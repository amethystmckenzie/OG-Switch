using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI; //using UI

public class M_TimeManager : MonoBehaviour
{
    public float startTime;

    private Text textTime;


    // Start is called before the first frame update
    void Start()
    {
        textTime = GetComponent<Text>();

    }


    // Update is called once per frame
    void Update()
    {
        startTime -= Time.deltaTime;
        textTime.text = "Time: " + Mathf.Round(startTime); //Rounds to nearest whole number so it isn't an ugly float

        if (startTime <= 0)
        {
            M_LM.instance.Terminate();

        }

       
    }
}
