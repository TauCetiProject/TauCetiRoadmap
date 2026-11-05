/-
Copyright (c) 2026 Kim Morrison. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Mathlib
public import TauCeti.Algebra.Coalgebra.Comodule.MatrixCoefficient.FromMatrix
public import TauCeti.Algebra.Coalgebra.Comodule.LinearlyReductive

/-!
# Quantum groups: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems that are statable against the pinned Mathlib and Tau Ceti, each with `sorry`, together
with the few definitions (real bodies on native carriers) that those statements need.

Stated here: the algebraic consequences of star compatibility and the Schur orthogonality
relations on a Hopf *-algebra with a positive invariant functional (Q3); the free orthogonal
coefficient relation and its cup invariance (Q5); the SUq(2) relations as unitarity of the
fundamental matrix (Q5); and, for the generic quantized enveloping algebra `U_q(sl₂)` presented
as a `RingQuot` of a free algebra (Q8): its coproduct, the PBW basis, the domain property, the
centre `ℂ[Ω]`, the classification of finite-dimensional simple modules by highest weight, and
complete reducibility.

Not statable at the pins:

* Q1 existence and uniqueness of the Haar state of a compact quantum group, and every Q1, Q2, Q4
  and Q7 statement about a C*-bialgebra `Δ : A → A ⊗_min A`: neither Mathlib nor Tau Ceti has the
  minimal (spatial) C*-tensor product of two C*-algebras.
* Q2 decomposition of unitary corepresentations on arbitrary Hilbert spaces and the analytic
  Peter–Weyl theorem: Mathlib's `CStarModule` exists, but the free Hilbert module `H ⊗ A` and its
  adjointable operators, on which the coaction is defined, do not.
* Q4 universal and reduced completions and the coamenability criteria: they need the C*-envelope
  of a Hopf *-algebra and the minimal tensor product above.
* Q6 Tannaka–Krein reconstruction: there is no unitary rigid C*-tensor category, dagger fibre
  functor or finite Hilbert-space dagger category at the pins.
* Q7 fusion rules, dimensions and Haar laws of `SUq(2)` and `O_F^+`: they are statements about the
  universal C*-algebras of Q5, which need the minimal tensor product for their coproduct.
* Q8.5 Clebsch–Gordan decompositions, 6j symbols and the pivotal structure, Q8.6 the comparison
  with `SUq(2)`: they need the monoidal, rigid and pivotal structure on finite-dimensional modules
  over a Hopf algebra, which is a construction of the roadmap and not a carrier at the pins.
-/

open scoped TensorProduct ComplexOrder

namespace TauCetiRoadmap.QuantumGroups

@[expose] public section

universe u v w

/-! ## Q3. The Hopf *-core, orthogonality and modular data -/

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

omit [StarModule ℂ A] in
/-- For a unitary coefficient matrix `u` of a finite comodule in an orthonormal basis, the
entrywise antipode is the matrix adjoint: `(S(u_ij)) = u*`. The left inverse `S(u) u = 1` is
Tau Ceti's `Comodule.map_antipode_mul_coefficientMatrix`. -/
theorem coefficientMatrix_map_antipode_eq_star (b : OrthonormalBasis ι ℂ H)
    (hu : TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis ∈ unitary (Matrix ι ι A)) :
    (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis).map
      (HopfAlgebra.antipode ℂ) =
    star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis) := by
  let U := TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis
  have hright : U * star U = 1 := Unitary.mul_star_self_of_mem hu
  have hleft : U.map (HopfAlgebra.antipode ℂ) * U = 1 :=
    TauCeti.Comodule.map_antipode_mul_coefficientMatrix b.toBasis
  change U.map (HopfAlgebra.antipode ℂ) = star U
  calc
    U.map (HopfAlgebra.antipode ℂ) = U.map (HopfAlgebra.antipode ℂ) * (U * star U) :=
      by rw [hright, mul_one]
    _ = (U.map (HopfAlgebra.antipode ℂ) * U) * star U := (mul_assoc _ _ _).symm
    _ = star U := by rw [hleft, one_mul]

