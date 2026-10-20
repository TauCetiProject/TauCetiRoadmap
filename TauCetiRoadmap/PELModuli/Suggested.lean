import Mathlib
import TauCeti.AlgebraicGeometry.AbelianVariety.End.Basic
import TauCeti.Geometry.Hodge.WeightOne.RiemannForm

/-!
# PELModuli: representative target signatures

The roadmap is `README.md`; these are suggested forms, not an exhaustive checklist. This file records
definitions and theorem signatures of the Siegel and PEL moduli roadmap that can be stated against
the pinned Mathlib and Tau Ceti APIs, fixing their hypotheses and conventions. The
complex-realization theorem retains the abelian variety, dimension and order action. The full
moduli problems, their stacks, universal families, uniformization, canonical models and arithmetic
interface use the relative abelian-scheme, polarization, level, analytic-space and Shimura-variety
carriers specified in the README and listed at the end.

Design choices made explicit here:
* The Tate-valued pairing is `φ = 2πi ψ`; the scalar pairing `ψ` is used after choosing the generator
  `2πi` of `ℤ(1)`. Its positivity test is `ψ(x,Jx) > 0` (M0.11); the principal Siegel Gram
  matrix is `−Matrix.J`, so `ψ(e_i, f_i) = 1`, and the complex structure satisfies `J e_i = f_i`,
  `J f_i = −e_i`, making `ψ(x, J x) > 0` for `x ≠ 0`.
* Positivity of an involution is stated with the unreduced trace `Algebra.trace ℚ B`; the README proves
  it equivalent to positivity for the reduced trace (M0.1, `iff_trace_pos`).
* Similitudes carry their multiplier as data; uniqueness of the multiplier needs flatness and a
  nonzero lattice and is a theorem, not part of the definition (M0.7).
* The determinant polynomial is built from Mathlib's `LinearMap.polyCharpoly`; the determinant
  condition is an equality of polynomials, never of traces (M0.14, M0.18).
* The unitary signature comparison uses `ψ = Tr(δH)` and a CM type on which `Im τ(δ) > 0`;
  the Hodge multiplicities swap at conjugate embeddings, while the inertia of `τ(H)` does not.
* Full Tate trivializations in M1.4 are finite étale pro-systems; their profinite geometric fibres
  are inverse limits of finite fibres, with continuous monodromy and termwise base change.
* Lattice realization in M1.10 uses units of `RelativeLocalizedHom`, which can be quasi-isogenies
  such as `id/3`. Integral Tate-lattice preservation supplies actual morphisms before kernels are used.
* The Newton convention in M2.16 uses unscaled `F` on the covariant Dieudonné module.
  Its Hodge cocharacter is `μ_cov(z) = z·id·μ_h(z)⁻¹ = h_ℂ(1,z)`, with weight zero on `V₀`.
* Hecke operators act on the right by precomposition of level markings (M1.13).
* The analytic period map goes from the analytified moduli space to the arithmetic quotient;
  its inverse gives uniformization after the Kodaira–Spencer tangent comparison (M3.5, M3.7).
* The analytic-family Riemann input is `E = −ε(h′) q_g ψ`, so `E(Jx, x) > 0` (M3.5).
* The ordered elliptic frame retains `e_n^MC = (e_n^pol)⁻¹`; a PEL multiplier `ζ` gives
  the ModularCurves fibre `Y(n,ζ⁻¹)` (M3.5, M5.3).
-/

namespace TauCetiRoadmap.PELModuli

open scoped TensorProduct

/-- Complex realization of a polarized integral complex structure with an order action (M3.4).
There is a complex abelian variety of half the lattice rank carrying the action with exactly the
same annihilator. This is the nonemptiness consequence of Riemann's equivalence and PEL complex
uniformization; the full polarization, level and homology comparison is M3.4 of the README.
Milne, Theorems 6.7–6.8 and 8.17. -/
theorem complexPoints_realization {O L : Type*} [Ring O] [AddCommGroup L] [Module O L]
    [Module.Free ℤ L] [Module.Finite ℤ L]
    (J : TauCeti.AlmostComplexStructure (ℝ ⊗[ℤ] L)) (E : LinearMap.BilinForm ℤ L)
    (hE : J.IsRiemannForm E)
    (hcomm : ∀ (b : O) (x : ℝ ⊗[ℤ] L),
      J (((DistribSMul.toAddMonoidHom L b).toIntLinearMap.baseChange ℝ) x) =
        ((DistribSMul.toAddMonoidHom L b).toIntLinearMap.baseChange ℝ) (J x)) :
    ∃ (A : TauCeti.AlgebraicGeometry.AbelianVariety ℂ) (i : O →+* A.End) (g : ℕ),
      Module.finrank ℤ L = 2 * g ∧ A.dim = (g : WithBot ℕ∞) ∧
        ∀ b : O, i b = 0 ↔ ∀ x : L, b • x = 0 := by
  sorry

/-! ## Layer M0: Linear algebra and reflex fields -/

section PositiveInvolution

variable (B : Type*) [Ring B] [Algebra ℚ B] [StarRing B] [FiniteDimensional ℚ B]

/-- **Positive involution** (M0.1). A star structure on a finite-dimensional `ℚ`-algebra is positive
when `Tr_{B/ℚ}(x x*) > 0` for every nonzero `x`. Lan, thesis, §1.2.1, p. 45; Milne, *Introduction to
Shimura varieties*, Proposition 8.10 and Definition 8.11, pp. 84–85. The trace is the trace of left
multiplication; positivity for it is equivalent to positivity for the reduced trace. -/
def IsPositiveInvolution : Prop :=
  (∀ (q : ℚ) (x : B), star (q • x) = q • star x) ∧
    ∀ x : B, x ≠ 0 → 0 < LinearMap.trace ℚ B (LinearMap.mulLeft ℚ (x * star x))

/-- **Star-order** (M0.1). A star-stable `ℤ`-subalgebra with a full lattice as its underlying
module. The lattice proof is the defining condition of ClassicalArithmeticCompletion §7.4's
`IntegralOrder.IsOrder`; `StarOrder.orderEquiv` identifies this carrier with that supplier's
star-stable orders. Lan, Definitions 1.1.1.2–1.1.1.4 and §1.2.1. -/
structure StarOrder where
  /-- The underlying arithmetic-order carrier. -/
  toSubalgebra : Subalgebra ℤ B
  /-- The underlying module is a full lattice, as in `IntegralOrder.IsOrder`. -/
  isLattice : Submodule.IsLattice ℚ toSubalgebra.toSubmodule
  /-- Stability under the involution. -/
  star_mem : ∀ x ∈ toSubalgebra, star x ∈ toSubalgebra

