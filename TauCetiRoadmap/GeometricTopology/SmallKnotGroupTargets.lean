import Mathlib
import TauCetiRoadmap.GeometricTopology.FiveOneTargets
import TauCetiRoadmap.GeometricTopology.CompositeKnotGeneratorTargets

/-!
**This file is not the roadmap and is not exhaustive.** The README is definitive.
These are suggested forms.
These actual free words, presented groups, Laurent polynomials and the native
semidirect product are finite certificate inputs. The single admitted Fox-row
comparison is a future proof. Geometric diagram/group/cover comparisons remain
additional required README targets. The fourteen table polynomials alone do
not identify any rational diagram with a named PD input.
-/
noncomputable section
namespace TauCetiRoadmap.GeometricTopology.SmallKnotGroups
open LaurentPolynomial
set_option maxRecDepth 20000
set_option maxHeartbeats 4000000

def epsilon (p q i : ℕ) : ℤ := if (i * q / p) % 2 = 0 then 1 else -1

def prefixExponent (p q i : ℕ) : ℤ :=
  ∑ j ∈ Finset.range i, epsilon p q (j + 1)

/-- First letter b, then a, in the native FreeGroup sign convention. -/
def schubertWord (p q : ℕ) : List (Fin 2 × Bool) :=
  (List.range (p - 1)).map fun j =>
    (if j % 2 = 0 then 1 else 0, decide (((j + 1) * q / p) % 2 = 0))

def relatorWord (p q : ℕ) : List (Fin 2 × Bool) :=
  [(0,true)] ++ schubertWord p q ++ [(1,false)] ++
    ((schubertWord p q).reverse.map fun x => (x.1,!x.2))

def relator (p q : ℕ) : FreeGroup (Fin 2) := FreeGroup.mk (relatorWord p q)
abbrev SchubertGroup (p q : ℕ) := PresentedGroup ({relator p q} : Set (FreeGroup (Fin 2)))

def raw (p q : ℕ) : ℤ[T;T⁻¹] :=
  ∑ i ∈ Finset.range p, (-1 : ℤ[T;T⁻¹]) ^ i * T (prefixExponent p q i)

def normalized (p q : ℕ) : ℤ[T;T⁻¹] :=
  T (-(prefixExponent p q (p - 1) / 2)) * raw p q

/-- Compare the literal native signed word with its closed Laurent formula.
The generic free-group-ring Fox comparison is supplied by the README owner. -/
theorem fox_row (p q : ℕ) (hp : Odd p) :
    (FiveOne.wordFox 0 0 (relatorWord p q), FiveOne.wordFox 1 0 (relatorWord p q)) =
      (raw p q, -raw p q) := by
  sorry

/-- Ordering is the existing fourteen standard-PD rows, 3₁ through 7₇. -/
def slopes : Fin 14 → ℕ × ℕ :=
  ![(3,1),(5,7),(5,1),(7,9),(9,11),(11,3),(13,5),
    (7,1),(11,13),(13,3),(15,19),(17,5),(19,27),(21,29)]

def expected : Fin 14 → ℤ[T;T⁻¹] :=
  ![T (1) - 1 + T (-1),
    -T (1) + 3 * 1 - T (-1),
    T (2) - T (1) + 1 - T (-1) + T (-2),
    2 * T (1) - 3 * 1 + 2 * T (-1),
    -2 * T (1) + 5 * 1 - 2 * T (-1),
    -T (2) + 3 * T (1) - 3 * 1 + 3 * T (-1) - T (-2),
    T (2) - 3 * T (1) + 5 * 1 - 3 * T (-1) + T (-2),
    T (3) - T (2) + T (1) - 1 + T (-1) - T (-2) + T (-3),
    3 * T (1) - 5 * 1 + 3 * T (-1),
    2 * T (2) - 3 * T (1) + 3 * 1 - 3 * T (-1) + 2 * T (-2),
    4 * T (1) - 7 * 1 + 4 * T (-1),
    2 * T (2) - 4 * T (1) + 5 * 1 - 4 * T (-1) + 2 * T (-2),
    -T (2) + 5 * T (1) - 7 * 1 + 5 * T (-1) - T (-2),
    T (2) - 5 * T (1) + 9 * 1 - 5 * T (-1) + T (-2)]

