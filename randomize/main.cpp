#include <GDML/GDML.hpp>
#include  <random>
#include  <iterator>

template<typename Iter, typename RandomGenerator>
Iter select_randomly(Iter start, Iter end, RandomGenerator& g) {
    std::uniform_int_distribution<> dis(0, std::distance(start, end) - 1);
    std::advance(start, dis(g));
    return start;
}

template<typename Iter>
Iter select_randomly(Iter start, Iter end) {
    static std::random_device rd;
    static std::mt19937 gen(rd());
    return select_randomly(start, end, gen);
}

std::vector<char*>* based;

ModContainer* i;


void* frame(char* b) {
	if(std::find(based->begin(), based->end(), b) == based->end()) {

	char* thething = (char*)malloc(sizeof(char)*(strlen(b)+1));
	memcpy(thething, b, sizeof(char)*(strlen(b)+1));

	based->push_back(thething);
	}

	char* r = *select_randomly(based->begin(), based->end());

	return FCAST(frame,i->getOriginal(getBase()+0x132dc0))(r);

}

void inject() {
	i = new ModContainer("randomiz", "global");
	based = new std::vector<char*>();
	i->registerHook(getBase()+0x132dc0, (func_t)frame);

	i->enable();

}