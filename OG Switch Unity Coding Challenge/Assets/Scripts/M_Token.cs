using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_Token : MonoBehaviour
{
    void Update()
    {
        transform.Rotate(0, 90 * Time.deltaTime, 0); //rotate along y-axis every second
    }

    void OnTriggerEnter2D(Collider2D other)
    {
        if (other.gameObject.CompareTag("Player"))
        {

            M_LM.instance.AddToken();

            Destroy(gameObject);

        }


    }
}
