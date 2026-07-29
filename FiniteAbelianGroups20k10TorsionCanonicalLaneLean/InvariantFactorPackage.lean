import canonicalLaneMathlib.InvariantFactorPackage

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure InvariantFactorPackage where
  group : FiniteAbelianGroup
  factors : List ℕ
  factorsDivisors : Prop
  factorSumIsGroup : Prop
  classificationComplete : Prop

structure InvariantFactorEvidence (I : InvariantFactorPackage) where
  factorsDivisorsClosed : I.factorsDivisors
  factorSumIsGroupClosed : I.factorSumIsGroup
  classificationCompleteClosed : I.classificationComplete

def InvariantFactorClosed (I : InvariantFactorPackage) : Prop :=
  I.factorsDivisors ∧ I.factorSumIsGroup ∧ I.classificationComplete

theorem invariant_factor_closed_from_evidence
    (I : InvariantFactorPackage) (E : InvariantFactorEvidence I) :
    InvariantFactorClosed I := by
  exact And.intro E.factorsDivisorsClosed
    (And.intro E.factorSumIsGroupClosed E.classificationCompleteClosed)

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse