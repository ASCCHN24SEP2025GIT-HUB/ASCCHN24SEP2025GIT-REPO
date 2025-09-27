package com.demo.inheritance;

// Interfaces are the highest form of abstraction
// Methods in an interface are by default public
interface DebitCard {
}

interface NetBanking {
}

interface SavingsAccount extends DebitCard, NetBanking {
}
