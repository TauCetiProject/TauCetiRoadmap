import Mathlib

/-!
# PotentialAutomorphyInfrastructure: representative target signatures

The roadmap is `README.md`. This file records the light definitions, theorem signatures and
examples that can already be stated against the pinned Mathlib; it is not exhaustive. Every
statement whose carriers are arithmetic (locally symmetric spaces and their cohomology, Hecke
algebras, Galois representations of number fields, compatible systems, automorphic
representations, deformation rings, patched complexes, integral dual Weyl modules) is a README
target and is absent here.

Design choices made explicit by the declarations below.
* A Hecke-equivariant direct summand is a Mathlib `Retract` together with equations for an
  indexed family of actual endomorphisms on both objects.
* The unitary weight of a pair of `GLₙ` rows concatenates the negated reversed conjugate row with
  the row itself; rows are descending and indexed from zero. Coefficient splittings also require
  this concatenated row to be dominant.
* Siegel Kostant representatives are permutations of `Fin (n + n)` whose inverse is increasing on
  each block, the minimal representatives of cosets `W_P w` with the Levi group on the left.
* Chosen local uniformizers give unit/valuation coordinates `Oˣ × ℤ` on a diagonal torus entry.
  The lowest-weight character is trivial on uniformizer powers. The `i`-th ordinary character
  (zero-based) uses the reversed weight `λ_{τ, n-1-i}`, the cyclotomic exponent `-i` and the ratio
  `U_{i+1}/U_i` of normalized operators.
* The orientation character of a Bruhat cell is `a(t)⁻¹ / |a(t)|_p` for a nonzero determinant
  character `a` with values in `ℚ_pˣ`.
* Integral duality is derived; the rational degree reflection `i ↦ d - i` and the Hida weight
  shift `ν` are recorded only as numerical examples.
-/

open CategoryTheory
open scoped BigOperators

namespace TauCetiRoadmap.PotentialAutomorphyInfrastructure

universe u v w

/-! ## Layer 0: Integral coefficients and boundary comparison -/

/-- An equivariant retract: a Mathlib `Retract A B` whose inclusion and retraction commute with
an indexed family of endomorphisms `fA r` of `A` and `fB r` of `B` (ACC §4.2, p. 969). In the
arithmetic applications the index is a Hecke algebra acting through ring homomorphisms. -/
structure EquivariantRetract {C : Type u} [Category.{v} C] {I : Type w}
    (A B : C) (fA : I → (A ⟶ A)) (fB : I → (B ⟶ B))
    extends Retract A B where
  inclusion_comm_eq : ∀ r, fA r ≫ i = i ≫ fB r
  retraction_comm_eq : ∀ r, fB r ≫ toRetract.r = toRetract.r ≫ fA r

namespace EquivariantRetract
variable {C : Type u} [Category.{v} C] {I : Type w}
variable {A B : C} {fA : I → (A ⟶ A)} {fB : I → (B ⟶ B)}

/-- A functor carries an equivariant retract to one between the image objects, for the image
endomorphisms. -/
def map {D : Type*} [Category D] (h : EquivariantRetract A B fA fB) (F : C ⥤ D) :
    EquivariantRetract (F.obj A) (F.obj B)
      (fun r => F.map (fA r)) (fun r => F.map (fB r)) where
  toRetract := h.toRetract.map F
  inclusion_comm_eq r := by
    simp only [Retract.map_i]
    rw [← F.map_comp, ← F.map_comp, h.inclusion_comm_eq r]
  retraction_comm_eq r := by
    simp only [Retract.map_r]
    rw [← F.map_comp, ← F.map_comp, h.retraction_comm_eq r]

/-- The identity retract of `A` is equivariant for any indexed family acting on `A`. -/
def refl (A : C) (f : I → (A ⟶ A)) : EquivariantRetract A A f f where
  toRetract := Retract.refl A
  inclusion_comm_eq r := by simp
  retraction_comm_eq r := by simp

/-- The summand projector `r ≫ i` of `B` is idempotent and commutes with every action
operator; in a derived category it is the idempotent whose image is the equivariant summand. -/
theorem idempotent (h : EquivariantRetract A B fA fB) :
    (h.toRetract.r ≫ h.i) ≫ (h.toRetract.r ≫ h.i) = h.toRetract.r ≫ h.i ∧
      ∀ r, fB r ≫ (h.toRetract.r ≫ h.i) = (h.toRetract.r ≫ h.i) ≫ fB r := by sorry

/-- `EquivariantRetract.forget_identity`: forgetting the equations of the identity construction
gives Mathlib's `Retract.refl`. -/
example (A : C) (f : I → (A ⟶ A)) : (refl A f).toRetract = Retract.refl A := rfl

/-- `EquivariantRetract.incompatible_actions`: the identity maps of `ℤ` are a retract but not an
equivariant one when the same index acts by `1` on the source and by `2` on the target. -/
example : ¬ ∃ h : EquivariantRetract (C := Type) ℤ ℤ
    (fun _ : Unit => ↾(fun z : ℤ => z)) (fun _ : Unit => ↾(fun z : ℤ => 2 * z)),
      h.i = 𝟙 ℤ ∧ h.toRetract.r = 𝟙 ℤ := by sorry
end EquivariantRetract

/-- The unitary weight attached to descending `GLₙ` rows `a = λ_τ` and `b = λ_{τc}`: the row
`(-b_{n-1}, …, -b_0, a_0, …, a_{n-1})` (ACC (2.2.2), pp. 918–919). -/
def UnitaryLeviWeight {n : ℕ} (a b : Fin n → ℤ) : Fin (n + n) → ℤ :=
  Fin.addCases (fun i => -b i.rev) a

namespace UnitaryLeviWeight
variable {n : ℕ}

/-- For `n > 0` and descending input rows, the unitary row is descending exactly when
`-b₀ ≥ a₀`, the comparison across the two blocks. -/
theorem dominant_iff (a b : Fin n → ℤ) (hn : 0 < n) (ha : Antitone a) (hb : Antitone b) :
    Antitone (UnitaryLeviWeight a b) ↔ -b ⟨0, hn⟩ ≥ a ⟨0, hn⟩ := by sorry

/-- `UnitaryLeviWeight.zero`: zero Levi rows give the zero unitary row, including rank zero. -/
example : UnitaryLeviWeight (0 : Fin n → ℤ) 0 = 0 := by sorry