/-- Forgetting the lattice and star-stability proofs retains the arithmetic order's subring. -/
def StarOrder.toSubring (O : StarOrder B) : Subring B := O.toSubalgebra.toSubring

end PositiveInvolution

section SymplecticLattice

variable (O : Type*) [Ring O] [StarRing O]
variable (L : Type*) [AddCommGroup L] [Module O L] [Module.Free ℤ L] [Module.Finite ℤ L]

/-- **Symplectic `O`-lattice** (M0.4). A finite free `ℤ`-module with an `O`-action and an alternating
nondegenerate integral pairing for which `b` and `b*` are adjoint. Lan, §1.2.1, p. 46; Kottwitz, §1,
p. 374. -/
structure SymplecticOLattice where
  /-- The pairing, `ℤ(1)`-valued after the choice of `√−1`. -/
  form : LinearMap.BilinForm ℤ L
  /-- The pairing is alternating. -/
  isAlt : form.IsAlt
  /-- The pairing is nondegenerate (equivalently, nondegenerate after `⊗ ℚ`). -/
  nondegenerate : form.Nondegenerate
  /-- `⟨b x, y⟩ = ⟨x, b* y⟩`. -/
  adjoint : ∀ (b : O) (x y : L), form (b • x) y = form x (star b • y)

namespace SymplecticOLattice

variable {O L}

/-- The **dual index** `[L^# : L]` (M0.4), computed as the absolute value of the Gram determinant in a
chosen `ℤ`-basis; the README proves it is the index of `L` in its dual lattice and independent of the
basis. -/
noncomputable def dualIndex (S : SymplecticOLattice O L) : ℕ :=
  (LinearMap.BilinForm.toMatrix (Module.Free.chooseBasis ℤ L) S.form).det.natAbs

/-- The dual index is positive (nondegeneracy over `ℚ`). -/
theorem dualIndex_pos (S : SymplecticOLattice O L) : 0 < S.dualIndex := by
  sorry

/-- The `ℝ`-bilinear extension of the pairing to `ℝ ⊗ L`. -/
noncomputable def realForm (S : SymplecticOLattice O L) : LinearMap.BilinForm ℝ (ℝ ⊗[ℤ] L) :=
  LinearMap.BilinForm.baseChange ℝ S.form

end SymplecticOLattice

/-- The action of `b ∈ O` on `ℝ ⊗ L`. -/
noncomputable def realAction (b : O) : Module.End ℝ (ℝ ⊗[ℤ] L) :=
  ((DistribSMul.toAddMonoidHom L b).toIntLinearMap).baseChange ℝ

/-- **Linear part of an integral PEL datum** (M0.5). A symplectic `O`-lattice with an `O ⊗ ℝ`-linear complex structure
`J = h(√−1)` with `J² = −1`, preserving the real pairing, and with `ψ(x, J x) > 0` for `x ≠ 0` (Lan's
Condition 1.2.1.2, pp. 46–47; Definition 1.2.1.3, p. 47). The positive involution on `O ⊗ ℚ` and the
faithfulness used for rationalization are hypotheses of the README targets that use them. -/
structure IntegralPELLinearDatum where
  /-- The symplectic `O`-lattice. -/
  lattice : SymplecticOLattice O L
  /-- The complex structure `h(√−1)` on `ℝ ⊗ L`. -/
  J : TauCeti.AlmostComplexStructure (ℝ ⊗[ℤ] L)
  /-- `J` commutes with the action of `O`. -/
  J_comm : ∀ b : O,
    J.toLinearMap * realAction O L b = realAction O L b * J.toLinearMap
  /-- `J` preserves the real pairing (equivalently `⟨h(z)x, y⟩ = ⟨x, h(z̄)y⟩`). -/
  J_isometry : ∀ x y, lattice.realForm (J x) (J y) = lattice.realForm x y
  /-- Positivity: `ψ(x, J x) > 0` for `x ≠ 0`. -/
  pos : ∀ x, x ≠ 0 → 0 < lattice.realForm x (J x)

