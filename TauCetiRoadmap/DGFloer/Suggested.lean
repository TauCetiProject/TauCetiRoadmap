module

public import Mathlib
public import TauCeti.Algebra.Homology.DG.Module.Right.Defs
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.Geometry.Manifold.Flow.Basic
public import TauCeti.Geometry.Manifold.Flow.TimeDependent
public import TauCeti.Geometry.Symplectic.Hamiltonian.Integrable
public import TauCeti.Geometry.Symplectic.Manifold.TwoForm
public import TauCeti.Geometry.Symplectic.SymplecticTransport

/-!
# Morse and Floer homology with DG local coefficients: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, together with the
few definitions needed to state them. Discharging the statements here finishes neither a layer
nor the roadmap.

Stated here:

* the twisted complex of a twisting cocycle over a DG algebra (README Layer 4 items 1–2): the
  twisted differential of a DG right module squares to zero and raises the total degree by one;
* the mod-2 vanishing theorem (README Layer 1 item 4): a simply connected space with vanishing
  reduced mod-2 singular homology has uniquely 2-divisible higher homotopy groups;
* Hamiltonian vector fields, the Poisson bracket, symplectic maps and linearized flows (README
  Layer 6 item 0): the statements of the Hamiltonian formalism that the pinned Tau Ceti has only
  in finite dimension, or not at all, on the pinned carriers `TauCeti.SmoothTwoForm`,
  `TauCeti.SmoothTwoForm.IsHamiltonianVectorField`, `TauCeti.SmoothTwoForm.hamiltonianVectorField`,
  `TauCeti.SmoothTwoForm.poissonBracket`, `TauCeti.SmoothTwoForm.IsFirstIntegral`,
  `TauCeti.SmoothForm.mpullback`, `TauCeti.flowOf` and `TauCeti.timeDependentFlowOf`. The pinned
  results they extend are consumed by name: `isHamiltonianVectorField_iff_interior_eq`,
  `hamiltonianVectorField_add`, `hamiltonianVectorField_const_smul`, `hamiltonianVectorField_comp`,
  `isHamiltonianVectorField_iff_eq`, `contMDiff_hamiltonianVectorField_uncurry`,
  `apply_eq_of_isMIntegralCurveOn`, `neg_poissonBracket`, `poissonBracket_eq_mvfderiv`,
  `poissonBracket_jacobi`, `mlieBracket`, `apply_maximalIntegralCurve`,
  `mfderiv_hamiltonianVectorField_comp`, `poissonBracket_comp`,
  `isMIntegralCurve_comp_hamiltonianVectorField`, `mpullback_globalFlow`, `eval₂_mpullback`,
  `mpullback_subtype_val`, `tangentSpaceOpenEquiv`, `hamiltonianVectorField_constSmooth`,
  `apply_eq_of_mvfderiv_apply_eq_zero`, `hasDerivAt_comp_curve`, `contMDiffOn_flowOf`,
  `contMDiffOn_timeDependentFlowOf`, `hasMFDerivAt_timeDependentFlowOf`,
  `timeDependentFlowOf_trans_of_mem`, `isNondegenerate_iff_isInvertible_flat`. Strong
  nondegeneracy is the unbundled hypothesis that every flat map `σ.flat x` is onto, the hypothesis
  of the contraction inverse of HeegaardFloer F2.1;
* the torus criterion (README Layer 11 item 3): a compact connected Lie group is aspherical
  exactly when it is a torus;
* Lemma 3.41 of the source (README Layer 10 item 4): a path-connected space is aspherical
  exactly when its double loop space has the integral homology of a point.

Not statable at the pins, each with the carrier it lacks:

* Theorems A and C (contractible almost existence on hypersurfaces of `T*Q`, README Layer 10
  item 5): closed characteristics of a hypersurface and 1-periodic orbits of a time-dependent
  Hamiltonian flow on a symplectic manifold; at the pins `cotangentSymplecticForm` lives on the
  model space only.
* Theorems L and M (capacity bounds, README Layer 10 items 1–2): the relative and
  `π₁`-sensitive Hofer–Zehnder capacities and the spectral invariants.
* Theorem J and the comparison `FH_*(X; 𝓕) ≅ H_{*+n}(X; i_X^*𝓕)` (README Layer 8 item 6):
  the Hamiltonian Floer complex, hence moduli spaces of Floer cylinders.
* Theorem K, the DG Viterbo isomorphism (README Layer 9 item 3): symplectic homology `SH_*` and
  DG Morse homology of the free loop space.
* The fibration theorem `H_*(B; C_*(F')) ≅ H_*(E)` (README Layer 5 item 4): the DG Morse
  complex, hence compactified Morse trajectory spaces with corners and the DG algebra of cubical
  chains on Moore loops.
* The Arnold bound on contractible 1-periodic orbits (README Layer 7.C.6g): nondegenerate
  1-periodic orbits of a time-dependent Hamiltonian flow and `c₁` on spherical classes.
* The degree-one Hurewicz isomorphism (README Layer 1 item 1): AlgebraicTopology Stage 8.3's
  Hurewicz map on native singular homology, of which the theorem asserts bijectivity.
* The Serre spectral sequences (README Layer 1 item 2): the local system of fibre homology of a
  Serre fibration, the coefficient system of `E²`. The pinned Tau Ceti has the Serre-fibration
  predicate `TauCeti.TopCat.serreFibrations` and the spectral sequence of a filtered space
  `TauCeti.filteredSpaceSpectralSequence`, but its fibre-homology local system
  `TauCeti.fiberLocalSystem` is built from a lifting function of a Hurewicz fibration, and no
  fibre-homology local system of a Serre fibration is at the pins.
