using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement; //import scene management functions
using UnityEngine.UI;

//where to store global variables
public class M_GM : MonoBehaviour
{
    public static M_GM instance;

    int deathCount = 0;
    public Text globalDeathCount;


    private void Awake()
    {
        if (instance != null)
        {
            Destroy(gameObject);

        }

        else
        {
            instance = this;
            DontDestroyOnLoad(gameObject);

        }


    }

    public void overallDeathIncrease()
    {
        deathCount += 1;
        Debug.Log("Death Count: " + deathCount);
    }


}
