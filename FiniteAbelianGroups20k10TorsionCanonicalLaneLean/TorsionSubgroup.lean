import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure TorsionSubgroupPackage (A : AdmissibleClass) where
  torsionSubgroupDefined : Prop
  directSummand : Prop
  torsionFreePart : Prop
  finitenessOfTorsion : Prop

structure TorsionSubgroupEvidence {A : AdmissibleClass} (T : TorsionSubgroupPackage A) where
  torsionSubgroupDefinedClosed : T.torsionSubgroupDefined
  directSummandClosed : T.directSummand
  torsionFreePartClosed : T.torsionFreePart
  finitenessOfTorsionClosed : T.finitenessOfTorsion

def TorsionSubgroupClosed {A : AdmissibleClass} (T : TorsionSubgroupPackage A) : Prop :=
  T.torsionSubgroupDefined ∧ T.directSummand ∧ T.torsionFreePart ∧ T.finitenessOfTorsion

theorem torsion_subgroup_closed_from_evidence
    {A : AdmissibleClass} (T : TorsionSubgroupPackage A)
    (E : TorsionSubgroupEvidence T) : TorsionSubgroupClosed T := by
  exact And.intro E.torsionSubgroupDefinedClosed
    (And.intro E.directSummandClosed
      (And.intro E.torsionFreePartClosed E.finitenessOfTorsionClosed))

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