* The Floer–Novikov torsion invariant (README Layer 7.T.8): Floer complexes over Novikov rings.

In Layer 4, `P → M` stands for `M ⊗_A K_m`, where `K_m` is the twisted complex of free left
modules of the README; the coefficient `m x y` acts on the right of `α`. The twisting equation is
written in the source's homological sign convention on a cohomologically graded algebra, through
the grading bridge `C^{-n} = C_n` of the README (standing conventions).
-/

@[expose] public section

namespace TauCetiRoadmap.DGFloer

universe u

open scoped unitInterval ContDiff

/-! ## Layer 1: topological prerequisites -/

open scoped Topology in
/-- **Mod-2 vanishing** (README Layer 1 item 4). A simply connected space `Y` whose singular
homology with coefficients in the abelian group `ℤ/2` vanishes in every positive degree has
every higher homotopy group uniquely 2-divisible: squaring is a bijection on `π_{n+2}(Y, y)`.
The coefficients are Mathlib's singular homology with values in `ModuleCat ℤ`, evaluated on the
`ℤ`-module `ZMod 2`, lifted to the universe of `Y`. The proof is the one-step lemma of the
README, iterated through the Whitehead tower, with the mod-2 Serre spectral sequence and the
vanishing of `H̃_*(K(A, n); 𝔽₂)` for a `ℤ[1/2]`-module `A`. -/
theorem bijective_sq_homotopyGroup_of_mod_two_acyclic (Y : TopCat.{u}) [SimplyConnectedSpace Y]
    (hY : ∀ n : ℕ, 1 ≤ n → Subsingleton
      (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
        (ModuleCat.of ℤ (ULift.{u} (ZMod 2)))).obj Y))
    (n : ℕ) (y : Y) : Function.Bijective (fun a : π_ (n + 2) Y y ↦ a ^ 2) := sorry

/-! ## Layer 4: twisting cocycles and the twisted complex -/

section Twisting

variable {R A : Type*} [CommRing R] [Ring A] [Algebra R A]
  {𝒜 : ℤ → Submodule R A} [GradedAlgebra 𝒜] {d : A →ₗ[R] A}

/-- A **twisting cocycle** over the DG algebra `(𝒜, d)` on a finite set `P` of generators
graded by `ind` (README Layer 4 item 1). In homological notation `m x y` has degree
`ind x - ind y - 1`, so under the grading bridge it lies in cohomological degree
`ind y - ind x + 1`. The twisting equation is the source's
`∂m_{x,y} = Σ_z (-1)^{ind x - ind z} m_{x,z} m_{z,y}`.

The one-sidedness condition is part of the data: it does not follow from the degree and the
twisting equation over an arbitrary DG algebra (README Layer 4 item 1), but it is automatic over
a cohomologically nonpositive algebra. -/
structure TwistingCocycle (h : TauCeti.IsDGAlgebra 𝒜 d) (P : Type*) [Fintype P] (ind : P → ℤ)
    where
  /-- The coefficient of `y` in the twisted differential of `x`. -/
  m : P → P → A
  mem_graded : ∀ x y, m x y ∈ 𝒜 (ind y - ind x + 1)
  twisting : ∀ x y, d (m x y) = ∑ z, (ind x - ind z).negOnePow • (m x z * m z y)
  /-- Strict upper-triangularity for the order by `ind`. -/
  one_sided : ∀ x y, ind x ≤ ind y → m x y = 0

variable {M : Type*} [AddCommGroup M] [Module R M] [Module Aᵐᵒᵖ M]

/-- The **grading involution** `α ↦ (-1)^{|α|} α` of an internally graded module: on the
homogeneous piece of degree `q` it is multiplication by `(-1)^q`, through the decomposition
`M ≃ ⨁ ℳ q`. It carries the Koszul sign of the twisted differential. -/
noncomputable def gradingInvolution (ℳ : ℤ → Submodule R M) [DirectSum.Decomposition ℳ] :
    M →ₗ[R] M :=
  (DirectSum.decomposeLinearEquiv ℳ).symm.toLinearMap ∘ₗ
    DirectSum.lmap (fun q : ℤ ↦ q.negOnePow • (LinearMap.id : ℳ q →ₗ[R] ℳ q)) ∘ₗ
    (DirectSum.decomposeLinearEquiv ℳ).toLinearMap

/-- The twisted complex `M ⊗_A K_m`, with `M ⊗ ⟨P⟩` identified with `P → M`, is graded in total
degree `n` by `f x ∈ ℳ (n + ind x)`: the generator `x` sits in cohomological degree `-ind x`. -/
def totalGrading (ℳ : ℤ → Submodule R M) {P : Type*} (ind : P → ℤ) (n : ℤ) :
    Submodule R (P → M) where
  carrier := {f | ∀ x, f x ∈ ℳ (n + ind x)}
  add_mem' hf hg x := add_mem (hf x) (hg x)
  zero_mem' _ := zero_mem _
  smul_mem' c _ hf x := Submodule.smul_mem _ c (hf x)

variable {h : TauCeti.IsDGAlgebra 𝒜 d} {P : Type*} [Fintype P] {ind : P → ℤ}
  {ℳ : ℤ → Submodule R M}

/-- The twisted differential on `M ⊗_A K_m`, identified with `P → M` (README Layer 4 item 2).
Its `y`-component is `(D f) y = ∂(f y) + Σ_x (m_{x,y} acting on the right) (ε (f x))`, where
`ε = gradingInvolution ℳ` carries the Koszul sign. On a homogeneous elementary tensor this is
`D(α ⊗ x) = ∂α ⊗ x + (-1)^{|α|} Σ_y α · m_{x,y} ⊗ y`. The right `A`-action on `M` enters the
construction itself, so the map depends on it (README Layer 4 item 2, Checks).

