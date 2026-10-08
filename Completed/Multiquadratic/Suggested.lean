import Mathlib
import TauCeti.Algebra.Group.PowMonoidHom
import TauCeti.FieldTheory.IntermediateField.Quadratic
import TauCeti.FieldTheory.SquareClassGroup.Basic
import TauCeti.NumberTheory.ClassGroup.ElementaryTwoQuotient
import TauCeti.NumberTheory.DedekindDomain.Transversal
import TauCeti.NumberTheory.EffectiveBounds.UnitSquares.Basic
import TauCeti.NumberTheory.Multiquadratic.CMField.Basic
import TauCeti.NumberTheory.Multiquadratic.CandidateGenusField.Degree
import TauCeti.NumberTheory.Multiquadratic.CandidateGenusField.RamifiedPrimes
import TauCeti.NumberTheory.Multiquadratic.CandidateGenusField.Real.Basic
import TauCeti.NumberTheory.Multiquadratic.CandidateGenusField.Relative.GenusCharacter
import TauCeti.NumberTheory.Multiquadratic.CandidateGenusField.Relative.Real
import TauCeti.NumberTheory.Multiquadratic.Degree
import TauCeti.NumberTheory.Multiquadratic.EvenPrimeDiscriminant
import TauCeti.NumberTheory.Multiquadratic.Frobenius
import TauCeti.NumberTheory.Multiquadratic.Galois.Basic
import TauCeti.NumberTheory.Multiquadratic.Galois.Exponent
import TauCeti.NumberTheory.Multiquadratic.Galois.Group
import TauCeti.NumberTheory.Multiquadratic.GenusField
import TauCeti.NumberTheory.Multiquadratic.MinusFive.ClassNumber
import TauCeti.NumberTheory.Multiquadratic.MinusFive.GenusField
import TauCeti.NumberTheory.Multiquadratic.MinusFive.RelativeDegree
import TauCeti.NumberTheory.Multiquadratic.MinusFive.TwoRank
import TauCeti.NumberTheory.Multiquadratic.MinusTwentyOne.ClassNumber
import TauCeti.NumberTheory.Multiquadratic.MinusTwentyOne.GenusField
import TauCeti.NumberTheory.Multiquadratic.MinusTwentyOne.RelativeDegree
import TauCeti.NumberTheory.Multiquadratic.MinusTwentyOne.TwoRank
import TauCeti.NumberTheory.Multiquadratic.MultiquadraticSplitting
import TauCeti.NumberTheory.Multiquadratic.Prime.Radicands
import TauCeti.NumberTheory.Multiquadratic.Quadratic.AmbiguousClassNumber
import TauCeti.NumberTheory.Multiquadratic.Quadratic.Discriminant
import TauCeti.NumberTheory.Multiquadratic.Quadratic.Ramification
import TauCeti.NumberTheory.Multiquadratic.Quadratic.TwoRank
import TauCeti.NumberTheory.Multiquadratic.SquareClass.Basic
import TauCeti.NumberTheory.Multiquadratic.SquareClass.Independence
import TauCeti.NumberTheory.Multiquadratic.SquareClass.Rational
import TauCeti.NumberTheory.Multiquadratic.SquareClass.Splitting
import TauCeti.NumberTheory.Multiquadratic.Subfield.Lattice
import TauCeti.NumberTheory.Multiquadratic.Three.ClassNumber
import TauCeti.NumberTheory.Multiquadratic.Three.TwoRank
import TauCeti.NumberTheory.Multiquadratic.Unramified.NarrowGenusField
import TauCeti.NumberTheory.NumberField.NarrowClassGroup.Basic
import TauCeti.NumberTheory.NumberField.Quadratic.Conjugation.ClassGroup
import TauCeti.NumberTheory.NumberField.Units.ElementaryTwoQuotient
import TauCeti.RingTheory.DedekindDomain.ConjugateFactorization

/-!
# Multiquadratic fields and genus theory: target signatures

**This file is not the roadmap and is not exhaustive.** The definitive document is
`README.md`. The statements here suggest Lean forms for the milestones, so that
contributors and reviewers converge on names and signatures; discharging all of them
finishes neither a layer nor the roadmap.

Every milestone of `README.md` has a statement here, in the form the roadmap asks for, closed
by the Tau Ceti declaration that realizes it, so the correspondence is checked by the Lean kernel
rather than asserted in prose. No statement is left as `sorry`. That is evidence for completion,
not its criterion: completion is judged by a milestone-by-milestone audit against `README.md`,
which a `sorry`-free file of suggested forms cannot replace.

The earlier version of this file stated five targets with `sorry`: the `[ℚ(√2, √3) : ℚ] = 4`
example, the degree `2 ^ |ι|`, the `IsGalois` half of the Galois milestone, the isomorphism
`Gal ≃* Multiplicative (ι → ZMod 2)`, and the odd-prime splitting law. All five are carried over
below. Two of them changed form: `[CharZero K]` is weakened to `[NeZero (2 : K)]`, which the
README allows, and the coprimality hypothesis of the splitting law is the README's `p ∤ d₁ ⋯ dₙ`
rather than `∀ i, p ∤ dᵢ` (equivalent, since `p` is prime). Several differences between the
README and Tau Ceti are deliberate.

* The base field only needs `[NeZero (2 : K)]`, and the descent and degree theorems are stated
  for an arbitrary field `L ⊇ K`, so the rational and prime-indexed versions are corollaries.
* The splitting law does not need the radicands to be squarefree: the README's hypotheses
  (squarefree `dⱼ`, odd `p ∤ d₁ ⋯ dₙ`) are a special case. The Frobenius vector is written in
  additive `ZMod 2` coordinates, `0` for a residue and `1` for a non-residue, which is how
  `Gal ≅ (𝔽₂)ⁿ` is set up; the Legendre symbol form `σ (√dⱼ) = (dⱼ/p) • √dⱼ` is stated too.
* The genus field is a predicate `IsGenusField d L y` on an abelian extension `L / ℚ` with a
  chosen square root `y` of `d`, whose maximality clause is a root-preserving universal
  property; uniqueness up to root-preserving isomorphism is a theorem. Its narrow counterpart,
  `IsNarrowGenusField`, asks for unramifiedness at the finite places only.
* The genus-field statements are made inside `ℂ`, about the copy `candidateGenusFieldBase hd` of
  `ℚ(√d)` generated by a square root of `d` in the compositum; the class-number, ambiguous-class
  and 2-rank statements are made for any number field `K` presented by an integral `θ` with
  minimal polynomial `X ^ 2 - d` and `ℚ(θ) = K`. `t` is `(ramifiedPrimes K).ncard`.
* The isomorphisms with `Cl/Cl²` are certified by what they compute: the genus characters of
  the class attached to an automorphism are its sign pattern on the prime-discriminant roots.
  Their identification with the Artin map is not part of the README and is not stated.

The genus-field statements follow the README's Layer 3 as corrected at archiving (an erratum
noted there): the compositum of the `ℚ(√P)` over the prime discriminants `P` dividing `disc K`
is the *narrow* genus field in both signatures, and the genus field is that compositum for
imaginary `K` and its maximal totally real subfield for real `K` (for `ℚ(√3)` the compositum
`ℚ(i, √3)` ramifies at the real places). The real genus field is still multiquadratic
(generated by square roots of squarefree integers), so Layer 0 applies to it. The isomorphism
`Gal(K_gen/K) ≅ Cl(K)/Cl(K)²` is proved for the genus field in both signatures, and for the
narrow genus field the isomorphism is with `Cl⁺(K)/Cl⁺(K)²`.

The README's *long horizon* section (explicit Kronecker–Weber for the abelian-over-`ℚ` case,
that every multiquadratic field embeds in a cyclotomic field via Gauss sums; the Hilbert class
field; ring class fields) is headed "aspiration, not required for the early extraction" and
says the roadmap proper is Layers 0–3, so it is not part of the completion judgment.