omit [StarModule ℂ A] in
/-- The entrywise form `S(u_ij) = u_ji*` of the antipode on a unitary coefficient matrix, in
the column-coaction orientation `δ(e_j) = Σ_i e_i ⊗ u_ij`. -/
theorem antipode_coefficient (b : OrthonormalBasis ι ℂ H)
    (hu : TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis ∈ unitary (Matrix ι ι A))
    (i j : ι) :
    HopfAlgebra.antipode ℂ (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis i j) =
      star (TauCeti.Comodule.coefficientMatrix (C := A) b.toBasis j i) := by
  have h := congrFun (congrFun (coefficientMatrix_map_antipode_eq_star (A := A) b hu) i) j
  simpa only [Matrix.map_apply, Matrix.star_apply] using h

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

/-- Schur orthogonality (Q3; Timmermann, *An Invitation to Quantum Groups and Duality*,
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

/-! ## Q5. Compact matrix presentations -/

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
tensor square `U_13 U_23`: `Σ_{j,l} U_ij F_lj U_kl = F_ki`. -/
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
`SUq(2)` relations. -/
theorem suqMatrix_unitary_iff (q : ℝ) (a c : A) :
    suqMatrix q a c ∈ unitary (Matrix (Fin 2) (Fin 2) A) ↔ SUqRelations q a c := by
  sorry

end StarPresentations

/-! ## Q8. Generic U_q(sl₂), signed modules and integrability -/

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
defined for every `q`; the headline theorems below state their hypotheses on `q`. -/
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

/-- The coproduct of `U_q(sl₂)` (Q8.1): for `q ≠ 0` there is exactly one algebra map
`Δ : U_q → U_q ⊗ U_q` with `ΔK = K ⊗ K`, `ΔE = E ⊗ 1 + K ⊗ E` and `ΔF = F ⊗ K⁻¹ + 1 ⊗ F`,
and it is coassociative. -/
theorem quantumSL2_existsUnique_comul (q : ℂ) (hq : q ≠ 0) :
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

/-- The PBW theorem (Q8.1): for `q ≠ 0`
not a root of unity the ordered monomials `F^a K^b E^c`, `(a, b, c) ∈ ℕ × ℤ × ℕ`, form a basis
of `U_q(sl₂)`. -/
theorem quantumSL2_exists_pbwBasis (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) :
    ∃ b : Module.Basis (ℕ × ℤ × ℕ) ℂ (QuantumSL2 q), ∀ (a : ℕ) (n : ℤ) (c : ℕ),
      b (a, n, c) = quantumSL2Generator q .F ^ a *
        ((quantumSL2KUnit q) ^ n : (QuantumSL2 q)ˣ) * quantumSL2Generator q .E ^ c := by
  sorry

/-- `U_q(sl₂)` is a domain for `q ≠ 0` not a root of unity (Q8.1, via the Ore tower).
-/
theorem quantumSL2_isDomain (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) :
    IsDomain (QuantumSL2 q) := by
  sorry

/-- Highest weights of finite-dimensional simple modules (Q8.2): a finite-dimensional simple
`U_q(sl₂)`-module `V` has a nonzero vector killed by `E` on which `K` acts by `ε q^(dim V − 1)`
for a sign `ε = ±1`. -/
theorem quantumSL2_exists_highestWeightVector (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1)
    (V : Type u) [AddCommGroup V] [Module ℂ V] [Module (QuantumSL2 q) V]
    [IsScalarTower ℂ (QuantumSL2 q) V] [FiniteDimensional ℂ V]
    [IsSimpleModule (QuantumSL2 q) V] :
    ∃ ε : ℂ, (ε = 1 ∨ ε = -1) ∧ ∃ v : V, v ≠ 0 ∧ quantumSL2Generator q .E • v = 0 ∧
      quantumSL2Generator q .K • v = (ε * q ^ (Module.finrank ℂ V - 1)) • v := by
  sorry

/-- Uniqueness in the classification (Q8.2): two finite-dimensional simple
`U_q(sl₂)`-modules having highest-weight vectors (killed by `E`) of the same `K`-eigenvalue
are isomorphic. -/
theorem quantumSL2_nonempty_linearEquiv_of_highestWeight (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1)
    (V : Type u) [AddCommGroup V] [Module ℂ V] [Module (QuantumSL2 q) V]
    [IsScalarTower ℂ (QuantumSL2 q) V] [FiniteDimensional ℂ V]
    [IsSimpleModule (QuantumSL2 q) V]
    (W : Type v) [AddCommGroup W] [Module ℂ W] [Module (QuantumSL2 q) W]
    [IsScalarTower ℂ (QuantumSL2 q) W] [FiniteDimensional ℂ W]
    [IsSimpleModule (QuantumSL2 q) W]
    (μ : ℂ) (v : V) (w : W) (hv : v ≠ 0) (hw : w ≠ 0)
    (hEv : quantumSL2Generator q .E • v = 0) (hEw : quantumSL2Generator q .E • w = 0)
    (hKv : quantumSL2Generator q .K • v = μ • v)
    (hKw : quantumSL2Generator q .K • w = μ • w) :
    Nonempty (V ≃ₗ[QuantumSL2 q] W) := by
  sorry

/-- Existence in the classification (Q8.2): for every `m : ℕ` and sign `ε = ±1` there is an
irreducible action of `U_q(sl₂)` on `ℂ^(m+1)` whose first basis vector is killed by `E` and is
a `K`-eigenvector of eigenvalue `ε q^m` (the ladder module `L_m^ε`). -/
theorem quantumSL2_exists_ladderAction (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) (m : ℕ) (ε : ℂ) (hε : ε = 1 ∨ ε = -1) :
    ∃ ρ : QuantumSL2 q →ₐ[ℂ] Module.End ℂ (Fin (m + 1) → ℂ),
      (∀ p : Submodule ℂ (Fin (m + 1) → ℂ), (∀ a, ∀ x ∈ p, ρ a x ∈ p) → p = ⊥ ∨ p = ⊤) ∧
      ρ (quantumSL2Generator q .E) (Pi.single 0 1) = 0 ∧
      ρ (quantumSL2Generator q .K) (Pi.single 0 1) = (ε * q ^ m) • Pi.single 0 1 := by
  sorry

/-- The centre of `U_q(sl₂)` is the polynomial algebra on the Casimir element (Q8.3):
for `q ≠ 0` not a root of unity the centre is generated by `Ω`, and `Ω` is
transcendental over `ℂ`. -/
theorem quantumSL2_center_eq_adjoin_casimir (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1) :
    Subalgebra.center ℂ (QuantumSL2 q) = Algebra.adjoin ℂ {quantumSL2Casimir q} ∧
      Transcendental ℂ (quantumSL2Casimir q) := by
  sorry

/-- Complete reducibility (Q8.3): for `q ≠ 0` not a root of unity every
finite-dimensional `U_q(sl₂)`-module is semisimple, with no assumption that `K` acts
diagonalisably. -/
theorem quantumSL2_isSemisimpleModule (q : ℂ) (hq : q ≠ 0)
    (hgeneric : ∀ r : ℕ, 0 < r → q ^ r ≠ 1)
    (V : Type u) [AddCommGroup V] [Module ℂ V] [Module (QuantumSL2 q) V]
    [IsScalarTower ℂ (QuantumSL2 q) V] [FiniteDimensional ℂ V] :
    IsSemisimpleModule (QuantumSL2 q) V := by
  sorry

end GenericRankOne

end

end TauCetiRoadmap.QuantumGroups
