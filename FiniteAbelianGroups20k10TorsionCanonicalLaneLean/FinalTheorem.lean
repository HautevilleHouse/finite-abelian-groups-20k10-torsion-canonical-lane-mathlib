import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FiniteAbelianGroups20k10TorsionCanonicalLaneLean.PrimaryDecompositionStructure
import HautevilleHouse.FiniteAbelianGroups20k10TorsionCanonicalLaneLean.InvariantFactorClassification
import HautevilleHouse.FiniteAbelianGroups20k10TorsionCanonicalLaneLean.TorsionSubgroupStructure

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

def ConstrainedTorsionClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_torsion_endgame (A : AdmissibleClass) :
    ConstrainedTorsionClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
