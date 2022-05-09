using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class M_Player : MonoBehaviour
{
    Rigidbody2D rigidbody2d;
    private Touch tap;
    private bool switch_;

    // Start is called before the first frame update
    void Start()
    {
        rigidbody2d = GetComponent<Rigidbody2D>();
        
      
    }

    // Update is called once per frame
    void Update()
    {

        if((Input.acceleration.x) != 0)
        {
            rigidbody2d.AddForce(new Vector2(Input.acceleration.x/3, 0), ForceMode2D.Impulse);
        }

        switch_ = false;

       
        if(Input.touchCount > 0 && Input.GetTouch(0).phase == TouchPhase.Ended)
        {
            tap = Input.GetTouch(0);

            if (!switch_)
            {
                rigidbody2d.gravityScale *= -1;
                Debug.Log("Switch");
            }
           

            switch_ = true;
        }
        
    }
}