/-- `UnitaryLeviWeight.rank_one`: `λ_τ = (2)`, `λ_{τc} = (-3)` give `(3, 2)`. -/
example : UnitaryLeviWeight ![(2 : ℤ)] ![(-3 : ℤ)] = ![(3 : ℤ), 2] := by sorry
/-- `UnitaryLeviWeight.rank_two`: `λ_τ = (2, 1)`, `λ_{τc} = (-3, -4)` give `(4, 3, 2, 1)`;
omitting the reversal would give `(3, 4, 2, 1)`. -/
example : UnitaryLeviWeight ![(2 : ℤ), 1] ![(-3 : ℤ), -4] = ![(4 : ℤ), 3, 2, 1] := by sorry

/-- `UnitaryLeviWeight.non_dominant`: both rank-one Levi rows are dominant, but their unitary
row `(-1, 1)` is not dominant. The Siegel coefficient splitting requires unitary dominance. -/
example : UnitaryLeviWeight ![(1 : ℤ)] ![(1 : ℤ)] = ![(-1 : ℤ), 1] ∧
    ¬ Antitone (UnitaryLeviWeight ![(1 : ℤ)] ![(1 : ℤ)]) := by decide
end UnitaryLeviWeight

/-! ## Layer 1: Fontaine–Laffaille compatibility -/

/-- Siegel Kostant representatives: permutations of `Fin (n + n)` whose inverse is strictly
increasing on each of the two blocks (ACC §1.2, pp. 905–906). -/
def KostantShuffle (n : ℕ) :=
  {w : Equiv.Perm (Fin (n + n)) //
    StrictMono (fun i : Fin n => w.symm (Fin.castAdd n i)) ∧
    StrictMono (fun i : Fin n => w.symm (Fin.natAdd n i))}

namespace KostantShuffle
variable {n : ℕ}

/-- The underlying permutation. -/
def val (s : KostantShuffle n) : Equiv.Perm (Fin (n + n)) := s.1

/-- The number of pairs `i < j` with `w j < w i`, the Coxeter length in `S_{2n}`. -/
def inversionCount (w : Equiv.Perm (Fin (n + n))) : ℕ :=
  (Finset.univ.filter fun ij : Fin (n + n) × Fin (n + n) =>
    ij.1 < ij.2 ∧ w ij.2 < w ij.1).card

/-- The length of a shuffle. -/
def length (s : KostantShuffle n) : ℕ := inversionCount s.val

/-- Every coset `W_P w`, with `W_P` the block-preserving permutations acting on the left, has a
unique shuffle representative, and it has minimal length in its coset. -/
theorem minimal_representative (w : Equiv.Perm (Fin (n + n))) :
    (∃! s : KostantShuffle n, ∃ v : Equiv.Perm (Fin (n + n)),
      (∀ i, (v i).val < n ↔ i.val < n) ∧ w = v * s.val) ∧
    (∀ (s : KostantShuffle n) (v : Equiv.Perm (Fin (n + n))),
      (∀ i, (v i).val < n ↔ i.val < n) → s.length ≤ inversionCount (v * s.val)) := by sorry

/-- `KostantShuffle.rank_zero`: the unique rank-zero shuffle has length zero. -/
example : ∃! s : KostantShuffle 0, s.length = 0 := by sorry

/-- `KostantShuffle.rank_one`: for `n = 1` there are exactly two shuffles, of lengths `0`
and `1`. -/
example : ∃ s₀ s₁ : KostantShuffle 1,
    s₀.length = 0 ∧ s₁.length = 1 ∧ ∀ s, s = s₀ ∨ s = s₁ := by sorry
/-- `KostantShuffle.block_swap`: the block exchange is a shuffle of length `n²`. -/
example (n : ℕ) : ∃ s : KostantShuffle n,
    s.val = (finAddFlip : Fin (n + n) ≃ Fin (n + n)) ∧ s.length = n ^ 2 := by sorry
/-- `KostantShuffle.internal_swap`: for `n = 2` the transposition `(0 1)` inside the first block
is not a shuffle. -/
example : ¬ ∃ s : KostantShuffle 2, s.val = Equiv.swap (0 : Fin 4) 1 := by sorry
end KostantShuffle

/-- The CTG condition on a computed Levi-weight table `μ w τ i` (ACC Definition 4.3.5, p. 974):
for every Kostant representative `w` and integer `a`, some embedding `τ` has a conjugate sum
`μ w τ i + μ w (c τ) (n-1-i)` that is not the constant vector `a`. -/
def CTGWeight {W Emb : Type*} {n : ℕ} (c : Emb → Emb)
    (μ : W → Emb → Fin n → ℤ) : Prop :=
  ∀ w a, ∃ τ, (fun i => μ w τ i + μ w (c τ) i.rev) ≠ fun _ => a

namespace CTGWeight
variable {W Emb : Type*} {n : ℕ} {c : Emb → Emb}

/-- `CTGWeight.empty_w`: an empty representative set satisfies CTG for every table. -/
example [IsEmpty W] (μ : W → Emb → Fin n → ℤ) : CTGWeight c μ := by sorry

/-- `CTGWeight.zero`: for nonempty `W` the zero table is not CTG (in every rank, including
rank zero). -/
example [Nonempty W] : ¬ CTGWeight (W := W) (n := n) c (fun _ _ _ => 0) := by sorry
/-- `CTGWeight.rank_one_pair`: with two conjugate pairs of embeddings whose conjugate sums are
`0` and `1`, the rank-one table is CTG. -/
example : CTGWeight (n := 1)
    (fun τ : Bool × Bool => (τ.1, !τ.2))
    (fun (_ : Unit) (τ : Bool × Bool) (_ : Fin 1) =>
      if τ.1 && !τ.2 then 1 else 0) := by sorry
end CTGWeight

/-- Separated sets of integers are recovered from their union and their shifted union
(ACC Lemma 4.5.2, p. 989). -/
theorem shifted_partition_recovery (A B C D : Finset ℤ) (m : ℕ) (hm : 0 < m)
    (hA : A.card = m) (hB : B.card = m) (hC : C.card = m) (hD : D.card = m)
    (hsep : ∀ c ∈ C, ∀ d ∈ D, d < c) (h₀ : A ∪ B = C ∪ D)
    (h₁ : A.image (fun a => a + 1) ∪ B = C.image (fun c => c + 1) ∪ D)
    (hcard₀ : (A ∪ B).card = 2 * m)
    (hcard₁ : (A.image (fun a => a + 1) ∪ B).card = 2 * m) :
    A = C ∧ B = D := by sorry

