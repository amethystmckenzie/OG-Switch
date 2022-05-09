using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement; //import scene management functions

public class M_Trophy : MonoBehaviour
{


    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

        if (M_LM.instance.allTokensCollected)
        {
            GetComponent<Renderer>().material.SetColor("_BaseColor", Color.green); //custom cyan blue
            
        }


        else if (!M_LM.instance.allTokensCollected)
        {

            GetComponent<Renderer>().material.SetColor("_BaseColor", Color.red);
        }


    }


    void OnCollisionEnter2D(Collision2D other)
    {

        if (other.gameObject.CompareTag("Player") && M_LM.instance.allTokensCollected)
        {
            M_LM.instance.LevelCompleted();
        }

    }
}
