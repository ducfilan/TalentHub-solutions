/*
Given a sorted array which has repeating numbers, delete duplicates such that elements of the array appear only once and return the length of the array.

Sample input:

Array : [21 22 24 25 25 26 27 28]

Delete repeating numbers : [21 22 24 25 26 27 28]

Output:

7
*/

#include <iostream>
#include <vector>
#include <sstream>
#include <algorithm>

using namespace std;

int main(void){
    string s;
    getline(cin, s);
	
    stringstream iss(s);
    
    vector<int> v;
	
    int i;
    while (iss >> i) v.push_back(i);
    
    cout << unique(v.begin(), v.end()) - v.begin();
    return 0;
}
