import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure TorsionSubgroupPackage where
  torsionSubgroupType : Type u
  torsionPartExtracted : Prop
  directSummand : Prop
  quotientTorsionFree : Prop

structure TorsionSubgroupEvidence (T : TorsionSubgroupPackage) where
  torsionPartExtractedClosed : T.torsionPartExtracted
  directSummandClosed : T.directSummand
  quotientTorsionFreeClosed : T.quotientTorsionFree

def TorsionSubgroupClosed (T : TorsionSubgroupPackage) : Prop :=
  T.torsionPartExtracted ∧ T.directSummand ∧ T.quotientTorsionFree

theorem torsion_subgroup_closed_from_evidence (T : TorsionSubgroupPackage)
    (E : TorsionSubgroupEvidence T) : TorsionSubgroupClosed T :=
  And.intro E.torsionPartExtractedClosed
    (And.intro E.directSummandClosed E.quotientTorsionFreeClosed)

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
