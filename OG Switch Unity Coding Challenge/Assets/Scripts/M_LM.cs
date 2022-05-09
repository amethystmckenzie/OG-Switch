using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement; //import scene management functions

public class M_LM : MonoBehaviour
{
    public static M_LM instance; //globally accessible (making this accessible to other scripts without having to reference it everytime)

    public GameObject player;
    public Transform respawnPoint;
    public int coins_needed;
    public int index; //this way I can make a specific trophy go to a specific level in the inspector
                      //ex. trophy on level1 has index set to 0, trophy on level2 has index set to 1, etc..
    public int current_index;
    int token_num = 0;
    int deathCount;
    public bool allTokensCollected;

    AudioSource audioSource;
    public AudioClip playerdeath;
    public AudioClip tokenEffect;
    public AudioClip allTokens;

   

    public void Awake()
    {
        instance = this;
        audioSource = GetComponent<AudioSource>();

    }


    void Update()
    {

        if (token_num == coins_needed)
        {
            allTokensCollected = true;
    
        }

        

    }


    public void LevelCompleted()
    {
        if (token_num == coins_needed)
        {
            SceneManager.LoadScene(index); //load specific scene
          

        }

    }

    public void PlaySoundEffect(AudioClip clip)
    {
        audioSource.PlayOneShot(clip);

    }


    public void AddToken()
    {
        PlaySoundEffect(tokenEffect);
        token_num += 1;
        Debug.Log("Num of tokens: " + token_num);
    }



    public void Terminate()
    {
        //PlaySoundEffect(playerdeath);
        token_num = 0;
        M_GM.instance.overallDeathIncrease();
        SceneManager.LoadScene(current_index);




    }

}


