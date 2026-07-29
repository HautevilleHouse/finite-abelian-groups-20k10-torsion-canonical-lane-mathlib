import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure TorsionSubgroupPackage (G : Type u) [AddCommGroup G] where
  torsionSubgroup : AddSubgroup G
  torsionSubgroupIsTorsion : ∀ x ∈ torsionSubgroup, IsOfFiniteOrder x
  quotientTorsionFree : TorsionFree (G ⧸ torsionSubgroup)
  torsionSubgroupMaximal : Prop

structure TorsionSubgroupEvidence {G : Type u} [AddCommGroup G]
    (T : TorsionSubgroupPackage G) where
  torsionSubgroupIsTorsionClosed : ∀ x ∈ T.torsionSubgroup, T.torsionSubgroupIsTorsion x
  quotientTorsionFreeClosed : T.quotientTorsionFree
  torsionSubgroupMaximalClosed : T.torsionSubgroupMaximal

def TorsionSubgroupClosed {G : Type u} [AddCommGroup G]
    (T : TorsionSubgroupPackage G) : Prop :=
  (∀ x ∈ T.torsionSubgroup, T.torsionSubgroupIsTorsion x) ∧ T.quotientTorsionFree ∧ T.torsionSubgroupMaximal

theorem torsion_subgroup_closed_from_evidence
    {G : Type u} [AddCommGroup G]
    (T : TorsionSubgroupPackage G) (E : TorsionSubgroupEvidence T) :
    TorsionSubgroupClosed T := by
  exact And.intro E.torsionSubgroupIsTorsionClosed
    (And.intro E.quotientTorsionFreeClosed E.torsionSubgroupMaximalClosed)

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
