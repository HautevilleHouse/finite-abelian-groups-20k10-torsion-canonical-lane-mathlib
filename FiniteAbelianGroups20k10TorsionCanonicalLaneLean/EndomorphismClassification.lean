import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure EndomorphismClassificationPackage where
  endomorphismRing : Type u
  structureTheoremApplied : Prop
  classificationComplete : Prop

def EndomorphismClassificationClosed (E : EndomorphismClassificationPackage) : Prop :=
  E.structureTheoremApplied ∧ E.classificationComplete

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
