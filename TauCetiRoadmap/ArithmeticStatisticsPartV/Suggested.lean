import Mathlib
import TauCeti.NumberTheory.BinaryQuadraticForm.Reduction
import TauCeti.NumberTheory.NumberField.Monogenic
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Basic
import TauCeti.RingTheory.ClassGroup.RelNorm

/-!
# Arithmetic statistics, Part V: headline theorems

This file is not the roadmap and is not exhaustive. The definitive specification is
`README.md`. These statements suggest Lean forms for its mathematical endpoints.

The statements cover discriminant-ordered quadratic, cubic, quartic and quintic field
counts, secondary terms, classical quadratic-form means, class-group torsion bounds
and averages, quadratic four-rank
moments and laws, general field-count bounds, monogenic and odd-degree binary-form
field lower bounds, unramified alternating extensions, the cyclotomic counterexample
to Malle's prediction, embedded two-extension counts and three-torsion means, and
historical negative-Pell bounds.

Local-specification refinements and S-integral mass formulas need the specified
local etale-order and orbit interfaces, including `CubicLocalSpecification`.
The general relative narrow means also need the narrow norm map. The
fixed-signature rigid wreath refinements and nonabelian quadratic moments need
compatible local specifications and maximal unramified extension interfaces;
the refined moments additionally need reduced Schur covers and their arithmetic
lifting invariant. Abelian discriminant-series continuation needs the conductor height on continuous idele-class characters.
Fixed cubic-resolvent quartic estimates need a quartic resolvent map on fields.
Spin criteria and the conditional absence of a sixteen-rank governing field need
the number-field residue-symbol and joint-spin interfaces. These objects are absent from the pinned libraries.
The even-degree binary-field and alternating-extension bounds need the specified
even binary summed-tail contract. These refinements are deferred here, with their
full mathematical statements and prerequisites in the README.
-/

noncomputable section
open scoped BigOperators Topology Classical
open Polynomial Filter
open scoped NumberField

namespace TauCetiRoadmap.ArithmeticStatisticsPartV
namespace FieldStatistics

