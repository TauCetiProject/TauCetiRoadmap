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
* Integral duality is derived; the rational degree reflection `i ↦ d - i` belongs to the
  arithmetic duality targets, and `ν` records the Hida weight shift.
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

/-- `EquivariantRetract.incompatible_actions`: the identity maps of `ℤ` are a retract but not an
equivariant one when the same index acts by `1` on the source and by `2` on the target. -/
example : ¬ ∃ h : EquivariantRetract (C := Type) ℤ ℤ
    (fun _ : Unit => ↾(fun z : ℤ => z)) (fun _ : Unit => ↾(fun z : ℤ => 2 * z)),
      h.i = 𝟙 ℤ ∧ h.toRetract.r = 𝟙 ℤ := by
  rintro ⟨h, hi, _⟩
  have hc := h.inclusion_comm_eq ()
  rw [hi] at hc
  have h₁ := congrArg (fun f : ℤ ⟶ ℤ => f 1) hc
  norm_num at h₁
end EquivariantRetract

/-- The coefficient exponent after the supplied ambient twist `ε^(1-a)` equals the
ACC monic unitary exponent, for every rank and coefficient index (README §0.7a;
IgusaVarietiesAndTorsionConcentration IG.6.6b). This records the twist already present
in that export. -/
theorem unitary_ambient_twist_exponent (j a : ℚ) :
    j * (1 - 2 * a + j) / 2 + j * (a - 1) = j * (j - 1) / 2 := by ring

/-- The supplied GL rank-one polynomial `1-6X` at `q=3, U₁=2` becomes the standard
reciprocal `1-2X` after the cyclotomic substitution (README §0.7b;
IgusaVarietiesAndTorsionConcentration IG.6.6a). -/
theorem gln_torsion_polynomial_rank_one (x : ℚ) : 1 - 6 * (x / 3) = 1 - 2 * x := by ring

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

/-- `UnitaryLeviWeight.non_dominant`: both rank-one Levi rows are dominant, but their unitary
row `(-1, 1)` is not dominant. The Siegel coefficient splitting requires unitary dominance. -/
example : UnitaryLeviWeight ![(1 : ℤ)] ![(1 : ℤ)] = ![(-1 : ℤ), 1] ∧
    ¬ Antitone (UnitaryLeviWeight ![(1 : ℤ)] ![(1 : ℤ)]) := by decide

/-- The allowed rank-four unitary row at `p = 7` has shifted weights `(5, 2, 1, 0)`.
They fit the Fontaine–Laffaille interval `[0, p - 2]` and exceed `[0, p - n - 1]`
for Levi rank `n = 2` (ACC §4.1 and Proposition 4.4.6). -/
theorem fontaine_laffaille_endpoint :
    (UnitaryLeviWeight ![(0 : ℤ), 0] ![(0 : ℤ), -2] +
      fun i : Fin 4 => (3 : ℤ) - (i.val : ℤ)) = ![(5 : ℤ), 2, 1, 0] ∧
    (∀ i : Fin 4, 0 ≤ (![(5 : ℤ), 2, 1, 0]) i ∧
      (![(5 : ℤ), 2, 1, 0]) i ≤ 5) ∧
    ¬ (∀ i : Fin 4, (![(5 : ℤ), 2, 1, 0]) i ≤ 4) := by sorry
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
end KostantShuffle

/-- The CTG condition on a computed Levi-weight table `μ w τ i` (ACC Definition 4.3.5, p. 974):
for every Kostant representative `w` and integer `a`, some embedding `τ` has a conjugate sum
`μ w τ i + μ w (c τ) (n-1-i)` that is not the constant vector `a`. -/
def CTGWeight {W Emb : Type*} {n : ℕ} (c : Emb → Emb)
    (μ : W → Emb → Fin n → ℤ) : Prop :=
  ∀ w a, ∃ τ, (fun i => μ w τ i + μ w (c τ) i.rev) ≠ fun _ => a

namespace CTGWeight
variable {W Emb : Type*} {n : ℕ} {c : Emb → Emb}

/-- `CTGWeight.zero`: for nonempty `W` the zero table is not CTG (in every rank, including
rank zero). -/
example [Nonempty W] : ¬ CTGWeight (W := W) (n := n) c (fun _ _ _ => 0) := by
  intro h
  obtain ⟨w⟩ := ‹Nonempty W›
  obtain ⟨τ, hτ⟩ := h w 0
  exact hτ rfl

/-- `CTGWeight.rank_one_pair`: with two conjugate pairs of embeddings whose conjugate sums are
`0` and `1`, the rank-one table is CTG. -/
example : CTGWeight (n := 1)
    (fun τ : Bool × Bool => (τ.1, !τ.2))
    (fun (_ : Unit) (τ : Bool × Bool) (_ : Fin 1) =>
      if τ.1 && !τ.2 then 1 else 0) := by
  intro w a
  by_cases ha : a = 0
  · refine ⟨(true, false), ?_⟩
    intro heq
    have h₀ : (1 : ℤ) = a := congrFun heq 0
    omega
  · refine ⟨(false, false), ?_⟩
    intro heq
    have h₀ : (0 : ℤ) = a := congrFun heq 0
    exact ha h₀.symm
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

/-! ## Layer 2: Soluble transport and rank-two compatible systems -/

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

/-- Oddness of a rank-two system, given its complex conjugations at the real places as matrices
over characteristic-zero coefficients: each has determinant `-1` (BCGP §9.1, p. 251). -/
def RankTwoOdd {I R : Type*} [CommRing R] [CharZero R]
    (A : I → Matrix (Fin 2) (Fin 2) R) : Prop :=
  ∀ i, Matrix.det (A i) = -1

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

/-- The unit prescription of `LowestWeightCharacter` in README §3.5 gives the algebraic
weight scalar on the compact torus. -/
theorem unit_eval (u : Fin n → U) :
    LowestWeightCharacter n σ lam (u, 1) = ∏ τ, ∏ i, σ τ (u i) ^ lam τ i := by sorry

/-- The uniformizer prescription of `LowestWeightCharacter` in README §3.5 makes every
chosen diagonal uniformizer power act trivially, at arbitrary weight. -/
theorem uniformizer_eval (a : Fin n → ℤ) :
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

/-- The longest relative Bruhat cell of README §3.23 has one block exchange at every place;
its absolute length counts each local degree, while its relative length counts places. -/
theorem longest [Fintype P] (d : P → ℕ) :
    ∃ w : RelativeBruhatCells P n,
      (∀ v, (w v).val = (finAddFlip : Fin (n + n) ≃ Fin (n + n))) ∧
      relLength w = n ^ 2 * Fintype.card P ∧
      absLength d w = n ^ 2 * ∑ v, d v := by sorry
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

/-- The unit prescription of README §3.6 retains the reversed weight row, the cyclotomic
power and the diamond character of the ordinary diagonal character. -/
theorem on_units (n : ℕ) (σ : Emb → Uo →* Tˣ) (lam : Emb → Fin n → ℤ)
    (δ : Fin n → Uo →* Tˣ) (i : Fin n) (u : Uo) :
    OrdinaryGaloisCharacters n σ lam ε δ U i (u, 1) =
      ε (u, 1) ^ (-(i : ℤ)) * (∏ τ, σ τ u ^ (-lam τ i.rev)) * δ i u := by sorry

/-- The uniformizer prescription of README §3.6 is the cyclotomic power times the ratio of
successive normalized ordinary operators. -/
theorem on_uniformizer (n : ℕ) (σ : Emb → Uo →* Tˣ) (lam : Emb → Fin n → ℤ)
    (δ : Fin n → Uo →* Tˣ) (i : Fin n) :
    OrdinaryGaloisCharacters n σ lam ε δ U i (1, Multiplicative.ofAdd 1) =
      ε (1, Multiplicative.ofAdd 1) ^ (-(i : ℤ)) * (U (i + 1) / U i) := by sorry

/-- The coordinate uniqueness assertion of README §3.6 determines a character by its values
on units and on the chosen uniformizer. -/
theorem unique_from_units_and_uniformizer
    (χ ψ : Uo × Multiplicative ℤ →* Tˣ)
    (hu : ∀ u, χ (u, 1) = ψ (u, 1))
    (hϖ : χ (1, Multiplicative.ofAdd 1) = ψ (1, Multiplicative.ofAdd 1)) :
    χ = ψ := by sorry

/-- The coordinate change of README §3.6 transports a character from `ϖ` to `u₀ϖ`, including
negative valuation powers and the full unit factor. -/
theorem coordinate_uniformizer_change (χ : Uo × Multiplicative ℤ →* Tˣ)
    (u₀ u : Uo) (k : ℤ) :
    χ (u * u₀ ^ k, Multiplicative.ofAdd k) =
      χ (u, 1) * (χ (u₀, 1) * χ (1, Multiplicative.ofAdd 1)) ^ k := by sorry

/-- `OrdinaryGaloisCharacters.determinant`: the product of uniformizer values telescopes to
the top operator times the cyclotomic power `n(1-n)/2`, with `U 0 = 1`. -/
theorem determinant (n : ℕ) (σ : Emb → Uo →* Tˣ) (lam : Emb → Fin n → ℤ)
    (δ : Fin n → Uo →* Tˣ) (hU : U 0 = 1) :
    (∏ i : Fin n, OrdinaryGaloisCharacters n σ lam ε δ U i
      (1, Multiplicative.ofAdd 1)) =
      ε (1, Multiplicative.ofAdd 1) ^ ((n : ℤ) * (1 - (n : ℤ)) / 2) * U n := by sorry
end OrdinaryGaloisCharacters

/-- The orientation character `χ_w(t) = a(t)⁻¹ / |a(t)|_p` of a Bruhat cell, for the determinant
character `a(t) = N det(Ad(t^w) | Lie U ∩ w N w⁻¹)` supplied as a homomorphism to `ℚ_pˣ`
(ACC §5.3); `|·|_p` is Mathlib's `p`-adic norm. -/
noncomputable def BruhatOrientationCharacter {p : ℕ} [Fact p.Prime] {G : Type*} [Group G]
    (a : G →* ℚ_[p]ˣ) (t : G) : ℚ_[p] :=
  (a t : ℚ_[p])⁻¹ / ((padicNormE (a t : ℚ_[p]) : ℚ) : ℚ_[p])

/-! ## Layer 4: Arithmetic deformation and support inputs -/

namespace WeightIndependentHidaTwist
/-- The row `ν_i = i - 1` (one-based) entering the inverse Hida twist. -/
def nu (n : ℕ) : Fin n → ℤ := fun i => i.val

/-- A nontrivial unit and its square are different. For `Λ₁ = O[C_p]` and a primitive
`ζ_p`, this separates the scalar `ζ_p` of twist-before-component specialization from
`ζ_p²` of component specialization followed by a diagonal twist (ACC §6.6.1). -/
theorem torsion_component {R : Type*} [CommRing R] (ζ : Rˣ) (hζ : ζ ≠ 1) :
    (ζ : R) ^ 2 ≠ (ζ : R) := by sorry
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
end TaylorWilesArithmeticLevels

/-
Stated in README.md and absent here, because their carriers are not available at the pins:
the integral cohomology models and Siegel boundary comparisons of Layer 0; the arithmetic
adapters `unitary_similitude_tower_comparison` and `admissible_torsion_hecke_comparison`;
the transported IgusaVarietiesAndTorsionConcentration IG.6.6a–b residual instances
(`residual_unitary_galois_inputs`, `finite_coefficient_gln_galois_inputs`), its IG.7.5–7.6
vanishing specialization (`integral_caraiani_scholze_vanishing`), and the supplied
HodgeTateAndCanonicalSubgroups / PerfectoidShimuraVarieties tower specialization
(`unitary_torsion_tower_geometry`); the integral dual Weyl
modules with their Levi splitting and bottom-alcove duality (`IntegralDualWeylModule`), the Hecke
algebras of positive monoids, the image of a residually multiplicity-free pair, the forms of
products of `PGL₂`, the
nonabelian cocycle quotient (`NonabelianGaloisH1`), the irreducibility of pure unramified principal
series, smooth modules over open monoids
(`SmoothMonoidModules`), the residual Iwahori Hecke algebra at Taylor–Wiles places, the Kostant and
Fontaine–Laffaille comparisons of Layer 1 (`unitary_generic_vanishing`, the specialization of
IgusaVarietiesAndTorsionConcentration IG.7.8 together with IG.7.5–7.6,
`fontaine_laffaille_local_global`, `fontaine_laffaille_normalization`,
`degree_reflection_duality` with compact supports and its supported non-Eisenstein ordinary
corollary), the soluble
transport and rank-two compatible-system theorems of Layer 2
(`auxiliary_cm_extension_prescriptions`, `soluble_base_change_and_descent`,
`local_base_change_rec_compatibility`, `WeaklyAutomorphicPrimeTo`), the ordinary parts, completed
cohomology and determinant comparisons
of Layer 3 (`LocalOrdinaryParts`, `ArithmeticOrdinarySummand`, `CompletedArithmeticCohomology`,
`CompletedOrdinaryCohomology`, `UnitaryOrdinaryTower`, `UnitaryCompletedBoundary`,
`BruhatCellInduction`, `BruhatUnipotentInvariants`, `DeterminantTorus`,
`determinant_component_product`, `determinant_neat_level_shrinking`, `IotaOrdinary`,
`OrdinarilyAutomorphic`, `unitary_rational_ordinary_hecke_semisimple`,
`unitary_ordinary_refinement`, `ordinary_local_global`), the Hida complexes and deformation actions of
Layer 4 (`OrdinaryHidaComplex` and the derived twist `WeightIndependentHidaTwist`, whose integer
row `WeightIndependentHidaTwist.nu` is stated above), and the Taylor–Wiles data,
patching verifications and lifting theorems of Layer 5 (`TaylorWilesSelectedIdeals`,
`OrdinaryTaylorWilesLevels`, `fontaine_laffaille_automorphy_lifting`,
`ordinary_automorphy_lifting`).

The density-one comparison of semisimple Galois representations is supplied by
ArithmeticGaloisRepresentations §5.3, `GaloisRep.iso_of_frobenius_charpoly_eq`.
README §2.16 names its specialization `frobenius_polynomials_determine_semisimple`,
with arithmetic/geometric Frobenius inversion and characteristic polynomials in every
characteristic. The arithmetic carriers of that supplied export are absent here.

Further API statements and Checks specified in the README, without additional Lean declarations:
CompletedArithmeticCohomology.level_colimit, CompletedArithmeticCohomology.residual_level_colimit,
UnitaryCompletedBoundary.level_colimit,
UnitaryCompletedBoundary.nonempty_rank_one,
BruhatOrientationCharacter.uniformizer_part, BruhatOrientationCharacter.unit_part,
CTGWeight.iff_witness, CTGWeight.no_cuspidal_levi_weight, CTGWeight.not_parallel,
KostantShuffle.mem_iff,
OrdinaryGaloisCharacters.change_uniformizer,
PositiveTorusMonoid.mem_iff, PositiveTorusMonoid.unit_subgroup, RankTwoOdd.automorphic_weight_zero,
RankTwoOdd.det_eq, RankTwoOdd.no_real_places, UnitaryLeviWeight.first_block, UnitaryLeviWeight.second_block,
WeightIndependentHidaTwist.weight_compare, WeightIndependentHidaTwist.component_specialization.
-/
end TauCetiRoadmap.PotentialAutomorphyInfrastructure
