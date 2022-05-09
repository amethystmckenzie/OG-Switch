using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class M_Enemy : MonoBehaviour
{

    public ParticleSystem deathEffect;
    //AudioSource enemySound;

    // Start is called before the first frame update
    void Start()
    {
        //enemySound = GetComponent<AudioSource>();
    }

    // Update is called once per frame
    void Update()
    {


    }



    void OnTriggerEnter2D(Collider2D other)
    {
        if (other.gameObject.CompareTag("Player"))
        {

            //Instantiate(deathEffect, other.gameObject.transform.position, Quaternion.identity);
            //enemySound.Play();
            M_LM.instance.Terminate();




        }



    }

}