`R`-linearity needs the two actions on `M` to commute, `[SMulCommClass R Aᵐᵒᵖ M]`; the instance
is bound on the definition and used in `map_smul'`, so it is retained in the signature. -/
noncomputable def twistedDifferential [SMulCommClass R Aᵐᵒᵖ M] (m : TwistingCocycle h P ind)
    (ℳ : ℤ → Submodule R M) [DirectSum.Decomposition ℳ] (dM : M →ₗ[R] M) :
    (P → M) →ₗ[R] (P → M) where
  toFun f y := dM (f y) + ∑ x, MulOpposite.op (m.m x y) • gradingInvolution ℳ (f x)
  map_add' f g := by
    funext y
    simp only [Pi.add_apply, map_add, smul_add, Finset.sum_add_distrib]
    abel
  map_smul' r f := by
    funext y
    simp only [Pi.smul_apply, map_smul, RingHom.id_apply, smul_add, Finset.smul_sum, smul_comm r]

/-- The twisted differential raises the total degree by one when `M` is a DG right module
(README Layer 4 item 2). -/
theorem twistedDifferential_mem_totalGrading [IsScalarTower R Aᵐᵒᵖ M] [SMulCommClass R Aᵐᵒᵖ M]
    [SetLike.GradedSMul (TauCeti.InternalGrading.ofDecomposition 𝒜).opposite.piece ℳ]
    [DirectSum.Decomposition ℳ] (m : TwistingCocycle h P ind) {dM : M →ₗ[R] M}
    (hM : TauCeti.IsDGRightModule h ℳ dM) {n : ℤ} {f : P → M} (hf : f ∈ totalGrading ℳ ind n) :
    twistedDifferential m ℳ dM f ∈ totalGrading ℳ ind (n + 1) := sorry

/-- The twisted differential squares to zero when `M` is a DG right module: `D² = 0` is the
twisting equation together with the right Leibniz rule (README Layer 4 item 2). -/
theorem twistedDifferential_sq [IsScalarTower R Aᵐᵒᵖ M] [SMulCommClass R Aᵐᵒᵖ M]
    [SetLike.GradedSMul (TauCeti.InternalGrading.ofDecomposition 𝒜).opposite.piece ℳ]
    [DirectSum.Decomposition ℳ] (m : TwistingCocycle h P ind) {dM : M →ₗ[R] M}
    (hM : TauCeti.IsDGRightModule h ℳ dM) (f : P → M) :
    twistedDifferential m ℳ dM (twistedDifferential m ℳ dM f) = 0 := sorry

end Twisting

/-! ## Layer 6: Hamiltonian vector fields, symplectic maps and linearized flows -/

section Hamiltonian

open TauCeti
open scoped Manifold Topology

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I₀ : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I₀ ∞ M]
  {θ : SmoothTwoForm I₀ M} {f g k : M → ℝ} {X Y Z : (x : M) → TangentSpace I₀ x}

/-- **Uniqueness of Hamiltonian vector fields** (README Layer 6 item 0). For a weakly
nondegenerate two-form on a manifold modelled on any real normed space, a function has at most
one Hamiltonian vector field. -/
theorem SmoothTwoForm.IsNondegenerate.eq_of_isHamiltonianVectorField (hθ : θ.IsNondegenerate)
    (hX : θ.IsHamiltonianVectorField f X) (hY : θ.IsHamiltonianVectorField f Y) : X = Y := sorry

/-- **Zeros of a Hamiltonian vector field** (README Layer 6 item 0). For a weakly nondegenerate
form, a Hamiltonian vector field of `f` vanishes exactly at the critical points of `f`. -/
theorem SmoothTwoForm.IsHamiltonianVectorField.apply_eq_zero_iff (hθ : θ.IsNondegenerate)
    (hX : θ.IsHamiltonianVectorField f X) (x : M) : X x = 0 ↔ mvfderiv I₀ f x = 0 := sorry

/-- Hamiltonian vector fields of differentiable functions add (README Layer 6 item 0). No
nondegeneracy is needed. -/
theorem SmoothTwoForm.IsHamiltonianVectorField.add (hX : θ.IsHamiltonianVectorField f X)
    (hY : θ.IsHamiltonianVectorField g Y) (hf : MDifferentiable I₀ 𝓘(ℝ) f)
    (hg : MDifferentiable I₀ 𝓘(ℝ) g) :
    θ.IsHamiltonianVectorField (f + g) (fun x ↦ X x + Y x) := sorry

/-- Hamiltonian vector fields scale with their Hamiltonian (README Layer 6 item 0). -/
theorem SmoothTwoForm.IsHamiltonianVectorField.const_smul (hX : θ.IsHamiltonianVectorField f X)
    (c : ℝ) : θ.IsHamiltonianVectorField (c • f) (fun x ↦ c • X x) := sorry

/-- **The Leibniz rule for Hamiltonian vector fields** (README Layer 6 item 0): `F • Y + G • X`
is a Hamiltonian vector field of `F * G`. No nondegeneracy is needed. -/
theorem SmoothTwoForm.IsHamiltonianVectorField.mul (hX : θ.IsHamiltonianVectorField f X)
    (hY : θ.IsHamiltonianVectorField g Y) (hf : MDifferentiable I₀ 𝓘(ℝ) f)
    (hg : MDifferentiable I₀ 𝓘(ℝ) g) :
    θ.IsHamiltonianVectorField (f * g) (fun x ↦ f x • Y x + g x • X x) := sorry

