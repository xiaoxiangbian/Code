#include <iostream>
#include <semaphore.h>
#include <pthread.h>

using namespace std;

sem_t semaphore;

pthread_mutex_t mu = PTHREAD_MUTEX_INITIALIZER;
pthread_t id[2];

const int MAX_NUM = 5;

int number = 0;
void addFunc()
{
    cout << "int addFunc number is:" << ++number << endl;
}

void* thread1(void*)
{
    cout << "Thread1 in!" << endl;

    int loop = MAX_NUM;
    while(loop--)
    {
        sem_wait(&semaphore);

        cout << "Thread1 locked!" << endl;
        addFunc();

        sem_post(&semaphore);
        cout << "Thread1 unlocked!" << endl;
    }
    return nullptr;
}

void* thread2(void*)
{
    cout << "Thread2 in!" << endl;

    int loop = MAX_NUM;
    while(loop--)
    {
        sem_wait(&semaphore);

        cout << "Thread2 locked!" << endl;
        addFunc();

        sem_post(&semaphore);

        cout << "Thread2 unlocked!" << endl;
    }
    return nullptr;
}

int main()
{
    sem_init(&semaphore, 0, 1);

    pthread_attr_t attr;
    pthread_attr_init(&attr);

    pthread_create(id, &attr, thread1, (void*)1);

    pthread_create(id + 1, &attr, thread2, (void*)2);

    pthread_join(*id, nullptr);
    pthread_join(id[1], nullptr);

    sem_destroy(&semaphore);
    return 0;
}
