import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FiniteAbelianGroups20k10TorsionCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  FiniteAbelianWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FiniteAbelianGroups20k10TorsionCanonicalLaneLean
end HautevilleHouse