/-- The Leibniz rule for the Hamiltonian vector field `(θ♭)⁻¹ df` of the pinned Tau Ceti, at a
point where both functions are differentiable (README Layer 6 item 0). -/
theorem SmoothTwoForm.hamiltonianVectorField_mul {x : M} (hf : MDifferentiableAt I₀ 𝓘(ℝ) f x)
    (hg : MDifferentiableAt I₀ 𝓘(ℝ) g x) :
    θ.hamiltonianVectorField (f * g) x =
      f x • θ.hamiltonianVectorField g x + g x • θ.hamiltonianVectorField f x := sorry

/-- **Locality** (README Layer 6 item 0): the Hamiltonian vector field at `x` depends only on the
germ of the function at `x`. -/
theorem SmoothTwoForm.hamiltonianVectorField_congr_of_eventuallyEq {x : M} (h : f =ᶠ[𝓝 x] g) :
    θ.hamiltonianVectorField f x = θ.hamiltonianVectorField g x := sorry

/-- A function is **Hamiltonian** for `θ` when it is smooth and has a smooth Hamiltonian vector
field (README Layer 6 item 0). -/
def SmoothTwoForm.IsHamiltonian (θ : SmoothTwoForm I₀ M) (f : M → ℝ) : Prop :=
  ContMDiff I₀ 𝓘(ℝ) ∞ f ∧ ∃ X : (x : M) → TangentSpace I₀ x,
    ContMDiff I₀ I₀.tangent ∞ (fun x ↦ (⟨x, X x⟩ : TangentBundle I₀ M)) ∧
      θ.IsHamiltonianVectorField f X

/-- For a strongly nondegenerate form on a Banach manifold, every smooth function is Hamiltonian
(README Layer 6 item 0), through the contraction inverse of HeegaardFloer F2.1. -/
theorem SmoothTwoForm.isHamiltonian_iff_contMDiff [CompleteSpace E]
    (hθ : ∀ x, Function.Surjective (θ.flat x)) :
    SmoothTwoForm.IsHamiltonian θ f ↔ ContMDiff I₀ 𝓘(ℝ) ∞ f := sorry

/-- The Poisson bracket `{f, g} = θ(X_f, X_g)` of the pinned Tau Ceti is the derivative of `f`
along `X_g` for a strongly nondegenerate form on a Banach manifold (README Layer 6 item 0). -/
theorem SmoothTwoForm.poissonBracket_eq_mvfderiv_of_surjective_flat [CompleteSpace E]
    (hθ : ∀ x, Function.Surjective (θ.flat x)) (f g : M → ℝ) (x : M) :
    θ.poissonBracket f g x = mvfderiv I₀ f x (θ.hamiltonianVectorField g x) := sorry

/-- **The Leibniz rule for the Poisson bracket** in its first argument (README Layer 6 item 0). -/
theorem SmoothTwoForm.poissonBracket_mul_left {x : M} (hf : MDifferentiableAt I₀ 𝓘(ℝ) f x)
    (hg : MDifferentiableAt I₀ 𝓘(ℝ) g x) :
    θ.poissonBracket (f * g) k x =
      f x * θ.poissonBracket g k x + g x * θ.poissonBracket f k x := sorry

/-- **The Leibniz rule for the Poisson bracket** in its second argument (README Layer 6 item 0). -/
theorem SmoothTwoForm.poissonBracket_mul_right {x : M} (hf : MDifferentiableAt I₀ 𝓘(ℝ) f x)
    (hg : MDifferentiableAt I₀ 𝓘(ℝ) g x) :
    θ.poissonBracket k (f * g) x =
      f x * θ.poissonBracket k g x + g x * θ.poissonBracket k f x := sorry

/-- The Poisson bracket of two `C^(n+1)` functions is `C^n` for a strongly nondegenerate form on a
Banach manifold (README Layer 6 item 0). -/
theorem SmoothTwoForm.contMDiff_poissonBracket_of_surjective_flat [CompleteSpace E]
    (hθ : ∀ x, Function.Surjective (θ.flat x)) {n : WithTop ℕ∞} (hn : n ≤ ∞)
    (hf : ContMDiff I₀ 𝓘(ℝ) (n + 1) f) (hg : ContMDiff I₀ 𝓘(ℝ) (n + 1) g) :
    ContMDiff I₀ 𝓘(ℝ) n (θ.poissonBracket f g) := sorry

/-- **Constancy along an integral curve on a preconnected set of times** (README Layer 6 item 0).
If `df(X) = 0` along an integral curve `γ` of `X` at every time of a preconnected subset `T` of an
open set of times `s`, then `f ∘ γ` is constant on `T`. The values on two components of `s` need
not agree. -/
theorem IsMIntegralCurveOn.apply_eq_of_isPreconnected {γ : ℝ → M} {s T : Set ℝ}
    (hγ : IsMIntegralCurveOn γ X s) (hs : IsOpen s) (hT : IsPreconnected T) (hTs : T ⊆ s)
    (hf : ∀ t ∈ T, MDifferentiableAt I₀ 𝓘(ℝ) f (γ t))
    (h0 : ∀ t ∈ T, mvfderiv I₀ f (γ t) (X (γ t)) = 0) {t₁ t₂ : ℝ} (ht₁ : t₁ ∈ T) (ht₂ : t₂ ∈ T) :
    f (γ t₁) = f (γ t₂) := sorry

