#include <iostream>

class Wrapper {
public:
    int i;
    
    Wrapper(int value) {
        i = value;
    }
};

template <class T> class SmartPointer {
public:
    SmartPointer(T *ptr) {
        ref = ptr;
        ref_count = (unsigned*)malloc(sizeof(unsigned));
        *ref_count = 1;
    }
    
    SmartPointer(SmartPointer<T> &sptr) {
        ref = sptr.ref;
        ref_count = sptr.ref_count;
        ++(*ref_count);
    }
    
    SmartPointer<T> &operator=(SmartPointer<T> &sptr) {
        if (this == &sptr) return *this;
        
        if (*ref_count > 0) {
            remove();
        }
        ref = sptr.ref;
        ref_count = sptr.ref_count;
        ++(*ref_count);
        return *this;
    }
    
    ~SmartPointer() {
        remove();
    }
    
    T getValue() {
        return *ref;
    }
    
protected:
    void remove() {
        --(*ref_count);
        if (*ref_count == 0) {
            delete ref;
            free(ref_count);
            ref = nullptr;
            ref_count = nullptr;
        }
    }
    T *ref;
    unsigned *ref_count;
};

int main() {
    auto ptr = new Wrapper(1);
    SmartPointer<Wrapper> *sp = new SmartPointer<Wrapper>(ptr);
    std::cout << sp->getValue().i << std::endl;
    return 0;
}
