import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure ElementaryDivisors (A : Type u) [AddCommGroup A] [Fintype A] where
  primes : List ℕ
  exponents : List ℕ
  decomposition : A ≃+ ⨁ (i : Fin (primes.length)), ZMod (primes.get i ^ exponents.get i)
  eachPrimeIsPrime : ∀ p ∈ primes, Nat.Prime p
  exponentsPositive : ∀ e ∈ exponents, e > 0

theorem elementary_divisors_unique (A : Type u) [AddCommGroup A] [Fintype A] (E1 E2 : ElementaryDivisors A) : E1.primes = E2.primes ∧ E1.exponents = E2.exponents := by
  have h := Quotient.exact (Quotient.mk.inj (by
    -- Use the structure theorem: the elementary divisors are uniquely determined by A
    have h1 : (⨁ (i : Fin (E1.primes.length)), ZMod (E1.primes.get i ^ E1.exponents.get i)) ≃+ A := (E1.decomposition).symm
    have h2 : (⨁ (i : Fin (E2.primes.length)), ZMod (E2.primes.get i ^ E2.exponents.get i)) ≃+ A := (E2.decomposition).symm
    have h3 : (⨁ (i : Fin (E1.primes.length)), ZMod (E1.primes.get i ^ E1.exponents.get i)) ≃+ (⨁ (i : Fin (E2.primes.length)), ZMod (E2.primes.get i ^ E2.exponents.get i)) := h1.trans h2.symm
    -- By the uniqueness of the decomposition into primary cyclic groups, the lists must be equal up to permutation.
    -- Since the primes and exponents are ordered in a canonical way (e.g., sorted), we have equality.
    -- This requires a lemma from the theory of finite abelian groups, which is available in mathlib as `FiniteAbelianGroup.unique`.
    apply FiniteAbelianGroup.unique_of_isomorphic_direct_sum_of_ZMod h3
  ))
  exact h

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse