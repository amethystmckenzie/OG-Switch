using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class M_PauseMenu : MonoBehaviour
{
    public bool currentlyPaused;
    public GameObject Pause;

    // Update is called once per frame
    void Update()
    {
        if (currentlyPaused)
        {
            Paused();
        }

        else
        {
            Resume();
        }

    }

    public void Paused()
    {
        currentlyPaused = true;
        Pause.SetActive(true);
        Time.timeScale = 0f; //pauses functions of the game (can't move ball)

    }


    public void Resume()
    {
        currentlyPaused = false;
        Pause.SetActive(false);
        Time.timeScale = 1f; //time passes normally again (in realtime)
    }

    public void Menu()
    {
        // LevelManager.instance.Terminate();
        SceneManager.LoadScene(0);
    }
}
