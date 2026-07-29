import canonicalLaneMathlib.AdmissibleClass
import Mathlib.GroupTheory.Abelianization

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure InvariantFactorDecompositionPackage (G : AbelianGroupObject) where
  invariantFactors : List ℕ
  decomposition : G.carrier ≃+ (i : Fin (invariantFactors.length)) → CyclicGroup (invariantFactors.get i)
  divisibilityChain : Prop
  uniqueness : Prop

structure InvariantFactorDecompositionEvidence {G : AbelianGroupObject}
    (I : InvariantFactorDecompositionPackage G) where
  decompositionClosed : I.decomposition
  divisibilityChainClosed : I.divisibilityChain
  uniquenessClosed : I.uniqueness

def InvariantFactorDecompositionClosed {G : AbelianGroupObject}
    (I : InvariantFactorDecompositionPackage G) : Prop :=
  I.decomposition ∧ I.divisibilityChain ∧ I.uniqueness

theorem invariant_factor_decomposition_closed_from_evidence
    {G : AbelianGroupObject} (I : InvariantFactorDecompositionPackage G)
    (E : InvariantFactorDecompositionEvidence I) : InvariantFactorDecompositionClosed I := by
  exact And.intro E.decompositionClosed
    (And.intro E.divisibilityChainClosed E.uniquenessClosed)

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
