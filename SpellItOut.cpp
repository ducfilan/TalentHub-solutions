/*
Objective:
Given a non-negative integer N (0 <= N < 10^11), write a program to convert N into English numbers.

For example:

with N = 1, then output is "One"
with N = 91, then output is "Ninety One"
with N = 100, then output is "One Hundred"
with N = 99999, then output is "Ninety Nine Thousand Nine Hundred Ninety Nine"

Input:
10

Output:
Ten

Note: The first letter of each word in the output must be capitalized.
*/

#include <string>
#include <iostream>
using std::string;

const char* smallNumbers[] = {
    "Zero", "One", "Two", "Three", "Four", "Five",
    "Six", "Seven", "Eight", "Nine", "Ten",
    "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen",
    "Sixteen", "Seventeen", "Eighteen", "Nineteen"
};

string spellHundreds(unsigned n){
    string res;
    if (n > 99) {
        res = smallNumbers[n / 100];
        res += " Hundred";
        n %= 100;
        if (n)
            res += " ";
    }
    if (n >= 20) {
        static const char* Decades[] = {
            "", "", "Twenty", "Thirty", "Forty",
            "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"
        };
        res += Decades[n / 10];
        n %= 10;
        if (n)
            res += " ";
    }
    if (n < 20 && n > 0)
        res += smallNumbers[n];
    return res;
}

const char* thousandPowers[] = {
    " Billion", " Million", " Thousand", ""
};

typedef unsigned long Spellable;

string spell(Spellable n){
    if (n < 20) return smallNumbers[n];
	
    string res;
    const char** pScaleName = thousandPowers;
    Spellable scaleFactor = 1000000000;
	
    while (scaleFactor > 0) {
        if (n >= scaleFactor) {
            Spellable h = n / scaleFactor;
            res += spellHundreds(h) + *pScaleName;
            n %= scaleFactor;
            if (n)
                res += " ";
        }
        scaleFactor /= 1000;
        ++pScaleName;
    }
    return res;
}

int main(){
    Spellable x;
    std::cin >> x;
	
    std::cout << spell(x);
    return 0;
}