import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure InvariantFactorsPackage (A : AdmissibleClass) where
  invariantFactorsDefined : Prop
  divisibilityChain : Prop
  uniquenessUpToOrder : Prop
  relationToPrimaryDecomposition : Prop

structure InvariantFactorsEvidence {A : AdmissibleClass} (I : InvariantFactorsPackage A) where
  invariantFactorsDefinedClosed : I.invariantFactorsDefined
  divisibilityChainClosed : I.divisibilityChain
  uniquenessUpToOrderClosed : I.uniquenessUpToOrder
  relationToPrimaryDecompositionClosed : I.relationToPrimaryDecomposition

def InvariantFactorsClosed {A : AdmissibleClass} (I : InvariantFactorsPackage A) : Prop :=
  I.invariantFactorsDefined ∧ I.divisibilityChain ∧ I.uniquenessUpToOrder ∧ I.relationToPrimaryDecomposition

theorem invariant_factors_closed_from_evidence
    {A : AdmissibleClass} (I : InvariantFactorsPackage A)
    (E : InvariantFactorsEvidence I) : InvariantFactorsClosed I := by
  exact And.intro E.invariantFactorsDefinedClosed
    (And.intro E.divisibilityChainClosed
      (And.intro E.uniquenessUpToOrderClosed E.relationToPrimaryDecompositionClosed))

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
