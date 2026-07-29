import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure TorsionGroupPackage where
  abelianGroup : Type u
  torsionSubgroup : Type v
  decompositionIntoCyclic : Prop
  primaryComponentDecomposition : Prop
  finitelyGenerated : Prop
  exponent : ℕ
  exponentBound : ℕ

structure TorsionGroupEvidence (T : TorsionGroupPackage) where
  decompositionIntoCyclicClosed : T.decompositionIntoCyclic
  primaryComponentDecompositionClosed : T.primaryComponentDecomposition
  finitelyGeneratedClosed : T.finitelyGenerated

def TorsionGroupClosed (T : TorsionGroupPackage) : Prop :=
  T.decompositionIntoCyclic ∧ T.primaryComponentDecomposition ∧ T.finitelyGenerated

theorem torsion_group_closed_from_evidence (T : TorsionGroupPackage)
    (E : TorsionGroupEvidence T) : TorsionGroupClosed T :=
  And.intro E.decompositionIntoCyclicClosed
    (And.intro E.primaryComponentDecompositionClosed E.finitelyGeneratedClosed)

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
