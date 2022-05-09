using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_MovingEnemy : MonoBehaviour
{
    public float vX;
    public float changeTime;
    float timer;


    //float x;
    int direction = 1;

    Rigidbody2D rigidbody2D;
    // Start is called before the first frame update
    void Start()
    {
        rigidbody2D = GetComponent<Rigidbody2D>();
        timer = changeTime;

    }

    // Update is called once per frame
    void Update()
    {


    }

    void FixedUpdate()
    {
        Vector2 position = rigidbody2D.position;
        position.x = position.x + Time.deltaTime * vX * direction;
        rigidbody2D.MovePosition(position);

        timer -= Time.deltaTime;

        if (timer < 0)
        {
            direction = -direction;
            timer = changeTime;
        }
    }
}