/-- The signed cubic field counts have the Davenport–Heilbronn leading constants.
Each embedded field is weighted by its automorphism order divided by three,
so that each rational isomorphism class contributes one. -/
theorem davenportHeilbronn_cubicFields :
    let count := fun (ε : ℤ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = 3 ∧ 0 < ε * NumberField.discr K.val ∧
            ((ε * NumberField.discr K.val : ℤ) : ℝ) < X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / 3 else 0
    ∀ ε : ℤ, ε = 1 ∨ ε = -1 →
      Tendsto (fun X => count ε X / X) atTop
        (𝓝 (1 / ((if ε = 1 then 12 else 4) * (riemannZeta 3).re))) := by sorry

/-- The mean ordinary three-torsion is four thirds over real quadratic fields
and two over imaginary quadratic fields, with strict discriminant cutoffs. -/
theorem davenportHeilbronn_threeTorsion :
    let total := fun (m : ℕ) (ε : ℤ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = 2 ∧ 0 < ε * NumberField.discr K.val ∧
            ((ε * NumberField.discr K.val : ℤ) : ℝ) < X then
          (Nat.card {c : ClassGroup (𝓞 K.val) // c ^ m = 1} : ℝ) else 0
    ∀ ε : ℤ, ε = 1 ∨ ε = -1 →
      Tendsto (fun X => total 3 ε X / total 1 ε X) atTop
        (𝓝 (if ε = 1 then 4 / 3 else 2)) := by sorry

/-- All narrow four-rank moments satisfy the Fouvry–Klüners logarithmic error bound,
both for each sign and within each fundamental-discriminant congruence family.
The two-torsion in the square subgroup has cardinality two to the four-rank. -/
theorem fouvryKluners_fourRankMoments :
    let total := fun (k : ℕ) (ε : ℤ) (t : Option (Fin 3)) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        let D := NumberField.discr K.val
        if Module.finrank ℚ K.val = 2 ∧ 0 < ε * D ∧ ((ε * D : ℤ) : ℝ) < X ∧
            (match t with
            | none => True
            | some i => if i = 0 then D % 4 = 1 else if i = 1 then D % 8 = 0
                else D % 8 = 4) then
          (Nat.card {c : NumberField.NarrowClassGroup K.val //
            c ^ 2 = 1 ∧ ∃ b, b ^ 2 = c} : ℝ) ^ k else 0
    let subspaces := fun k : ℕ =>
      (Nat.card (Submodule (ZMod 2) (Fin k → ZMod 2)) : ℝ)
    ∀ (k : ℕ) (ε : ℤ), ε = 1 ∨ ε = -1 → ∀ (t : Option (Fin 3)) (δ : ℝ), 0 < δ →
      ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 2 ≤ X →
        |total k ε t X -
          (if ε = 1 then (subspaces (k + 1) - subspaces k) / (2 : ℝ) ^ k
            else subspaces k) * total 0 ε t X| ≤
          C * X * (Real.log X) ^ (-((2 : ℝ) ^ k)⁻¹ + δ) := by sorry

/-- The quadratic narrow four-rank has the Cohen–Lenstra–Gerth limiting law
for each sign and each fundamental-discriminant congruence family. -/
theorem fouvryKluners_fourRankLaw :
    let count := fun (rank : Option ℕ) (ε : ℤ) (t : Option (Fin 3)) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        let D := NumberField.discr K.val
        if Module.finrank ℚ K.val = 2 ∧ 0 < ε * D ∧ ((ε * D : ℤ) : ℝ) < X ∧
            (match t with
            | none => True
            | some i => if i = 0 then D % 4 = 1 else if i = 1 then D % 8 = 0
                else D % 8 = 4) ∧
            (match rank with
            | none => True
            | some r => Nat.card {c : NumberField.NarrowClassGroup K.val //
                c ^ 2 = 1 ∧ ∃ b, b ^ 2 = c} = 2 ^ r) then 1 else (0 : ℝ)
    let η := fun r : ℕ => ∏ i ∈ Finset.Icc 1 r, (1 - ((2 : ℝ) ^ i)⁻¹)
    ∀ (ε : ℤ), ε = 1 ∨ ε = -1 → ∀ (t : Option (Fin 3)) (r : ℕ),
      let u : ℕ := if ε = 1 then 1 else 0
      Tendsto (fun X => count (some r) ε t X / count none ε t X) atTop
        (𝓝 (((2 : ℝ) ^ (r * (r + u)))⁻¹ *
          (∏' i : ℕ, (1 - ((2 : ℝ) ^ (i + 1))⁻¹)) / (η r * η (r + u)))) := by sorry

/-- The ordinary and narrow two-torsion means over S₃-cubic fields have their
signature-dependent values. Each of the three conjugate subfields has weight one third. -/
theorem bhargava_cubicTwoTorsionMean :
    let total := fun (narrow : Bool) (m r : ℕ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = 3 ∧
            Module.finrank ℚ (IntermediateField.normalClosure ℚ K.val
              (AlgebraicClosure ℚ)) = 6 ∧
            NumberField.InfinitePlace.nrComplexPlaces K.val = r ∧
            |(NumberField.discr K.val : ℝ)| < X then
          (if narrow then
            (Nat.card {c : NumberField.NarrowClassGroup K.val // c ^ m = 1} : ℝ)
          else (Nat.card {c : ClassGroup (𝓞 K.val) // c ^ m = 1} : ℝ)) / 3 else 0
    ∀ (narrow : Bool) (r : ℕ), r ≤ 1 →
      Tendsto (fun X => total narrow 2 r X / total narrow 1 r X) atTop
        (𝓝 (if r = 0 then (if narrow then 2 else 5 / 4) else 3 / 2)) := by sorry

/-- The S₄ and S₅ field counts have the signature-specific Euler-product constants.
Normal-closure degree n! expresses the full permutation group on n embeddings. -/
theorem bhargava_quarticQuinticFields (n : ℕ) (hn : n = 4 ∨ n = 5) :
    let count := fun (r : ℕ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = n ∧
            Module.finrank ℚ (IntermediateField.normalClosure ℚ K.val
              (AlgebraicClosure ℚ)) = n.factorial ∧
            NumberField.InfinitePlace.nrComplexPlaces K.val = r ∧
            |(NumberField.discr K.val : ℝ)| < X then 1 / (n : ℝ) else 0
    let c := ∏' p : Nat.Primes,
      (1 + ((p.val : ℝ) ^ 2)⁻¹ - ((p.val : ℝ) ^ (n - 1))⁻¹ - ((p.val : ℝ) ^ n)⁻¹)
    ∀ r : ℕ, 2 * r ≤ n →
      Tendsto (fun X => count r X / X) atTop
        (𝓝 (c / (2 * ((n - 2 * r).factorial : ℝ) * 2 ^ r * (r.factorial : ℝ)))) :=
  by sorry

/-- Weighted Sₙ-extension counts over every number-field base have the
Bhargava–Shankar–Wang constant, for each degree from two through five.
Weight one over n on embedded fields equals inverse automorphism weight on classes. -/
theorem bhargavaShankarWang_numberFieldCount (F : Type*) [Field F] [NumberField F]
    (n : ℕ) (hn : 2 ≤ n ∧ n ≤ 5) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField F (AlgebraicClosure F) // FiniteDimensional F L},
        letI : FiniteDimensional F K.val := K.property
        letI : NumberField K.val := NumberField.of_module_finite F K.val
        if Module.finrank F K.val = n ∧
            Module.finrank F (IntermediateField.normalClosure F K.val
              (AlgebraicClosure F)) = n.factorial ∧
            |(NumberField.discr K.val : ℝ)| / |(NumberField.discr F : ℝ)| ^ n ≤ X then
          1 / (n : ℝ) else 0
    let q := fun k m : ℕ => (Nat.card {a : Nat.Partition k // a.parts.card ≤ m} : ℝ)
    Tendsto (fun X => count X / X) atTop
      (𝓝 ((1 / 2) * NumberField.dedekindZeta_residue F *
        ((Nat.card {σ : Equiv.Perm (Fin n) // σ ^ 2 = 1} : ℝ) / n.factorial) ^
          NumberField.InfinitePlace.nrRealPlaces F *
        (1 / (n.factorial : ℝ)) ^ NumberField.InfinitePlace.nrComplexPlaces F *
        ∏' p : IsDedekindDomain.HeightOneSpectrum (𝓞 F),
          ∑ k ∈ Finset.range (n + 1),
            (q k (n - k) - (if k = 0 then 0 else q (k - 1) (n - k + 1))) /
              (Ideal.absNorm p.asIdeal : ℝ) ^ k)) := by sorry

/-- Every degree from two through five has a positive linear asymptotic for
all rational field isomorphism classes, including the D₄ contribution in degree four. -/
theorem allFields_degree_le_five (n : ℕ) (hn : 2 ≤ n ∧ n ≤ 5) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = n ∧ |(NumberField.discr K.val : ℝ)| < X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / n else 0
    ∃ c : ℝ, 0 < c ∧ Tendsto (fun X => count X / X) atTop (𝓝 c) := by sorry

/-- Monogenic fields of squarefree discriminant satisfy the stated lower bound
in every degree and signature, with the full symmetric normal-closure group. -/
theorem monogenicField_lowerBound (n r : ℕ) (hn : 2 ≤ n) (hr : 2 * r ≤ n) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = n ∧
            Module.finrank ℚ (IntermediateField.normalClosure ℚ K.val
              (AlgebraicClosure ℚ)) = n.factorial ∧
            NumberField.InfinitePlace.nrComplexPlaces K.val = r ∧
            TauCeti.NumberField.IsMonogenic K.val ∧ Squarefree (NumberField.discr K.val) ∧
            |(NumberField.discr K.val : ℝ)| < X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / n else 0
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ X : ℝ in atTop, c * X ^ (1 / 2 + 1 / (n : ℝ)) ≤ count X :=
  by sorry

/-- In every degree and signature, the short integral generator family has
the lower bound with exponent (n−1)(n+2)/2, even with monogenicity and squarefree discriminant. -/
theorem monogenicField_shortGenerator_lowerBound (n r : ℕ)
    (hn : 2 ≤ n) (hr : 2 * r ≤ n) :
    let count := fun Y : ℝ =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = n ∧
            Module.finrank ℚ (IntermediateField.normalClosure ℚ K.val
              (AlgebraicClosure ℚ)) = n.factorial ∧
            NumberField.InfinitePlace.nrComplexPlaces K.val = r ∧
            TauCeti.NumberField.IsMonogenic K.val ∧ Squarefree (NumberField.discr K.val) ∧
            (∃ α : 𝓞 K.val, Algebra.adjoin ℚ {(α : K.val)} = ⊤ ∧
              ∀ σ : K.val →+* ℂ, ‖σ (α : K.val)‖ ≤ Y) then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / n else 0
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ Y : ℝ in atTop,
      c * Y ^ (((n : ℝ) - 1) * ((n : ℝ) + 2) / 2) ≤ count Y := by sorry

/-- Cubic field counts have Roberts' secondary constants and the stated power-saving error. -/
theorem roberts_cubicFieldsSecondary (δ : ℝ) (hδ : 0 < δ) :
    let count := fun (ε : ℤ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = 3 ∧ 0 < ε * NumberField.discr K.val ∧
            ((ε * NumberField.discr K.val : ℤ) : ℝ) < X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / 3 else 0
    ∃ C : ℝ, 0 < C ∧ ∀ ε : ℤ, ε = 1 ∨ ε = -1 → ∀ X : ℝ, 1 ≤ X →
      |count ε X - X / ((if ε = 1 then 12 else 4) * (riemannZeta 3).re) -
        (if ε = 1 then 1 else Real.sqrt 3) *
          (4 * (riemannZeta (1 / 3)).re /
            (5 * Real.Gamma (2 / 3) ^ 3 * (riemannZeta (5 / 3)).re)) * X ^ (5 / 6 : ℝ)| ≤
        C * X ^ (5 / 6 - 1 / 48 + δ) := by sorry

/-- Quadratic three-torsion sums have the secondary Euler-product constant,
with the real and imaginary factors and the power-saving error retained. -/
theorem davenportHeilbronn_threeTorsionSecondary (δ : ℝ) (hδ : 0 < δ) :
    let total := fun (m : ℕ) (ε : ℤ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = 2 ∧ 0 < ε * NumberField.discr K.val ∧
            ((ε * NumberField.discr K.val : ℤ) : ℝ) < X then
          (Nat.card {c : ClassGroup (𝓞 K.val) // c ^ m = 1} : ℝ) else 0
    let c := 8 * (riemannZeta (1 / 3)).re / (5 * Real.Gamma (2 / 3) ^ 3) *
      ∏' p : Nat.Primes, (1 - ((p.val : ℝ) ^ (1 / 3 : ℝ) + 1) /
        ((p.val : ℝ) * (p.val + 1)))
    ∃ C : ℝ, 0 < C ∧ ∀ ε : ℤ, ε = 1 ∨ ε = -1 → ∀ X : ℝ, 1 ≤ X →
      |total 3 ε X - (if ε = 1 then 4 / 3 else 2) * total 1 ε X -
        (if ε = 1 then 1 else Real.sqrt 3) * c * X ^ (5 / 6 : ℝ)| ≤
        C * X ^ (5 / 6 - 1 / 48 + δ) := by sorry

/-- Schmidt's absolute-discriminant bound has a constant uniform over all base
fields of a fixed degree; embedded fields carry automorphism order over relative degree. -/
theorem schmidt_fieldCount_uniform (m n : ℕ) (hm : 1 ≤ m) (hn : 2 ≤ n) :
    ∃ C : ℝ, 0 < C ∧ ∀ (F : Type*) [Field F] [NumberField F],
      Module.finrank ℚ F = m → ∀ X : ℝ, 1 ≤ X →
        (∑ᶠ K : {L : IntermediateField F (AlgebraicClosure F) // FiniteDimensional F L},
          letI : FiniteDimensional F K.val := K.property
          letI : NumberField K.val := NumberField.of_module_finite F K.val
          if Module.finrank F K.val = n ∧ |(NumberField.discr K.val : ℝ)| ≤ X then
            (Nat.card (K.val ≃ₐ[F] K.val) : ℝ) / n else 0) ≤
          C * X ^ (((n : ℝ) + 2) / 4) := by sorry

/-- Squarefree field discriminant forces the normal closure to have full
symmetric permutation group, expressed by its degree n!. -/
theorem squarefree_discriminant_fullSymmetric (K : Type*) [Field K] [NumberField K]
    (n : ℕ) (hn : 2 ≤ n) (hdegree : Module.finrank ℚ K = n)
    (hdisc : Squarefree (NumberField.discr K)) :
    Module.finrank ℚ (IntermediateField.normalClosure ℚ K (AlgebraicClosure ℚ)) =
      n.factorial := by sorry

/-- The mixed-trace field count gives the explicit, asymptotic, and two-generator
exponents of Lemke Oliver and Thorne, with constants depending on the degree and exponent. -/
theorem lemkeOliverThorne_fieldCount :
    let count := fun (n : ℕ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = n ∧ |(NumberField.discr K.val : ℝ)| ≤ X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / n else 0
    let bound := fun (n : ℕ) (a : ℝ) =>
      ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X → count n X ≤ C * X ^ a
    (∀ n : ℕ, 6 ≤ n → bound n (1.564 * (Real.log n) ^ 2)) ∧
    (∀ c : ℝ, 1 / (4 * (Real.log 2) ^ 2) < c → ∃ n₀ : ℕ,
      ∀ n : ℕ, n₀ ≤ n → 6 ≤ n → bound n (c * (Real.log n) ^ 2)) ∧
    (∀ n r d : ℕ, 6 ≤ n → 3 ≤ r → r ≤ n → r * n < (d + r - 1).choose (r - 1) →
      bound n ((d : ℝ) * r)) ∧
    (∀ n d : ℕ, 6 ≤ n → 2 * n + 1 ≤ (d + 2).choose 2 →
      (∀ e < d, (e + 2).choose 2 < 2 * n + 1) →
      bound n (2 * d - (d : ℝ) * (d - 1) * (d + 4) / (6 * n))) := by sorry

/-- The simple-group large-subgroup inequality implies the three-eighths bound
for every Galois type of order greater than four over any fixed number-field base. -/
theorem galois_count_threeEighths_of_largeSubgroups
    (hsub : ∀ (S : Type*) [Group S] [Finite S] [IsSimpleGroup S],
      (∃ x y : S, x * y ≠ y * x) →
      ∃ H : Subgroup S, H ≠ ⊤ ∧ Nat.card S < (Nat.card H) ^ 2)
    (k G : Type*) [Field k] [NumberField k] [Group G] [Finite G]
    (hG : 4 < Nat.card G) (δ : ℝ) (hδ : 0 < δ) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField k (AlgebraicClosure k) // FiniteDimensional k L},
        letI : FiniteDimensional k K.val := K.property
        letI : NumberField K.val := NumberField.of_module_finite k K.val
        if Module.finrank k K.val = Nat.card G ∧ Normal k K.val ∧
            Nonempty ((K.val ≃ₐ[k] K.val) ≃* G) ∧
            |(NumberField.discr K.val : ℝ)| /
              |(NumberField.discr k : ℝ)| ^ Nat.card G ≤ X then 1 else (0 : ℝ)
    ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X → count X ≤ C * X ^ (3 / 8 + δ) := by sorry

/-- Galois extensions of each fixed type of order greater than four satisfy
the three-eighths discriminant bound over every fixed number-field base. -/
theorem galois_count_threeEighths
    (k G : Type*) [Field k] [NumberField k] [Group G] [Finite G]
    (hG : 4 < Nat.card G) (δ : ℝ) (hδ : 0 < δ) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField k (AlgebraicClosure k) // FiniteDimensional k L},
        letI : FiniteDimensional k K.val := K.property
        letI : NumberField K.val := NumberField.of_module_finite k K.val
        if Module.finrank k K.val = Nat.card G ∧ Normal k K.val ∧
            Nonempty ((K.val ≃ₐ[k] K.val) ≃* G) ∧
            |(NumberField.discr K.val : ℝ)| /
              |(NumberField.discr k : ℝ)| ^ Nat.card G ≤ X then 1 else (0 : ℝ)
    ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X → count X ≤ C * X ^ (3 / 8 + δ) := by sorry

/-- Convergence of all exponential rank moments determines each limiting rank probability. -/
theorem rank_moments_determine_rank_law (p : ℕ) [Fact p.Prime] (u : ℕ)
    (μ : ℝ → ℕ → ℝ) (hμ : ∀ X r, 0 ≤ μ X r)
    (hmass : ∀ X, HasSum (μ X) 1)
    (hsum : ∀ X k, Summable (fun r : ℕ => (p : ℝ) ^ (k * r) * μ X r))
    (hmom : ∀ k : ℕ, Tendsto (fun X => ∑' r : ℕ, (p : ℝ) ^ (k * r) * μ X r)
      atTop (𝓝 (∑ j ∈ Finset.range (k + 1),
        (Nat.card {W : Submodule (ZMod p) (Fin k → ZMod p) //
          Module.finrank (ZMod p) W = j} : ℝ) / (p : ℝ) ^ (u * j)))) :
    ∀ r : ℕ, Tendsto (fun X => μ X r) atTop
      (𝓝 (((p : ℝ) ^ (r * (r + u)))⁻¹ *
        (∏' i : ℕ, (1 - ((p : ℝ) ^ (i + 1))⁻¹)) /
        ((∏ i ∈ Finset.Icc 1 r, (1 - ((p : ℝ) ^ i)⁻¹)) *
          ∏ i ∈ Finset.Icc 1 (r + u), (1 - ((p : ℝ) ^ i)⁻¹)))) := by sorry

/-- Each sign of quadratic fundamental discriminants has density three over pi squared. -/
theorem quadratic_discriminant_count :
    ∃ C : ℝ, 0 < C ∧ ∀ (ε : ℤ), ε = 1 ∨ ε = -1 → ∀ X : ℝ, 1 ≤ X →
      |(Set.ncard {D : ℤ | D.IsFundamentalDiscr ∧ D ≠ 1 ∧
          0 < ε * D ∧ ((ε * D : ℤ) : ℝ) < X} : ℝ) -
        (3 / Real.pi ^ 2) * X| ≤ C * Real.sqrt X := by sorry

/-- A degree-uniform discriminant saving bounds two-torsion in every field of fixed degree. -/
theorem classGroupTwoTorsion_powerSaving (n : ℕ) (hn : 3 ≤ n) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ (K : Type*) [Field K] [NumberField K],
      Module.finrank ℚ K = n →
      (Nat.card {c : ClassGroup (𝓞 K) // c ^ 2 = 1} : ℝ) ≤
        C * |(NumberField.discr K : ℝ)| ^ (1 / 2 - 1 / (2 * (n : ℝ)) + ε) := by sorry

/-- The elliptic-curve feedback bound improves two-torsion estimates for all cubic fields. -/
theorem cubicClassGroupTwoTorsion_bound (ε : ℝ) (hε : 0 < ε) :
    let α := Real.sqrt 3 / 2
    let β := ((1 + α) / (2 * α)) * Real.log ((1 + α) / (2 * α)) -
      ((1 - α) / (2 * α)) * Real.log ((1 - α) / (2 * α))
    ∃ C : ℝ, 0 < C ∧ ∀ (K : Type*) [Field K] [NumberField K],
      Module.finrank ℚ K = 3 →
      (Nat.card {c : ClassGroup (𝓞 K) // c ^ 2 = 1} : ℝ) ≤
        C * |(NumberField.discr K : ℝ)| ^ (1 / (6 * (1 - β / Real.log 2)) + ε) := by sorry

/-- The integer ring has a full integral basis of uniformly bounded archimedean size. -/
theorem integerLattice_largestMinimum (n : ℕ) (hn : 2 ≤ n) :
    ∃ C : ℝ, 0 < C ∧ ∀ (K : Type*) [Field K] [NumberField K],
      Module.finrank ℚ K = n → ∃ b : Module.Basis (Fin n) ℤ (𝓞 K),
        ∀ (i : Fin n) (σ : K →+* ℂ),
          ‖σ (b i : K)‖ ≤ C * |(NumberField.discr K : ℝ)| ^ (1 / (n : ℝ)) := by sorry

/-- Integral Weierstrass points satisfy the uniform discriminant and Mordell–Weil rank bound. -/
theorem elliptic_integralPoints_rankBound (ε : ℝ) (hε : 0 < ε) :
    let α := Real.sqrt 3 / 2
    let β := ((1 + α) / (2 * α)) * Real.log ((1 + α) / (2 * α)) -
      ((1 - α) / (2 * α)) * Real.log ((1 - α) / (2 * α))
    ∃ C : ℝ, 0 < C ∧ ∀ W : WeierstrassCurve ℤ, W.Δ ≠ 0 →
      {xy : ℤ × ℤ | W.toAffine.Equation xy.1 xy.2}.Finite ∧
      (Set.ncard {xy : ℤ × ℤ | W.toAffine.Equation xy.1 xy.2} : ℝ) ≤
        C * |(W.Δ : ℝ)| ^ ε *
          Real.exp ((β + ε) * Module.finrank ℤ
            (W.map (Int.castRingHom ℚ)).toAffine.Point) := by sorry


/-- The transported action on embeddings has precisely the specified permutation image. -/
def HasGaloisType {k E Ω : Type*} [Field k] [Field E] [Algebra k E]
    (G : Subgroup (Equiv.Perm Ω)) : Prop :=
  ∃ e : (E →ₐ[k] AlgebraicClosure k) ≃ Ω,
    ∀ σ : Equiv.Perm Ω, σ ∈ G ↔
      ∃ τ : AlgebraicClosure k ≃ₐ[k] AlgebraicClosure k,
        ∀ φ : E →ₐ[k] AlgebraicClosure k, e (τ.toAlgHom.comp φ) = σ (e φ)

/-- The cyclotomic wreath subfamily violates the strong Malle logarithmic exponent. -/
theorem kluners_cyclotomic_lowerBound :
    let G := (RegularWreathProduct.toPerm
      (Multiplicative (ZMod 3)) (Multiplicative (ZMod 2)) (Multiplicative (ZMod 3))).range
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if HasGaloisType (k := ℚ) (E := K.val) G ∧
            |(NumberField.discr K.val : ℝ)| ≤ X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / 6 else 0
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ X : ℝ in atTop,
      c * X ^ (1 / 2 : ℝ) * Real.log X ≤ count X := by sorry

/-- Odd-degree binary forms give fields of each signature with squarefree discriminant. -/
theorem binaryFormField_lowerBound (n r : ℕ) (hn : 3 ≤ n) (hodd : Odd n)
    (hr : 2 * r ≤ n) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = n ∧
            Module.finrank ℚ (IntermediateField.normalClosure ℚ K.val
              (AlgebraicClosure ℚ)) = n.factorial ∧
            NumberField.InfinitePlace.nrComplexPlaces K.val = r ∧
            Squarefree (NumberField.discr K.val) ∧ |(NumberField.discr K.val : ℝ)| < X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / n else 0
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ X : ℝ in atTop,
      c * X ^ (((n : ℝ) + 1) / (2 * n - 2)) ≤ count X := by sorry

/-- Both signs of quadratic bases support the odd-degree alternating-extension lower bound.
The top field is normal over ℚ, so embedded pairs are precisely ℚ-isomorphism classes. -/
theorem unramifiedAlternatingExtension_lowerBound (n : ℕ) (hn : 3 ≤ n) (hodd : Odd n) :
    let count := fun (ε : ℤ) (X : ℝ) =>
      ∑ᶠ L : {E : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ E},
        letI : FiniteDimensional ℚ L.val := L.property
        letI : NumberField L.val := @NumberField.mk _ _ inferInstance L.property
        ∑ᶠ k : IntermediateField ℚ L.val,
          letI : NumberField k := NumberField.of_module_finite ℚ k
          if Module.finrank ℚ k = 2 ∧ Squarefree (NumberField.discr k) ∧
              Normal ℚ L.val ∧ IsGalois k L.val ∧
              Nonempty ((L.val ≃ₐ[ℚ] L.val) ≃* Equiv.Perm (Fin n)) ∧
              (∃ K : IntermediateField ℚ L.val,
                letI : NumberField K := NumberField.of_module_finite ℚ K
                Module.finrank ℚ K = n ∧ Squarefree (NumberField.discr K) ∧
                  IntermediateField.normalClosure ℚ K L.val = ⊤) ∧
              Nonempty ((L.val ≃ₐ[k] L.val) ≃* alternatingGroup (Fin n)) ∧
              Algebra.Unramified (𝓞 k) (𝓞 L.val) ∧
              IsUnramifiedAtInfinitePlaces k L.val ∧
              0 < ε * NumberField.discr k ∧ ((ε * NumberField.discr k : ℤ) : ℝ) < X then
            (1 : ℝ) else 0
    ∀ ε : ℤ, ε = 1 ∨ ε = -1 → ∃ c : ℝ, 0 < c ∧ ∀ᶠ X : ℝ in atTop,
      c * X ^ (((n : ℝ) + 1) / (2 * n - 2)) ≤ count ε X := by sorry

/-- The restricted squarefree positive radicands, including the unit radicand. -/
def pellRadicands : Set ℕ :=
  {d | 0 < d ∧ Squarefree d ∧ ∀ p ∈ d.primeFactors, p = 2 ∨ p % 4 = 1}

/-- Integral solubility of the negative Pell equation in the restricted family. -/
def negativePellRadicands : Set ℕ :=
  {d ∈ pellRadicands | ∃ x y : ℤ, x ^ 2 - (d : ℤ) * y ^ 2 = -1}

/-- Strict radicand-ordered proportions, with an optional fixed number of prime factors. -/
def negativePellProportion (t : Option ℕ) (X : ℝ) : ℝ :=
  (Set.ncard {d : ℕ | d ∈ negativePellRadicands ∧ (d : ℝ) < X ∧
    (t = none ∨ t = some d.primeFactors.card)} : ℝ) /
  (Set.ncard {d : ℕ | d ∈ pellRadicands ∧ (d : ℝ) < X ∧
    (t = none ∨ t = some d.primeFactors.card)} : ℝ)

/-- The historical negative-Pell lower product and upper bound hold in radicand order. -/
theorem negativePell_historicalBounds :
    let α := ∏' j : ℕ, (1 - ((2 : ℝ) ^ (2 * j + 1))⁻¹)
    α ≤ liminf (negativePellProportion none) atTop ∧
      limsup (negativePellProportion none) atTop ≤ 2 / 3 := by sorry

/-- For every fixed positive prime-factor count the finite symmetric-matrix product is a lower bound. -/
theorem pell_fixedPrimeFactor_lower (t : ℕ) (ht : 1 ≤ t) :
    let q := ∏ j ∈ Finset.Icc 1 (t / 2), (1 - ((2 : ℝ) ^ (2 * j - 1))⁻¹)
    q ≤ liminf (negativePellProportion (some t)) atTop ∧
      (∏' j : ℕ, (1 - ((2 : ℝ) ^ (2 * j + 1))⁻¹)) ≤ q := by sorry

/-- Cyclic prime-degree fields have the sharp pure-power upper bound. -/
theorem cyclicPrime_fieldCount (p : ℕ) (hp : p.Prime) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = p ∧ Normal ℚ K.val ∧
            |(NumberField.discr K.val : ℝ)| ≤ X then (1 : ℝ) else 0
    ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X →
      count X ≤ C * X ^ (1 / ((p : ℝ) - 1)) := by sorry

/-- Each fixed quadratic resolvent has a positive cubic count, including the exceptional logarithm. -/
theorem fixedResolvent_cubicFields (F : Type*) [Field F] [NumberField F]
    (hF : Module.finrank ℚ F = 2) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if Module.finrank ℚ K.val = 3 ∧
            Module.finrank ℚ (IntermediateField.normalClosure ℚ K.val
              (AlgebraicClosure ℚ)) = 6 ∧
            (∃ f : ℕ, NumberField.discr K.val = NumberField.discr F * (f : ℤ) ^ 2) ∧
            |(NumberField.discr K.val : ℝ)| < X then 1 / (3 : ℝ) else 0
    ∃ c : ℝ, 0 < c ∧
      (NumberField.discr F = -3 → c = 7 / (60 * Real.sqrt 3) *
        ∏' p : Nat.Primes, (1 - 3 / (p.val : ℝ) ^ 2 + 2 / (p.val : ℝ) ^ 3)) ∧
      Tendsto (fun X => count X /
        (X ^ (1 / 2 : ℝ) * (if NumberField.discr F = -3 then Real.log X else 1)))
        atTop (𝓝 c) := by sorry

/-- The cumulative quadratic-extension estimate is uniform over bases of fixed degree. -/
theorem quadraticFieldCount_uniform (m : ℕ) (hm : 1 ≤ m) (ε : ℝ) (hε : 0 < ε) :
    ∃ C : ℝ, 0 < C ∧ ∀ (F : Type*) [Field F] [NumberField F],
      Module.finrank ℚ F = m → ∀ X : ℝ, 1 ≤ X →
      (∑ᶠ K : {L : IntermediateField F (AlgebraicClosure F) // FiniteDimensional F L},
        letI : FiniteDimensional F K.val := K.property
        letI : NumberField K.val := NumberField.of_module_finite F K.val
        if Module.finrank F K.val = 2 ∧
            |(NumberField.discr K.val : ℝ)| / |(NumberField.discr F : ℝ)| ^ 2 ≤ X then
          (1 : ℝ) else 0) ≤ C *
            (Nat.card {c : ClassGroup (𝓞 F) // c ^ 2 = 1} : ℝ) *
            |(NumberField.discr F : ℝ)| ^ ε * X := by sorry

/-- Embedded two-extensions have a positive linear constant given by their quadratic bases. -/
theorem twoExtension_fieldCount (k : Type*) [Field k] [NumberField k]
    (m : ℕ) (hm : 1 ≤ m) :
    let count := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField k (AlgebraicClosure k) // FiniteDimensional k L},
        letI : FiniteDimensional k K.val := K.property
        letI : NumberField K.val := NumberField.of_module_finite k K.val
        if Module.finrank k K.val = 2 ^ m ∧
            (∃ a : ℕ, Module.finrank k (IntermediateField.normalClosure k K.val
              (AlgebraicClosure k)) = 2 ^ a) ∧ |(NumberField.discr K.val : ℝ)| ≤ X then
          (1 : ℝ) else 0
    let w := fun F : {L : IntermediateField k (AlgebraicClosure k) // FiniteDimensional k L} =>
      letI : FiniteDimensional k F.val := F.property
      letI : NumberField F.val := NumberField.of_module_finite k F.val
      if Module.finrank k F.val = 2 ^ (m - 1) ∧
          (∃ a : ℕ, Module.finrank k (IntermediateField.normalClosure k F.val
            (AlgebraicClosure k)) = 2 ^ a) then
        NumberField.dedekindZeta_residue F.val /
          (2 ^ NumberField.InfinitePlace.nrComplexPlaces F.val *
            (NumberField.dedekindZeta F.val 2).re * |(NumberField.discr F.val : ℝ)| ^ 2)
      else 0
    Summable w ∧ 0 < ∑' F, w F ∧
      Tendsto (fun X => count X / X) atTop (𝓝 (∑' F, w F)) := by sorry

/-- The absolute three-torsion mean over embedded two-extensions is the convergent base-weighted ratio. -/
theorem twoExtension_threeTorsionMean (k : Type*) [Field k] [NumberField k]
    (m : ℕ) (hm : 1 ≤ m) :
    let total := fun (ℓ : ℕ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField k (AlgebraicClosure k) // FiniteDimensional k L},
        letI : FiniteDimensional k K.val := K.property
        letI : NumberField K.val := NumberField.of_module_finite k K.val
        if Module.finrank k K.val = 2 ^ m ∧
            (∃ a : ℕ, Module.finrank k (IntermediateField.normalClosure k K.val
              (AlgebraicClosure k)) = 2 ^ a) ∧ |(NumberField.discr K.val : ℝ)| ≤ X then
          (Nat.card {c : ClassGroup (𝓞 K.val) // c ^ ℓ = 1} : ℝ) else 0
    let w := fun (ℓ : ℕ)
      (F : {L : IntermediateField k (AlgebraicClosure k) // FiniteDimensional k L}) =>
      letI : FiniteDimensional k F.val := F.property
      letI : NumberField F.val := NumberField.of_module_finite k F.val
      if Module.finrank k F.val = 2 ^ (m - 1) ∧
          (∃ a : ℕ, Module.finrank k (IntermediateField.normalClosure k F.val
            (AlgebraicClosure k)) = 2 ^ a) then
        NumberField.dedekindZeta_residue F.val /
          (2 ^ NumberField.InfinitePlace.nrComplexPlaces F.val *
            (NumberField.dedekindZeta F.val 2).re * |(NumberField.discr F.val : ℝ)| ^ 2) *
          (Nat.card {c : ClassGroup (𝓞 F.val) // c ^ ℓ = 1} : ℝ) *
          (if ℓ = 1 then 1 else 1 + (2 : ℝ) ^ NumberField.InfinitePlace.nrRealPlaces F.val /
            3 ^ (NumberField.InfinitePlace.nrRealPlaces F.val +
              NumberField.InfinitePlace.nrComplexPlaces F.val))
      else 0
    Summable (w 1) ∧ Summable (w 3) ∧ 0 < ∑' F, w 1 F ∧
      Tendsto (fun X => total 3 X / total 1 X) atTop
        (𝓝 ((∑' F, w 3 F) / ∑' F, w 1 F)) := by sorry

/-- The imprimitive quadratic wreath group, generated by block flips and the base permutation group. -/
def quadraticWreathType {d : ℕ} (H : Subgroup (Equiv.Perm (Fin d))) :
    Subgroup (Equiv.Perm (Fin d × Fin 2)) :=
  Subgroup.closure
    ({g | ∃ i : Fin d, g = Equiv.prodCongrRight
      (fun j : Fin d => if j = i then Equiv.swap (0 : Fin 2) 1 else Equiv.refl _)} ∪
      {g | ∃ h : H, g = Equiv.prodCongr h.val (Equiv.refl (Fin 2))})

/-- Relative wreath three-torsion has the unit-rank mean, for two-groups and
for every transitive base group satisfying the general counting hypothesis. -/
theorem relativeWreath_threeTorsionMean (k : Type*) [Field k] [NumberField k]
    (d : ℕ) (hd : 1 ≤ d) (H : Subgroup (Equiv.Perm (Fin d)))
    (htrans : MulAction.IsPretransitive H (Fin d)) (u : ℕ) :
    let baseCount := fun X : ℝ =>
      ∑ᶠ F : {L : IntermediateField k (AlgebraicClosure k) // FiniteDimensional k L},
        letI : FiniteDimensional k F.val := F.property
        letI : NumberField F.val := NumberField.of_module_finite k F.val
        if HasGaloisType (k := k) (E := F.val) H ∧
            |(NumberField.discr F.val : ℝ)| ≤ X then (1 : ℝ) else 0
    let total := fun (ℓ : ℕ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField k (AlgebraicClosure k) // FiniteDimensional k L},
        letI : FiniteDimensional k K.val := K.property
        letI : NumberField K.val := NumberField.of_module_finite k K.val
        ∑ᶠ F : IntermediateField k K.val,
          letI : NumberField F := NumberField.of_module_finite k F
          if HasGaloisType (k := k) (E := K.val) (quadraticWreathType H) ∧
              Module.finrank F K.val = 2 ∧
              NumberField.InfinitePlace.nrRealPlaces K.val +
                NumberField.InfinitePlace.nrComplexPlaces K.val -
                  (NumberField.InfinitePlace.nrRealPlaces F +
                    NumberField.InfinitePlace.nrComplexPlaces F) = u ∧
              |(NumberField.discr K.val : ℝ)| ≤ X then
            (Nat.card {c : ClassGroup (𝓞 K.val) //
              ClassGroup.relNorm (R := 𝓞 F) c = 1 ∧ c ^ ℓ = 1} : ℝ) *
              Nat.card (K.val ≃ₐ[k] K.val) / (2 * d) else 0
    (IsPGroup 2 H ∨ ∀ ε : ℝ, 0 < ε → ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X →
      baseCount X ≤ C * X ^ (2 / 3 + ε)) →
    (∃ X : ℝ, 0 < total 1 X) →
    Tendsto (fun X => total 3 X / total 1 X) atTop (𝓝 (1 + ((3 : ℝ) ^ u)⁻¹)) := by sorry

/-- Mertens' unweighted count includes every positive definite proper form class, primitive or not. -/
theorem mertens_positiveDefiniteForms :
    let count := fun X : ℝ =>
      ∑ᶠ D : ℕ+,
        letI : NeZero (D : ℕ) := ⟨D.ne_zero⟩
        if (D : ℝ) < X then
          (Nat.card (MulAction.orbitRel.Quotient
            (Matrix.SpecialLinearGroup (Fin 2) ℤ)
            (TauCeti.BinaryQuadraticForm.posDef (D : ℕ))) : ℝ) else 0
    ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 2 ≤ X →
      |count X - (Real.pi / 18) * X ^ (3 / 2 : ℝ)| ≤ C * X * Real.log X := by sorry

/-- Proper primitive classes of an integral binary quadratic discriminant. -/
def primitiveQuadraticClassNumber (D : ℤ) : ℕ :=
  Nat.card {q : MulAction.orbitRel.Quotient (Matrix.SpecialLinearGroup (Fin 2) ℤ)
      (TauCeti.BinaryQuadraticForm ℤ) //
    ∃ f : TauCeti.BinaryQuadraticForm ℤ, Quotient.mk'' f = q ∧ f.discrim = D ∧
      Int.gcd f.a (Int.gcd f.b f.c : ℤ) = 1}

/-- The positive norm-one period of the quadratic order, expressed through its Pell equation. -/
def quadraticOrderNormOneRegulator (D : ℤ) : ℝ :=
  Real.log (sInf {x : ℝ | ∃ t u : ℤ, 2 < t ∧ 0 < u ∧ t ^ 2 - D * u ^ 2 = 4 ∧
    x = ((t : ℝ) + u * Real.sqrt D) / 2})

/-- Siegel's primitive indefinite form classes are weighted by their own order's norm-one regulator. -/
theorem siegel_indefiniteForms :
    let total := fun X : ℝ =>
      ∑ᶠ D : ℕ+, if (D : ℝ) < X ∧ ¬ IsSquare (D : ℤ) then
        (primitiveQuadraticClassNumber (D : ℤ) : ℝ) * quadraticOrderNormOneRegulator D
      else 0
    ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 2 ≤ X →
      |total X - (Real.pi ^ 2 / (18 * (riemannZeta 3).re)) * X ^ (3 / 2 : ℝ)| ≤
        C * X * Real.log X := by sorry

/-- The known alternating/symmetric nonabelian moments in degrees three through five over any base. -/
theorem lowDegree_alternatingMoment (k : Type*) [Field k] [NumberField k]
    (n a : ℕ) (hn : 3 ≤ n ∧ n ≤ 5)
    (ha : a ≤ NumberField.InfinitePlace.nrRealPlaces k) :
    let denominator := fun X : ℝ =>
      ∑ᶠ F : {L : IntermediateField k (AlgebraicClosure k) // FiniteDimensional k L},
        letI : FiniteDimensional k F.val := F.property
        letI : NumberField F.val := NumberField.of_module_finite k F.val
        if Module.finrank k F.val = 2 ∧ NumberField.InfinitePlace.nrRealPlaces F.val = 2 * a ∧
            |(NumberField.discr F.val : ℝ)| < X then (1 : ℝ) else 0
    let numerator := fun X : ℝ =>
      ∑ᶠ L : {E : IntermediateField k (AlgebraicClosure k) // FiniteDimensional k E},
        letI : FiniteDimensional k L.val := L.property
        letI : NumberField L.val := NumberField.of_module_finite k L.val
        ∑ᶠ F : IntermediateField k L.val,
          letI : NumberField F := NumberField.of_module_finite k F
          if Module.finrank k F = 2 ∧ Normal k L.val ∧ IsGalois F L.val ∧
              Nonempty ((L.val ≃ₐ[k] L.val) ≃* Equiv.Perm (Fin n)) ∧
              Nonempty ((L.val ≃ₐ[F] L.val) ≃* alternatingGroup (Fin n)) ∧
              Algebra.Unramified (𝓞 F) (𝓞 L.val) ∧
              IsUnramifiedAtInfinitePlaces F L.val ∧
              NumberField.InfinitePlace.nrRealPlaces F = 2 * a ∧
              |(NumberField.discr F : ℝ)| < X then (1 : ℝ) else 0
    Tendsto (fun X => numerator X / denominator X) atTop
      (𝓝 ((1 / 2) * (2 / (n.factorial : ℝ)) ^
        (NumberField.InfinitePlace.nrComplexPlaces k + a) *
        (1 / ((n - 2).factorial : ℝ)) ^
          (NumberField.InfinitePlace.nrRealPlaces k - a))) := by sorry

/-- Cubic two-torsion bounds give the A₄ and fixed-quadratic-resolvent S₄ field exponents. -/
theorem quarticTorsion_fieldCounts (ε : ℝ) (hε : 0 < ε) :
    let α := Real.sqrt 3 / 2
    let β := ((1 + α) / (2 * α)) * Real.log ((1 + α) / (2 * α)) -
      ((1 - α) / (2 * α)) * Real.log ((1 - α) / (2 * α))
    let a := 1 / (6 * (1 - β / Real.log 2))
    let alternatingCount := fun X : ℝ =>
      ∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
        letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
        if HasGaloisType (k := ℚ) (E := K.val) (alternatingGroup (Fin 4)) ∧
            |(NumberField.discr K.val : ℝ)| ≤ X then
          (Nat.card (K.val ≃ₐ[ℚ] K.val) : ℝ) / 4 else 0
    (∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X →
      alternatingCount X ≤ C * X ^ (1 / 2 + a + ε)) ∧
    ∀ (F : Type*) [Field F] [NumberField F], Module.finrank ℚ F = 2 →
      ∃ C : ℝ, 0 < C ∧ ∀ X : ℝ, 1 ≤ X →
        (∑ᶠ K : {L : IntermediateField ℚ (AlgebraicClosure ℚ) // FiniteDimensional ℚ L},
          letI : NumberField K.val := @NumberField.mk _ _ inferInstance K.property
          if Module.finrank ℚ K.val = 4 ∧
              Module.finrank ℚ (IntermediateField.normalClosure ℚ K.val
                (AlgebraicClosure ℚ)) = 24 ∧
              (∃ f : ℕ, NumberField.discr K.val = NumberField.discr F * (f : ℤ) ^ 2) ∧
              |(NumberField.discr K.val : ℝ)| ≤ X then 1 / (4 : ℝ) else 0) ≤
            C * X ^ (1 / 2 + a + ε) := by sorry

/-- Ordinary relative two-torsion has the BSW mean over cubic fields of every base and real-place type. -/
theorem cubicTwoTorsion_relativeMean (F : Type*) [Field F] [NumberField F]
    (a : ℕ) (ha : a ≤ NumberField.InfinitePlace.nrRealPlaces F) :
    let total := fun (ℓ : ℕ) (X : ℝ) =>
      ∑ᶠ K : {L : IntermediateField F (AlgebraicClosure F) // FiniteDimensional F L},
        letI : FiniteDimensional F K.val := K.property
        letI : NumberField K.val := NumberField.of_module_finite F K.val
        if Module.finrank F K.val = 3 ∧
            Module.finrank F (IntermediateField.normalClosure F K.val
              (AlgebraicClosure F)) = 6 ∧
            NumberField.InfinitePlace.nrRealPlaces K.val =
              NumberField.InfinitePlace.nrRealPlaces F + 2 * a ∧
            |(NumberField.discr K.val : ℝ)| < X then
          (Nat.card {c : ClassGroup (𝓞 K.val) //
            ClassGroup.relNorm (R := 𝓞 F) c = 1 ∧ c ^ ℓ = 1} : ℝ) *
              Nat.card (K.val ≃ₐ[F] K.val) / 3 else 0
    Tendsto (fun X => total 2 X / total 1 X) atTop
      (𝓝 (1 + ((2 : ℝ) ^ (NumberField.InfinitePlace.nrRealPlaces F +
        2 * NumberField.InfinitePlace.nrComplexPlaces F + a))⁻¹)) := by sorry


end FieldStatistics
end TauCetiRoadmap.ArithmeticStatisticsPartV