The Layer-0 square-class machinery is migrated from
[kim-em/erdos-unit-distance](https://github.com/kim-em/erdos-unit-distance), credited in the
ported `TauCeti/` files.
-/

namespace TauCetiRoadmap.Multiquadratic

open TauCeti TauCeti.Multiquadratic IntermediateField Polynomial NumberField
open scoped NumberField nonZeroDivisors

universe u v

/-! ## Layer 0: the multiquadratic field -/

section Layer0

variable {K : Type u} {L : Type v} [Field K] [Field L] [Algebra K L]

/-- **Square-class descent**, the engine. If `y ∈ K(√d₁, …, √dₙ)` squares to `r ∈ K`, then `r`
is a square times a subset product of the radicands. -/
theorem squareClass_of_sq_mem {ι : Type*} [Finite ι] [NeZero (2 : K)] (d : ι → K) (r : ι → L)
    (hr : ∀ i, r i ^ 2 = algebraMap K L (d i)) {a : K} {y : L} (hy : y ^ 2 = algebraMap K L a)
    (hmem : y ∈ adjoin K (Set.range r)) :
    ∃ (T : Finset ι) (s : K), a = s ^ 2 * ∏ j ∈ T, d j :=
  squareClass_of_sq_mem_fintype d r hr hy hmem

/-- The migrated names: the tower `sqrtTower`, the one-step membership lemma
`mem_sup_adjoin_sq`, the rational-real descent `squareClass_of_sqrt_mem`, and the tower degree. -/
example (root : ℕ → L) (n : ℕ) :
    sqrtTower (K := K) root n = adjoin K (root '' Set.Iio n) :=
  sqrtTower_def root n

theorem mem_sup_adjoin_sq {F : IntermediateField K L} {x : L} (hx2 : x ^ 2 ∈ F) {y : L} :
    y ∈ F ⊔ adjoin K {x} ↔ ∃ a b : L, a ∈ F ∧ b ∈ F ∧ y = a + b * x :=
  TauCeti.IntermediateField.mem_sup_adjoin_sq hx2

theorem squareClass_of_sqrt_mem (c : ℕ → ℚ) {n : ℕ} (hc : ∀ j < n, 0 ≤ c j) {r : ℚ}
    (hr : 0 ≤ r) (hmem : (Real.sqrt r : ℝ) ∈ sqrtTower (K := ℚ) (fun j => Real.sqrt (c j)) n) :
    ∃ (T : Finset ℕ) (s : ℚ), ↑T ⊆ Set.Iio n ∧ r = s ^ 2 * ∏ j ∈ T, c j :=
  TauCeti.Multiquadratic.squareClass_of_sqrt_mem c hc hr hmem

theorem finrank_sqrtTower [NeZero (2 : K)] {d : ℕ → K} {root : ℕ → L}
    (hroot : ∀ j, root j ^ 2 = algebraMap K L (d j)) (n : ℕ)
    (hindep : ∀ S : Finset ℕ, S.Nonempty → ↑S ⊆ Set.Iio n → ¬ IsSquare (∏ j ∈ S, d j)) :
    Module.finrank K (sqrtTower (K := K) root n) = 2 ^ n :=
  TauCeti.Multiquadratic.finrank_sqrtTower hroot n hindep

/-- **Square-class independence, `Finset` form ↔ `ZMod 2`-linear independence.** The classes of
the radicands in `Kˣ ⧸ (Kˣ)²` are `ZMod 2`-linearly independent exactly when no nonempty subset
product is a square. -/
theorem linearIndependent_squareClass_iff {ι : Type*} [Finite ι] (d : ι → Kˣ) :
    LinearIndependent (ZMod 2) (fun i => squareClass (d i)) ↔
      ∀ S : Finset ι, S.Nonempty → ¬ IsSquare (∏ i ∈ S, (d i : K)) := by
  rw [TauCeti.linearIndependent_squareClass_iff]
  refine forall_congr' fun S => imp_congr_right fun _ => ?_
  rw [← Units.coe_prod, isSquare_units_val_iff]

/-- The square-class group is the quotient `Kˣ ⧸ (Kˣ)²`: a class vanishes exactly on squares. -/
theorem squareClass_eq_zero_iff (u : Kˣ) : squareClass u = 0 ↔ IsSquare u :=
  TauCeti.squareClass_eq_zero_iff u

/-- **Layer 0, multiquadratic degree.** If no nonempty subset product of the radicands is a
square in `K`, then `[K(√d₁, …, √dₙ) : K] = 2 ^ |ι|`. -/
theorem finrank_adjoin_range {ι : Type*} [Fintype ι] [NeZero (2 : K)] (d : ι → K) (r : ι → L)
    (hr : ∀ i, r i ^ 2 = algebraMap K L (d i))
    (hindep : ∀ S : Finset ι, S.Nonempty → ¬ IsSquare (∏ i ∈ S, d i)) :
    Module.finrank K (adjoin K (Set.range r)) = 2 ^ Fintype.card ι := by
  rw [TauCeti.Multiquadratic.finrank_adjoin_range hr hindep, Nat.card_eq_fintype_card]

/-- The same degree under the structural form of independence. -/
theorem finrank_adjoin_range_of_linearIndependent {ι : Type*} [Finite ι] [NeZero (2 : K)]
    {d : ι → Kˣ} {r : ι → L} (hr : ∀ i, r i ^ 2 = algebraMap K L (d i))
    (hli : LinearIndependent (ZMod 2) (fun i => squareClass (d i))) :
    Module.finrank K (adjoin K (Set.range r)) = 2 ^ Nat.card ι :=
  TauCeti.Multiquadratic.finrank_adjoin_range_of_linearIndependent hr hli

/-- **Layer 0, the extension is Galois** (the easy half; no independence needed). -/
theorem isGalois {ι : Type*} [Finite ι] [NeZero (2 : K)] (d : ι → K) (r : ι → L)
    (hr : ∀ i, r i ^ 2 = algebraMap K L (d i)) :
    IsGalois K ↥(adjoin K (Set.range r)) :=
  TauCeti.Multiquadratic.isGalois hr

/-- **Layer 0, abelian of exponent dividing two** (the easy half, continued). -/
theorem isAbelianGalois {ι : Type*} [Finite ι] [NeZero (2 : K)] (d : ι → K) (r : ι → L)
    (hr : ∀ i, r i ^ 2 = algebraMap K L (d i)) :
    IsAbelianGalois K ↥(adjoin K (Set.range r)) :=
  TauCeti.Multiquadratic.isAbelianGalois hr

theorem aut_exponent_dvd_two {ι : Type*} (d : ι → K) (r : ι → L)
    (hr : ∀ i, r i ^ 2 = algebraMap K L (d i)) :
    Monoid.exponent (adjoin K (Set.range r) ≃ₐ[K] adjoin K (Set.range r)) ∣ 2 :=
  TauCeti.Multiquadratic.aut_exponent_dvd_two hr

/-- **Layer 0, the Galois group is `(ℤ/2)ⁿ`.** Under square-class independence the explicit
isomorphism exists. -/
noncomputable example {ι : Type*} [Fintype ι] [NeZero (2 : K)] (d : ι → K) (r : ι → L)
    (hr : ∀ i, r i ^ 2 = algebraMap K L (d i))
    (hindep : ∀ S : Finset ι, S.Nonempty → ¬ IsSquare (∏ i ∈ S, d i)) :
    (↥(adjoin K (Set.range r)) ≃ₐ[K] ↥(adjoin K (Set.range r))) ≃*
      Multiplicative (ι → ZMod 2) :=
  galoisGroupEquiv hr hindep

open Classical in
/-- The isomorphism is the sign-change description: it records, for each generator, whether the
automorphism fixes it (`0`) or not (`1`), and its inverse sends a sign vector `ε` to the
automorphism `√dⱼ ↦ (-1) ^ εⱼ √dⱼ`. -/
theorem galoisGroupEquiv_apply {ι : Type*} [Finite ι] [NeZero (2 : K)] {d : ι → K} {r : ι → L}
    (hr : ∀ i, r i ^ 2 = algebraMap K L (d i))
    (hindep : ∀ S : Finset ι, S.Nonempty → ¬ IsSquare (∏ i ∈ S, d i))
    (σ : adjoin K (Set.range r) ≃ₐ[K] adjoin K (Set.range r)) (i : ι) :
    Multiplicative.toAdd (galoisGroupEquiv hr hindep σ) i =
      if σ (gen r i) = gen r i then 0 else 1 := by
  rw [TauCeti.Multiquadratic.galoisGroupEquiv_apply]
  rfl

theorem galoisGroupEquiv_symm_apply_gen {ι : Type*} [Finite ι] [NeZero (2 : K)] {d : ι → K}
    {r : ι → L} (hr : ∀ i, r i ^ 2 = algebraMap K L (d i))
    (hindep : ∀ S : Finset ι, S.Nonempty → ¬ IsSquare (∏ i ∈ S, d i)) (ε : ι → ZMod 2)
    (i : ι) :
    ((galoisGroupEquiv hr hindep).symm (Multiplicative.ofAdd ε)) (gen r i) =
      (-1) ^ (ε i).val * gen r i :=
  TauCeti.Multiquadratic.galoisGroupEquiv_symm_apply_gen hr hindep ε i

/-- `gen r i` is the generator `r i`, viewed in the multiquadratic field. -/
theorem coe_gen {ι : Type*} [Finite ι] (r : ι → L) (i : ι) : ((gen (K := K) r i : _) : L) = r i :=
  rfl

/-- **Layer 0, subfields ↔ `𝔽₂`-subspaces.** The intermediate fields of `K(√d₁, …, √dₙ) / K`
correspond order-reversingly to the subspaces of `𝔽₂ⁿ`, by the Galois correspondence
transported along the sign-change isomorphism. -/
noncomputable example {ι : Type*} [Finite ι] [NeZero (2 : K)] (d : ι → K) (r : ι → L)
    (hr : ∀ i, r i ^ 2 = algebraMap K L (d i))
    (hindep : ∀ S : Finset ι, S.Nonempty → ¬ IsSquare (∏ i ∈ S, d i)) :
    IntermediateField K (adjoin K (Set.range r)) ≃o (Submodule (ZMod 2) (ι → ZMod 2))ᵒᵈ :=
  intermediateFieldEquivSubmodule hr hindep

theorem mem_intermediateFieldEquivSubmodule_iff {ι : Type*} [Finite ι] [NeZero (2 : K)]
    {d : ι → K} {r : ι → L} (hr : ∀ i, r i ^ 2 = algebraMap K L (d i))
    (hindep : ∀ S : Finset ι, S.Nonempty → ¬ IsSquare (∏ i ∈ S, d i))
    (F : IntermediateField K (adjoin K (Set.range r))) (v : ι → ZMod 2) :
    v ∈ (intermediateFieldEquivSubmodule hr hindep F).ofDual ↔
      ∃ σ ∈ F.fixingSubgroup, Multiplicative.toAdd (galoisGroupEquiv hr hindep σ) = v := by
  rw [mem_intermediateFieldEquivSubmodule_apply_ofDual_iff]
  simp only [TauCeti.Multiquadratic.galoisGroupEquiv_apply, toAdd_ofAdd]

end Layer0

/-! ## Layer 1: the prime-splitting law -/

section Layer1

/-- **Layer 1, the prime-splitting law.** Let `K = ℚ(√d₁, …, √dₙ)` be a multiquadratic number
field (`r i` a square root of the integer `d i`, the `r i` generating `K` over `ℚ`). For an odd
prime `p ∤ d₁ ⋯ dₙ`, `p` splits completely in `K` (there are `[K : ℚ]` primes of `𝓞 K` above
`p`) iff `legendreSym p (d i) = 1` for every `i`. Squarefreeness of the `d i` is not needed. -/
theorem splits_completely_iff (K : Type*) [Field K] [NumberField K] {ι : Type*} [Fintype ι]
    (d : ι → ℤ) (r : ι → K) (hr : ∀ i, r i ^ 2 = algebraMap ℤ K (d i))
    (htop : adjoin ℚ (Set.range r) = ⊤)
    (p : ℕ) [Fact p.Prime] (hodd : p ≠ 2) (hcop : ¬ (p : ℤ) ∣ ∏ i, d i) :
    Nat.card (Ideal.primesOver (Ideal.span {(p : ℤ)}) (𝓞 K)) = Module.finrank ℚ K ↔
      ∀ i, legendreSym p (d i) = 1 := by
  rw [Nat.card_coe_set_eq]
  exact NumberField.ncard_primesOver_multiquadratic_iff d r hr htop hodd
    (fun i hi => hcop (hi.trans (Finset.dvd_prod_of_mem d (Finset.mem_univ i))))

/-- **Layer 1, the Frobenius is the Legendre vector.** A Frobenius `σ` at a prime above an odd
`p ∤ d i` acts on each `√dᵢ` by the Legendre symbol `(dᵢ/p)`. -/
theorem exists_isArithFrobAt (K : Type*) [Field K] [NumberField K] [IsGalois ℚ K] {ι : Type*}
    (d : ι → ℤ) (r : ι → K) (hr : ∀ i, r i ^ 2 = algebraMap ℤ K (d i)) {p : ℕ} [Fact p.Prime]
    (hodd : p ≠ 2) (hcop : ∀ i, ¬ (p : ℤ) ∣ d i) (Q : Ideal (𝓞 K)) [Q.IsPrime]
    [Q.LiesOver (Ideal.span {(p : ℤ)})] :
    ∃ σ : K ≃ₐ[ℚ] K, IsArithFrobAt ℤ σ Q ∧ ∀ i, σ (r i) = legendreSym p (d i) • r i :=
  NumberField.exists_isArithFrobAt_multiquadratic d r hr hodd hcop Q

/-- Under `Gal ≅ (𝔽₂)ⁿ` the Frobenius is the vector of Legendre symbols, written additively:
coordinate `0` where `dᵢ` is a residue mod `p` and `1` where it is not. -/
theorem galoisGroupEquiv_frobenius {L : Type*} [Field L] [NumberField L] {ι : Type*} [Finite ι]
    {d : ι → ℤ} {r : ι → L} (hr : ∀ i, r i ^ 2 = algebraMap ℚ L (d i))
    (hindep : ∀ S : Finset ι, S.Nonempty → ¬ IsSquare (∏ i ∈ S, (d i : ℚ)))
    (p : ℕ) [Fact p.Prime] (hodd : p ≠ 2) (hcop : ∀ i, ¬ (p : ℤ) ∣ d i)
    (Q : Ideal (𝓞 ↥(adjoin ℚ (Set.range r)))) [Q.LiesOver (Ideal.span {(p : ℤ)})]
    {σ : ↥(adjoin ℚ (Set.range r)) ≃ₐ[ℚ] ↥(adjoin ℚ (Set.range r))}
    (hσ : IsArithFrobAt ℤ σ Q) :
    galoisGroupEquiv hr hindep σ =
      Multiplicative.ofAdd (fun i => if legendreSym p (d i) = 1 then 0 else 1) :=
  NumberField.galoisGroupEquiv_frobenius (root := r) (d := d)
    (fun i => by rw [hr i, IsScalarTower.algebraMap_apply ℤ ℚ L]; simp) hindep p hodd hcop Q hσ

/-- **Rational radicands reduce to the integral case by square classes.** A family of nonzero
rational radicands is replaced by squarefree integers in the same square classes, generating the
same field. -/
theorem exists_squarefree_root_adjoin_eq {L : Type*} [Field L] [Algebra ℚ L] {ι : Type*}
    {d : ι → ℚ} (hd : ∀ i, d i ≠ 0) {r : ι → L} (hr : ∀ i, r i ^ 2 = algebraMap ℚ L (d i)) :
    ∃ (a : ι → ℤ) (c : ι → ℚ) (r' : ι → L), (∀ i, Squarefree (a i)) ∧ (∀ i, c i ≠ 0) ∧
      (∀ i, d i = a i * c i ^ 2) ∧ (∀ i, r' i = algebraMap ℚ L (c i)⁻¹ * r i) ∧
      (∀ i, r' i ^ 2 = algebraMap ℚ L (a i)) ∧ adjoin ℚ (Set.range r') = adjoin ℚ (Set.range r) :=
  TauCeti.Multiquadratic.exists_squarefree_root_adjoin_eq hd hr

/-- The splitting law for rational radicands, in the canonical integer `num · den` of each
square class. -/
theorem splits_completely_iff_of_rat (K : Type*) [Field K] [NumberField K] {ι : Type*}
    [Finite ι] {d : ι → ℚ} (r : ι → K) (hr : ∀ i, r i ^ 2 = algebraMap ℚ K (d i))
    (htop : adjoin ℚ (Set.range r) = ⊤) {p : ℕ} [Fact p.Prime] (hodd : p ≠ 2)
    (hnum : ∀ i, ¬ (p : ℤ) ∣ (d i).num) (hden : ∀ i, ¬ p ∣ (d i).den) :
    (Ideal.primesOver (Ideal.span {(p : ℤ)}) (𝓞 K)).ncard = Module.finrank ℚ K ↔
      ∀ i, legendreSym p ((d i).num * (d i).den) = 1 :=
  ncard_primesOver_multiquadratic_iff_num_mul_den r hr htop hodd hnum hden

/-- **Reusable infrastructure: the conjugate-ideal transversal count**, migrated from the Erdős
formalization as a lower bound. For a fixed-point-free involution `σ` of a finite set `S` of
height-one primes of a Dedekind domain, at least `2 ^ (#S / 2)` ideals `A` satisfy
`A · σA = ∏ S`. -/
theorem exists_transversal_family {R : Type*} [CommRing R] [IsDedekindDomain R] (σ : R ≃+* R)
    (S : Finset (IsDedekindDomain.HeightOneSpectrum R))
    (hinv : ∀ p ∈ S, IsDedekindDomain.HeightOneSpectrum.equivOfRingEquiv σ p ∈ S)
    (hinvol : ∀ p ∈ S, IsDedekindDomain.HeightOneSpectrum.equivOfRingEquiv σ
      (IsDedekindDomain.HeightOneSpectrum.equivOfRingEquiv σ p) = p)
    (hfree : ∀ p ∈ S, IsDedekindDomain.HeightOneSpectrum.equivOfRingEquiv σ p ≠ p) :
    ∃ G : Finset (Ideal R), 2 ^ (S.card / 2) ≤ G.card ∧
      ∀ A ∈ G, A * Ideal.map σ A = ∏ p ∈ S, p.asIdeal :=
  TauCeti.DedekindDomain.exists_transversal_family σ S hinv hinvol hfree

/-- The count is exact: there are exactly `2 ^ (#S / 2)` such ideals. -/
theorem ncard_setOf_mul_map_eq_prod {R : Type*} [CommRing R] [IsDedekindDomain R]
    (σ : R →+* R) {S : Finset (Ideal R)} (hprime : ∀ p ∈ S, p.IsPrime) (hbot : ∀ p ∈ S, p ≠ ⊥)
    (hmaps : ∀ p ∈ S, Ideal.map σ p ∈ S) (hinvol : ∀ p ∈ S, Ideal.map σ (Ideal.map σ p) = p)
    (hfree : ∀ p ∈ S, Ideal.map σ p ≠ p) :
    {A : Ideal R | A * Ideal.map σ A = ∏ p ∈ S, p}.ncard = 2 ^ (S.card / 2) :=
  TauCeti.ncard_setOf_mul_map_eq_prod hprime hbot hmaps hinvol hfree

end Layer1

/-! ## Layer 2: the 2-elementary quotient of the class group -/

section Layer2

/-- **`Cl(R)/Cl(R)²` is the quotient by squares**: it is `ZMod 2`-linear, every element is the
class of an ideal class, and a class vanishes exactly on squares. The image of the squaring map
`C ↦ C²` is the subgroup of squares, so this is the cokernel of squaring. -/
theorem elementaryTwoQuotientMk_eq_zero_iff (R : Type*) [CommRing R] [IsDomain R]
    (C : ClassGroup R) :
    TauCeti.ClassGroup.elementaryTwoQuotientMk R C = 0 ↔ IsSquare C :=
  TauCeti.ClassGroup.elementaryTwoQuotientMk_eq_zero_iff R C

noncomputable example (R : Type*) [CommRing R] [IsDomain R] :
    Module (ZMod 2) (TauCeti.ClassGroup.ElementaryTwoQuotient R) :=
  inferInstance

theorem elementaryTwoQuotientMk_surjective (R : Type*) [CommRing R] [IsDomain R] :
    Function.Surjective (TauCeti.ClassGroup.elementaryTwoQuotientMk R) :=
  TauCeti.ClassGroup.elementaryTwoQuotientMk_surjective R

theorem elementaryTwoQuotientMk_mul (R : Type*) [CommRing R] [IsDomain R] (C D : ClassGroup R) :
    TauCeti.ClassGroup.elementaryTwoQuotientMk R (C * D) =
      TauCeti.ClassGroup.elementaryTwoQuotientMk R C +
        TauCeti.ClassGroup.elementaryTwoQuotientMk R D := by
  simp

theorem square_eq_range_squaring (G : Type*) [CommGroup G] :
    Subgroup.square G = (powMonoidHom 2 : G →* G).range :=
  TauCeti.square_eq_range_powMonoidHom

/-- **The quotient is kept distinct from the 2-torsion subgroup `Cl[2]`**, with which it only
shares its cardinality. -/
theorem card_elementaryTwoQuotient_eq_card_twoTorsion (R : Type*) [CommRing R] [IsDomain R]
    [Finite (ClassGroup R)] :
    Nat.card (TauCeti.ClassGroup.ElementaryTwoQuotient R) =
      Nat.card {C : ClassGroup R // C ^ 2 = 1} :=
  TauCeti.ClassGroup.card_elementaryTwoQuotient_eq_card_twoTorsion R

/-- The 2-rank is the `ZMod 2`-dimension of `Cl/Cl²`. -/
theorem card_elementaryTwoQuotient_eq_two_pow_twoRank (R : Type*) [CommRing R] [IsDomain R]
    [Module.Finite (ZMod 2) (TauCeti.ClassGroup.ElementaryTwoQuotient R)] :
    Nat.card (TauCeti.ClassGroup.ElementaryTwoQuotient R) =
      2 ^ TauCeti.ClassGroup.twoRank R :=
  TauCeti.ClassGroup.card_elementaryTwoQuotient_eq_two_pow_twoRank R

/-- **The unit-square-class input `[𝓞_F^× : (𝓞_F^×)²]`**, migrated as `units_sq_index_le`, and
its abstract input: a commutative group generated by `n` elements has squares of index at most
`2 ^ n`. -/
theorem units_sq_index_le (F : Type*) [Field F] [NumberField F] :
    (Subgroup.square (𝓞 F)ˣ).index ≤ 2 ^ Module.finrank ℚ F :=
  NumberField.units_sq_index_le F

theorem index_powMonoidHom_two_le_of_closure {G : Type*} [CommGroup G] {S : Finset G}
    (hS : Subgroup.closure (S : Set G) = ⊤) :
    (powMonoidHom 2 : G →* G).range.index ≤ 2 ^ S.card := by
  rw [← TauCeti.square_eq_range_powMonoidHom]
  exact TauCeti.index_square_le_of_closure_eq_top hS

/-- The index is exactly `2 ^ (rank + 1)`. -/
theorem units_sq_index_eq (F : Type*) [Field F] [NumberField F] :
    (Subgroup.square (𝓞 F)ˣ).index = 2 ^ (Units.rank F + 1) :=
  NumberField.units_sq_index_eq F

section Quadratic

variable {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K} {d : ℤ}

/-- The nontrivial automorphism of `K = ℚ(√d)` sends `θ = √d` to `-θ`, and it acts on `Cl(K)` by
inversion, since `I · σI` is principal. -/
theorem ringOfIntegersQuadraticConj_gen (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    ringOfIntegersQuadraticConj hmin hgen θ = -θ :=
  NumberField.ringOfIntegersQuadraticConj_gen hmin hgen

theorem conj_apply_eq_inv (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (C : ClassGroup (𝓞 K)) :
    ClassGroup.mulEquiv (ringOfIntegersQuadraticConj hmin hgen) C = C⁻¹ :=
  NumberField.mulEquiv_ringOfIntegersQuadraticConj_apply_eq_inv hmin hgen C

/-- **The ambiguous class number formula, imaginary case.** For squarefree `d < 0`, with `t` the
number of ramified rational primes, the ambiguous classes (those fixed by conjugation), the
2-torsion classes, and the classes of ambiguous ideals `I = σI` each number `2 ^ (t - 1)`. -/
theorem natCard_ambiguous_eq_two_pow (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) (hd : d < 0) :
    Nat.card {C : ClassGroup (𝓞 K) //
      ClassGroup.mulEquiv (ringOfIntegersQuadraticConj hmin hgen) C = C} =
      2 ^ ((ramifiedPrimes K).ncard - 1) :=
  natCard_mulEquiv_ringOfIntegersQuadraticConj_eq_self_eq_two_pow hmin hgen hsf hd

theorem natCard_classGroup_sq_eq_one_eq_two_pow (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) (hd : d < 0) :
    Nat.card {C : ClassGroup (𝓞 K) // C ^ 2 = 1} = 2 ^ ((ramifiedPrimes K).ncard - 1) :=
  TauCeti.Multiquadratic.natCard_classGroup_sq_eq_one_eq_two_pow hmin hgen hsf hd

theorem natCard_ambiguousIdealClass_eq_two_pow (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) (hd : d < 0) :
    Nat.card {C : ClassGroup (𝓞 K) // ∃ I : (Ideal (𝓞 K))⁰,
      Ideal.map (ringOfIntegersQuadraticConj hmin hgen) (I : Ideal (𝓞 K)) = (I : Ideal (𝓞 K)) ∧
        ClassGroup.mk0 I = C} = 2 ^ ((ramifiedPrimes K).ncard - 1) :=
  natCard_exists_map_ringOfIntegersQuadraticConj_eq_self_eq_two_pow hmin hgen hsf hd

/-- **The ambiguous class number formula in the narrow class group**, either signature. -/
theorem natCard_narrowClassGroup_sq_eq_one_eq_two_pow (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) :
    Nat.card {C : NarrowClassGroup K // C ^ 2 = 1} = 2 ^ ((ramifiedPrimes K).ncard - 1) :=
  TauCeti.Multiquadratic.natCard_narrowClassGroup_sq_eq_one_eq_two_pow hmin hgen hsf

/-- **The ambiguous class number formula, real case.** The ambiguous classes of `Cl(K)` number
`2 ^ (t - 1)` when every prime discriminant dividing `disc K` is positive and `2 ^ (t - 2)`
otherwise; the classes of ambiguous ideals number `2 ^ (t - 1)` or `2 ^ (t - 2)` according to
whether some unit has norm `-1`. -/
theorem natCard_ambiguous_eq_two_pow_of_forall_pos {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s, IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d) (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) (hpos : ∀ P ∈ s, 0 < P) :
    Nat.card {C : ClassGroup (𝓞 K) //
      ClassGroup.mulEquiv (ringOfIntegersQuadraticConj hmin hgen) C = C} =
      2 ^ ((ramifiedPrimes K).ncard - 1) :=
  natCard_mulEquiv_ringOfIntegersQuadraticConj_eq_self_eq_two_pow_of_forall_pos hs heven hprod
    hmin hgen hsf hpos

theorem natCard_ambiguous_eq_two_pow_of_neg {s : Finset ℤ}
    (hs : ∀ P ∈ s, IsPrimeDiscriminant P)
    (heven : ∀ P ∈ s, ∀ P' ∈ s, IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant P' → P = P')
    (hprod : ∏ P ∈ s, P = fundamentalDiscriminant d) (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) (hd : 0 < d) {P : ℤ}
    (hP : P ∈ s) (hneg : P < 0) :
    Nat.card {C : ClassGroup (𝓞 K) //
      ClassGroup.mulEquiv (ringOfIntegersQuadraticConj hmin hgen) C = C} =
      2 ^ ((ramifiedPrimes K).ncard - 2) :=
  natCard_mulEquiv_ringOfIntegersQuadraticConj_eq_self_eq_two_pow_of_neg hs heven hprod hmin
    hgen hsf hd hP hneg

theorem mem_stronglyAmbiguousClassSubgroup_iff (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (C : ClassGroup (𝓞 K)) :
    C ∈ stronglyAmbiguousClassSubgroup hmin hgen ↔ ∃ I : (Ideal (𝓞 K))⁰,
      Ideal.map (ringOfIntegersQuadraticConj hmin hgen) (I : Ideal (𝓞 K)) = (I : Ideal (𝓞 K)) ∧
        ClassGroup.mk0 I = C :=
  Iff.rfl

theorem natCard_stronglyAmbiguous_of_norm_eq_neg_one (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) {u : (𝓞 K)ˣ}
    (hu : Algebra.norm ℚ ((u : 𝓞 K) : K) = -1) :
    Nat.card (stronglyAmbiguousClassSubgroup hmin hgen) = 2 ^ ((ramifiedPrimes K).ncard - 1) :=
  natCard_stronglyAmbiguousClassSubgroup_eq_two_pow_of_norm_eq_neg_one hmin hgen hsf hu

theorem natCard_stronglyAmbiguous_of_forall_norm_ne_neg_one (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) (hd : 0 < d)
    (hu : ∀ u : (𝓞 K)ˣ, Algebra.norm ℚ ((u : 𝓞 K) : K) ≠ -1) :
    Nat.card (stronglyAmbiguousClassSubgroup hmin hgen) = 2 ^ ((ramifiedPrimes K).ncard - 2) :=
  natCard_stronglyAmbiguousClassSubgroup_eq_two_pow_of_forall_norm_ne_neg_one hmin hgen hsf hd hu

end Quadratic

end Layer2

/-! ## Layer 3: the genus field and the 2-rank theorem -/

section Layer3

/-- **The prime discriminants** are `-4`, `8`, `-8`, and `p* = (-1) ^ ((p - 1) / 2) p` for odd
primes `p`, written as `p` when `p ≡ 1 (mod 4)` and `-p` otherwise. -/
theorem isPrimeDiscriminant_iff (D : ℤ) :
    IsPrimeDiscriminant D ↔
      (D = -4 ∨ D = 8 ∨ D = -8) ∨ ∃ p : ℕ, p.Prime ∧ Odd p ∧ D = oddPrimeDiscriminant p :=
  TauCeti.Multiquadratic.isPrimeDiscriminant_iff

theorem oddPrimeDiscriminant_eq (p : ℕ) :
    oddPrimeDiscriminant p = if p % 4 = 1 then (p : ℤ) else -(p : ℤ) :=
  oddPrimeDiscriminant_def p

/-- The discriminant of `K = ℚ(√d)` (`d` squarefree) is `d` or `4d` according to `d mod 4`, and
it factors into prime discriminants, at most one of them even. `genusPrimeDiscriminants hd` is
that factorization. -/
theorem discr_eq (K : Type*) [Field K] [NumberField K] {θ : 𝓞 K} {d : ℤ}
    (hmin : minpoly ℤ θ = X ^ 2 - C d) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (hsf : Squarefree d) :
    NumberField.discr K = if d % 4 = 1 then d else 4 * d :=
  discr_eq_fundamentalDiscriminant hmin hgen hsf

theorem genusPrimeDiscriminants_spec {d : ℤ} (hd : Squarefree d) :
    (∀ P ∈ genusPrimeDiscriminants hd, IsPrimeDiscriminant P) ∧
      (∀ P ∈ genusPrimeDiscriminants hd, ∀ Q ∈ genusPrimeDiscriminants hd,
        IsEvenPrimeDiscriminant P → IsEvenPrimeDiscriminant Q → P = Q) ∧
      ∏ P ∈ genusPrimeDiscriminants hd, P = fundamentalDiscriminant d :=
  TauCeti.Multiquadratic.genusPrimeDiscriminants_spec hd

/-- **The compositum of the `ℚ(√P)`** over the prime discriminants `P ∣ disc ℚ(√d)`, inside `ℂ`:
it is generated by square roots of the radicands of the `P` (the squarefree `P` itself, or `-1`,
`2`, `-2` for `-4`, `8`, `-8`). It is multiquadratic of degree `2 ^ t`, and `2 ^ (t - 1)` over its
copy of `ℚ(√d)`, where `t` is the number of ramified primes. -/
theorem candidateGenusField_eq {d : ℤ} (hd : Squarefree d) :
    candidateGenusField hd = adjoin ℚ (Set.range (genusFieldRoot hd)) :=
  candidateGenusField_def hd

theorem genusFieldRoot_sq {d : ℤ} (hd : Squarefree d)
    (P : {P // P ∈ genusPrimeDiscriminants hd}) :
    genusFieldRoot hd P ^ 2 = ((primeDiscriminantRadicand P.val : ℤ) : ℂ) :=
  TauCeti.Multiquadratic.genusFieldRoot_sq hd P

theorem finrank_candidateGenusField {d : ℤ} (hd : Squarefree d) :
    Module.finrank ℚ (candidateGenusField hd) = 2 ^ (genusPrimeDiscriminants hd).card :=
  TauCeti.Multiquadratic.finrank_candidateGenusField hd

theorem finrank_candidateGenusField_over_base (K : Type*) [Field K] [NumberField K] {θ : 𝓞 K}
    {d : ℤ} (hmin : minpoly ℤ θ = X ^ 2 - C d) (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤)
    (hd : Squarefree d) :
    Module.finrank (candidateGenusFieldBase hd) (candidateGenusField hd) =
      2 ^ ((ramifiedPrimes K).ncard - 1) :=
  finrank_candidateGenusField_over_candidateGenusFieldBase_eq_two_pow_ncard_ramifiedPrimes hmin
    hgen hd

/-- The copy of `ℚ(√d)` inside the compositum is generated by a square root of `d`. -/
theorem candidateGenusFieldBase_eq {d : ℤ} (hd : Squarefree d) :
    candidateGenusFieldBase hd = adjoin ℚ {candidateGenusFieldBaseRoot hd} :=
  candidateGenusFieldBase_def hd

theorem candidateGenusFieldBaseRoot_sq {d : ℤ} (hd : Squarefree d) :
    candidateGenusFieldBaseRoot hd ^ 2 = algebraMap ℚ (candidateGenusField hd) ((d : ℤ) : ℚ) :=
  TauCeti.Multiquadratic.candidateGenusFieldBaseRoot_sq hd

/-- **The genus field, as a predicate.** An abelian extension `L / ℚ` with a chosen square root
`y` of `d` is a genus field of `ℚ(√d)` when `y` generates a quadratic subfield, `L` is unramified
over `ℚ(y)` at every finite and every infinite place, and every other such extension embeds into
`L` over `ℚ`, carrying its square root of `d` to `y`. -/
theorem isGenusField_iff (d : ℤ) (L : Type u) [Field L] [NumberField L] (y : L) :
    IsGenusField.{u, v} d L y ↔
      y ^ 2 = algebraMap ℤ L d ∧ Module.finrank ℚ (adjoin ℚ {y} : IntermediateField ℚ L) = 2 ∧
        IsAbelianGalois ℚ L ∧
        (∀ q : Ideal (𝓞 (adjoin ℚ {y} : IntermediateField ℚ L)),
          q.IsPrime → q ≠ ⊥ → Algebra.IsUnramifiedIn (𝓞 L) q) ∧
        IsUnramifiedAtInfinitePlaces (adjoin ℚ {y} : IntermediateField ℚ L) L ∧
        ∀ {M : Type v} [Field M] [NumberField M] [IsAbelianGalois ℚ M] {z : M},
          z ^ 2 = algebraMap ℤ M d →
          (∀ q : Ideal (𝓞 (adjoin ℚ {z} : IntermediateField ℚ M)),
            q.IsPrime → q ≠ ⊥ → Algebra.IsUnramifiedIn (𝓞 M) q) →
          IsUnramifiedAtInfinitePlaces (adjoin ℚ {z} : IntermediateField ℚ M) M →
          ∃ φ : M →ₐ[ℚ] L, φ z = y :=
  ⟨fun h => ⟨h.root_sq, h.finrank_adjoin, h.isAbelianGalois, h.isUnramifiedAtFinitePlaces,
      h.isUnramifiedAtInfinitePlaces, h.maximal⟩,
    fun ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩ => ⟨h₁, h₂, h₃, h₄, h₅, h₆⟩⟩

/-- The genus field is unique up to an isomorphism matching the chosen square roots. -/
theorem IsGenusField.exists_algEquiv_apply_eq {d : ℤ} {L : Type u} [Field L] [NumberField L]
    {M : Type v} [Field M] [NumberField M] {y : L} {z : M} (hL : IsGenusField.{u, v} d L y)
    (hM : IsGenusField.{v, u} d M z) : ∃ e : L ≃ₐ[ℚ] M, e y = z :=
  hL.exists_algEquiv_apply_eq hM

/-- **The genus field of an imaginary quadratic field is the prime-discriminant compositum.** -/
theorem isGenusField_candidateGenusField {d : ℤ} (hd : Squarefree d) (hneg : d < 0) :
    IsGenusField.{0, v} d (candidateGenusField hd) (candidateGenusFieldBaseRoot hd) :=
  TauCeti.Multiquadratic.isGenusField_candidateGenusField hd hneg

/-- **The genus field of a real quadratic field** is the maximal totally real subfield of the
compositum. -/
theorem isGenusField_candidateGenusFieldReal {d : ℤ} (hd : Squarefree d)
    (hnsq : ¬ IsSquare ((d : ℤ) : ℚ)) (hpos : 0 < d) :
    IsGenusField.{0, v} d (candidateGenusFieldReal hd) (candidateGenusFieldRealBaseRoot hd hpos) :=
  TauCeti.Multiquadratic.isGenusField_candidateGenusFieldReal hd hnsq hpos

theorem mem_candidateGenusFieldReal_iff {d : ℤ} (hd : Squarefree d) (x : candidateGenusField hd) :
    x ∈ candidateGenusFieldReal hd ↔ ∀ φ : candidateGenusField hd →+* ℂ, star (φ x) = φ x :=
  TauCeti.Multiquadratic.mem_candidateGenusFieldReal_iff hd x

/-- **The real genus field is multiquadratic**: its automorphisms over `ℚ` are restrictions of
those of the compositum, so they square to one, and it is generated by square roots of
square-class independent squarefree integers. -/
theorem exists_squarefree_root_adjoin_range_eq_top_candidateGenusFieldReal {d : ℤ}
    (hd : Squarefree d) :
    ∃ (n : ℕ) (a : Fin n → ℤ) (root : Fin n → candidateGenusFieldReal hd),
      (∀ i, Squarefree (a i)) ∧
      (∀ i, root i ^ 2 = algebraMap ℚ (candidateGenusFieldReal hd) (a i)) ∧
      (∀ S : Finset (Fin n), S.Nonempty → ¬ IsSquare (∏ i ∈ S, a i)) ∧
      adjoin ℚ (Set.range root) = ⊤ := by
  have hexp : Monoid.exponent
      (candidateGenusFieldReal hd ≃ₐ[ℚ] candidateGenusFieldReal hd) ∣ 2 := by
    rw [Monoid.exponent_dvd_iff_forall_pow_eq_one]
    intro σ
    obtain ⟨τ, rfl⟩ := AlgEquiv.restrictNormalHom_surjective (F := ℚ)
      (K₁ := candidateGenusFieldReal hd) (candidateGenusField hd) σ
    have hτ : τ ^ 2 = 1 := by
      apply (AlgEquiv.autCongr (candidateGenusFieldEquivAdjoin hd)).injective
      rw [map_pow, map_one, pow_two]
      exact aut_mul_self_eq_one (genusFieldRoot_sq_algebraMap hd) _
    rw [← map_pow, hτ, map_one]
  obtain ⟨n, a, root, hsf, hroot, hindep, htop, -⟩ :=
    exists_squarefree_root_adjoin_range_eq_top hexp
  exact ⟨n, a, root, hsf, hroot, hindep, htop⟩

/-- **The narrow genus field**, unramified over `ℚ(√d)` at the finite places only, and maximal
with that property. -/
theorem isNarrowGenusField_iff (d : ℤ) (L : Type u) [Field L] [NumberField L] (y : L) :
    IsNarrowGenusField d L y ↔
      y ^ 2 = algebraMap ℤ L d ∧ Module.finrank ℚ (adjoin ℚ {y} : IntermediateField ℚ L) = 2 ∧
        IsAbelianGalois ℚ L ∧
        (∀ q : Ideal (𝓞 (adjoin ℚ {y} : IntermediateField ℚ L)),
          q.IsPrime → q ≠ ⊥ → Algebra.IsUnramifiedIn (𝓞 L) q) ∧
        ∀ {M : Type u} [Field M] [NumberField M] [IsAbelianGalois ℚ M] {z : M},
          z ^ 2 = algebraMap ℤ M d →
          (∀ q : Ideal (𝓞 (adjoin ℚ {z} : IntermediateField ℚ M)),
            q.IsPrime → q ≠ ⊥ → Algebra.IsUnramifiedIn (𝓞 M) q) →
          Nonempty (M →ₐ[ℚ] L) :=
  ⟨fun h => ⟨h.root_sq, h.finrank_adjoin, h.isAbelianGalois, h.isUnramifiedAtFinitePlaces,
      h.maximal⟩,
    fun ⟨h₁, h₂, h₃, h₄, h₅⟩ => ⟨h₁, h₂, h₃, h₄, h₅⟩⟩

/-- In either signature the prime-discriminant compositum is the narrow genus field, unique up
to an isomorphism matching the chosen square roots. -/
theorem isNarrowGenusField_candidateGenusField {d : ℤ} (hd : Squarefree d)
    (hnsq : ¬ IsSquare ((d : ℤ) : ℚ)) :
    IsNarrowGenusField d (candidateGenusField hd) (candidateGenusFieldBaseRoot hd) :=
  TauCeti.Multiquadratic.isNarrowGenusField_candidateGenusField hd hnsq

theorem IsNarrowGenusField.exists_algEquiv_apply_eq {d : ℤ} {L M : Type u} [Field L]
    [NumberField L] [Field M] [NumberField M] {y : L} {z : M} (hL : IsNarrowGenusField d L y)
    (hM : IsNarrowGenusField d M z) : ∃ e : L ≃ₐ[ℚ] M, e y = z :=
  hL.exists_algEquiv_apply_eq hM

/-- **The narrow class group** `Cl⁺(K)`: invertible fractional ideals modulo the principal ideals
with a totally positive generator. -/
example (K : Type*) [Field K] [NumberField K] :
    NarrowClassGroup K = ((FractionalIdeal (𝓞 K)⁰ K)ˣ ⧸ narrowPrincipalSubgroup K) :=
  rfl

theorem mem_narrowPrincipalSubgroup_iff {K : Type*} [Field K] [NumberField K]
    (I : (FractionalIdeal (𝓞 K)⁰ K)ˣ) :
    I ∈ narrowPrincipalSubgroup K ↔
      ∃ x : Kˣ, (∀ (w : InfinitePlace K) (hw : w.IsReal),
        0 < InfinitePlace.embedding_of_isReal hw (x : K)) ∧ toPrincipalIdeal (𝓞 K) K x = I := by
  rw [mem_narrowPrincipalSubgroup]
  rfl

theorem NarrowClassGroup.mk0_eq_one_iff {K : Type*} [Field K] [NumberField K]
    {I : (Ideal (𝓞 K))⁰} :
    NarrowClassGroup.mk0 I = 1 ↔
      ∃ a : 𝓞 K, a ≠ 0 ∧ IsTotallyPositive (a : K) ∧ (I : Ideal (𝓞 K)) = Ideal.span {a} :=
  NumberField.NarrowClassGroup.mk0_eq_one_iff

theorem NarrowClassGroup.toClassGroup_mk0 {K : Type*} [Field K] [NumberField K]
    (I : (Ideal (𝓞 K))⁰) :
    NarrowClassGroup.toClassGroup (NarrowClassGroup.mk0 I) = ClassGroup.mk0 I :=
  NumberField.NarrowClassGroup.toClassGroup_mk0 I

/-- **The genus-field isomorphism `Gal(K_gen/K) ≅ Cl⁺(K)/Cl⁺(K)²`** for the narrow genus field,
in either signature. -/
noncomputable example {d : ℤ} (hd : Squarefree d) (hnsq : ¬ IsSquare ((d : ℤ) : ℚ)) :
    (candidateGenusField hd ≃ₐ[candidateGenusFieldBase hd] candidateGenusField hd) ≃*
      Multiplicative (NarrowClassGroup.ElementaryTwoQuotient (candidateGenusFieldBase hd)) :=
  autCandidateGenusFieldEquivNarrowElementaryTwoQuotient hd hnsq

/-- The isomorphism is the genus-character description: the genus characters of the class
attached to `σ` are the signs by which `σ` acts on the chosen roots of the prime
discriminants. -/
theorem genusChar_autCandidateGenusFieldEquivNarrowElementaryTwoQuotient {d : ℤ}
    (hd : Squarefree d) (hnsq : ¬ IsSquare ((d : ℤ) : ℚ))
    (σ : candidateGenusField hd ≃ₐ[candidateGenusFieldBase hd] candidateGenusField hd) :
    candidateGenusFieldBaseGenusCharLinearMap hd hnsq
        (Multiplicative.toAdd (autCandidateGenusFieldEquivNarrowElementaryTwoQuotient hd hnsq σ)) =
      candidateGenusFieldRelativeSignPattern hd σ := by
  rw [autCandidateGenusFieldEquivNarrowElementaryTwoQuotient_apply, toAdd_ofAdd,
    ← narrowElementaryTwoQuotientEquivRelativeSign_apply_coe, LinearEquiv.apply_symm_apply]

/-- **`Gal(K_gen/K) ≅ Cl(K)/Cl(K)²` for imaginary `K`**, where narrow and ordinary agree. -/
noncomputable example {d : ℤ} (hd : Squarefree d) (hneg : d < 0) :
    (candidateGenusField hd ≃ₐ[candidateGenusFieldBase hd] candidateGenusField hd) ≃*
      Multiplicative (TauCeti.ClassGroup.ElementaryTwoQuotient (𝓞 (candidateGenusFieldBase hd))) :=
  autCandidateGenusFieldEquivElementaryTwoQuotient hd hneg

theorem autCandidateGenusFieldEquivElementaryTwoQuotient_apply {d : ℤ} (hd : Squarefree d)
    (hneg : d < 0)
    (σ : candidateGenusField hd ≃ₐ[candidateGenusFieldBase hd] candidateGenusField hd) :
    autCandidateGenusFieldEquivElementaryTwoQuotient hd hneg σ =
      let hnsq : ¬ IsSquare ((d : ℤ) : ℚ) := fun h =>
        absurd h.nonneg (not_le.mpr (by exact_mod_cast hneg))
      let _ : NumberField.IsTotallyComplex (candidateGenusFieldBase hd) :=
        isTotallyComplex_candidateGenusFieldBase hd hneg
      (NarrowClassGroup.toClassGroupElementaryTwoQuotientEquiv
        (candidateGenusFieldBase hd)).toAddEquiv.toMultiplicative
          (autCandidateGenusFieldEquivNarrowElementaryTwoQuotient hd hnsq σ) :=
  TauCeti.Multiquadratic.autCandidateGenusFieldEquivElementaryTwoQuotient_apply hd hneg σ

/-- **`Gal(K_gen/K) ≅ Cl(K)/Cl(K)²` for real `K`**, with `K_gen` the real genus field. It sends
the restriction of `σ` to the ordinary class of the narrow class whose genus characters are the
signs of `σ`. -/
noncomputable example {d : ℤ} (hd : Squarefree d) (hnsq : ¬ IsSquare ((d : ℤ) : ℚ))
    (hpos : 0 < d) :
    letI := candidateGenusFieldRealAlgebra hd hpos
    (candidateGenusFieldReal hd ≃ₐ[candidateGenusFieldBase hd] candidateGenusFieldReal hd) ≃*
      Multiplicative (TauCeti.ClassGroup.ElementaryTwoQuotient (𝓞 (candidateGenusFieldBase hd))) :=
  autCandidateGenusFieldRealEquivElementaryTwoQuotient hd hnsq hpos

theorem autCandidateGenusFieldRealEquivElementaryTwoQuotient_apply_restrict {d : ℤ}
    (hd : Squarefree d) (hnsq : ¬ IsSquare ((d : ℤ) : ℚ)) (hpos : 0 < d)
    (σ : candidateGenusField hd ≃ₐ[candidateGenusFieldBase hd] candidateGenusField hd) :
    letI := candidateGenusFieldRealAlgebra hd hpos
    autCandidateGenusFieldRealEquivElementaryTwoQuotient hd hnsq hpos
        (candidateGenusFieldRestrictionToReal hd hpos σ) =
      Multiplicative.ofAdd
        (NarrowClassGroup.toClassGroupElementaryTwoQuotient (candidateGenusFieldBase hd)
          ((narrowElementaryTwoQuotientEquivRelativeSign hd hnsq).symm
            ⟨candidateGenusFieldRelativeSignPattern hd σ,
              candidateGenusFieldRelativeSignPattern_mem hd σ⟩)) := by
  rw [TauCeti.Multiquadratic.autCandidateGenusFieldRealEquivElementaryTwoQuotient_apply_restrict,
    candidateGenusFieldOrdinaryClassGroupHom_apply,
    candidateGenusFieldOrdinaryClassGroupSignMap_apply]

section TwoRank

variable {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K} {d : ℤ}

/-- **The 2-rank formula `rank₂ Cl(K) = t - 1` for imaginary `K = ℚ(√d)`**, `t` the number of
ramified rational primes. -/
theorem twoRank_eq_ncard_ramifiedPrimes_sub_one (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) (hd : d < 0) :
    TauCeti.ClassGroup.twoRank (𝓞 K) = (ramifiedPrimes K).ncard - 1 :=
  TauCeti.Multiquadratic.twoRank_eq_ncard_ramifiedPrimes_sub_one hmin hgen hsf hd

/-- **The narrow 2-rank formula `rank₂ Cl⁺(K) = t - 1`**, real and imaginary alike. -/
theorem narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one (hmin : minpoly ℤ θ = X ^ 2 - C d)
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) (hsf : Squarefree d) :
    NarrowClassGroup.twoRank K = (ramifiedPrimes K).ncard - 1 :=
  TauCeti.Multiquadratic.narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one hmin hgen hsf

theorem NarrowClassGroup.twoRank_eq (K : Type*) [Field K] [NumberField K] :
    NarrowClassGroup.twoRank K =
      Module.finrank (ZMod 2) (NarrowClassGroup.ElementaryTwoQuotient K) :=
  NumberField.NarrowClassGroup.twoRank_def K

/-- For real `K` the ordinary 2-rank can drop by one, and no further. -/
theorem twoRank_eq_ncard_ramifiedPrimes_sub_one_or_sub_two (hK : Module.finrank ℚ K = 2) :
    TauCeti.ClassGroup.twoRank (𝓞 K) = (ramifiedPrimes K).ncard - 1 ∨
      TauCeti.ClassGroup.twoRank (𝓞 K) = (ramifiedPrimes K).ncard - 2 :=
  TauCeti.Multiquadratic.twoRank_eq_ncard_ramifiedPrimes_sub_one_or_sub_two hK

omit [NumberField K] in
/-- `ramifiedPrimes K` is the set of rational primes that ramify in `K`. -/
theorem mem_ramifiedPrimes_iff (p : ℕ) :
    p ∈ ramifiedPrimes K ↔
      p.Prime ∧ ¬ Algebra.IsUnramifiedIn (𝓞 K) (Ideal.span {(p : ℤ)}) :=
  Iff.rfl

/-- **`ℚ(√3)`**: `t = 2` but class number `1`, while the narrow 2-rank is `t - 1 = 1`. -/
theorem sqrt_three (hmin : minpoly ℤ θ = X ^ 2 - C (3 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    (ramifiedPrimes K).ncard = 2 ∧ NumberField.classNumber K = 1 ∧
      NarrowClassGroup.twoRank K = 1 :=
  ⟨ncard_ramifiedPrimes_eq_two_of_minpoly_eq_X_sq_sub_three hmin hgen,
    TauCeti.NumberField.classNumber_eq_one_of_minpoly_eq_X_sq_sub_three hmin hgen,
    narrowTwoRank_eq_one_of_minpoly_eq_X_sq_sub_three hmin hgen⟩

end TwoRank

end Layer3

/-! ## Worked examples -/

section Examples

/-- **`[ℚ(√2, √3) : ℚ] = 4`**, the smallest nontrivial multiquadratic degree. -/
theorem finrank_sqrt_two_sqrt_three :
    Module.finrank ℚ (adjoin ℚ {Real.sqrt 2, Real.sqrt 3} : IntermediateField ℚ ℝ) = 4 :=
  finrank_adjoin_sqrt_two_three

/-- **The Erdős CM field** `ℚ(i, √q₀, …, √q_{g-1})`, for distinct primes `qⱼ`, is a
multiquadratic field of degree `2 ^ (g + 1)`. -/
theorem finrank_erdos_cm_field {ι : Type*} [Finite ι] (q : ι → ℕ) (hq : ∀ i, (q i).Prime)
    (hinj : Function.Injective q) :
    Module.finrank ℚ
        (adjoin ℚ (insert Complex.I (Set.range fun i => ((Real.sqrt (q i) : ℝ) : ℂ))))
      = 2 ^ (Nat.card ι + 1) :=
  finrank_adjoin_I_sqrt_primes q hq hinj

section MinusFive

variable {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K}

/-- **`ℚ(√-5)` has class number `2`.** -/
theorem classNumber_sqrt_neg_five (hmin : minpoly ℤ θ = X ^ 2 - C (-5 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) : NumberField.classNumber K = 2 :=
  TauCeti.NumberField.classNumber_eq_two_of_minpoly_eq_X_sq_add_five hmin hgen

/-- The ramified primes of `ℚ(√-5)` are `2` and `5`, so `t = 2`. -/
theorem ramifiedPrimes_sqrt_neg_five (hmin : minpoly ℤ θ = X ^ 2 - C (-5 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) : ramifiedPrimes K = {2, 5} := by
  have hsf : Squarefree (-5 : ℤ) := (Int.prime_iff_natAbs_prime.mpr (by decide)).squarefree
  have hs : ∀ P ∈ ({-4, 5} : Finset ℤ), IsPrimeDiscriminant P := by
    intro P hP
    fin_cases hP
    · exact isPrimeDiscriminant_neg_four
    · simpa [oddPrimeDiscriminant_of_mod_four_eq_one (by norm_num : 5 % 4 = 1)]
        using isPrimeDiscriminant_oddPrimeDiscriminant (p := 5) (by decide) (by decide)
  have hprod : ∏ P ∈ ({-4, 5} : Finset ℤ), P = fundamentalDiscriminant (-5 : ℤ) := by
    rw [Finset.prod_insert (by decide : (-4 : ℤ) ∉ ({5} : Finset ℤ)), Finset.prod_singleton,
      fundamentalDiscriminant_of_mod_four_ne_one (by decide : (-5 : ℤ) % 4 ≠ 1)]
    ring
  rw [ramifiedPrimes_eq_image hmin hgen hsf hs hprod]
  simp [primeDiscriminantPrime_def]

/-- Its 2-rank is `1 = t - 1`. -/
theorem twoRank_sqrt_neg_five (hmin : minpoly ℤ θ = X ^ 2 - C (-5 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) : TauCeti.ClassGroup.twoRank (𝓞 K) = 1 :=
  twoRank_eq_one_of_minpoly_eq_X_sq_add_five hmin hgen

end MinusFive

/-- **The genus field of `ℚ(√-5)` is `ℚ(√-1, √5)`.** -/
theorem candidateGenusField_sqrt_neg_five (hd : Squarefree (-5 : ℤ)) :
    candidateGenusField hd = adjoin ℚ ({Complex.I, (Real.sqrt 5 : ℂ)} : Set ℂ) :=
  candidateGenusField_neg_five_eq hd

theorem isGenusField_sqrt_neg_five :
    ∃ y : adjoin ℚ ({Complex.I, (Real.sqrt 5 : ℂ)} : Set ℂ),
      IsGenusField (-5) (adjoin ℚ ({Complex.I, (Real.sqrt 5 : ℂ)} : Set ℂ)) y :=
  exists_isGenusField_adjoin_I_sqrt_five

section MinusTwentyOne

variable {K : Type*} [Field K] [NumberField K] {θ : 𝓞 K}

/-- **`ℚ(√-21)` has class group `(ℤ/2)²`.** -/
theorem classGroup_sqrt_neg_twenty_one (hmin : minpoly ℤ θ = X ^ 2 - C (-21 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) :
    Nonempty (ClassGroup (𝓞 K) ≃* Multiplicative (ZMod 2 × ZMod 2)) :=
  nonempty_classGroup_mulEquiv_zmod_two_sq_of_minpoly_eq_X_sq_add_twenty_one hmin hgen

/-- Its discriminant is `-84`, and the ramified primes are `2`, `3`, `7`, so `t = 3`. -/
theorem discr_sqrt_neg_twenty_one (hmin : minpoly ℤ θ = X ^ 2 - C (-21 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) : NumberField.discr K = -84 := by
  rw [discr_eq_fundamentalDiscriminant hmin hgen squarefree_neg_twenty_one,
    fundamentalDiscriminant_of_mod_four_ne_one (by decide)]
  norm_num

theorem ramifiedPrimes_sqrt_neg_twenty_one (hmin : minpoly ℤ θ = X ^ 2 - C (-21 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) : ramifiedPrimes K = {2, 3, 7} := by
  have hs : ∀ P ∈ ({-4, -3, -7} : Finset ℤ), IsPrimeDiscriminant P := by
    intro P hP
    fin_cases hP
    · exact isPrimeDiscriminant_neg_four
    · simpa [oddPrimeDiscriminant_of_mod_four_eq_three (by norm_num : 3 % 4 = 3)]
        using isPrimeDiscriminant_oddPrimeDiscriminant (p := 3) (by decide) (by decide)
    · simpa [oddPrimeDiscriminant_of_mod_four_eq_three (by norm_num : 7 % 4 = 3)]
        using isPrimeDiscriminant_oddPrimeDiscriminant (p := 7) (by decide) (by decide)
  have hprod : ∏ P ∈ ({-4, -3, -7} : Finset ℤ), P = fundamentalDiscriminant (-21 : ℤ) := by
    rw [Finset.prod_insert (by decide : (-4 : ℤ) ∉ ({-3, -7} : Finset ℤ)),
      Finset.prod_insert (by decide : (-3 : ℤ) ∉ ({-7} : Finset ℤ)), Finset.prod_singleton,
      fundamentalDiscriminant_of_mod_four_ne_one (by decide : (-21 : ℤ) % 4 ≠ 1)]
    ring
  rw [ramifiedPrimes_eq_image hmin hgen squarefree_neg_twenty_one hs hprod]
  simp [primeDiscriminantPrime_def]

/-- Its 2-rank is `2 = t - 1`. -/
theorem twoRank_sqrt_neg_twenty_one (hmin : minpoly ℤ θ = X ^ 2 - C (-21 : ℤ))
    (hgen : Algebra.adjoin ℚ {(θ : K)} = ⊤) : TauCeti.ClassGroup.twoRank (𝓞 K) = 2 :=
  twoRank_eq_two_of_minpoly_eq_X_sq_add_twenty_one hmin hgen

end MinusTwentyOne

/-- **The genus field of `ℚ(√-21)` is `ℚ(√-1, √-3, √-7)`**, of degree `4` over `ℚ(√-21)`. -/
theorem candidateGenusField_sqrt_neg_twenty_one :
    candidateGenusField squarefree_neg_twenty_one =
      adjoin ℚ ({Complex.I, Complex.I * ((Real.sqrt 3 : ℝ) : ℂ),
        Complex.I * ((Real.sqrt 7 : ℝ) : ℂ)} : Set ℂ) :=
  candidateGenusField_neg_twenty_one_eq

theorem sqrt_neg_three_sq : (Complex.I * ((Real.sqrt 3 : ℝ) : ℂ)) ^ 2 = -3 :=
  sqrtNegThree_sq

theorem sqrt_neg_seven_sq : (Complex.I * ((Real.sqrt 7 : ℝ) : ℂ)) ^ 2 = -7 :=
  sqrtNegSeven_sq

theorem finrank_candidateGenusField_sqrt_neg_twenty_one :
    Module.finrank (candidateGenusFieldBase squarefree_neg_twenty_one)
      (candidateGenusField squarefree_neg_twenty_one) = 4 := by
  have hnsq : ¬ IsSquare (((-21 : ℤ) : ℤ) : ℚ) := fun h => by
    have := h.nonneg
    norm_num at this
  rw [finrank_candidateGenusField_over_candidateGenusFieldBase _ hnsq,
    genusPrimeDiscriminants_neg_twenty_one]
  rfl

theorem isGenusField_sqrt_neg_twenty_one :
    ∃ y : adjoin ℚ ({Complex.I, sqrtNegThree, sqrtNegSeven} : Set ℂ),
      IsGenusField.{0, v} (-21) _ y :=
  exists_isGenusField_adjoin_I_sqrt_neg_three_sqrt_neg_seven

end Examples

end TauCetiRoadmap.Multiquadratic