theorem normalized_eq_sum (p q : ℕ) :
    normalized p q = ∑ i ∈ Finset.range p,
      (-1 : ℤ[T;T⁻¹]) ^ i *
        T (-(prefixExponent p q (p - 1) / 2) + prefixExponent p q i) := by
  rw [normalized, raw, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i hi
  rw [show T (-(prefixExponent p q (p - 1) / 2)) *
      ((-1 : ℤ[T;T⁻¹]) ^ i * T (prefixExponent p q i)) =
      (-1 : ℤ[T;T⁻¹]) ^ i *
        (T (-(prefixExponent p q (p - 1) / 2)) * T (prefixExponent p q i)) by ring]
  rw [← T_add]

theorem all_fourteen (i : Fin 14) :
    normalized (slopes i).1 (slopes i).2 = expected i := by
  fin_cases i <;> rw [normalized_eq_sum] <;>
    norm_num [prefixExponent, epsilon, slopes, expected, Finset.sum_range_succ]
  all_goals ring

/-! The order-18 generalized dihedral quotient uses the native semidirect product. -/
abbrev Translations := Multiplicative (ZMod 3 × ZMod 3)
abbrev ReflectionParity := Multiplicative (ZMod 2)

def inversion : MulAut Translations :=
  (AddEquiv.neg (ZMod 3 × ZMod 3)).toMultiplicative

def action : ReflectionParity →* MulAut Translations where
  toFun g := if g = 1 then 1 else inversion
  map_one' := by simp
  map_mul' := by decide +kernel

abbrev Dihedral18 := SemidirectProduct Translations ReflectionParity action
instance : Fintype Dihedral18 :=
  Fintype.ofEquiv (Translations × ReflectionParity) SemidirectProduct.equivProd.symm

def tImage : Dihedral18 := ⟨Multiplicative.ofAdd (0,0), Multiplicative.ofAdd 1⟩
def aImage : Dihedral18 := ⟨Multiplicative.ofAdd (1,0), Multiplicative.ofAdd 1⟩
def bImage : Dihedral18 := ⟨Multiplicative.ofAdd (0,1), Multiplicative.ofAdd 1⟩

theorem card_dihedral18 : Fintype.card Dihedral18 = 18 := by decide +kernel

theorem image_braid_relations :
    tImage * aImage * tImage = aImage * tImage * aImage ∧
    tImage * bImage * tImage = bImage * tImage * bImage := by decide +kernel

/-- Each finite element is an explicit word in the three chosen reflections. -/
theorem image_word_formula : ∀ d : Dihedral18,
    (aImage * tImage) ^ d.left.toAdd.1.val *
      (bImage * tImage) ^ d.left.toAdd.2.val *
      tImage ^ d.right.toAdd.val = d := by
  decide +kernel

def images : Fin 3 → Dihedral18 := ![tImage,aImage,bImage]

theorem kill_relators (r : FreeGroup (Fin 3))
    (hr : r ∈ CompositeKnotGenerators.relators) : FreeGroup.lift images r = 1 := by
  simp only [CompositeKnotGenerators.relators, Set.mem_insert_iff,
    Set.mem_singleton_iff] at hr
  rcases hr with rfl | rfl
  · simp [CompositeKnotGenerators.braidRelator, images, image_braid_relations.1]
  · simp [CompositeKnotGenerators.braidRelator, images, image_braid_relations.2]

def quotient : CompositeKnotGenerators.Presentation →* Dihedral18 :=
  PresentedGroup.toGroup (fun r hr => kill_relators r hr)

@[simp] theorem quotient_of (i : Fin 3) :
    quotient (PresentedGroup.of i) = images i := PresentedGroup.toGroup.of _

def preimageWord (d : Dihedral18) : CompositeKnotGenerators.Presentation :=
  (PresentedGroup.of 1 * PresentedGroup.of 0) ^ d.left.toAdd.1.val *
    (PresentedGroup.of 2 * PresentedGroup.of 0) ^ d.left.toAdd.2.val *
    PresentedGroup.of 0 ^ d.right.toAdd.val

theorem quotient_surjective : Function.Surjective quotient := by
  intro d
  refine ⟨preimageWord d, ?_⟩
  simpa [preimageWord, images] using image_word_formula d

end TauCetiRoadmap.GeometricTopology.SmallKnotGroups