/-- **Similitude with multiplier** (M0.7). Over a commutative ring `R`, a pair `(g, r)` of an
`O`-linear automorphism of `R ⊗ L` and a unit `r` with `⟨g x, g y⟩ = r ⟨x, y⟩`. The multiplier is data:
over nonflat `R` it is not determined by `g` (Lan's thesis errata, p. 4). -/
def IsSimilitude (S : SymplecticOLattice O L) (R : Type*) [CommRing R]
    (g : (R ⊗[ℤ] L) ≃ₗ[R] (R ⊗[ℤ] L)) (r : Rˣ) : Prop :=
  (∀ (b : O) (x : R ⊗[ℤ] L),
      g (((DistribSMul.toAddMonoidHom L b).toIntLinearMap.baseChange R) x) =
        ((DistribSMul.toAddMonoidHom L b).toIntLinearMap.baseChange R) (g x)) ∧
    ∀ x y, LinearMap.BilinForm.baseChange R S.form (g x) (g y) =
      (r : R) * LinearMap.BilinForm.baseChange R S.form x y

/-- The negative scalar pairing is a Riemann form for the PEL complex structure (M0.11).
Its sign changes the PEL test `ψ(x,Jx) > 0` into the Riemann test `E(Jx,x) > 0`. -/
theorem IntegralPELLinearDatum.isRiemannForm (D : IntegralPELLinearDatum O L) :
    D.J.IsRiemannForm (-D.lattice.form) := by
  sorry

/-- Positive order-linear complex structures on the same symplectic lattice are conjugate by a
real order-linear isometry (M0.11; Kottwitz, Lemma 4.3). -/
theorem IntegralPELLinearDatum.conjugacy (D D' : IntegralPELLinearDatum O L)
    (hform : D.lattice.form = D'.lattice.form) :
    ∃ g : (ℝ ⊗[ℤ] L) ≃ₗ[ℝ] (ℝ ⊗[ℤ] L),
      (∀ x y, D.lattice.realForm (g x) (g y) = D.lattice.realForm x y) ∧
      (∀ b x, g (realAction O L b x) = realAction O L b (g x)) ∧
      ∀ x, g (D.J x) = D'.J (g x) := by
  sorry

/-- On a nonzero lattice over a nonzero flat base, a similitude has a unique multiplier (M0.7).
Flatness preserves a nonzero integral pairing value. -/
theorem IsSimilitude.multiplier_unique (S : SymplecticOLattice O L)
    (R : Type*) [CommRing R] [Nontrivial R] [Module.Flat ℤ R] [Nontrivial L]
    (g : (R ⊗[ℤ] L) ≃ₗ[R] (R ⊗[ℤ] L)) (r s : Rˣ)
    (hr : IsSimilitude O L S R g r) (hs : IsSimilitude O L S R g s) : r = s := by
  sorry

/-- On the integral plane with form `5ψ`, reduction modulo five admits different multipliers for
the identity (M0.7). The pair-valued similitude definition retains both choices. -/
theorem IsSimilitude.multiplier_nonflat :
    ∃ S : SymplecticOLattice ℤ (Fin 2 → ℤ),
      S.form = (5 : ℤ) • Matrix.toBilin' !![0, 1; -1, 0] ∧
      IsSimilitude ℤ (Fin 2 → ℤ) S (ZMod 5) (LinearEquiv.refl _ _) 1 ∧
      IsSimilitude ℤ (Fin 2 → ℤ) S (ZMod 5) (LinearEquiv.refl _ _)
        (ZMod.unitOfCoprime 2 (by decide)) := by
  sorry

end SymplecticLattice

section BadPrimes

/-- **Bad-prime integer** (M0.10): `n · I_bad · Disc · [L^# : L]`. -/
def badPrimeInteger (n Ibad disc dualIndex : ℕ) : ℕ := n * Ibad * disc * dualIndex

/-- A prime is **good** (M0.10) when it does not divide the bad-prime integer. Each factor is a
separate condition; none follows from `p` being large. -/
def IsGoodPrime (n Ibad disc dualIndex p : ℕ) : Prop :=
  Nat.Prime p ∧ ¬ p ∣ badPrimeInteger n Ibad disc dualIndex

end BadPrimes

section Determinant

variable {R : Type*} [CommRing R] {O : Type*} [AddCommGroup O] [Module R O]
variable {ι : Type*} [Fintype ι] [DecidableEq ι]
variable {M : Type*} [AddCommGroup M] [Module R M] [Module.Free R M] [Module.Finite R M]

/-- **Determinant polynomial** `Det_{O|M}` (M0.14). For a linear family `φ : O → End M` and a basis
of `O`, `(−1)^{rank M}` times the constant coefficient of the generic characteristic polynomial
`LinearMap.polyCharpoly`; its value at `x` is `det(φ x)` (Lan, Definition 1.1.2.17, p. 19). -/
noncomputable def detPoly (φ : O →ₗ[R] Module.End R M) (b : Module.Basis ι R O) :
    MvPolynomial ι R :=
  (-1) ^ Module.finrank R M * (LinearMap.polyCharpoly φ b).coeff 0

/-- Evaluating the determinant polynomial at the coordinates of `x` gives `det(φ x)` (`detPoly_eval`;
Check `detPoly_eval_charpoly`, which pins that no further sign appears). -/
theorem detPoly_eval (φ : O →ₗ[R] Module.End R M) (b : Module.Basis ι R O) (x : O) :
    MvPolynomial.eval (b.repr x) (detPoly φ b) = LinearMap.det (φ x) := by
  sorry

/-- Evaluation at the negative of an element gives the constant term of its characteristic
polynomial, with no further sign (M0.14). -/
theorem detPoly_eval_charpoly (φ : O →ₗ[R] Module.End R M) (b : Module.Basis ι R O) (x : O) :
    MvPolynomial.eval (b.repr (-x)) (detPoly φ b) = (LinearMap.charpoly (φ x)).eval 0 := by
  sorry

/-- **Determinant condition** (M0.18): equality of the determinant polynomials of arbitrary
linear families, including nonfaithful actions and zero modules. For families induced by unital
algebra actions this implies equality of characteristic polynomials and traces, by specializing the
generic element to `T·1 − x`; the converse fails in positive characteristic. -/
def SatisfiesDetCondition {M' : Type*} [AddCommGroup M'] [Module R M'] [Module.Free R M']
    [Module.Finite R M'] (φ : O →ₗ[R] Module.End R M) (ψ : O →ₗ[R] Module.End R M')
    (b : Module.Basis ι R O) : Prop :=
  detPoly φ b = detPoly ψ b

/-- Determinant polynomials commute with extension of scalars (M0.14). -/
theorem detPoly_baseChange (φ : O →ₗ[R] Module.End R M) (b : Module.Basis ι R O)
    (A : Type*) [CommRing A] [Algebra R A] :
    detPoly ((LinearMap.tensorProduct R A M M).comp (φ.baseChange A))
        (b.baseChange A) = MvPolynomial.map (algebraMap R A) (detPoly φ b) := by
  sorry

/-- A change of basis substitutes the coordinates of the new generic element (M0.14). -/
theorem detPoly_basis_indep (φ : O →ₗ[R] Module.End R M) (b : Module.Basis ι R O)
    {κ : Type*} [Fintype κ] [DecidableEq κ] (b' : Module.Basis κ R O) :
    detPoly φ b' = MvPolynomial.bind₁
      (fun i => ∑ j, MvPolynomial.C (b.repr (b' j) i) * MvPolynomial.X j) (detPoly φ b) := by
  sorry

/-- The determinant polynomial has the rank of the represented module as its degree (M0.14). -/
theorem detPoly_homogeneous [Nontrivial R] (φ : O →ₗ[R] Module.End R M)
    (b : Module.Basis ι R O) : (detPoly φ b).IsHomogeneous (Module.finrank R M) := by
  sorry

/-- In a short exact sequence of finite free representations, the determinant polynomial is the
product of those of the submodule and quotient (M0.14). -/
theorem detPoly_exact
    {M₁ M₃ : Type*} [AddCommGroup M₁] [Module R M₁] [Module.Free R M₁] [Module.Finite R M₁]
    [AddCommGroup M₃] [Module R M₃] [Module.Free R M₃] [Module.Finite R M₃]
    (φ₁ : O →ₗ[R] Module.End R M₁) (φ₂ : O →ₗ[R] Module.End R M)
    (φ₃ : O →ₗ[R] Module.End R M₃) (b : Module.Basis ι R O)
    (f : M₁ →ₗ[R] M) (g : M →ₗ[R] M₃)
    (hf : Function.Injective f) (hg : Function.Surjective g) (hexact : LinearMap.range f = LinearMap.ker g)
    (hfφ : ∀ a x, f (φ₁ a x) = φ₂ a (f x)) (hgφ : ∀ a x, g (φ₂ a x) = φ₃ a (g x)) :
    detPoly φ₂ b = detPoly φ₁ b * detPoly φ₃ b := by
  sorry

end Determinant

section ModuleClassification

variable {k C M N : Type*} [Field k] [Ring C] [Algebra k C]
variable [FiniteDimensional k C] [IsSemisimpleRing C]
variable [AddCommGroup M] [Module k M] [FiniteDimensional k M]
variable [AddCommGroup N] [Module k N] [FiniteDimensional k N]
variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Determinant polynomials classify finite-dimensional representations of a semisimple algebra in
every characteristic (M0.15). After separable-centre scalar extension, apply this to the extended
semisimple algebra. Lan, Proposition 1.1.2.16. -/
theorem detPoly_classifies (φ : C →ₐ[k] Module.End k M) (ψ : C →ₐ[k] Module.End k N)
    (b : Module.Basis ι k C) :
    detPoly φ.toLinearMap b = detPoly ψ.toLinearMap b ↔
      ∃ f : M ≃ₗ[k] N, ∀ a x, f (φ a x) = ψ a (f x) := by
  sorry

/-- In characteristic zero, traces also classify finite-dimensional semisimple representations
(M0.15; Milne, Proposition 8.1). -/
theorem detPoly_classifies_charZero [CharZero k]
    (φ : C →ₐ[k] Module.End k M) (ψ : C →ₐ[k] Module.End k N) :
    (∀ a, LinearMap.trace k M (φ a) = LinearMap.trace k N (ψ a)) ↔
      ∃ f : M ≃ₗ[k] N, ∀ a x, f (φ a x) = ψ a (f x) := by
  sorry

end ModuleClassification

/-- Equal determinant polynomials of unital algebra actions give equal characteristic polynomials
of every element (M0.18), using the generic element `T·1 − a`. -/
theorem SatisfiesDetCondition.charpoly_eq
    {R C M N : Type*} [CommRing R] [Ring C] [Algebra R C]
    [AddCommGroup M] [Module R M] [Module.Free R M] [Module.Finite R M]
    [AddCommGroup N] [Module R N] [Module.Free R N] [Module.Finite R N]
    {ι : Type*} [Fintype ι] [DecidableEq ι] (b : Module.Basis ι R C)
    (φ : C →ₐ[R] Module.End R M) (ψ : C →ₐ[R] Module.End R N)
    (h : SatisfiesDetCondition φ.toLinearMap ψ.toLinearMap b) (a : C) :
    LinearMap.charpoly (φ a) = LinearMap.charpoly (ψ a) := by
  sorry

/-- In characteristic `p`, the scalar representations of ranks `p` and zero have the same traces
and different determinant polynomials (M0.15). Thus traces cannot replace the determinant condition. -/
theorem detCondition_not_trace (k : Type*) [Field k] (p : ℕ) [Fact p.Prime] [CharP k p] :
    let φ := (Algebra.lsmul k k (Fin p → k)).toLinearMap
    let ψ := (Algebra.lsmul k k (Fin 0 → k)).toLinearMap
    let b := Module.Basis.singleton Unit k
    (∀ a : k, LinearMap.trace k (Fin p → k) (φ a) =
      LinearMap.trace k (Fin 0 → k) (ψ a)) ∧
    detPoly φ b = MvPolynomial.X () ^ p ∧ detPoly ψ b = 1 ∧ detPoly φ b ≠ detPoly ψ b := by
  sorry

section CMTypes

variable (K : Type*) [Field K] [NumberField K] [NumberField.IsCMField K]

/-- **Generalized CM type** of rank `N` (M0.25): a finitely supported `Ψ : (K →+* ℂ) →₀ ℕ` with
`Ψ(τ) + Ψ(τ̄) = N` for every complex embedding (Liu–Tian–Xiao–Zhang–Zhu, Definition 3.3.1, p. 147). -/
def IsGeneralizedCMType (N : ℕ) (Ψ : (K →+* ℂ) →₀ ℕ) : Prop :=
  ∀ τ : K →+* ℂ, Ψ τ + Ψ (NumberField.ComplexEmbedding.conjugate τ) = N

/-- A CM type is a generalized CM type of rank one. -/
def IsCMType (Φ : (K →+* ℂ) →₀ ℕ) : Prop := IsGeneralizedCMType K 1 Φ

/-- In rank one every coefficient is `0` or `1` (Check `gcmType_cm_rank1`). -/
theorem IsCMType.le_one {Φ : (K →+* ℂ) →₀ ℕ} (h : IsCMType K Φ) (τ : K →+* ℂ) : Φ τ ≤ 1 := by
  sorry

end CMTypes

/-! ## Layer M5: Siegel, Hilbert and unitary examples -/

section Siegel

open Matrix

variable {g : ℕ}

/-- The **Siegel Gram matrix of type `d`** (M5.1): `⟨e_i, f_j⟩ = d_i δ_{ij}`, `⟨e_i, e_j⟩ = ⟨f_i, f_j⟩ = 0`
on `ℤ^{2g}` with basis `e = inl`, `f = inr`. For `d = 1` it is `−Matrix.J`. -/
def siegelGram (d : Fin g → ℤ) : Matrix (Fin g ⊕ Fin g) (Fin g ⊕ Fin g) ℤ :=
  Matrix.fromBlocks 0 (Matrix.diagonal d) (-Matrix.diagonal d) 0

/-- For the principal type the Gram matrix is `−Matrix.J` (the sign convention of the roadmap). -/
theorem siegelGram_one : siegelGram (fun _ : Fin g => (1 : ℤ)) = -Matrix.J (Fin g) ℤ := by
  sorry

/-- **Dual index of the Siegel datum** (`siegelDatum_dualIndex`): `[L_D^# : L_D] = (d₁⋯d_g)²`. -/
theorem siegelGram_det (d : Fin g → ℤ) : (siegelGram d).det = (∏ i, d i) ^ 2 := by
  sorry

/-- Positive polarization weights give a positive definite Siegel form in every genus and type
(M5.1). Divisibility of the weights is needed to name a polarization type, not for positivity. -/
theorem siegel_type_pos (d : Fin g → ℤ) (hd : ∀ i, 0 < d i)
    (x : Fin g ⊕ Fin g → ℝ) (hx : x ≠ 0) :
    0 < x ⬝ᵥ ((siegelGram d).map (Int.cast : ℤ → ℝ) *ᵥ (Matrix.J (Fin g) ℝ *ᵥ x)) := by
  sorry

/-- Positivity in the Siegel convention (Check `IntegralPELDatum.siegel`): with
`ψ = siegelGram 1` and `J = Matrix.J (Fin g) ℝ`, `ψ(x, J x) = Σ x_i²` is positive for `x ≠ 0`. -/
theorem siegel_pos (x : Fin g ⊕ Fin g → ℝ) (hx : x ≠ 0) :
    0 < x ⬝ᵥ ((siegelGram (fun _ : Fin g => (1 : ℤ))).map (Int.cast : ℤ → ℝ) *ᵥ
      (Matrix.J (Fin g) ℝ *ᵥ x)) := by
  sorry

/-- With `J` replaced by `−J` the form is negative definite (Check `IntegralPELDatum.wrong_sign`). -/
theorem siegel_neg (x : Fin g ⊕ Fin g → ℝ) (hx : x ≠ 0) :
    x ⬝ᵥ ((siegelGram (fun _ : Fin g => (1 : ℤ))).map (Int.cast : ℤ → ℝ) *ᵥ
      ((-Matrix.J (Fin g) ℝ) *ᵥ x)) < 0 := by
  sorry

end Siegel

section Hilbert

variable (F : Type*) [Field F] [NumberField F]

/-- The **Hilbert trace pairing** (M5.4): `ψ((x₁, x₂), (y₁, y₂)) = Tr_{F/ℚ}(x₁ y₂ − x₂ y₁)` on `F²`; on
`L = O_F ⊕ 𝔡⁻¹` it is integral and perfect. -/
noncomputable def hilbertPairing (x y : F × F) : ℚ :=
  Algebra.trace ℚ F (x.1 * y.2 - x.2 * y.1)

/-- The Hilbert pairing is alternating. -/
theorem hilbertPairing_self (x : F × F) : hilbertPairing F x x = 0 := by
  sorry

/-- The order acts by self-adjoint maps (`* = id`): `ψ(bx, y) = ψ(x, by)`. -/
theorem hilbertPairing_smul (b : F) (x y : F × F) :
    hilbertPairing F (b • x) y = hilbertPairing F x (b • y) := by
  sorry

/-- The lattice `O_F ⊕ 𝔡⁻¹` is exactly its dual under the Hilbert trace pairing (M5.4).
Integrality is expressed by membership in the image of `ℤ` in `ℚ`. -/
theorem hilbertPairing_selfDual :
    let I : FractionalIdeal (nonZeroDivisors (NumberField.RingOfIntegers F)) F := 1
    let J := FractionalIdeal.dual ℤ ℚ I
    ∀ x : F × F,
      (∀ y : F × F, y.1 ∈ I → y.2 ∈ J → ∃ n : ℤ, hilbertPairing F x y = (n : ℚ)) ↔
        x.1 ∈ I ∧ x.2 ∈ J := by
  sorry

/-- The Hilbert convention adapter `f(a,b) = (a,−b)` transports `(J,ψ)` to `(-J,-ψ)` (M5.4). -/
def hilbertConventionMap : (F × F) ≃ₗ[F] (F × F) :=
  (LinearEquiv.refl F F).prodCongr (LinearEquiv.neg F)

/-- Changing the second coordinate's sign transports the positive Hilbert pairing. -/
theorem hilbertConventionMap_pairing (x y : F × F) :
    -hilbertPairing F (hilbertConventionMap F x) (hilbertConventionMap F y) =
      hilbertPairing F x y := by
  sorry

/-- The convention adapter intertwines `J(a,b) = (−b,a)` with `−J`. -/
theorem hilbertConventionMap_complexStructure (x : F × F) :
    hilbertConventionMap F (-x.2, x.1) =
      ((hilbertConventionMap F x).2, -(hilbertConventionMap F x).1) := by
  sorry

/-- The sign adapter preserves product lattices, including `O_F ⊕ 𝔡⁻¹`. -/
theorem hilbertConventionMap_mem_prod (I J : Submodule ℤ F) (x : F × F) :
    hilbertConventionMap F x ∈ I.prod J ↔ x ∈ I.prod J := by
  sorry

end Hilbert

section Unitary

variable (K : Type*) [Field K] [NumberField K] [NumberField.IsCMField K]

/-- The **scalar unitary trace form** (M5.5) is `ψ(x, y) = Tr_{K/ℚ}(δ H(x, y))`, with values in `ℚ`.
For hermitian `H` and anti-invariant `δ` it is alternating and `ψ(a x, y) = ψ(x, ā y)`.
The Tate-valued polarization is `φ = 2πi ψ`, and positivity tests `ψ(x,Jx)` (M0.11).
The domain of the hermitian form is arbitrary; the finite-dimensional construction is M5.5. -/
noncomputable def unitaryTraceForm {V : Type*} (H : V → V → K) (δ : K) (x y : V) : ℚ :=
  Algebra.trace ℚ K (δ * H x y)

/-- With `δ = 1`, which is not anti-invariant, the trace form of the standard hermitian form on `K` is
not alternating (Check `unitaryDatum_wrong_delta`). -/
theorem unitaryTraceForm_one_not_alternating :
    ∃ x : K, unitaryTraceForm K
      (fun a b => a * NumberField.IsCMField.complexConj K b) 1 x x ≠ 0 := by
  sorry

/-- Taking the trace of a nondegenerate hermitian form times a nonzero anti-invariant scalar gives
an alternating nondegenerate rational form with the CM action star-adjoint (M5.5).
The hermitian form is linear in its first variable. -/
theorem unitaryTraceForm_properties {V : Type*} [AddCommGroup V] [Module K V]
    [Module ℚ V] [IsScalarTower ℚ K V] [FiniteDimensional K V]
    (H : V → V → K)
    (hadd : ∀ x y z, H (x + y) z = H x z + H y z)
    (hsmul : ∀ a x y, H (a • x) y = a * H x y)
    (hherm : ∀ x y, H y x = NumberField.IsCMField.complexConj K (H x y))
    (hnd : ∀ x, x ≠ 0 → ∃ y, H x y ≠ 0)
    (δ : K) (hδ : δ ≠ 0) (hcδ : NumberField.IsCMField.complexConj K δ = -δ) :
    ∃ ψ : LinearMap.BilinForm ℚ V,
      (∀ x y, ψ x y = unitaryTraceForm K H δ x y) ∧ ψ.IsAlt ∧ ψ.Nondegenerate ∧
      ∀ (a : K) x y, ψ (a • x) y = ψ x (NumberField.IsCMField.complexConj K a • y) := by
  sorry

end Unitary

/-!
## Further README interfaces and conventions

The full interfaces below are specified in `README.md`. They include abelian schemes over a base
and their duals, polarizations over a base, algebraic stacks and spaces, complex analytic spaces,
Shimura data and Shimura varieties, crystalline and étale cohomology, and displays:
the full `PositiveInvolution`, `IntegralPELDatum`, `RationalPELDatum`, and `PIntegralPELDatum`;
`IntegralPELDatum.coordinate`, `IntegralPELDatum.coordinatePoints`,
`IntegralPELDatum.isometryCoordinate`, `IntegralPELDatum.similitudePoints`;
`PELDatum.multiplier`, `PELDatum.isometryGroup`, `PELDatum.similitudeGroup`;
`RationalPELDatum.coordinate`, `RationalPELDatum.coordinatePoints`;
`RelativeLocalizedHom`, `SymplecticOLattice.dual`, `IsSelfDualAt`, `multiRank`, `polarizationType`, `baseChange`;
`Order.inverseDifferent`; `PELDatum.IsGoodSet`, `goodBase`, `principalCongruence`;
`RationalPELDatum.domain`, `signature`, `reflexField`;
`IntegralPELDatum.hodgeStructure`, `IntegralPELDatum.signature`,
`IntegralPELDatum.reflexField`, `IntegralPELDatum.detPoly_integral`; `GeneralizedCMType` and its
`reflexField`, `positiveImaginaryCone`; `HermitianSpace`, `HermitianSpace.unitaryGroup`,
`HermitianSpace.sharp`, `HermitianSpace.toSkewHermitian`; `SkewHermitianSpace`, `Similitude`, `Similar`, `GU`, `HasCMType`;
`tauField`, `diamondField`, `psiField`, `tauPart`, `tauSubmodule`, `frobeniusOnEmbeddings`;
the Albert classification `albertTypes`; `StarOrder.orderEquiv`; `Order.disc` and its
reduced-trace maximality criterion; the similitude group
scheme and its structure `similitudeGroupStructure`; Galois cohomology `galoisH1` over any field
with discrete `G(k^sep)`, `ker1`, the comparison `smoothAffineTorsor_galoisH1` constructed here
for smooth affine finite-type groups, including disconnected groups, and its inverse
`galoisH1_equiv_torsorClasses` to common fppf torsor classes; finite separable trivialization,
affine Galois descent, inverse laws, base points, field extension and group-homomorphism
compatibility, and the characteristic-zero twisting and PEL all-place Hasse statements (M0.9);
`hodgeStructureOfDatum`;
the Shimura datum `toShimuraDatum`;
signatures; `detPoly_classifies`; the reflex field and `reflexField_eq_shimura`;
`detCondition_splitting`;
`selfDualLattice_unique` (for `D : PIntegralPELDatum p`, comparing its self-dual `D.Λ₀` in
`V ⊗ ℚ_p` with another self-dual lattice; the integral specialization uses `toPIntegral` and
`p ∤ I_bad · Disc · [L^# : L]`, retaining the Case-D hypotheses of M0.20);
`cmTorus_integralH1_trivial`; `bpsSignatureConstancy`; hermitian and
skew-hermitian spaces, `cmTorus`, `rankOneSkewHermitian_classification`; `CMField.reflexiveClosure`;
`τ`-parts. Layer M1: `HasSignatureType`, `PELDatum.Hom`, `PELModuli.forgetLevel`,
`heckeCorrespondence`, `mapOfDatumFunctor`, `toSiegelFunctor`; `QuasiIsogeny`, `BoxPolarization`, `PELTriple`, unitary `O_F`-abelian schemes,
`symplecticIsomSheaf`, `PrincipalLevel`, `IntegralLevel`, `RelativeRationalLevel`, `moduliProblem`,
`ratModuliProblem`, `adelicModuli`, `primeToLatticeRealization`, `localizedHom_integral_of_tate`,
`isoIsogenyComparison`, `changeOfLatticeAndPrimes`, `changeOfPrimes_openClosed`,
`effectiveDescent`, `heckeTranslate`, `toSiegel_finite`. Layer M2: `rigidity`, `IsPinkNeatElement`, `IsNeat`,
`noAutomorphisms_of_neat`, `isomScheme_finite`, `deformation_prorepresentable`, `formalSmoothness`,
`effectivity`, `representability`, `universal`, `kodairaSpencer`, `properOfDivision`,
`unitaryDeformation`, `isogenyDieudonne_coker_length`, `isogenyKernelRanks`, `Display`, `Display.deformationEndomorphism`, `polarizedDisplay_lifting`,
`covariantHodgeCocharacter`, `pelNewtonPoint`, `averagedHodgeCocharacter`, `IsMuOrdinary`,
`muOrdinaryLocus`, `wedhornOrdinary`.
Layer M3: `PELModuli.analyticFamily`, `PELModuli.periodMap`, `ker1Classification`, `hasseCases`, `arithmeticQuotient_structure`, `complexPoints`,
`uniformization`, `algebraization`, `typeDComparison`, `hermitianHomOfAbelianSchemes`,
`siegelFineUniformization`. Layer M4: `cmReciprocity`, `twist`, `adelicTwist`, `canonicalModel`,
`canonicalModel_functorial`, `normalizedModel`, `normalizedModel_finite_normal_flat`, `cmModuli`,
`cmModuli1`, `cmModuliAct`, `torusGroupoid`, `cmModuli_galois`,
`torusInvariantCohomology`, `torusTrace`. Layer M5: `siegelIntegralDatum`,
`siegelRationalDatum`, `hilbertIntegralDatum`, `unitaryRationalDatum`; `siegelModuli`, `genusOneComparison`, `hilbertExample`,
`unitaryExamples`, `nonprincipalExample`. Layer M6: `levelForgetting_finiteEtale`,
`arbitraryLevelStack`, `siegelStack`, `polarizedStackFiniteType`, `coarseModuli`, `fieldOfModuli`,
`PELModuli.fieldOfModuliPEL`,
the residual gerbe `𝒢_x`, `descentObstruction`, `boundedFieldOfDefinition`, `PELModuli.hodgeBundle`, `PELModuli.hodgeLine`, `classifyingMap`,
`finiteFieldFiniteness`, `nonemptyExamples`.

The following APIs and discriminating Checks are also specified in the README:
* M0.1: `StarOrder.orderEquiv` retains the underlying `StarOrder.toSubalgebra` and identifies
  `StarOrder.isLattice` with the supplier's `IntegralOrder.IsOrder` proof. Inclusions and
  localized carriers agree under this equivalence (Check `starOrder_matrix_adapter`).
* M0.2: `albertTypes` applies AbelianSchemesAndArithmeticModuli A6.15
  `realRosatiDecomposition` to the real extension with its positive regular trace; the PEL
  rational-centre consequences, A/C/D labels and group comparisons are derived here.
  An indefinite quaternion algebra has type C for every positive involution; its canonical
  quaternion involution is not positive (Check `albertTypes_indefiniteQuaternion`).
* M0.3: `Order.disc_regularTrace_matrix` distinguishes the regular and reduced traces on
  `M₂(ℚ)`: the integral matrix-unit Gram determinants are `−16` and `−1`, and the trace-duals
  are `(1/2)M₂(ℤ)` and `M₂(ℤ)`. Generic `IntegralOrder.IsMaximalOrder` and containment in a
  maximal order are ClassicalArithmeticCompletion §§7.21 and 7.56's interfaces, used in M1.11;
  the containing maximal order need not be star-stable.
* M0.4: `SymplecticOLattice.le_dual` and double duality using the Tau Ceti supplier
  recorded in the README; `polarizationType` exposes A5.4(1)
  `alternating_elementaryDivisors` on the underlying integral lattice.
* M0.9: `smoothAffineTorsor_galoisH1` uses right torsors with `σ(s) = s·c_σ` and
  gauge change `g⁻¹c_σ σ(g)`; descent on the trivial right torsor is `x ↦ c_σ σ(x)`.
  `ker1_disconnected` uses `Spec ℚ(√2)` and its quadratic cocycle. Over `𝔽_q` the
  smooth constant group `C₂` has two torsor classes, including in characteristic two.
  Smoothness excludes `α_p/𝔽_p(t)`, whose fppf torsor `x^p = t` has no separable point
  although its continuous Galois cohomology is trivial.
* M0.10: `PELDatum.IsGoodPrime.not_dvd_dualIndex`,
  `PELDatum.IsGoodPrime.not_two_of_typeD`.
* M0.11: `hodgeStructureOfDatum` uses the scalar alternating `ψ : V × V → ℚ`, with
  `ψ(x,Jy)` symmetric positive definite, and the Tate-valued polarization `φ = 2πi ψ`.
  Its homological Weil operator is `−J` with `Q = ψ`; the Riemann input is `E = −ψ`.
* M0.13: `RationalPELDatum.signature_unitary` assumes `ψ = Tr_{K/ℚ}(δH)`,
  `δ ∈ K^×`, `δ̄ = −δ` and a CM type `Φ` with `Im τ(δ) > 0` for `τ ∈ Φ`.
  For nondegenerate `H` on `K^n`, its inertia `(r_τ,s_τ)` at `τ ∈ Φ` equals the
  Hodge pair there; the pair at `τ̄` is `(s_τ,r_τ)`. The unweighted hermitian matrix
  keeps its inertia under conjugation, by `Matrix.IsHermitian.signature_map_starRingEnd`.
* M0.14: `detPoly_sheaf`, `detPoly_sheaf_restrict`, `detPoly_basis_indep`,
  `detPoly_baseChange`, `detPoly_exact`, `detPoly_homogeneous`,
  `detPoly_eq_polyCharpoly`.
* M0.15: `detPoly_classifies_charZero`.
* M0.18: `SatisfiesDetCondition.iff_eval`.
* M0.21: `bpsSignatureConstancy` orders `σ, σ̄` above `τ` and selects `π_i^+` only in type A.
  Type C has `F = F₀`, one extension of `τ`, and constant multiplicity `dim_ℚ U_ℚ / (2nd)`.
* M0.25–M0.27: `τ_∞ : F ↪ ℂ` is the fixed coefficient embedding and
  `τ̄_∞ = τ_∞|_{F⁺}` its real restriction. In `psiField Ψ`, the factor `F` is `τ_∞(F)`,
  so both `tauPart τ_∞` and `tauPart τ_∞^c` are defined over a `ℤ_p^Ψ`-scheme.
  Other embeddings may require a larger coefficient ring. In Check `tauComposite_mixedQuartic`,
  `F = ℚ(α)` with `α² = −3 − √2` at `p = 17` has two degree-one primes and one degree-two prime.
  For `Ψ = 2τ₀ + 0τ₀^c + τ₁ + τ₁^c`, choosing coefficient embedding `τ₀` gives
  `psiField Ψ = ℚ₁₇`; choosing `τ₁` gives the unramified quadratic extension.
* M1.4: `symplecticIsomSheaf` is a pro-object in finite étale schemes, with the pro-constant
  source coefficients `(L/nL)_S` and `((ℤ/n)(1))_S`. Its geometric fibre is the profinite limit
  of the finite fibres. `symplecticIsomSheaf.reduce` projects to the liftable finite pairs;
  `symplecticIsomSheaf.baseChange` is termwise pullback, with monodromy supplied by
  EtaleCohomologyFoundations §F.0.2 `VanishingCycles.finiteEtaleGaloisCategory`.
* M1.6: `rationalLevel_not_integral` uses the principal genus-one datum over `ℂ`, `□ = {2}`,
  `H = GL₂(Ẑ^□)` and `λ = 3λ_can`. Every marking `(α₀h,3ν₀ det(h))` in the rational
  orbit preserves the linear Tate lattice; its multiplier sends `ℤ₃(1)` onto `3T₃G_m`.
  Thus it fails the two-lattice criterion `RelativeRationalLevel.integral_iff`.
* M1.10: `primeToLatticeRealization` realizes a monodromy-stable, `O`-stable open compact
  prime-to-`□` Tate lattice by an abelian scheme and a unit of `RelativeLocalizedHom ℤ_(□)`.
  The base is connected and locally noetherian, with residue characteristics zero or in `□`.
  For abelian schemes over this base, `localizedHom_integral_of_tate` identifies actual morphisms
  among localized Hom sections by integral Tate-lattice inclusion. Applying it to a quasi-isogeny
  and its inverse gives the isomorphism in the full-faithfulness of `isoIsogenyComparison`.
  Over `ℂ`, for `□ = {2}`, the lattice `3T^□A` is realized by `id_A/3`; no actual isogeny
  in the same direction maps its `3`-adic part onto the target integral Tate module.
* M1.11: `changeOfPrimes_openClosed` is the representable clopen immersion
  `M_H → M_{H′} ×_{S₀′} S₀` for good sets `□ ⊆ □′` and
  `H = H′ × ∏_{p∈□′∖□} G(ℤ_p)`. Self-dual-lattice uniqueness makes it an equivalence;
  the immersion itself also applies in type D and supplies M2.8's liftability locus.
* M1.14: `toSiegel_g1` counts distinct underlying CM `j`-invariants by `h(O_K)` over an
  algebraically closed field of characteristic zero. Good positive-characteristic geometric
  fibres retain finiteness, allowing collisions: for `K = ℚ(√−23)` over `𝔽̄₅` the set is `{0}`,
  although `h(O_K) = 3`. The finite unramified assertion `toSiegel_finite` holds on the good base.
* M2.5–M2.6: `deformation_prorepresentable` and `formalSmoothness` use a fixed compatible
  complete Noetherian local coefficient ring `Λ` with residue `k`, and local `Λ`-linear maps
  inducing the identity on `k`. The standard choices are `Λ = k` in characteristic zero and
  `Λ = W(k)` for perfect `k` at a good prime. Power-series rings and completed-chart comparisons
  retain these coefficient and residue maps, with a specified base change for larger residue fields.
  Uniqueness of lifts uses Lan, Lemma 2.2.2.1 and Corollaries 2.2.2.6–2.2.2.7;
  Corollary 2.2.2.10 and Propositions 2.2.3.7 and 2.2.3.9 give the prorepresentable
  subfunctors. Their injective relative tangent maps make the complete representing rings
  quotients, giving the closed immersions.
* M2.12: `unitaryDeformation` distinguishes the fixed complex coefficient embedding `τ_∞`
  from its real restriction `τ̄_∞` and assumes extremality away from `τ̄_∞`.
  Its base is `ℤ_p^Ψ`, whose definition includes `τ_∞(F)`, so the two displayed crystalline
  parts exist. The proof decomposes all components after finite étale base change to
  `ℤ_p^◇` and descends the uniquely forced extremal components together with the given pair.
  Check `unitaryDeformation_dimension` assumes `τ_∞ ∈ Φ`;
  Check `unitaryDeformation_mixedSplitting` uses the quartic type of M0.27 with `τ_∞ = τ₁`
  and coefficient ring `O_{K₂}`, where both distinguished parts are defined.
* M2.16: `covariantHodgeCocharacter` complements the weights of M0.12's Shimura cocharacter
  embedding by embedding, has multiplier `z`, and preserves its reflex field.
  `averagedHodgeCocharacter` averages the dominant representative of this covariant cocharacter
  for the local based Galois action. `pelNewtonPoint` uses unscaled covariant `F` with weights
  in `[0,1]`, and `IsMuOrdinary` equates it with that average. For split Gaussian CM at `5`,
  with `τ` in `Lie A`, the labelled Hodge weights are `(1,0)` and the covariant Hodge and Newton
  weights are `(0,1)`; the torus Weyl group cannot exchange them.
* M3.2: `unitaryCentre_sha_vanishing` applies to a simple type-A datum of hermitian rank
  `n ≥ 1`, with CM centre `F/F₀`. For the norm-one torus `D₁`, the finite centre is
  `Z₀ = Z(G^der) = D₁[n]`; its character module is induced from `ℤ/n` with quadratic sign
  action. Shapiro, inflation–restriction and an inert place give `Ш¹(ℚ,X^*(Z₀)) = 0`.
  ArithmeticGaloisDuality R02.4.6's finite all-place Sha duality gives `Ш²(ℚ,Z₀) = 0`.
  In `hasseCases` with `n` odd, the resulting lift through `Z → D` is locally trivial
  because multiplication by `n` is invertible on the local `2`-torsion `H¹(ℚ_v,D₁)`.
  The rank-three imaginary-quadratic Check has `Z₀,ℚ̄ ≅ μ₃` and geometric character
  module `ℤ/3`; rank one is trivial, and an inert place detects the possible rank-two
  class in `H¹(Gal(F/ℚ),ℤ/2)`.
* M3.5: `PELModuli.periodMap` constructs holomorphic maps from locally marked Betti homology
  and the universal family's Hodge filtration on an analytified étale atlas. The pairing, order
  action and locally constant level are retained. Changing markings and atlas overlaps descends
  the maps and their structure-sheaf pullbacks. M3.4 gives bijectivity and M2.10 identifies its
  differential with an isomorphism, so the analytic inverse theorem gives `uniformization`.
  M3.7 extends this construction using its full-group point classification in type D.
  In `uniformization_g1`, the frame `(1/n,aτ/n)` has PEL pairing `ζ_n^a` and equation
  pairing `ζ_n^(−a)`; at `n = 3`, `a = 2`, `τ = i`, these are `ζ₃²` and `ζ₃`.
* M4.3: `canonicalModel` includes semisimple type-A/C data with a common multiplier. It uses
  `cmReciprocity` on each inner datum, dense Hecke orbits and disjoint special reflex fields for
  descent, and canonical-model uniqueness. `twist` and `adelicTwist` give the additional
  piece transport for simple type-A algebras of odd hermitian rank.
* M4.5: `normalizedModel` uses relative normalization and its integral-factorization property
  `Scheme.Hom.normalizationDesc`, with quasi-compactness and quasi-separatedness of the cover
  map; `Scheme.Hom.normalization.hom_ext` gives uniqueness and
  `Scheme.Hom.normalizationPullback` gives smooth base change. Its Hecke extension concerns
  prime-to-`p` correspondences over the good models.
* M4.6: `normalizedModel_finite_normal_flat` uses normality of the finite étale generic
  cover over the smooth good-level generic model. Integral closure in this normal algebra
  agrees with closure in its product of function fields. For `ℚ[t²] ⊆ ℚ[t²,t³]`, relative
  closure in the reduced cusp algebra is the nonnormal cusp algebra itself, whereas closure
  in `ℚ(t)` is `ℚ[t]` (Check `normalizedModel_requires_normal_cover`).
* M5.2: `siegelModuli` is a stack at arbitrary positive level. For `n ≥ 3` its characteristic-zero
  fibre is a quasi-projective fine scheme; at every `n ≥ 1` the characteristic-zero coarse space
  is a quasi-projective scheme with the ordinary Siegel analytic quotient. Universal families
  live on the stack and on fine spaces.
* M5.3: `genusOneComparison` keeps `(P,Q) = (α_n(e₁),α_n(f₁))` and uses
  `e_n^MC(P,Q) = (e_n^pol(P,Q))⁻¹ = ν_n(1)⁻¹`. The fibre `ν_n(1) = ζ` is
  `Y(n,ζ⁻¹)`; determinant basis changes act on both pairings by the same exponent.
  `genusOne_complex` at `n = 3`, `τ = i` gives equation pairing `ζ₃⁻¹` on `(1/3,i/3)`;
  `genusOne_sign` inverts both pairings upon swapping the frame.
* M5.4: `hilbertRationalDatum`, `hilbertTraceEmbedding`,
  `hilbertTraceEmbedding_injective`, `hilbertTraceEmbedding_multiplier`,
  `hilbertTraceEmbedding_h`.
* M6.7: `descentObstruction` part (b) defines the étale gerbe `𝒢_x` for a perfect field `k` and
  `x ∈ M_H^c(k)`, so a finite algebraic lifting field is separable. Part (a), classifying forms
  split by a finite Galois extension, holds over arbitrary fields.
  M6.10 `PELModuli.export_obstruction` carries the same perfect-field hypothesis.
  Check `forms_twist_nontrivial` assumes `E/ℚ` elliptic, `j(E) ∉ {0,1728}` and
  `d ∈ ℚ^× ∖ ℚ^{×2}`. Check `forms_twist_exceptional` takes `y² = x³ − x` and `d = −1`:
  its short-Weierstrass twist is the same equation, and its discriminant-`−4` trace/norm
  representative `y² = x³ − 16x` is isomorphic via `(x,y) ↦ (4x,8y)`.
  The forms classification keeps the full automorphism group at exceptional j-invariants.

The affine determinant polynomial is stated above. Its sheaf construction,
the order and dual-lattice APIs, and their remaining Checks are README targets; this list does
not introduce additional Lean declarations.
-/

end TauCetiRoadmap.PELModuli
