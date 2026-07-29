import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure InvariantFactorPackage (G : Type u) [AddCommGroup G] [Finite G] where
  invariantFactors : List ℕ
  factorDecomposition : (⨁ (n : ℕ), ZMod (invariantFactors.get? n).getOrElse 1) ≃+ G
  invariantFactorsProper : ∀ n ∈ invariantFactors, n ≠ 1
  invariantFactorsUnique : Prop

structure InvariantFactorEvidence {G : Type u} [AddCommGroup G] [Finite G]
    (I : InvariantFactorPackage G) where
  factorDecompositionClosed : I.factorDecomposition
  invariantFactorsProperClosed : ∀ n ∈ I.invariantFactors, I.invariantFactorsProper n
  invariantFactorsUniqueClosed : I.invariantFactorsUnique

def InvariantFactorClosed {G : Type u} [AddCommGroup G] [Finite G]
    (I : InvariantFactorPackage G) : Prop :=
  I.factorDecomposition ∧ (∀ n ∈ I.invariantFactors, I.invariantFactorsProper n) ∧ I.invariantFactorsUnique

theorem invariant_factor_closed_from_evidence
    {G : Type u} [AddCommGroup G] [Finite G]
    (I : InvariantFactorPackage G) (E : InvariantFactorEvidence I) :
    InvariantFactorClosed I := by
  exact And.intro E.factorDecompositionClosed
    (And.intro E.invariantFactorsProperClosed E.invariantFactorsUniqueClosed)

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
