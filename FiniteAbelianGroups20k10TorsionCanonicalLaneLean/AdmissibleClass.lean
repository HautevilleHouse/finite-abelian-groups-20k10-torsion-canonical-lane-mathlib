import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure FiniteAbelianAdmittedObject where
  group : Type u
  commutative : Prop
  finite : Prop
  torsionComponent : Prop
  primaryDecomposition : Prop
  conclusion : primaryDecomposition

structure AdmissibleClass where
  object : FiniteAbelianAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  FiniteAbelianWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
