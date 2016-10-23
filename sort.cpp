#include <iostream>
#include <string>
#include <list>
using namespace std;

// Copy data from container 'f' to container 't'
template <typename Tfrom, typename Tto>
inline void copydata(Tfrom &f, Tto &t)
{
	for(typename Tfrom::iterator it=f.begin(); it!=f.end(); it++)  
		t.push_back(*it);
}

// Sort string 'source'
string sorts(string &source)
{
	list<char> tmp;
	copydata (source, tmp);
	tmp.sort();
	copydata (tmp, source);
	return source;
}

int main()
{
	string source;
	cout << "Print something\n";
	getline (cin, source); // Get data from command line
	cout << "Your string: \'" << source << "\'\n";
	cout << "After sort:  \'" << sorts(source) << "\'\n";
	return 0;
}