/-- **Evolution of an observable** (README Layer 6 item 0): along an integral curve of `X_g`,
`f ∘ γ` has derivative `{f, g}`, for a strongly nondegenerate form on a Banach manifold. -/
theorem SmoothTwoForm.hasDerivAt_comp_of_isMIntegralCurveOn [CompleteSpace E]
    (hθ : ∀ x, Function.Surjective (θ.flat x)) {γ : ℝ → M} {s : Set ℝ}
    (hγ : IsMIntegralCurveOn γ (θ.hamiltonianVectorField g) s) (hs : IsOpen s) {t : ℝ}
    (ht : t ∈ s) (hf : MDifferentiableAt I₀ 𝓘(ℝ) f (γ t)) :
    HasDerivAt (f ∘ γ) (θ.poissonBracket f g (γ t)) t := sorry

/-- **First integrals** (README Layer 6 item 0). On a boundaryless Banach manifold with a strongly
nondegenerate form, a differentiable `f` Poisson-commutes with a `C²` Hamiltonian `g` exactly when
`f` is constant along every integral curve of `X_g` on an open interval. -/
theorem SmoothTwoForm.isFirstIntegral_iff_forall_isMIntegralCurveOn [CompleteSpace E]
    [BoundarylessManifold I₀ M] (hθ : ∀ x, Function.Surjective (θ.flat x))
    (hg : ContMDiff I₀ 𝓘(ℝ) 2 g) (hf : MDifferentiable I₀ 𝓘(ℝ) f) :
    θ.IsFirstIntegral g f ↔ ∀ (γ : ℝ → M) (a b : ℝ),
      IsMIntegralCurveOn γ (θ.hamiltonianVectorField g) (Set.Ioo a b) →
        ∀ t₁ ∈ Set.Ioo a b, ∀ t₂ ∈ Set.Ioo a b, f (γ t₁) = f (γ t₂) := sorry

