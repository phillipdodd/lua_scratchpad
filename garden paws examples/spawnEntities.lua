t = World.SpawnEntity(
    "thingy",
    Vector3.Add(
        World.GetPlayerPosition(),
        Vector3.New(-1,0,0)
    )
)
t.gameObject.transform.SetParent(Player.gameObject.transform)
inv = t.gameObject.AddInventory('follow-box')
inv.gameObject.transform.SetParent(t.gameObject.transform)
inv.AddWorldVisualizer(Vector3.New(-1,1,0),Vector3.New(1,1,0))
inv.AddOpenTrigger("beep")


Player.gameObject.AddInventory('uraboxnow')
inv.gameObject.transform.SetParent(Player.gameObject.transform)
inv.gameObject.transform.localPosition = Vector3.zero
inv.gameObject.AddDebugSphere()