/-- For `n = 2` and `[F⁺ : ℚ] = 2`, `d = 8`; the rational range `[2, 5]` reflects to `[3, 6]`,
so the dual lower degree is `q_GL + 1`. -/
example : (Finset.Icc (2 : ℤ) 5).image (fun i => 8 - i) = Finset.Icc 3 6 := by sorry

/-- `arithmetic_franke_inputs.eisenstein`: the two induced geometric Frobenius eigenvalues
`5, 1` give trace `6` and determinant `5`, whereas omitting the twist gives trace `2`. -/
example : (Polynomial.X - Polynomial.C (5 : ℚ)) * (Polynomial.X - 1) =
    Polynomial.X ^ 2 - Polynomial.C 6 * Polynomial.X + Polynomial.C 5 ∧
    (6 : ℚ) ≠ 2 := by
  constructor
  · simp only [map_ofNat]
    ring
  · norm_num

/-! ## Layer 2: Soluble transport and rank-two compatible systems -/

/-- `rank_two_reducibility_dichotomy.metadata`: determinant weights do not recover the full
Hodge multiset of an extremely weak system. -/
example : ({(2 : ℤ), -3} : Multiset ℤ).sum = ({0, -1} : Multiset ℤ).sum ∧
    ({(2 : ℤ), -3} : Multiset ℤ) ≠ {0, -1} := by decide

/-- `extremely_weak_rational_maximality.coefficients`: the product of the conjugate quadratic
polynomials is `X⁴ + 1` when the coefficient has square `2`. -/
example {R : Type*} [CommRing R] (a : R) (ha : a ^ 2 = 2) :
    (Polynomial.X ^ 2 - Polynomial.C a * Polynomial.X + 1) *
      (Polynomial.X ^ 2 + Polynomial.C a * Polynomial.X + 1) =
        (Polynomial.X ^ 4 + 1 : Polynomial R) := by
  calc
    _ = Polynomial.X ^ 4 + Polynomial.C (2 - a ^ 2) * Polynomial.X ^ 2 + 1 := by
      simp only [map_sub, map_ofNat, map_pow]
      ring
    _ = _ := by rw [ha]; simp

