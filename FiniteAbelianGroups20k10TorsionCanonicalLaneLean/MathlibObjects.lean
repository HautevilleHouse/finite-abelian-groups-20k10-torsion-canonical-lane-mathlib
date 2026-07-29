import canonicalLaneMathlib.MathlibObjects

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

structure FiniteAbelianGroup where
  carrier : Type
  group : Group carrier
  finite : Fintype carrier
  abelian : CommGroup carrier

structure TorsionComponent where
  group : FiniteAbelianGroup
  prime : ℕ
  exponent : ℕ

structure FiniteAbelianObject where
  group : FiniteAbelianGroup
  decompositionExists : Prop
  torsionComponents : List TorsionComponent
  conclusion : decompositionExists

structure WitnessState where
  object : FiniteAbelianObject

def FiniteAbelianWitnessClosed (O : FiniteAbelianObject) : Prop :=
  O.decompositionExists

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse