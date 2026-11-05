/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.Algebra.Coalgebra.Comodule.MatrixCoefficient.Matrix
public import TauCeti.Algebra.Coalgebra.Subcomodule.Basic

/-!
# Quantum groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions (real bodies on native carriers) that those statements need.

Stated here: the von Neumann bicommutant theorem for the weak operator closure of a unital star
subalgebra (§0.1); star compatibility of counit and antipode and the weighted Schur orthogonality
relations on a Hopf *-algebra with a positive invariant functional (§3.1); the algebraic
compact-type equivalence (§4.1); the free orthogonal coefficient relation with its cup invariance
and the `SUq(2)` relations as unitarity of the fundamental matrix (Layer 5); and, for the generic
quantized enveloping algebra `U_q(sl₂)` presented as a `RingQuot` of a free algebra (Layer 8): the
unique coassociative coproduct, the PBW basis, the domain property, the centre `ℂ[Ω]`, the signed
ladder classification of finite-dimensional simple modules together with the existence of every
ladder, finite complete reducibility, and the characterisation and semisimplicity of locally
finite modules.

Not statable at the pins:

* Layer 0 apart from §0.1: Hilbert-module adjointable and compact operators, interior tensor
  products, C*-categories with standard conjugates, the positive Temperley–Lieb completions and
  the full left Hilbert algebra with its canonical weight are constructions of the roadmap; no
  carrier for any of them exists at the pins.
* Layer 1 existence and uniqueness of the Haar state of a compact quantum group, and every
  Layer 1, 2, 4 and 7 statement about a C*-bialgebra `Δ : A → A ⊗_min A`: neither Mathlib nor Tau
  Ceti has the minimal (spatial) C*-tensor product of two C*-algebras.
* Layer 2 decomposition of unitary corepresentations on arbitrary Hilbert spaces and the
  analytic Peter–Weyl theorem: Mathlib's `CStarModule` exists, but the free Hilbert module
  `H ⊗ A` and its adjointable operators, on which the coaction is defined, do not.
* §§3.2–3.4, the modular identity `h(ab) = h(b θ(a))`, the Woronowicz characters `f_z`, the Kac
  equivalences and the Tomita comparison: the characters need the complex powers `F^z` of the
  positive matrix of every irreducible block of the Peter–Weyl decomposition of the core, which
  is a construction of §3.1, and the Tomita comparison needs the full left Hilbert algebra.
* Layer 4 universal and reduced completions and the coamenability criteria: they need the
  C*-envelope of a Hopf *-algebra and the minimal tensor product above.
* Layer 6 Tannaka–Krein reconstruction: there is no unitary rigid C*-tensor category, dagger
  fibre functor or finite Hilbert-space dagger category at the pins.
* Layer 7 fusion rules, dimensions and Haar laws of `SUq(2)` and `O_F^+`: they are statements
  about the universal C*-algebras of Layer 5, which need the minimal tensor product for their
  coproduct.
* §8.5 Clebsch–Gordan decompositions, 6j symbols and the pivotal structure, §8.6 the comparison
  with `SUq(2)` and §8.7 the classical specialisation: they need the monoidal, rigid and pivotal
  structure on finite-dimensional modules over a Hopf algebra, the Laurent-polynomial ladder
  family and its Lie-module adapter, which are constructions of the roadmap and not carriers at
  the pins.
-/

open scoped TensorProduct ComplexOrder

namespace TauCetiRoadmap.QuantumGroups

@[expose] public section

universe u v w

/-! ## Layer 0: Analytic and categorical foundations -/

/-- The bicommutant theorem (§0.1): the weak operator closure of a unital star subalgebra `B` of
the bounded operators on a complex Hilbert space `H`, of any dimension, is its double commutant
`B″` (Hiai, *Lectures on Selected Topics in von Neumann Algebras*, §1.2). -/
theorem weakClosure_eq_bicommutant (H : Type u) [NormedAddCommGroup H]
    [InnerProductSpace ℂ H] [CompleteSpace H]
    (B : StarSubalgebra ℂ (H →L[ℂ] H)) :
    closure (ContinuousLinearMapWOT.ofCLM '' (B : Set (H →L[ℂ] H))) =
      ContinuousLinearMapWOT.ofCLM ''
        Set.centralizer (Set.centralizer (B : Set (H →L[ℂ] H))) := by
  sorry

/-! ## Layer 3: The Hopf *-core, orthogonality and modular data -/

section HopfCore

variable {A : Type u} [Ring A] [HopfAlgebra ℂ A] [StarRing A] [StarModule ℂ A]

/-- A Hopf *-algebra: a complex Hopf algebra with a compatible star structure whose
comultiplication preserves the star. Counit and antipode compatibility are consequences. -/
class StarCompatibleHopf : Prop where
  comul_star : ∀ a : A, Coalgebra.comul (R := ℂ) (star a) =
    star (Coalgebra.comul (R := ℂ) a)

/-- In a Hopf *-algebra the counit is star-preserving: `ε(a*) = conj ε(a)`. -/
theorem counit_star [StarCompatibleHopf (A := A)] (a : A) :
    Coalgebra.counit (R := ℂ) (star a) = star (Coalgebra.counit (R := ℂ) a) := by
  sorry

/-- In a Hopf *-algebra `S(S(a*)*) = a`; hence the antipode is bijective with
`S⁻¹(a) = S(a*)*` (uniqueness of convolution inverses). -/
theorem antipode_star_antipode_star [StarCompatibleHopf (A := A)] (a : A) :
    HopfAlgebra.antipode ℂ (star (HopfAlgebra.antipode ℂ (star a))) = a := by
  sorry

variable {H : Type v} [NormedAddCommGroup H] [InnerProductSpace ℂ H]
  [TauCeti.Comodule ℂ A H]
variable {ι : Type w} [Fintype ι] [DecidableEq ι]

/-- An algebraic Haar functional on a Hopf *-algebra: a normalised positive linear functional
`h` with `(id ⊗ h)Δ(a) = h(a)1` and `(h ⊗ id)Δ(a) = h(a)1`. -/
structure AlgebraicHaar where
  /-- The functional `h`. -/
  functional : A →ₗ[ℂ] ℂ
  normalized : functional 1 = 1
  left_invariant : ∀ a : A,
    (TensorProduct.rid ℂ A) ((TensorProduct.map (LinearMap.id) functional)
      (Coalgebra.comul (R := ℂ) a)) = functional a • (1 : A)
  right_invariant : ∀ a : A,
    (TensorProduct.lid ℂ A) ((TensorProduct.map functional (LinearMap.id))
      (Coalgebra.comul (R := ℂ) a)) = functional a • (1 : A)
  positive : ∀ a : A, 0 ≤ functional (star a * a)

/-- Schur orthogonality (§3.1; Timmermann, *An Invitation to Quantum Groups and Duality*,
Theorem 3.2.12 and Proposition 3.2.17): for an irreducible finite comodule with unitary
coefficient matrix `u` there is a positive invertible `F̃` with `Tr F̃ = Tr F̃⁻¹`,
`h(u_ij* u_kl) = δ_jl (F̃⁻¹)_ik / Tr F̃⁻¹` and `h(u_ij u_kl*) = δ_ik F̃_jl / Tr F̃`.
The matrix is the README's pre-antipode `F̃`, not its transpose `F`. -/
theorem schur_orthogonality [StarCompatibleHopf (A := A)]
    [IsSimpleOrder (TauCeti.Subcomodule ℂ A H)]
    (h : AlgebraicHaar (A := A)) (b : OrthonormalBasis ι ℂ H)
    (hu : TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis ∈ unitary (Matrix ι ι A)) :
    ∃ Ft : Matrix ι ι ℂ, Ft.PosDef ∧ Matrix.trace Ft = Matrix.trace Ft⁻¹ ∧
      (∀ i j k l,
        h.functional (star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j) *
          TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis k l) =
          (if j = l then Ft⁻¹ i k / Matrix.trace Ft⁻¹ else 0)) ∧
      (∀ i j k l,
        h.functional (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j *
          star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis k l)) =
          (if i = k then Ft j l / Matrix.trace Ft else 0)) := by
  sorry

end HopfCore

/-! ## Layer 4: Algebraic compact type -/

/-- The coefficients of all finite unitary native comodules of `A` in coordinate bases: the
entries of the coefficient matrices, in the standard basis of `ℂⁿ`, of those comodule structures
on `ℂⁿ` whose coefficient matrix is unitary. -/
def unitaryCoefficientSet (A : Type u) [Ring A] [HopfAlgebra ℂ A] [StarRing A] : Set A :=
  {a | ∃ (n : ℕ) (ρ : TauCeti.Comodule ℂ A (Fin n → ℂ)),
    letI := ρ
    let U := TauCeti.Comodule.coefficientMatrix (C := A) (Pi.basisFun ℂ (Fin n))
    U ∈ unitary (Matrix (Fin n) (Fin n) A) ∧ ∃ i j, a = U i j}

/-- Algebraic compact type (§4.1; Timmermann, Theorem 3.2.12): a nonzero Hopf *-algebra has a
normalized positive two-sided invariant integral exactly when it is spanned by the coefficients
of its finite unitary comodules. -/
theorem compactType_iff (A : Type u) [Ring A] [Nontrivial A] [HopfAlgebra ℂ A]
    [StarRing A] [StarModule ℂ A] [StarCompatibleHopf (A := A)] :
    Nonempty (AlgebraicHaar (A := A)) ↔
      Submodule.span ℂ (unitaryCoefficientSet A) = ⊤ := by
  sorry

/-! ## Layer 5: Compact matrix presentations -/

section StarPresentations

variable {A : Type u} [Ring A] [Algebra ℂ A] [StarRing A] [StarModule ℂ A]
variable {ι : Type w} [Fintype ι] [DecidableEq ι]

omit [StarModule ℂ A] in
/-- The defining relations of the free orthogonal quantum group `O_F^+` on a matrix `U`:
`U` is unitary and `U = F bar(U) F⁻¹`, where `bar(U) = (U_ij*)` is the entrywise star. -/
def freeOrthogonalRelation (F : Matrix ι ι ℂ) [Invertible F] (U : Matrix ι ι A) : Prop :=
  U ∈ unitary (Matrix ι ι A) ∧
    U = F.map (algebraMap ℂ A) * U.map star * (⅟ F).map (algebraMap ℂ A)

/-- Under the `O_F^+` relations the cup vector `Σ_{i,j} F_ji e_i ⊗ e_j` is invariant for the
tensor square `U_13 U_23`: `Σ_{j,l} U_ij F_lj U_kl = F_ki` (§5.2). -/
theorem freeOrthogonalCup_invariant (F : Matrix ι ι ℂ) [Invertible F]
    (U : Matrix ι ι A) (hU : freeOrthogonalRelation F U) (i k : ι) :
    ∑ j, ∑ l, U i j * algebraMap ℂ A (F l j) * U k l =
      algebraMap ℂ A (F k i) := by
  sorry

omit [StarModule ℂ A] in
/-- The fundamental matrix `[[a, −q c*], [c, a*]]` of `SUq(2)`. -/
def suqMatrix (q : ℝ) (a c : A) : Matrix (Fin 2) (Fin 2) A :=
  !![a, -(q : ℂ) • star c; c, star a]

omit [StarModule ℂ A] in
/-- Woronowicz's `SUq(2)` relations on generators `a, c`, for every real `q`. -/
structure SUqRelations (q : ℝ) (a c : A) : Prop where
  initial : star a * a + star c * c = 1
  final : a * star a + (q ^ 2 : ℂ) • (star c * c) = 1
  c_normal : star c * c = c * star c
  ac : a * c = (q : ℂ) • (c * a)
  ac_star : a * star c = (q : ℂ) • (star c * a)

/-- The fundamental matrix `suqMatrix q a c` is unitary exactly when `a, c` satisfy the
`SUq(2)` relations (§5.1). -/
theorem suqMatrix_unitary_iff (q : ℝ) (a c : A) :
    suqMatrix q a c ∈ unitary (Matrix (Fin 2) (Fin 2) A) ↔ SUqRelations q a c := by
  sorry

end StarPresentations

/-! ## Layer 8: Generic U_q(sl₂), signed modules and integrability -/

noncomputable section GenericRankOne

/-- The generators `E, F, K, K⁻¹` of `U_q(sl₂)`. -/
inductive SL2Generator
  | E | F | K | Kinv
  deriving DecidableEq

/-- The defining relations of `U_q(sl₂)` in the free complex algebra:
`KK⁻¹ = K⁻¹K = 1`, `KE = q²EK`, `KF = q⁻²FK`, `EF − FE = (K − K⁻¹)/(q − q⁻¹)`. -/
inductive QuantumSL2Relation (q : ℂ) :
    FreeAlgebra ℂ SL2Generator → FreeAlgebra ℂ SL2Generator → Prop
  | kkInv : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .K * FreeAlgebra.ι ℂ .Kinv) 1
  | kInvK : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .Kinv * FreeAlgebra.ι ℂ .K) 1
  | ke : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .K * FreeAlgebra.ι ℂ .E)
      (q ^ 2 • (FreeAlgebra.ι ℂ .E * FreeAlgebra.ι ℂ .K))
  | kf : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .K * FreeAlgebra.ι ℂ .F)
      ((q⁻¹) ^ 2 • (FreeAlgebra.ι ℂ .F * FreeAlgebra.ι ℂ .K))
  | ef : QuantumSL2Relation q
      (FreeAlgebra.ι ℂ .E * FreeAlgebra.ι ℂ .F)
      (FreeAlgebra.ι ℂ .F * FreeAlgebra.ι ℂ .E +
        (q - q⁻¹)⁻¹ • (FreeAlgebra.ι ℂ .K - FreeAlgebra.ι ℂ .Kinv))

/-- `U_q(sl₂)` as the quotient of the free complex algebra by `QuantumSL2Relation q`. It is
defined for every `q` (at `q = 0` the relations force `E = F = 0`, and at `q = ±1` the totalised
inverse makes the quotient commutative); the headline theorems state their hypotheses on `q`. -/
abbrev QuantumSL2 (q : ℂ) := RingQuot (QuantumSL2Relation q)

/-- The image of a generator in `QuantumSL2 q`. -/
def quantumSL2Generator (q : ℂ) (g : SL2Generator) : QuantumSL2 q :=
  RingQuot.mkAlgHom ℂ (QuantumSL2Relation q) (FreeAlgebra.ι ℂ g)

/-- `K` as a unit of `QuantumSL2 q`, with inverse the generator `K⁻¹`. -/
def quantumSL2KUnit (q : ℂ) : (QuantumSL2 q)ˣ where
  val := quantumSL2Generator q .K
  inv := quantumSL2Generator q .Kinv
  val_inv := by
    simpa [quantumSL2Generator] using
      (RingQuot.mkAlgHom_rel ℂ (QuantumSL2Relation.kkInv (q := q)))
  inv_val := by
    simpa [quantumSL2Generator] using
      (RingQuot.mkAlgHom_rel ℂ (QuantumSL2Relation.kInvK (q := q)))

/-- The quantum Casimir element `Ω = FE + (qK + q⁻¹K⁻¹)/(q − q⁻¹)²`. -/
def quantumSL2Casimir (q : ℂ) : QuantumSL2 q :=
  quantumSL2Generator q .F * quantumSL2Generator q .E +
    ((q - q⁻¹) ^ 2)⁻¹ •
      (q • quantumSL2Generator q .K + q⁻¹ • quantumSL2Generator q .Kinv)

/-- The symmetric quantum integer `[r]_q = (q^r − q^(−r))/(q − q⁻¹)` for `r : ℤ`; under the
generic hypothesis the denominator is nonzero. -/
def quantumInteger (q : ℂ) (r : ℤ) : ℂ := (q ^ r - q ^ (-r)) / (q - q⁻¹)

/-- The coproduct of `U_q(sl₂)` (§8.1): for `q ≠ 0` there is exactly one algebra map
`Δ : U_q → U_q ⊗ U_q` with `ΔK = K ⊗ K`, `ΔE = E ⊗ 1 + K ⊗ E` and `ΔF = F ⊗ K⁻¹ + 1 ⊗ F`,
and it is coassociative. -/
theorem quantumSL2Comul_exists (q : ℂ) (hq : q ≠ 0) :
    ∃! Δ : QuantumSL2 q →ₐ[ℂ] QuantumSL2 q ⊗[ℂ] QuantumSL2 q,
      Δ (quantumSL2Generator q .K) =
          quantumSL2Generator q .K ⊗ₜ[ℂ] quantumSL2Generator q .K ∧
      Δ (quantumSL2Generator q .E) =
          quantumSL2Generator q .E ⊗ₜ[ℂ] 1 +
            quantumSL2Generator q .K ⊗ₜ[ℂ] quantumSL2Generator q .E ∧
      Δ (quantumSL2Generator q .F) =
          quantumSL2Generator q .F ⊗ₜ[ℂ] quantumSL2Generator q .Kinv +
            1 ⊗ₜ[ℂ] quantumSL2Generator q .F ∧
      (Algebra.TensorProduct.assoc ℂ ℂ ℂ (QuantumSL2 q) (QuantumSL2 q)
            (QuantumSL2 q)).toAlgHom.comp
          ((Algebra.TensorProduct.map Δ (AlgHom.id ℂ (QuantumSL2 q))).comp Δ) =
        (Algebra.TensorProduct.map (AlgHom.id ℂ (QuantumSL2 q)) Δ).comp Δ := by
  sorry

/-- The PBW theorem (§8.1): for `q ≠ 0` not a root of unity the ordered monomials
`F^a K^b E^c`, `(a, b, c) ∈ ℕ × ℤ × ℕ`, form a basis of `U_q(sl₂)`. -/
theorem quantumSL2PBW_exists (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) :
    ∃ b : Module.Basis (ℕ × ℤ × ℕ) ℂ (QuantumSL2 q), ∀ a z c,
      b (a, z, c) = quantumSL2Generator q .F ^ a *
        ((quantumSL2KUnit q) ^ z : (QuantumSL2 q)ˣ) *
        quantumSL2Generator q .E ^ c := by
  sorry

/-- `U_q(sl₂)` is a domain for `q ≠ 0` not a root of unity (§8.1, via the Ore tower);
`IsDomain` includes nontriviality. -/
theorem quantumSL2_domain (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) : IsDomain (QuantumSL2 q) := by
  sorry

/-- The centre of `U_q(sl₂)` is the polynomial algebra on the Casimir (§8.3): for `q ≠ 0` not
a root of unity, an element is central exactly when it is a polynomial in `Ω`, and that
polynomial is unique, so `Ω` is transcendental over `ℂ`. -/
theorem quantumSL2_center (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) (z : QuantumSL2 q) :
    (∀ x, Commute z x) ↔ ∃! p : Polynomial ℂ,
      Polynomial.eval₂ (algebraMap ℂ (QuantumSL2 q)) (quantumSL2Casimir q) p = z := by
  sorry

/-- Complete reducibility (§8.3): for `q ≠ 0` not a root of unity every finite-dimensional
`U_q(sl₂)`-module is semisimple, with no assumption that `K` acts diagonalisably. -/
theorem quantumSL2_finite_semisimple (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1)
    (V : Type u) [AddCommGroup V] [Module ℂ V] [Module (QuantumSL2 q) V]
    [IsScalarTower ℂ (QuantumSL2 q) V] [FiniteDimensional ℂ V] :
    IsSemisimpleModule (QuantumSL2 q) V := by
  sorry

/-- Classification of finite-dimensional simple modules (§8.2): for `q ≠ 0` not a root of
unity, every finite-dimensional simple `U_q(sl₂)`-module `V` has a basis `b₀, …, b_m` and a sign
`ε = ±1` with `K b_j = ε q^(m−2j) b_j`, `F b_j = [j+1]_q b_(j+1)` and
`E b_j = ε [m−j+1]_q b_(j−1)` (out-of-range vectors zero): it is the signed ladder `L_m^ε`.
No diagonalisability of `K` is assumed. -/
theorem quantumSL2_simple_classification (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1)
    (V : Type u) [AddCommGroup V] [Module ℂ V] [Module (QuantumSL2 q) V]
    [IsScalarTower ℂ (QuantumSL2 q) V] [FiniteDimensional ℂ V]
    [IsSimpleModule (QuantumSL2 q) V] :
    ∃ (m : ℕ) (ε : ℂ) (b : Module.Basis (Fin (m + 1)) ℂ V),
      (ε = 1 ∨ ε = -1) ∧ ∀ j : Fin (m + 1),
      quantumSL2Generator q .K • b j = (ε * q ^ ((m : ℤ) - 2 * j.val)) • b j ∧
      quantumSL2Generator q .F • b j =
        (if h : j.val < m then quantumInteger q (j.val + 1) • b ⟨j.val + 1, by omega⟩
         else 0) ∧
      quantumSL2Generator q .E • b j =
        (if h : 0 < j.val then (ε * quantumInteger q ((m : ℤ) - j.val + 1)) •
          b ⟨j.val - 1, by omega⟩ else 0) := by
  sorry

/-- Existence in the classification (§8.2): for every `m : ℕ` and sign `ε = ±1` there is an
irreducible action of `U_q(sl₂)` on `ℂ^(m+1)` whose first basis vector is killed by `E` and is
a `K`-eigenvector of eigenvalue `ε q^m` (the ladder module `L_m^ε`); with
`quantumSL2_simple_classification` the pairs `(m, ε)` are in bijection with the
finite-dimensional simples. -/
theorem quantumSL2_exists_ladderAction (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) (m : ℕ) (ε : ℂ) (hε : ε = 1 ∨ ε = -1) :
    ∃ ρ : QuantumSL2 q →ₐ[ℂ] Module.End ℂ (Fin (m + 1) → ℂ),
      (∀ p : Submodule ℂ (Fin (m + 1) → ℂ), (∀ a, ∀ x ∈ p, ρ a x ∈ p) → p = ⊥ ∨ p = ⊤) ∧
      ρ (quantumSL2Generator q .E) (Pi.single 0 1) = 0 ∧
      ρ (quantumSL2Generator q .K) (Pi.single 0 1) = (ε * q ^ m) • Pi.single 0 1 := by
  sorry

/-- Local finiteness (§8.2): each cyclic `U_q`-submodule is finite-dimensional as a complex
vector space, with the restricted scalar action. -/
def QuantumSL2LocallyFinite (q : ℂ) (V : Type u) [AddCommGroup V]
    [Module ℂ V] [Module (QuantumSL2 q) V] [IsScalarTower ℂ (QuantumSL2 q) V] : Prop :=
  ∀ v : V, FiniteDimensional ℂ ((Submodule.span (QuantumSL2 q) {v}).restrictScalars ℂ)

/-- Signed integral weights (§8.4): `V` is spanned over `ℂ` by `K`-eigenvectors of eigenvalues
`±q^z`, `z : ℤ`. -/
def QuantumSL2SignedWeights (q : ℂ) (V : Type u) [AddCommGroup V]
    [Module ℂ V] [Module (QuantumSL2 q) V] : Prop :=
  Submodule.span ℂ {v : V | ∃ (z : ℤ) (ε : ℂ), (ε = 1 ∨ ε = -1) ∧
    quantumSL2Generator q .K • v = (ε * q ^ z) • v} = ⊤

/-- Local finiteness is equivalent to signed integral weights together with local nilpotence
of both ladder operators, for an arbitrary algebraic module (§8.4). -/
theorem quantumSL2_locallyFinite_iff (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1)
    (V : Type u) [AddCommGroup V] [Module ℂ V] [Module (QuantumSL2 q) V]
    [IsScalarTower ℂ (QuantumSL2 q) V] :
    QuantumSL2LocallyFinite q V ↔ QuantumSL2SignedWeights q V ∧
      (∀ v : V, ∃ n : ℕ, quantumSL2Generator q .E ^ n • v = 0) ∧
      (∀ v : V, ∃ n : ℕ, quantumSL2Generator q .F ^ n • v = 0) := by
  sorry

/-- An arbitrary locally finite module is semisimple (§8.4); its simple submodules are
finite-dimensional, hence the signed ladders of `quantumSL2_simple_classification`. -/
theorem quantumSL2_locallyFinite_semisimple (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1)
    (V : Type u) [AddCommGroup V] [Module ℂ V] [Module (QuantumSL2 q) V]
    [IsScalarTower ℂ (QuantumSL2 q) V] (hV : QuantumSL2LocallyFinite q V) :
    IsSemisimpleModule (QuantumSL2 q) V := by
  sorry

end GenericRankOne

end

end TauCetiRoadmap.QuantumGroups