/-- Composita of Galois extensions with a common simple Galois group (Qian, proof of Lemma
2.6(2), pp. 1251–1252): a subfamily indexed by `J` has the same compositum, the Galois group of
the compositum has order `#Δ ^ #J`, and composita over disjoint parts of `J` are linearly
disjoint. -/
theorem simple_galois_composita {k Ω Δ : Type*} [Field k] [Field Ω] [Algebra k Ω]
    [Group Δ] [Finite Δ] [IsSimpleGroup Δ] {ι : Type*} [Fintype ι]
    (K : ι → IntermediateField k Ω) [∀ i, FiniteDimensional k (K i)]
    [∀ i, IsGalois k (K i)]
    (hK : ∀ i, K i = ⊥ ∨ Nonempty ((K i ≃ₐ[k] K i) ≃* Δ)) :
    ∃ J : Finset ι, (⨆ j ∈ J, K j) = (⨆ i, K i) ∧
      Nat.card ((⨆ i, K i : IntermediateField k Ω) ≃ₐ[k] (⨆ i, K i : IntermediateField k Ω)) =
        Nat.card Δ ^ J.card ∧
      ∀ I I' : Finset ι, I ⊆ J → I' ⊆ J → Disjoint I I' →
        (⨆ i ∈ I, K i : IntermediateField k Ω).LinearDisjoint
          (↥(⨆ i ∈ I', K i : IntermediateField k Ω)) := by sorry

/-- The weight-zero condition on a rank-two Hodge table: every `H_τ` is the multiset `{0, 1}`
(BCGP §9.1, p. 251). -/
def RankTwoWeightZero {Emb : Type*} (H : Emb → Multiset ℤ) : Prop :=
  ∀ τ, H τ = {0, 1}

namespace RankTwoWeightZero
/-- `RankTwoWeightZero.standard`: the constant multiset table `{0, 1}` has weight zero. -/
example {Emb : Type*} : RankTwoWeightZero (fun _ : Emb => ({0, 1} : Multiset ℤ)) := by sorry

/-- `RankTwoWeightZero.reversed`: the table presented as `{1, 0}` has weight zero. -/
example : RankTwoWeightZero (fun _ : Unit => ({1, 0} : Multiset ℤ)) := by sorry
/-- `RankTwoWeightZero.repeated_zero`: the table `{0, 0}` does not have weight zero. -/
example : ¬ RankTwoWeightZero (fun _ : Unit => ({0, 0} : Multiset ℤ)) := by sorry
end RankTwoWeightZero

/-- Oddness of a rank-two system, given its complex conjugations at the real places as matrices
over characteristic-zero coefficients: each has determinant `-1` (BCGP §9.1, p. 251). -/
def RankTwoOdd {I R : Type*} [CommRing R] [CharZero R]
    (A : I → Matrix (Fin 2) (Fin 2) R) : Prop :=
  ∀ i, Matrix.det (A i) = -1

namespace RankTwoOdd
/-- `RankTwoOdd.split_involution`: `diag(1, -1)` is odd. -/
example : RankTwoOdd (fun _ : Unit => (!![(1 : ℚ), 0; 0, -1])) := by sorry
/-- `RankTwoOdd.identity`: the identity matrix over `ℚ` is not odd. -/
example : ¬ RankTwoOdd (fun _ : Unit => (1 : Matrix (Fin 2) (Fin 2) ℚ)) := by sorry
/-- `RankTwoOdd.empty_real_places`: with no real places the condition holds. -/
example (A : Empty → Matrix (Fin 2) (Fin 2) ℚ) : RankTwoOdd A := by sorry
end RankTwoOdd

/-- For Frobenius roots `2` and `3`, `Sym²` has roots `4, 6, 9` and determinant `216 = 6³`. -/
example : Matrix.det (Matrix.diagonal ![(4 : ℚ), 6, 9]) = (2 * 3 : ℚ) ^ 3 := by sorry

/-- With `m = 0` and `n = 3` the symmetric-power Hodge multiset `{0, 0, 0}` has repeated weights,
so regularity is not automatic. -/
example : ¬ (0 ::ₘ (0 ::ₘ (0 ::ₘ (0 : Multiset ℤ)))).Nodup := by sorry

/-! ## Layer 3: Ordinary cohomology and compatibility -/

/-- A diagonal torus element in unit/valuation coordinates, after uniformizers are chosen. -/
abbrev SplitTorus (n : ℕ) (U : Type*) := (Fin n → U) × Multiplicative (Fin n → ℤ)

/-- The positive monoid: diagonal elements whose valuations decrease, `v(t_i) ≥ v(t_j)` for
`i < j`, so that conjugation contracts the upper unipotent group (ACC §5.2.1). -/
def PositiveTorusMonoid (n : ℕ) (U : Type*) [CommGroup U] :
    Submonoid (SplitTorus n U) where
  carrier := {t | ∀ i j, i < j → t.2.toAdd j ≤ t.2.toAdd i}
  one_mem' := by sorry
  mul_mem' := by sorry

namespace PositiveTorusMonoid
variable {n : ℕ} {U : Type*} [CommGroup U]

/-- The exponent row `(n-1, …, 0)` for the chosen local uniformizer. ACC's element built from
the rational prime `p` has this row multiplied by `v(p)`. -/
def contractingElement (n : ℕ) (U : Type*) [CommGroup U] : SplitTorus n U :=
  (1, Multiplicative.ofAdd (fun i => (n : ℤ) - 1 - i.val))

/-- `PositiveTorusMonoid.rank_one`: every rank-one torus element is positive. -/
example (t : SplitTorus 1 U) : t ∈ PositiveTorusMonoid 1 U := by sorry

/-- `PositiveTorusMonoid.rank_two_positive`: the row `(1, 0)` is positive. -/
example : ((1 : Fin 2 → U), Multiplicative.ofAdd ![(1 : ℤ), 0]) ∈
    PositiveTorusMonoid 2 U := by sorry
/-- `PositiveTorusMonoid.rank_two_negative`: the row `(0, 1)` is not positive for the upper
Borel. -/
example : ((1 : Fin 2 → U), Multiplicative.ofAdd ![(0 : ℤ), 1]) ∉
    PositiveTorusMonoid 2 U := by sorry
end PositiveTorusMonoid

/-- The lowest-weight character of the torus: `∏_τ ∏_i τ(u_i)^{λ_{τ,i}}` on units, and `1` on
the chosen uniformizer powers (ACC §5.2.1). -/
noncomputable def LowestWeightCharacter {Emb U R : Type*} [Fintype Emb]
    [CommGroup U] [CommRing R] (n : ℕ) (σ : Emb → U →* Rˣ)
    (lam : Emb → Fin n → ℤ) : SplitTorus n U →* Rˣ where
  toFun t := ∏ τ, ∏ i, σ τ (t.1 i) ^ lam τ i
  map_one' := by sorry
  map_mul' := by sorry

namespace LowestWeightCharacter
variable {Emb U R : Type*} [Fintype Emb] [CommGroup U] [CommRing R]
variable {n : ℕ} (σ : Emb → U →* Rˣ) (lam : Emb → Fin n → ℤ)
/-- `LowestWeightCharacter.zero`: zero weight gives the trivial character on the full torus. -/
example : LowestWeightCharacter n σ (0 : Emb → Fin n → ℤ) = 1 := by sorry

/-- `LowestWeightCharacter.rank_one_square`: one embedding, rank one, weight `2`: a unit `u`
acts by `τ(u)²`. -/
example (σ : Unit → U →* Rˣ) (u : U) :
    LowestWeightCharacter 1 σ (fun _ _ => 2)
      ((fun _ => u), Multiplicative.ofAdd 0) = σ () u ^ (2 : ℤ) := by sorry
/-- `LowestWeightCharacter.uniformizer_normalization`: chosen uniformizers act by `1` even for
nonzero `λ`, not by their algebraic `λ`-power. -/
example (a : Fin n → ℤ) :
    LowestWeightCharacter n σ lam (1, Multiplicative.ofAdd a) = 1 := by sorry
end LowestWeightCharacter

/-- The admissible pairs `(b, c)`, `c ≥ b ≥ 0` and `c ≥ 1`, indexing the levels `K(b, c)`
(ACC §5.1). -/
structure IwahoriLevelTower where
  b : ℕ
  c : ℕ
  b_le_c : b ≤ c
  one_le_c : 1 ≤ c

namespace IwahoriLevelTower
variable {O : Type*} [CommRing O] (ϖ : O) (n : ℕ)

/-- The local factor `Iw_v(b, c)`: matrices in `GL_n(O)` that are upper triangular modulo `ϖ^c`
and whose diagonal entries are congruent to `1` modulo `ϖ^b`. -/
def level (t : IwahoriLevelTower) : Subgroup (GL (Fin n) O) where
  carrier := {g | (∀ i j : Fin n, j < i →
      (g : Matrix (Fin n) (Fin n) O) i j ∈ Ideal.span {ϖ ^ t.c}) ∧
    ∀ i, (g : Matrix (Fin n) (Fin n) O) i i - 1 ∈ Ideal.span {ϖ ^ t.b}}
  one_mem' := by sorry
  mul_mem' := by sorry
  inv_mem' := by sorry

/-- For `O` local, reduction of the diagonal modulo `ϖ^b` is a surjection from `Iw_v(0, c)` onto
the diagonal units of `O/ϖ^b` with kernel `Iw_v(b, c)`: the diamond quotient. -/
theorem diamondQuotient [IsLocalRing O] (t : IwahoriLevelTower) :
    ∃ f : level ϖ n ⟨0, t.c, Nat.zero_le _, t.one_le_c⟩ →*
        (Fin n → (O ⧸ Ideal.span {ϖ ^ t.b})ˣ),
      Function.Surjective f ∧
      f.ker = (level ϖ n t).subgroupOf (level ϖ n ⟨0, t.c, Nat.zero_le _, t.one_le_c⟩) ∧
      ∀ g i, ((f g i : (O ⧸ Ideal.span {ϖ ^ t.b})ˣ) : O ⧸ Ideal.span {ϖ ^ t.b}) =
        Ideal.Quotient.mk _ (((g : GL (Fin n) O) : Matrix (Fin n) (Fin n) O) i i) := by sorry

/-- `IwahoriLevelTower.zero_b`: at depth zero the diagonal diamond group is trivial. -/
example : Subsingleton (Fin n → (O ⧸ Ideal.span {ϖ ^ (0 : ℕ)})ˣ) := by sorry

/-- `IwahoriLevelTower.deep_unipotent`: for `b = 1` a diagonal unit not congruent to `1`
modulo `ϖ` lies in `K(0, c)` but not in `K(1, c)`. -/
example (c : ℕ) (hc : 1 ≤ c) (u : Oˣ) (hu : (u : O) - 1 ∉ Ideal.span {ϖ}) :
    let g : GL (Fin 2) O := Units.map
      (Matrix.diagonalRingHom (Fin 2) O : (Fin 2 → O) →* Matrix (Fin 2) (Fin 2) O)
      (MulEquiv.piUnits.symm ![u, 1])
    g ∈ level ϖ 2 ⟨0, c, Nat.zero_le c, hc⟩ ∧ g ∉ level ϖ 2 ⟨1, c, hc, hc⟩ := by sorry

/-- Over a field a nonzero congruence parameter generates the unit ideal and every level is the
whole group; arithmetic uniformizers are nonunits. -/
example {K : Type*} [Field K] (ϖ : K) (hϖ : ϖ ≠ 0) (n : ℕ)
    (t : IwahoriLevelTower) : level ϖ n t = ⊤ := by sorry
end IwahoriLevelTower

/-- One Kostant shuffle for each `p`-adic place of `F⁺`. -/
def RelativeBruhatCells (P : Type*) (n : ℕ) := P → KostantShuffle n

namespace RelativeBruhatCells
variable {P : Type*} {n : ℕ}

/-- The relative length: one length for each `p`-adic place of `F⁺`. -/
def relLength [Fintype P] (w : RelativeBruhatCells P n) : ℕ := ∑ v, (w v).length

/-- The absolute length: the component at `v` counted once for each of the `d v` embeddings
above `v`. -/
def absLength [Fintype P] (d : P → ℕ) (w : RelativeBruhatCells P n) : ℕ :=
  ∑ τ : (v : P) × Fin (d v), KostantShuffle.inversionCount (w τ.1).val

/-- The cell `∏_v P w N(R v)` in `∏_v GL_{2n}(K v)`: `P` the Siegel parabolic (lower-left block
zero), `w` the permutation matrix `e_j ↦ e_{w j}`, `N(R v)` the upper unitriangular matrices with
entries in the subring `R v`. With `R = ⊤` this is the Bruhat cell `S_w`, with `R v` the valuation
ring the compact cell `S_w°`. -/
def cell {K : P → Type*} [∀ v, Field (K v)] (R : ∀ v, Subring (K v))
    (w : RelativeBruhatCells P n) : Set (∀ v, GL (Fin (n + n)) (K v)) :=
  Set.univ.pi fun v => {g | ∃ p u : GL (Fin (n + n)) (K v),
    (∀ i j : Fin n,
      (p : Matrix (Fin (n + n)) (Fin (n + n)) (K v)) (Fin.natAdd n i) (Fin.castAdd n j) = 0) ∧
    (∀ i j, j < i → (u : Matrix (Fin (n + n)) (Fin (n + n)) (K v)) i j = 0) ∧
    (∀ i, (u : Matrix (Fin (n + n)) (Fin (n + n)) (K v)) i i = 1) ∧
    (∀ i j, (u : Matrix (Fin (n + n)) (Fin (n + n)) (K v)) i j ∈ R v) ∧
    (g : Matrix (Fin (n + n)) (Fin (n + n)) (K v)) =
      (p : Matrix (Fin (n + n)) (Fin (n + n)) (K v)) *
        Matrix.of (fun i j => if i = (w v).val j then 1 else 0) *
        (u : Matrix (Fin (n + n)) (Fin (n + n)) (K v))}

/-- Over nontrivially normed fields the union of the cells of relative length at least `i` is
open. -/
theorem open_union [Fintype P] {K : P → Type*} [∀ v, NontriviallyNormedField (K v)] (i : ℕ) :
    IsOpen (⋃ (w : RelativeBruhatCells P n) (_ : i ≤ relLength w),
      cell (fun v => (⊤ : Subring (K v))) w) := by sorry

/-- `RelativeBruhatCells.identity_cell`: the identity representative has both lengths zero. -/
example [Fintype P] (d : P → ℕ) (w : RelativeBruhatCells P n)
    (hw : ∀ v, (w v).val = Equiv.refl (Fin (n + n))) :
    relLength w = 0 ∧ absLength d w = 0 := by sorry

/-- `RelativeBruhatCells.degree_two_place`: one `p`-adic place of local degree `2` and `n = 1`:
the longest relative length is `1` but its absolute length is `2`. -/
example : ∃ w₀ : RelativeBruhatCells Unit 1,
    (∀ w : RelativeBruhatCells Unit 1, relLength w ≤ relLength w₀) ∧
      relLength w₀ = 1 ∧ absLength (fun _ => 2) w₀ = 2 := by sorry
end RelativeBruhatCells

/-- The ordinary characters `χ_{λ,v,i} ∘ Art_{F_v}` in the coordinates `F_vˣ ≅ O_{F_v}ˣ × ϖ_v^ℤ`,
for zero-based `i` (ACC's index `i + 1`, Corollary 5.5.2, p. 1028): `ε` is the cyclotomic
character, `σ τ` the embeddings on units, `δ i` the `i`-th diamond character and `U j` the
normalized operator `U_{v,j}` (with `U 0 = 1`). Continuity and the passage to the Galois group
use local class field theory and are README statements. -/
noncomputable def OrdinaryGaloisCharacters {Emb Uo T : Type*} [Fintype Emb] [CommGroup Uo]
    [CommRing T] (n : ℕ) (σ : Emb → Uo →* Tˣ) (lam : Emb → Fin n → ℤ)
    (ε : Uo × Multiplicative ℤ →* Tˣ) (δ : Fin n → Uo →* Tˣ) (U : ℕ → Tˣ) (i : Fin n) :
    Uo × Multiplicative ℤ →* Tˣ where
  toFun t := ε t ^ (-(i : ℤ)) * (∏ τ, σ τ t.1 ^ (-lam τ i.rev)) * δ i t.1 *
    (U (i + 1) / U i) ^ Multiplicative.toAdd t.2
  map_one' := by sorry
  map_mul' := by sorry

namespace OrdinaryGaloisCharacters
variable {Emb Uo T : Type*} [Fintype Emb] [CommGroup Uo] [CommRing T]
variable (ε : Uo × Multiplicative ℤ →* Tˣ) (U : ℕ → Tˣ)

/-- `OrdinaryGaloisCharacters.determinant`: the product of uniformizer values telescopes to
the top operator times the cyclotomic power `n(1-n)/2`, with `U 0 = 1`. -/
example (n : ℕ) (σ : Emb → Uo →* Tˣ) (lam : Emb → Fin n → ℤ)
    (δ : Fin n → Uo →* Tˣ) (hU : U 0 = 1) :
    (∏ i : Fin n, OrdinaryGaloisCharacters n σ lam ε δ U i
      (1, Multiplicative.ofAdd 1)) =
      ε (1, Multiplicative.ofAdd 1) ^ ((n : ℤ) * (1 - (n : ℤ)) / 2) * U n := by sorry

/-- `OrdinaryGaloisCharacters.rank_one`: for `n = 1`, `χ₁(Art ϖ_v) = U_{v,1}`. -/
example (σ : Emb → Uo →* Tˣ) (lam : Emb → Fin 1 → ℤ) (δ : Fin 1 → Uo →* Tˣ) (hU : U 0 = 1) :
    OrdinaryGaloisCharacters 1 σ lam ε δ U 0 (1, Multiplicative.ofAdd 1) = U 1 := by sorry

/-- `OrdinaryGaloisCharacters.weight_reversal`: rank two with `λ = (2, 0)`: before the cyclotomic
and diamond factors the unit parts are `1` for `χ₁` and `u⁻²` for `χ₂`; the unreversed weight
`(0, 2)` exchanges them. -/
example (σ : Unit → Uo →* Tˣ) (u : Uo) :
    OrdinaryGaloisCharacters 2 σ (fun _ => ![2, 0]) 1 1 U 0 (u, 1) = 1 ∧
    OrdinaryGaloisCharacters 2 σ (fun _ => ![2, 0]) 1 1 U 1 (u, 1) = σ () u ^ (-2 : ℤ) ∧
    OrdinaryGaloisCharacters 2 σ (fun _ => ![0, 2]) 1 1 U 0 (u, 1) = σ () u ^ (-2 : ℤ) ∧
    OrdinaryGaloisCharacters 2 σ (fun _ => ![0, 2]) 1 1 U 1 (u, 1) = 1 := by sorry

/-- Changing the uniformizer to `3ϖ`, with unit character `u ↦ u` and `U_{v,1} = 2`, gives the
value `6` at the new uniformizer; keeping the old eigenvalue would give `2`. -/
example (U : ℕ → ℚˣ) (h₀ : U 0 = 1)
    (h₁ : (U 1 : ℚ) = 2) (u₀ : ℚˣ) (hu₀ : (u₀ : ℚ) = 3) :
    (OrdinaryGaloisCharacters 1 (fun _ : Unit => (1 : ℚˣ →* ℚˣ)) 0 1
      (fun _ => MonoidHom.id ℚˣ) U 0 (u₀, Multiplicative.ofAdd 1) : ℚ) = 6 := by
  sorry
end OrdinaryGaloisCharacters

/-- The orientation character `χ_w(t) = a(t)⁻¹ / |a(t)|_p` of a Bruhat cell, for the determinant
character `a(t) = N det(Ad(t^w) | Lie U ∩ w N w⁻¹)` supplied as a homomorphism to `ℚ_pˣ`
(ACC §5.3); `|·|_p` is Mathlib's `p`-adic norm. -/
noncomputable def BruhatOrientationCharacter {p : ℕ} [Fact p.Prime] {G : Type*} [Group G]
    (a : G →* ℚ_[p]ˣ) (t : G) : ℚ_[p] :=
  (a t : ℚ_[p])⁻¹ / ((padicNormE (a t : ℚ_[p]) : ℚ) : ℚ_[p])

namespace BruhatOrientationCharacter
variable {p : ℕ} [Fact p.Prime]

/-- `BruhatOrientationCharacter.zero_lie`: the trivial determinant character has orientation
value one. -/
example {G : Type*} [Group G] (t : G) :
    BruhatOrientationCharacter (1 : G →* ℚ_[p]ˣ) t = 1 := by sorry

/-- `BruhatOrientationCharacter.one_unit`: a rational root of norm one has orientation value
equal to its inverse. -/
example (t : ℚ_[p]ˣ) (ht : padicNormE (t : ℚ_[p]) = 1) :
    BruhatOrientationCharacter (MonoidHom.id ℚ_[p]ˣ) t = (t : ℚ_[p])⁻¹ := by sorry

/-- `BruhatOrientationCharacter.one_uniformizer`: for a rational root with adjoint scalar `p`,
`χ_w(p) = 1`, because the norm factor cancels `p⁻¹`. -/
example (t : ℚ_[p]ˣ) (ht : (t : ℚ_[p]) = p) :
    BruhatOrientationCharacter (MonoidHom.id ℚ_[p]ˣ) t = 1 := by sorry

/-- At `p = 2` the unit `-1` has orientation value `-1`; a definition through the residue field
would lose this sign. -/
example (t : ℚ_[2]ˣ) (ht : (t : ℚ_[2]) = -1) :
    BruhatOrientationCharacter (MonoidHom.id ℚ_[2]ˣ) t = -1 := by sorry
end BruhatOrientationCharacter

/-- `twisted_steinberg_ordinarity_criterion.modulus`: the inverse modulus cancels the
unnormalized Steinberg Jacquet scalar, already for `GL₂(ℚ₅)`. -/
example : (5 : ℚ) * (1 / 5) = 1 ∧ (1 : ℚ) / 5 ≠ 1 := by norm_num

/-- `twisted_steinberg_ordinarity_criterion.weight`: the negative weight exponent makes both
operators units; reversing it fails. This also computes the unramified degree-two norm test. -/
example : (5 : ℚ) ^ (-2 : ℤ) * 25 = 1 ∧ (5 : ℚ) ^ (-4 : ℤ) * 625 = 1 ∧
    (5 : ℚ) ^ (2 : ℤ) * 25 ≠ 1 := by norm_num

/-- `iota_ordinary_soluble_base_change.unramified`: normalized slopes scale by the residue
degree, and zero slope is preserved in both directions. -/
example (a b : ℚ) : 2 * a - 2 * b = 0 ↔ a - b = 0 := by constructor <;> intro h <;> linarith

/-- `iota_ordinary_soluble_base_change.ramified`: two extended embeddings each contribute
half the weight slope in a totally ramified quadratic extension. -/
example (b : ℚ) : b / 2 + b / 2 = b := by ring

/-! ## Layer 4: Arithmetic deformation and support inputs -/

namespace WeightIndependentHidaTwist
/-- The row `ν_i = i - 1` (one-based) entering the inverse Hida twist. -/
def nu (n : ℕ) : Fin n → ℤ := fun i => i.val

/-- `WeightIndependentHidaTwist.rank_one_zero`: in rank one and weight zero the exponent row
of the Hida twist is zero. -/
example : nu 1 + (fun _ : Fin 1 => (0 : ℤ)) = 0 := by sorry

/-- `WeightIndependentHidaTwist.rank_two_zero`: for `n = 2` and `μ = 0`, `ν = (0, 1)`, so the
twist is not trivial. -/
example : nu 2 + (fun _ : Fin 2 => (0 : ℤ)) = ![(0 : ℤ), 1] := by sorry
/-- `WeightIndependentHidaTwist.rank_two_weight`: for `μ = (2, 0)`, `ν + w₀μ = (0, 3)`, which
fixes both the reversal and the shift. -/
example : nu 2 + (fun i : Fin 2 => (![(2 : ℤ), 0]) i.rev) = ![(0 : ℤ), 3] := by sorry
end WeightIndependentHidaTwist

/-! ## Layer 5: Arithmetic patching and automorphy lifting -/

namespace TaylorWilesArithmeticLevels
variable {O : Type*} [CommRing O] (ϖ : O) (n p : ℕ)

/-- `∏_{i=1}^{n} (1 + q + ⋯ + q^{i-1})`, the number of complete flags in `𝔽_qⁿ`. -/
def flagCount (q n : ℕ) : ℕ := ∏ i ∈ Finset.range n, ∑ j ∈ Finset.range (i + 1), q ^ j

/-- At a Taylor–Wiles place: the pair `(K₀(Q)_v, K₁(Q)_v)` with `K₀(Q)_v = Iw_v(0, 1)` and
`K₁(Q)_v` the elements of `K₀(Q)_v` whose reduced diagonal entries are killed by the
prime-to-`p` part of `#k(v)ˣ`. -/
def at_auxiliary : Subgroup (GL (Fin n) O) × Subgroup (GL (Fin n) O) :=
  (IwahoriLevelTower.level ϖ n ⟨0, 1, Nat.zero_le 1, le_rfl⟩,
    { carrier := {g | g ∈ IwahoriLevelTower.level ϖ n ⟨0, 1, Nat.zero_le 1, le_rfl⟩ ∧
        ∀ i, Ideal.Quotient.mk (Ideal.span {ϖ}) ((g : Matrix (Fin n) (Fin n) O) i i) ^
          ordCompl[p] (Nat.card (O ⧸ Ideal.span {ϖ})ˣ) = 1}
      one_mem' := by sorry
      mul_mem' := by sorry
      inv_mem' := by sorry })

/-- `K₀(Q)_v / K₁(Q)_v ≅ Δ_v = (k(v)ˣ(p))ⁿ`: a surjection from `K₀(Q)_v` onto `n` copies of the
`p`-primary part of `k(v)ˣ` with kernel `K₁(Q)_v`. -/
theorem diamond_quotient [IsLocalRing O] [Finite (O ⧸ Ideal.span {ϖ})] [Fact p.Prime] :
    ∃ f : (at_auxiliary ϖ n p).1 →*
        (Fin n → CommGroup.primaryComponent (O ⧸ Ideal.span {ϖ})ˣ p),
      Function.Surjective f ∧
      f.ker = (at_auxiliary ϖ n p).2.subgroupOf (at_auxiliary ϖ n p).1 := by sorry

end TaylorWilesArithmeticLevels

/-- The auxiliary levels `K₀(Q) ⊃ K₁(Q)` as families of local factors: `K v` at `v ∉ Q` and the
Taylor–Wiles pair at `v ∈ Q` (ACC §6.5.3). -/
def TaylorWilesArithmeticLevels {ι : Type*} [DecidableEq ι] {O : ι → Type*}
    [∀ v, CommRing (O v)] (ϖ : ∀ v, O v) (n p : ℕ) (K : ∀ v, Subgroup (GL (Fin n) (O v)))
    (Q : Finset ι) :
    (∀ v, Subgroup (GL (Fin n) (O v))) × (∀ v, Subgroup (GL (Fin n) (O v))) :=
  (fun v => if v ∈ Q then (TaylorWilesArithmeticLevels.at_auxiliary (ϖ v) n p).1 else K v,
    fun v => if v ∈ Q then (TaylorWilesArithmeticLevels.at_auxiliary (ϖ v) n p).2 else K v)

namespace TaylorWilesArithmeticLevels
variable {ι : Type*} {O : ι → Type*} [∀ v, CommRing (O v)] (ϖ : ∀ v, O v) (n p : ℕ)

/-- The index `[GL_n(O_v) : Iw_v]` is the number of complete flags over `k(v)`, and for
Taylor–Wiles places (`q_v ≡ 1 mod p`) the product over `Q` is `≡ (n!)^{#Q} mod p`; pullback
followed by trace is multiplication by this scalar on cohomology. -/
theorem trace_scalar [∀ v, IsLocalRing (O v)] (Q : Finset ι)
    (hϖ : ∀ v ∈ Q, IsLocalRing.maximalIdeal (O v) = Ideal.span {ϖ v})
    (hfin : ∀ v ∈ Q, Finite (O v ⧸ Ideal.span {ϖ v}))
    (hq : ∀ v ∈ Q, Nat.card (O v ⧸ Ideal.span {ϖ v}) ≡ 1 [MOD p]) :
    (∀ v ∈ Q, (IwahoriLevelTower.level (ϖ v) n ⟨0, 1, Nat.zero_le 1, le_rfl⟩).index =
      flagCount (Nat.card (O v ⧸ Ideal.span {ϖ v})) n) ∧
    ∏ v ∈ Q, flagCount (Nat.card (O v ⧸ Ideal.span {ϖ v})) n ≡ n.factorial ^ Q.card [MOD p] := by
  sorry

/-- `TaylorWilesArithmeticLevels.empty`: for `Q = ∅` both levels are `K`. -/
example [DecidableEq ι] (K : ∀ v, Subgroup (GL (Fin n) (O v))) :
    TaylorWilesArithmeticLevels ϖ n p K ∅ = (K, K) := by sorry
/-- `TaylorWilesArithmeticLevels.old_bad_place`: at an old place outside the auxiliary set,
both local factors retain the specified level. -/
example [DecidableEq ι] (K : ∀ v, Subgroup (GL (Fin n) (O v)))
    (Q : Finset ι) (S : Set ι) (v : ι) (hvS : v ∈ S) (hvQ : v ∉ Q) :
    (TaylorWilesArithmeticLevels ϖ n p K Q).1 v = K v ∧
      (TaylorWilesArithmeticLevels ϖ n p K Q).2 v = K v := by sorry

/-- `TaylorWilesArithmeticLevels.single_prime`: for one place, `n = 2` and `p > 2` the trace
scalar is `2` modulo `p`, a unit. -/
example (q : ℕ) (hp : p.Prime) (hp2 : 2 < p) (hq : q ≡ 1 [MOD p]) :
    flagCount q 2 ≡ 2 [MOD p] ∧ Nat.Coprime (flagCount q 2) p := by sorry
end TaylorWilesArithmeticLevels

/-- `taylor_wiles_residual_iwahori_hecke.integral_normalization`: with `q = 11`, multiplying
the spherical eigenvalue `2a` by `a⁻¹` gives `2`, while multiplying by `a` gives `22`. -/
example {K : Type*} [Field K] [CharZero K] (a : K) (ha : a ^ 2 = 11) :
    a⁻¹ * (2 * a) = 2 ∧ a * (2 * a) = 22 ∧ (2 : K) ≠ 22 := by sorry

/-- With `q_v = 3` and ordered roots `2, 5`, the Fontaine–Laffaille selected second eigenvalue is
`10/3`, while the ordinary one is `10`. -/
example : (3 : ℚ) ^ (-1 : ℤ) * 2 * 5 = 10 / 3 ∧ (2 : ℚ) * 5 = 10 := by sorry

/-
Stated in README.md and absent here, because their carriers are not available at the pins:
the integral cohomology models and Siegel boundary comparisons of Layer 0, its torsion attachments
(`residual_unitary_galois_inputs`, `finite_coefficient_gln_galois_inputs`) and geometric vanishing
(`integral_caraiani_scholze_vanishing`), the unitary perfectoid towers, compactified period maps
and finite-level Hodge–Tate sections (`unitary_torsion_tower_geometry`), the integral dual Weyl
modules with their Levi splitting and bottom-alcove duality (`IntegralDualWeylModule`), the Hecke
algebras of positive monoids, the image of a residually multiplicity-free pair, the forms of
products of `PGL₂`, the density-one comparison of semisimple Galois representations, the
nonabelian cocycle quotient (`NonabelianGaloisH1`), the irreducibility of pure unramified principal
series, smooth modules over open monoids
(`SmoothMonoidModules`), the residual Iwahori Hecke algebra at Taylor–Wiles places, the Kostant and
Fontaine–Laffaille comparisons of Layer 1 (`unitary_generic_vanishing`,
`fontaine_laffaille_local_global`), the soluble
transport and rank-two compatible-system theorems of Layer 2
(`auxiliary_cm_extension_prescriptions`, `soluble_base_change_and_descent`,
`local_base_change_rec_compatibility`, `WeaklyAutomorphicPrimeTo`), the ordinary parts, completed
cohomology and determinant comparisons
of Layer 3 (`LocalOrdinaryParts`, `ArithmeticOrdinarySummand`, `CompletedArithmeticCohomology`,
`CompletedOrdinaryCohomology`, `UnitaryOrdinaryTower`, `UnitaryCompletedBoundary`,
`BruhatCellInduction`, `BruhatUnipotentInvariants`, `DeterminantTorus`, `IotaOrdinary`,
`OrdinarilyAutomorphic`, `ordinary_local_global`), the Hida complexes and deformation actions of
Layer 4 (`OrdinaryHidaComplex` and the derived twist `WeightIndependentHidaTwist`, whose integer
row `WeightIndependentHidaTwist.nu` is stated above), and the Taylor–Wiles data,
patching verifications and lifting theorems of Layer 5 (`TaylorWilesSelectedIdeals`,
`OrdinaryTaylorWilesLevels`, `fontaine_laffaille_automorphy_lifting`,
`ordinary_automorphy_lifting`).

Further API statements and Checks specified in the README, without additional Lean declarations:
CompletedArithmeticCohomology.level_colimit, UnitaryCompletedBoundary.level_colimit,
UnitaryCompletedBoundary.nonempty_rank_one,
BruhatOrientationCharacter.uniformizer_part, BruhatOrientationCharacter.unit_part,
CTGWeight.iff_witness, CTGWeight.no_cuspidal_levi_weight, CTGWeight.not_parallel,
KostantShuffle.mem_iff, LowestWeightCharacter.uniformizer_eval,
LowestWeightCharacter.unit_eval, OrdinaryGaloisCharacters.change_uniformizer, OrdinaryGaloisCharacters.coordinate_uniformizer_change,
OrdinaryGaloisCharacters.on_uniformizer, OrdinaryGaloisCharacters.on_units, OrdinaryGaloisCharacters.unique_from_units_and_uniformizer,
PositiveTorusMonoid.mem_iff, PositiveTorusMonoid.unit_subgroup, RankTwoOdd.automorphic_weight_zero,
RankTwoOdd.det_eq, RankTwoOdd.no_real_places, UnitaryLeviWeight.first_block, UnitaryLeviWeight.second_block,
WeightIndependentHidaTwist.weight_compare.
-/

end TauCetiRoadmap.PotentialAutomorphyInfrastructure