/-- **Poisson's theorem** (README Layer 6 item 0). For a closed two-form, with no nondegeneracy,
let `X`, `Y`, `Z` be Hamiltonian vector fields of the `C²` functions `f`, `g`, `k`, with `X` and
`Y` differentiable. If `f` and `g` are stationary along `Z`, so is `θ(X, Y)`. -/
theorem SmoothTwoForm.IsHamiltonianVectorField.mvfderiv_eval₂_eq_zero [CompleteSpace E]
    (hθ : θ.IsClosed) (hX : θ.IsHamiltonianVectorField f X) (hY : θ.IsHamiltonianVectorField g Y)
    (hZ : θ.IsHamiltonianVectorField k Z) (hf : ContMDiff I₀ 𝓘(ℝ) 2 f)
    (hg : ContMDiff I₀ 𝓘(ℝ) 2 g) (hk : ContMDiff I₀ 𝓘(ℝ) 2 k)
    (hX' : MDifferentiable I₀ I₀.tangent (fun y ↦ (X y : TangentBundle I₀ M)))
    (hY' : MDifferentiable I₀ I₀.tangent (fun y ↦ (Y y : TangentBundle I₀ M)))
    (hfZ : ∀ y, mvfderiv I₀ f y (Z y) = 0) (hgZ : ∀ y, mvfderiv I₀ g y (Z y) = 0) (x : M) :
    mvfderiv I₀ (fun y ↦ SmoothBundleForm.eval₂ θ y (X y) (Y y)) x (Z x) = 0 := sorry

section SymplecticMaps

variable {E' H' M' : Type*} [NormedAddCommGroup E'] [NormedSpace ℝ E'] [TopologicalSpace H']
  {I₁ : ModelWithCorners ℝ E' H'} [TopologicalSpace M'] [ChartedSpace H' M'] [IsManifold I₁ ∞ M']
  {θ₁ : SmoothTwoForm I₁ M'} {φ : M → M'}

/-- A map `φ` is a **symplectic map** from `θ` to `θ₁` when `θ₁(dφ v, dφ w) = θ(v, w)` for all
tangent vectors (README Layer 6 item 0). The model spaces may differ. -/
def SmoothTwoForm.IsSymplecticMap (θ : SmoothTwoForm I₀ M) (θ₁ : SmoothTwoForm I₁ M')
    (φ : M → M') : Prop :=
  ∀ (x : M) (v w : TangentSpace I₀ x),
    SmoothBundleForm.eval₂ θ₁ (φ x) (mfderiv I₀ I₁ φ x v) (mfderiv I₀ I₁ φ x w) =
      SmoothBundleForm.eval₂ θ x v w

/-- A smooth map is symplectic exactly when it pulls the target form back to the source form. -/
theorem SmoothTwoForm.isSymplecticMap_iff_mpullback_eq (hφ : ContMDiff I₀ I₁ ∞ φ) :
    SmoothTwoForm.IsSymplecticMap θ θ₁ φ ↔ SmoothForm.mpullback φ hφ θ₁ = θ := sorry

/-- The identity is a symplectic map. -/
theorem SmoothTwoForm.isSymplecticMap_id : SmoothTwoForm.IsSymplecticMap θ θ id := sorry

/-- Composites of differentiable symplectic maps are symplectic maps. -/
theorem SmoothTwoForm.IsSymplecticMap.comp {E'' H'' M'' : Type*} [NormedAddCommGroup E'']
    [NormedSpace ℝ E''] [TopologicalSpace H''] {I₂ : ModelWithCorners ℝ E'' H''}
    [TopologicalSpace M''] [ChartedSpace H'' M''] [IsManifold I₂ ∞ M'']
    {θ₂ : SmoothTwoForm I₂ M''} {ψ : M' → M''}
    (hψ : SmoothTwoForm.IsSymplecticMap θ₁ θ₂ ψ) (hφ : SmoothTwoForm.IsSymplecticMap θ θ₁ φ)
    (hψd : MDifferentiable I₁ I₂ ψ) (hφd : MDifferentiable I₀ I₁ φ) :
    SmoothTwoForm.IsSymplecticMap θ θ₂ (ψ ∘ φ) := sorry

/-- The differential of a symplectic map out of a weakly nondegenerate form is injective. -/
theorem SmoothTwoForm.IsSymplecticMap.injective_mfderiv (hθ : θ.IsNondegenerate)
    (hφ : SmoothTwoForm.IsSymplecticMap θ θ₁ φ) (x : M) :
    Function.Injective (mfderiv I₀ I₁ φ x) := sorry

/-- A **symplectomorphism** from `θ` to `θ₁` is a diffeomorphism that is a symplectic map
(README Layer 6 item 0): a predicate on the diffeomorphism. -/
def SmoothTwoForm.IsSymplectomorphism {n : ℕ∞ω} (θ : SmoothTwoForm I₀ M)
    (θ₁ : SmoothTwoForm I₁ M') (φ : M ≃ₘ^n⟮I₀, I₁⟯ M') : Prop :=
  SmoothTwoForm.IsSymplecticMap θ θ₁ φ

/-- The inverse of a symplectomorphism of class at least `C¹` is a symplectomorphism. -/
theorem SmoothTwoForm.IsSymplectomorphism.symm {n : ℕ∞ω} (hn : n ≠ 0) {φ : M ≃ₘ^n⟮I₀, I₁⟯ M'}
    (hφ : SmoothTwoForm.IsSymplectomorphism θ θ₁ φ) :
    SmoothTwoForm.IsSymplectomorphism θ₁ θ φ.symm := sorry

/-- **Transport of Hamiltonian vector fields** (README Layer 6 item 0). A differentiable
symplectic map whose differentials are all invertible, such as a symplectomorphism or the
inclusion of an open subset, pulls a Hamiltonian vector field of `h` back to a Hamiltonian vector
field of `h ∘ φ`. No nondegeneracy is needed. -/
theorem SmoothTwoForm.IsSymplecticMap.isHamiltonianVectorField_mpullback
    (hφ : SmoothTwoForm.IsSymplecticMap θ θ₁ φ) (hφd : MDifferentiable I₀ I₁ φ)
    (hφi : ∀ x, (mfderiv I₀ I₁ φ x).IsInvertible) {h : M' → ℝ}
    {V : (y : M') → TangentSpace I₁ y} (hh : ∀ x, MDifferentiableAt I₁ 𝓘(ℝ) h (φ x))
    (hV : θ₁.IsHamiltonianVectorField h V) :
    θ.IsHamiltonianVectorField (h ∘ φ) (VectorField.mpullback I₀ I₁ φ V) := sorry

/-- For a symplectomorphism, a field on the target is a Hamiltonian vector field of `h` exactly
when its pullback is a Hamiltonian vector field of `h ∘ φ`. -/
theorem SmoothTwoForm.IsSymplectomorphism.isHamiltonianVectorField_mpullback_iff {n : ℕ∞ω}
    (hn : n ≠ 0) {φ : M ≃ₘ^n⟮I₀, I₁⟯ M'} (hφ : SmoothTwoForm.IsSymplectomorphism θ θ₁ φ)
    {h : M' → ℝ} {V : (y : M') → TangentSpace I₁ y} (hh : MDifferentiable I₁ 𝓘(ℝ) h) :
    θ.IsHamiltonianVectorField (h ∘ φ) (VectorField.mpullback I₀ I₁ φ V) ↔
      θ₁.IsHamiltonianVectorField h V := sorry

/-- The differential of a symplectic map with invertible differentials carries the Hamiltonian
vector field of `h ∘ φ` to that of `h`, for a strongly nondegenerate target form on a Banach
manifold (README Layer 6 item 0). -/
theorem SmoothTwoForm.IsSymplecticMap.mfderiv_hamiltonianVectorField_comp [CompleteSpace E]
    [CompleteSpace E'] (hφ : SmoothTwoForm.IsSymplecticMap θ θ₁ φ) (hφd : MDifferentiable I₀ I₁ φ)
    (hφi : ∀ x, (mfderiv I₀ I₁ φ x).IsInvertible) (hθ₁ : ∀ y, Function.Surjective (θ₁.flat y))
    {h : M' → ℝ} {x : M} (hh : MDifferentiableAt I₁ 𝓘(ℝ) h (φ x)) :
    mfderiv I₀ I₁ φ x (θ.hamiltonianVectorField (h ∘ φ) x) = θ₁.hamiltonianVectorField h (φ x) :=
  sorry

/-- Symplectic maps with invertible differentials preserve Poisson brackets, for a strongly
nondegenerate target form on a Banach manifold (README Layer 6 item 0). -/
theorem SmoothTwoForm.IsSymplecticMap.poissonBracket_comp [CompleteSpace E] [CompleteSpace E']
    (hφ : SmoothTwoForm.IsSymplecticMap θ θ₁ φ) (hφd : MDifferentiable I₀ I₁ φ)
    (hφi : ∀ x, (mfderiv I₀ I₁ φ x).IsInvertible) (hθ₁ : ∀ y, Function.Surjective (θ₁.flat y))
    {h h' : M' → ℝ} {x : M} (hh : MDifferentiableAt I₁ 𝓘(ℝ) h (φ x))
    (hh' : MDifferentiableAt I₁ 𝓘(ℝ) h' (φ x)) :
    θ.poissonBracket (h ∘ φ) (h' ∘ φ) x = θ₁.poissonBracket h h' (φ x) := sorry

/-- Symplectic maps with invertible differentials carry integral curves of `X_{h ∘ φ}` to integral
curves of `X_h`, for a strongly nondegenerate target form on a Banach manifold (README Layer 6
item 0). -/
theorem SmoothTwoForm.IsSymplecticMap.isMIntegralCurveOn_comp [CompleteSpace E] [CompleteSpace E']
    (hφ : SmoothTwoForm.IsSymplecticMap θ θ₁ φ) (hφd : MDifferentiable I₀ I₁ φ)
    (hφi : ∀ x, (mfderiv I₀ I₁ φ x).IsInvertible) (hθ₁ : ∀ y, Function.Surjective (θ₁.flat y))
    {h : M' → ℝ} {γ : ℝ → M} {s : Set ℝ} (hh : ∀ t ∈ s, MDifferentiableAt I₁ 𝓘(ℝ) h (φ (γ t)))
    (hγ : IsMIntegralCurveOn γ (θ.hamiltonianVectorField (h ∘ φ)) s) :
    IsMIntegralCurveOn (φ ∘ γ) (θ₁.hamiltonianVectorField h) s := sorry

/-- The inclusion of an open subset is a symplectic map from the restricted form (README Layer 6
item 0). -/
theorem SmoothTwoForm.isSymplecticMap_subtype_val (U : TopologicalSpace.Opens M) :
    SmoothTwoForm.IsSymplecticMap
      (SmoothForm.mpullback (Subtype.val : U → M) contMDiff_subtype_val θ) θ Subtype.val := sorry

end SymplecticMaps

/-- **Linear symplectomorphisms** (README Layer 6 item 0). A linear symplectomorphism of
finite-dimensional symplectic vector spaces is a symplectomorphism of the constant forms. -/
theorem SymplecticForm.IsSymplectomorphism.isSymplectomorphism_constSmooth {V W : Type*}
    [NormedAddCommGroup V] [NormedSpace ℝ V] [FiniteDimensional ℝ V] [NormedAddCommGroup W]
    [NormedSpace ℝ W] [FiniteDimensional ℝ W] {θ₁ : SymplecticForm V} {θ₂ : SymplecticForm W}
    {e : V ≃ₗ[ℝ] W} (he : θ₁.IsSymplectomorphism θ₂ e) :
    SmoothTwoForm.IsSymplectomorphism θ₁.constSmooth θ₂.constSmooth
      e.toContinuousLinearEquiv.toDiffeomorph := sorry

/-- **The variational equation of a time-dependent flow** (README Layer 6 item 0). Let `X` be a
jointly `C¹` time-dependent vector field on a finite-dimensional boundaryless Hausdorff manifold,
and `((s, t₀), x)` in the domain of its flow `Φ_{s,t}`. Read in the extended chart at
`Φ_{s,t₀} x`, the tangent vector `dΦ_{s,t} w` solves, for `t` near `t₀`, the linear equation
`J'(t) = DX̃_t(Φ̃_{s,t} x) J(t)`, where `X̃_t` is the chart expression of `X t`. -/
theorem hasDerivAt_mfderiv_timeDependentFlowOf [FiniteDimensional ℝ E] [I₀.Boundaryless]
    [T2Space M] {X : ℝ → (x : M) → TangentSpace I₀ x}
    (hX : ContMDiff (𝓘(ℝ, ℝ).prod I₀) I₀.tangent 1
      (fun p : ℝ × M ↦ (⟨p.2, X p.1 p.2⟩ : TangentBundle I₀ M)))
    {s t₀ : ℝ} {x : M} (hx : ((s, t₀), x) ∈ timeDependentFlowDomain X) (w : TangentSpace I₀ x) :
    ∀ᶠ t in 𝓝 t₀, HasDerivAt
      (fun t ↦ (mfderiv I₀ 𝓘(ℝ, E) (extChartAt I₀ (timeDependentFlowOf X s t₀ x))
        (timeDependentFlowOf X s t x) (mfderiv I₀ I₀ (timeDependentFlowOf X s t) x w) : E))
      (fderiv ℝ (fun z : E ↦ (VectorField.mpullbackWithin 𝓘(ℝ, E) I₀
          (extChartAt I₀ (timeDependentFlowOf X s t₀ x)).symm (X t) (Set.range I₀) z : E))
        (extChartAt I₀ (timeDependentFlowOf X s t₀ x) (timeDependentFlowOf X s t x))
        (mfderiv I₀ 𝓘(ℝ, E) (extChartAt I₀ (timeDependentFlowOf X s t₀ x))
          (timeDependentFlowOf X s t x) (mfderiv I₀ I₀ (timeDependentFlowOf X s t) x w) : E)) t :=
  sorry

/-- **The variational equation of an autonomous flow** (README Layer 6 item 0): the case of a
`C¹` vector field `v` and its maximal flow `φ_t`, read in the extended chart at `φ_{t₀} x`. -/
theorem hasDerivAt_mfderiv_flowOf [FiniteDimensional ℝ E] [I₀.Boundaryless] [T2Space M]
    {v : (x : M) → TangentSpace I₀ x}
    (hv : ContMDiff I₀ I₀.tangent 1 (fun y ↦ (⟨y, v y⟩ : TangentBundle I₀ M)))
    {t₀ : ℝ} {x : M} (hx : (t₀, x) ∈ flowDomain v) (w : TangentSpace I₀ x) :
    ∀ᶠ t in 𝓝 t₀, HasDerivAt
      (fun t ↦ (mfderiv I₀ 𝓘(ℝ, E) (extChartAt I₀ (flowOf v t₀ x)) (flowOf v t x)
        (mfderiv I₀ I₀ (flowOf v t) x w) : E))
      (fderiv ℝ (fun z : E ↦ (VectorField.mpullbackWithin 𝓘(ℝ, E) I₀
          (extChartAt I₀ (flowOf v t₀ x)).symm v (Set.range I₀) z : E))
        (extChartAt I₀ (flowOf v t₀ x) (flowOf v t x))
        (mfderiv I₀ 𝓘(ℝ, E) (extChartAt I₀ (flowOf v t₀ x)) (flowOf v t x)
          (mfderiv I₀ I₀ (flowOf v t) x w) : E)) t := sorry

/-- **Time-dependent Hamiltonian flows are symplectic** (README Layer 6 item 0). For a symplectic
form on a finite-dimensional boundaryless Hausdorff manifold and a jointly `C²` time-dependent
Hamiltonian `H`, every map `Φ_{s,t}` of the flow of `X_{H_t}` preserves `θ` at each point of its
domain. -/
theorem SmoothTwoForm.IsSymplectic.eval₂_mfderiv_timeDependentFlowOf [FiniteDimensional ℝ E]
    [I₀.Boundaryless] [T2Space M] (hθ : θ.IsSymplectic) {H : ℝ → M → ℝ}
    (hH : ContMDiff (𝓘(ℝ, ℝ).prod I₀) 𝓘(ℝ) 2 (Function.uncurry H)) {s t : ℝ} {x : M}
    (hx : ((s, t), x) ∈ timeDependentFlowDomain (fun τ ↦ θ.hamiltonianVectorField (H τ)))
    (v w : TangentSpace I₀ x) :
    SmoothBundleForm.eval₂ θ (timeDependentFlowOf (fun τ ↦ θ.hamiltonianVectorField (H τ)) s t x)
        (mfderiv I₀ I₀ (timeDependentFlowOf (fun τ ↦ θ.hamiltonianVectorField (H τ)) s t) x v)
        (mfderiv I₀ I₀ (timeDependentFlowOf (fun τ ↦ θ.hamiltonianVectorField (H τ)) s t) x w) =
      SmoothBundleForm.eval₂ θ x v w := sorry

/-- **Hamiltonian flows are symplectic** (README Layer 6 item 0): the autonomous case, for the
maximal flow `φ_t` of `X_f` of a `C²` function at each point of its domain, with no completeness
hypothesis. -/
theorem SmoothTwoForm.IsSymplectic.eval₂_mfderiv_flowOf [FiniteDimensional ℝ E] [I₀.Boundaryless]
    [T2Space M] (hθ : θ.IsSymplectic) (hf : ContMDiff I₀ 𝓘(ℝ) 2 f) {t : ℝ} {x : M}
    (hx : (t, x) ∈ flowDomain (θ.hamiltonianVectorField f)) (v w : TangentSpace I₀ x) :
    SmoothBundleForm.eval₂ θ (flowOf (θ.hamiltonianVectorField f) t x)
        (mfderiv I₀ I₀ (flowOf (θ.hamiltonianVectorField f) t) x v)
        (mfderiv I₀ I₀ (flowOf (θ.hamiltonianVectorField f) t) x w) =
      SmoothBundleForm.eval₂ θ x v w := sorry

end Hamiltonian

/-! ## Layer 10: the kernel of `i_{Q*}` -/

open scoped Topology.Homotopy in
/-- **Lemma 3.41 of the source** (README Layer 10 item 4). A path-connected space `Q` is
aspherical (a `K(π, 1)`: every homotopy group of dimension at least two vanishes) exactly when
its double loop space `Ω(ΩQ, refl)`, in Mathlib's fixed-interval model, has the integral
homology of a point: it is path-connected, which is `H₀ ≅ ℤ`, and its singular homology with
coefficients in `ℤ` vanishes in every positive degree. The proof is the source's, through
`π_i(Ω²Q) ≅ π_{i+2}(Q)`, Hurewicz on the H-space `Ω²Q` and the homology invariance of weak
homotopy equivalences. -/
theorem isAspherical_iff_double_loopSpace_homology (Q : Type u) [TopologicalSpace Q]
    [PathConnectedSpace Q] (q : Q) :
    TauCeti.IsAspherical Q q ↔
      (PathConnectedSpace (Ω (Ω Q q) (Path.refl q)) ∧
        ∀ n : ℕ, 1 ≤ n → Subsingleton
          (((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{u} ℤ) n).obj
            (ModuleCat.of ℤ (ULift.{u} ℤ))).obj (TopCat.of (Ω (Ω Q q) (Path.refl q))))) := sorry

/-! ## Layer 11: the finite cover of a compact connected Lie group -/

/-- **The torus criterion** (README Layer 11 item 3): a compact connected Lie group is
aspherical exactly when it is isomorphic, as a topological group, to a torus `(S¹)^r`. The
proof is through the finite covering `T × K → G` of README Layer 11 item 1 and `π₃(K) ≠ 0` for a
nontrivial compact simply connected semisimple `K` (item 2). -/
theorem isAspherical_iff_exists_continuousMulEquiv_torus
    {E H G : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
    (I₀ : ModelWithCorners ℝ E H) [TopologicalSpace G] [ChartedSpace H G] [Group G]
    [LieGroup I₀ ∞ G] [CompactSpace G] [ConnectedSpace G] :
    TauCeti.IsAspherical G 1 ↔ ∃ r : ℕ, Nonempty (G ≃ₜ* (Fin r → Circle)) := sorry

end TauCetiRoadmap.DGFloer
