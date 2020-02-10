using MoonSharp.Interpreter;
using UnityEngine;

[MoonSharpUserData]
public class HittableProxy
{
    Hittable target;

    public Transform transform
    {
        get { return target.transform; }
    }

    public GameObject gameObject
    {
        get { return target.gameObject; }
    }
    private Collider _collider;
    public Collider collider
    {
        get
        {
            if (_collider == null) _collider = target.GetComponentInChildren<Collider>();
            return _collider;
        }
    }

    [MoonSharpHidden]
    public HittableProxy(Hittable p)
    {
        this.target = p;
    }

    public Hittable SetActive(bool status)
    {
        gameObject.SetActive(status);
        return target;
    }

    public bool IsActive()
    {
        return gameObject.activeInHierarchy;
    }

    public Hittable UnregisterAllCallbacks()
    {
        target.OnHit.RemoveAllListeners();
        return target;
    }
    
    public Hittable RegisterCallback(DynValue callback, params object[] parameters)
    {
        target.OnHit.AddListener(() =>
        {
            if (callback != null && callback.Function != null && callback.Function.OwnerScript != null)
            {
                try
                {
                    callback.Function.OwnerScript.Call(callback.Function,parameters);
                }
                catch (ScriptRuntimeException ex)
                {
                    Debug.LogError(string.Format("Doh! An error occured! {0}", ex.DecoratedMessage));
                }
            }
        });
        return target;
    }

    public Hittable CreateSphereCollisions(float r = 2)
    {
        SphereCollider c = gameObject.AddComponent<SphereCollider>();
        c.radius = r;
        return target;
    }
    public Hittable AddDebugSphere()
    {
        GameObject primitive = GameObject.CreatePrimitive(PrimitiveType.Sphere);
        Collider primitiveCollider = primitive.GetComponent<Collider>();
        if(primitiveCollider != null) GameObject.Destroy(primitiveCollider);
        primitive.transform.SetParent(transform);
        primitive.transform.localPosition = Vector3.zero;
        return target;
    }

    public void Recycle()
    {
        transform.Recycle();
    }

    public void Destroy()
    {
        GameObject.Destroy(gameObject);
    }

    public static Hittable MakeHittable(GameObject go = null)
    {
        if (go == null)
        {
            go = new GameObject("Hittable");
            Rigidbody rb = go.AddComponent<Rigidbody>();
            rb.isKinematic = true;
        }
        go.layer = 26;
        Hittable newHittable = go.AddComponent<Hittable>();
        newHittable.IsEnemy = true;
        return newHittable;
    } 
    
}