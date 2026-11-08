module

public import Mathlib
public import TauCeti.AlgebraicTopology.EilenbergMacLane.Basic
public import TauCeti.AlgebraicTopology.Singular.LocalHomology.FundamentalClass
public import TauCeti.Geometry.Manifold.Flow.Basic
public import TauCeti.Geometry.Manifold.Flow.TimeDependent
public import TauCeti.Geometry.Symplectic.Cotangent.Bundle.Liouville
public import TauCeti.Geometry.Symplectic.Hamiltonian.AlmostExistence
public import TauCeti.Geometry.Symplectic.Hamiltonian.Integrable
public import TauCeti.Geometry.Symplectic.SymplecticTransport

/-!
# Morse and Floer homology with DG local coefficients: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`. Discharging the
statements here finishes neither a layer nor the roadmap.

Stated here:

* the mod-2 vanishing theorem (README Layer 1 item 4): a simply connected space with vanishing
  reduced mod-2 singular homology has uniquely 2-divisible higher homotopy groups;
* the Hamiltonian formalism beyond the pins (README Layer 6 item 0): Hamiltonian vector fields of
  weakly nondegenerate forms, Hamiltonian functions and the Jacobi identity for their brackets on
  Banach manifolds, the Poisson bracket of strongly nondegenerate forms, first integrals, symplectic
  maps and symplectomorphisms between manifolds, the variational equation of autonomous and
  time-dependent flows, and the symplecticity of incomplete Hamiltonian flows, on the pinned
  carriers `TauCeti.SmoothTwoForm.IsHamiltonianVectorField`,
  `TauCeti.SmoothTwoForm.hamiltonianVectorField`, `TauCeti.SmoothTwoForm.poissonBracket`,
  `TauCeti.SmoothTwoForm.IsFirstIntegral`, `TauCeti.SmoothForm.mpullback`, `TauCeti.flowOf` and
  `TauCeti.timeDependentFlowOf`. Strong nondegeneracy is the unbundled hypothesis that every flat
  map `θ.flat x` is onto. The pinned results these extend, `apply_eq_of_mvfderiv_apply_eq_zero`,
  `mvfderiv_eval₂`, `mlieBracket`, `poissonBracket_jacobi` and `mpullback_globalFlow` among them,
  are consumed by name in the README;
* Theorem A of the source in its two cases (README Layer 10 item 5): on the cotangent bundle of a
  closed connected oriented manifold that is not aspherical, respectively not rationally
  aspherical, every regular level of a proper function enclosing the image of a closed smooth
  oriented manifold of degree `±1`, respectively of nonzero degree, has the contractible almost
  existence property, on the pinned carriers `TauCeti.CotangentBundle.symplecticForm`,
  `TauCeti.SmoothTwoForm.HasContractibleAlmostExistence` and
  `TauCeti.HomologicalOrientation.mapFundamentalClass`;
* Theorem C of the source (README Layer 10 item 5): the same conclusion on the cotangent bundle of
  a closed connected non-orientable manifold `Q` with `π_ℓ(Q) ⊗ ℤ/2 ≠ 0` for some `ℓ ≥ 2`, for a
  closed smooth manifold mapping to `Q` with nonzero mod-2 degree, the degree read on Mathlib's
  singular homology with coefficients in `ZMod 2`;
* the torus criterion (README Layer 11 item 3): a compact connected Lie group is aspherical
  exactly when it is a torus.

The source's Lemma 3.41 (README Layer 10 item 4) is the pinned
`TauCeti.isAspherical_iff_doubleLoopSpace_singularHomology`, and the twisted complex of a twisting
cocycle (README Layer 4) is the pinned `TauCeti.TwistingCocycle.twistedCochainComplex`; neither is
restated here.

Not statable at the pins, each with the carrier it lacks:

* Theorems L and M (README Layer 10 items 1–2): symplectic homology with DG coefficients, its
  spectral invariants, and DG Morse homology of `(W, ∂W)`; the capacities they bound are pinned
  (`TauCeti.SmoothTwoForm.relContractibleHZCapacity`,
  `TauCeti.SmoothTwoForm.contractibleHZCapacity`).
* Theorem J and the comparison `FH_*(X; 𝓕) ≅ H_{*+n}(X; i_X^*𝓕)` (README Layer 8 item 6): the
  Hamiltonian Floer complex, hence moduli spaces of Floer cylinders.
* Theorem K, the DG Viterbo isomorphism (README Layer 9 item 3): symplectic homology `SH_*` and
  DG Morse homology of the free loop space.
* The fibration theorem `H_*(B; C_*(F')) ≅ H_*(E)` (README Layer 5 item 4): the DG Morse complex,
  that is, the Barraud–Cornea twisting cocycle of the compactified Morse trajectory spaces; the
  loop DG algebra, the DG local system `TauCeti.fibrationLocalSystem` of a map and the twisted
  complex of a twisting cocycle are pinned.
* The Arnold bound on contractible 1-periodic orbits (README Layer 7.C.6g): the first Chern class
  on spherical classes, for the spherical monotonicity hypothesis; the pinned Floer cap classes
  take the Chern number as an abstract homomorphism.
* The Serre spectral sequences (README Layer 1 item 2): the local system of fibre homology of a
  Serre fibration, the coefficient system of `E²`. The pinned fibre-homology local system
  `TauCeti.fiberLocalSystem` is built from a lifting function of a Hurewicz fibration.
* The Floer–Novikov torsion invariant (README Layer 7.T.8): Floer complexes over Novikov rings.
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

/-! ## Layer 6: Hamiltonian vector fields, symplectic maps and linearized flows -/

section Hamiltonian

open TauCeti
open scoped Manifold Topology

variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] [TopologicalSpace H]
  {I₀ : ModelWithCorners ℝ E H} [TopologicalSpace M] [ChartedSpace H M] [IsManifold I₀ ∞ M]
  {θ : SmoothTwoForm I₀ M} {f g k : M → ℝ} {X Y Z : (x : M) → TangentSpace I₀ x}

/-- **Strong nondegeneracy implies weak nondegeneracy** (README Layer 6 item 0). If every flat map
`θ♭_x : v ↦ θ_x(v, ·)` is onto the continuous dual of `T_x M`, it is injective: a vector `w` with
`θ_x(w, ·) = 0` is annihilated by every `θ_x(v, ·)`, by antisymmetry, hence by every continuous
linear form, and `w = 0` by the Hahn–Banach theorem. The model is any real normed space. -/
theorem SmoothTwoForm.isNondegenerate_of_surjective_flat
    (hθ : ∀ x, Function.Surjective (θ.flat x)) : θ.IsNondegenerate := sorry

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

/-- Hamiltonian vector fields scale with their Hamiltonian, for every function (README Layer 6
item 0). -/
theorem SmoothTwoForm.IsHamiltonianVectorField.const_smul (hX : θ.IsHamiltonianVectorField f X)
    (c : ℝ) : θ.IsHamiltonianVectorField (c • f) (fun x ↦ c • X x) := sorry

/-- **The Leibniz rule for Hamiltonian vector fields** (README Layer 6 item 0): `f • Y + g • X`
is a Hamiltonian vector field of `f * g`. No nondegeneracy is needed. -/
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
(README Layer 6 item 0), through the contraction inverse of HeegaardFloer F2.1 and its smooth
dependence on the base point. -/
theorem SmoothTwoForm.isHamiltonian_iff_contMDiff [CompleteSpace E]
    (hθ : ∀ x, Function.Surjective (θ.flat x)) :
    SmoothTwoForm.IsHamiltonian θ f ↔ ContMDiff I₀ 𝓘(ℝ) ∞ f := sorry

/-- **Hamiltonian functions are closed under the bracket** (README Layer 6 item 0). For a closed
two-form on a Banach manifold, with no nondegeneracy, let `X` and `Y` be smooth Hamiltonian
vector fields of smooth functions `f` and `g`. Then `θ(X, Y)` is a Hamiltonian function: it is
smooth, and `−[X, Y]` is a smooth Hamiltonian vector field of it. For a weakly nondegenerate form,
where `X` and `Y` are the unique Hamiltonian vector fields `X_f` and `X_g`, this is the closure of
the Hamiltonian functions under `{f, g} = θ(X_f, X_g)`, with `X_{{f, g}} = −[X_f, X_g]`. -/
theorem SmoothTwoForm.IsHamiltonianVectorField.isHamiltonian_eval₂ [CompleteSpace E]
    (hθ : θ.IsClosed) (hX : θ.IsHamiltonianVectorField f X) (hY : θ.IsHamiltonianVectorField g Y)
    (hf : ContMDiff I₀ 𝓘(ℝ) ∞ f) (hg : ContMDiff I₀ 𝓘(ℝ) ∞ g)
    (hXs : ContMDiff I₀ I₀.tangent ∞ (fun x ↦ (⟨x, X x⟩ : TangentBundle I₀ M)))
    (hYs : ContMDiff I₀ I₀.tangent ∞ (fun x ↦ (⟨x, Y x⟩ : TangentBundle I₀ M))) :
    SmoothTwoForm.IsHamiltonian θ (fun x ↦ SmoothBundleForm.eval₂ θ x (X x) (Y x)) := sorry

/-- **The Jacobi identity for Hamiltonian vector fields** (README Layer 6 item 0). For a closed
two-form on a Banach manifold, with no nondegeneracy, let `X`, `Y`, `Z` be differentiable
Hamiltonian vector fields of `C²` functions `f`, `g`, `k`. Then
`θ([X, Y], Z) + θ([Y, Z], X) + θ([Z, X], Y) = 0`. For a weakly nondegenerate form, with the unique
Hamiltonian vector fields and `X_{{f, g}} = −[X_f, X_g]`, this is the Jacobi identity for
`{f, g} = θ(X_f, X_g)` on Hamiltonian functions. -/
theorem SmoothTwoForm.IsHamiltonianVectorField.eval₂_mlieBracket_jacobi [CompleteSpace E]
    (hθ : θ.IsClosed) (hX : θ.IsHamiltonianVectorField f X) (hY : θ.IsHamiltonianVectorField g Y)
    (hZ : θ.IsHamiltonianVectorField k Z) (hf : ContMDiff I₀ 𝓘(ℝ) 2 f)
    (hg : ContMDiff I₀ 𝓘(ℝ) 2 g) (hk : ContMDiff I₀ 𝓘(ℝ) 2 k)
    (hX' : MDifferentiable I₀ I₀.tangent (fun y ↦ (X y : TangentBundle I₀ M)))
    (hY' : MDifferentiable I₀ I₀.tangent (fun y ↦ (Y y : TangentBundle I₀ M)))
    (hZ' : MDifferentiable I₀ I₀.tangent (fun y ↦ (Z y : TangentBundle I₀ M))) (x : M) :
    SmoothBundleForm.eval₂ θ x (VectorField.mlieBracket I₀ X Y x) (Z x) +
      SmoothBundleForm.eval₂ θ x (VectorField.mlieBracket I₀ Y Z x) (X x) +
        SmoothBundleForm.eval₂ θ x (VectorField.mlieBracket I₀ Z X x) (Y x) = 0 := sorry

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

/-- **The Hamiltonian vector field of a Poisson bracket** (README Layer 6 item 0). For a closed,
strongly nondegenerate form on a Banach manifold and `C²` functions, `X_{{f, g}} = −[X_f, X_g]`. -/
theorem SmoothTwoForm.hamiltonianVectorField_poissonBracket_of_surjective_flat [CompleteSpace E]
    (hθ : ∀ x, Function.Surjective (θ.flat x)) (hθc : θ.IsClosed) (hf : ContMDiff I₀ 𝓘(ℝ) 2 f)
    (hg : ContMDiff I₀ 𝓘(ℝ) 2 g) :
    θ.hamiltonianVectorField (θ.poissonBracket f g) =
      -VectorField.mlieBracket I₀ (θ.hamiltonianVectorField f) (θ.hamiltonianVectorField g) :=
  sorry

/-- **The Jacobi identity for the Poisson bracket** (README Layer 6 item 0). For a closed,
strongly nondegenerate form on a Banach manifold and `C²` functions `f`, `g`, `k`,
`{f, {g, k}} + {g, {k, f}} + {k, {f, g}} = 0`. -/
theorem SmoothTwoForm.poissonBracket_jacobi_of_surjective_flat [CompleteSpace E]
    (hθ : ∀ x, Function.Surjective (θ.flat x)) (hθc : θ.IsClosed) (hf : ContMDiff I₀ 𝓘(ℝ) 2 f)
    (hg : ContMDiff I₀ 𝓘(ℝ) 2 g) (hk : ContMDiff I₀ 𝓘(ℝ) 2 k) (x : M) :
    θ.poissonBracket f (θ.poissonBracket g k) x + θ.poissonBracket g (θ.poissonBracket k f) x +
      θ.poissonBracket k (θ.poissonBracket f g) x = 0 := sorry

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

/-- **First integrals of a vector field** (README Layer 6 item 0). On a boundaryless Banach
manifold, let `X` be a `C¹` vector field and `f` a differentiable function. Then `df(X) = 0`
everywhere exactly when `f` is constant along every integral curve of `X` on an open interval. For
a weakly nondegenerate form and the unique Hamiltonian vector field `X = X_g` of a Hamiltonian
function `g`, `df(X)` is the bracket `{f, g}`, and this is the first-integral criterion in that
generality. -/
theorem forall_mvfderiv_apply_eq_zero_iff_forall_isMIntegralCurveOn [CompleteSpace E]
    [BoundarylessManifold I₀ M]
    (hX : ContMDiff I₀ I₀.tangent 1 (fun x ↦ (⟨x, X x⟩ : TangentBundle I₀ M)))
    (hf : MDifferentiable I₀ 𝓘(ℝ) f) :
    (∀ x, mvfderiv I₀ f x (X x) = 0) ↔ ∀ (γ : ℝ → M) (a b : ℝ),
      IsMIntegralCurveOn γ X (Set.Ioo a b) →
        ∀ t₁ ∈ Set.Ioo a b, ∀ t₂ ∈ Set.Ioo a b, f (γ t₁) = f (γ t₂) := sorry

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

/-- A smooth map is symplectic exactly when it pulls the target form back to the source form
(README Layer 6 item 0). -/
theorem SmoothTwoForm.isSymplecticMap_iff_mpullback_eq (hφ : ContMDiff I₀ I₁ ∞ φ) :
    SmoothTwoForm.IsSymplecticMap θ θ₁ φ ↔ SmoothForm.mpullback φ hφ θ₁ = θ := sorry

/-- The identity is a symplectic map (README Layer 6 item 0). -/
theorem SmoothTwoForm.isSymplecticMap_id : SmoothTwoForm.IsSymplecticMap θ θ id := sorry

/-- Composites of differentiable symplectic maps are symplectic maps (README Layer 6 item 0). -/
theorem SmoothTwoForm.IsSymplecticMap.comp {E'' H'' M'' : Type*} [NormedAddCommGroup E'']
    [NormedSpace ℝ E''] [TopologicalSpace H''] {I₂ : ModelWithCorners ℝ E'' H''}
    [TopologicalSpace M''] [ChartedSpace H'' M''] [IsManifold I₂ ∞ M'']
    {θ₂ : SmoothTwoForm I₂ M''} {ψ : M' → M''}
    (hψ : SmoothTwoForm.IsSymplecticMap θ₁ θ₂ ψ) (hφ : SmoothTwoForm.IsSymplecticMap θ θ₁ φ)
    (hψd : MDifferentiable I₁ I₂ ψ) (hφd : MDifferentiable I₀ I₁ φ) :
    SmoothTwoForm.IsSymplecticMap θ θ₂ (ψ ∘ φ) := sorry

/-- The differential of a symplectic map out of a weakly nondegenerate form is injective (README
Layer 6 item 0). -/
theorem SmoothTwoForm.IsSymplecticMap.injective_mfderiv (hθ : θ.IsNondegenerate)
    (hφ : SmoothTwoForm.IsSymplecticMap θ θ₁ φ) (x : M) :
    Function.Injective (mfderiv I₀ I₁ φ x) := sorry

/-- A **symplectomorphism** from `θ` to `θ₁` is a diffeomorphism that is a symplectic map
(README Layer 6 item 0): a predicate on the diffeomorphism. -/
def SmoothTwoForm.IsSymplectomorphism {n : ℕ∞ω} (θ : SmoothTwoForm I₀ M)
    (θ₁ : SmoothTwoForm I₁ M') (φ : M ≃ₘ^n⟮I₀, I₁⟯ M') : Prop :=
  SmoothTwoForm.IsSymplecticMap θ θ₁ φ

/-- The inverse of a symplectomorphism of class at least `C¹` is a symplectomorphism (README
Layer 6 item 0). -/
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

/-- For a symplectomorphism of class at least `C¹`, a field on the target is a Hamiltonian vector
field of `h` exactly when its pullback is a Hamiltonian vector field of `h ∘ φ`, for every
function `h` (README Layer 6 item 0). No nondegeneracy is needed: where `h` is not differentiable
neither is `h ∘ φ`, and both differentials are `0`. -/
theorem SmoothTwoForm.IsSymplectomorphism.isHamiltonianVectorField_mpullback_iff {n : ℕ∞ω}
    (hn : n ≠ 0) {φ : M ≃ₘ^n⟮I₀, I₁⟯ M'} (hφ : SmoothTwoForm.IsSymplectomorphism θ θ₁ φ)
    {h : M' → ℝ} {V : (y : M') → TangentSpace I₁ y} :
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

/-- For a symplectomorphism of class at least `C¹` into a strongly nondegenerate form on a Banach
manifold, the differential carries the Hamiltonian vector field of `h ∘ φ` to that of `h` for
every function `h` (README Layer 6 item 0): where `h` is not differentiable neither is `h ∘ φ`,
and both fields vanish. The source form is then strongly nondegenerate as well. -/
theorem SmoothTwoForm.IsSymplectomorphism.mfderiv_hamiltonianVectorField_comp [CompleteSpace E']
    {n : ℕ∞ω} (hn : n ≠ 0) {φ : M ≃ₘ^n⟮I₀, I₁⟯ M'}
    (hφ : SmoothTwoForm.IsSymplectomorphism θ θ₁ φ) (hθ₁ : ∀ y, Function.Surjective (θ₁.flat y))
    (h : M' → ℝ) (x : M) :
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

/-- **Time-dependent Hamiltonian flows are symplectic** (README Layer 6 item 0). Let `θ` be a
closed two-form on a finite-dimensional boundaryless Hausdorff manifold, with no nondegeneracy,
and let `X` be a jointly `C¹` time-dependent vector field such that each `X τ` is a Hamiltonian
vector field of the `C²` function `H τ`. Then every map `Φ_{s,t}` of the flow of `X` preserves
`θ` at each point of its domain. For a symplectic form, `X τ = X_{H τ}` with `H` jointly `C²` is
the case of a time-dependent Hamiltonian. -/
theorem SmoothTwoForm.eval₂_mfderiv_timeDependentFlowOf [FiniteDimensional ℝ E]
    [I₀.Boundaryless] [T2Space M] (hθ : θ.IsClosed) {H : ℝ → M → ℝ}
    {X : ℝ → (x : M) → TangentSpace I₀ x} (hX : ∀ τ, θ.IsHamiltonianVectorField (H τ) (X τ))
    (hH : ∀ τ, ContMDiff I₀ 𝓘(ℝ) 2 (H τ))
    (hX₁ : ContMDiff (𝓘(ℝ, ℝ).prod I₀) I₀.tangent 1
      (fun p : ℝ × M ↦ (⟨p.2, X p.1 p.2⟩ : TangentBundle I₀ M)))
    {s t : ℝ} {x : M} (hx : ((s, t), x) ∈ timeDependentFlowDomain X) (v w : TangentSpace I₀ x) :
    SmoothBundleForm.eval₂ θ (timeDependentFlowOf X s t x)
        (mfderiv I₀ I₀ (timeDependentFlowOf X s t) x v)
        (mfderiv I₀ I₀ (timeDependentFlowOf X s t) x w) =
      SmoothBundleForm.eval₂ θ x v w := sorry

/-- **Hamiltonian flows are symplectic** (README Layer 6 item 0): the autonomous case. For a
closed two-form on a finite-dimensional boundaryless Hausdorff manifold, with no nondegeneracy,
the maximal flow `φ_t` of a `C¹` Hamiltonian vector field `X` of a `C²` function preserves `θ` at
each point of its domain, with no completeness hypothesis. -/
theorem SmoothTwoForm.IsHamiltonianVectorField.eval₂_mfderiv_flowOf [FiniteDimensional ℝ E]
    [I₀.Boundaryless] [T2Space M] (hX : θ.IsHamiltonianVectorField f X) (hθ : θ.IsClosed)
    (hf : ContMDiff I₀ 𝓘(ℝ) 2 f)
    (hX₁ : ContMDiff I₀ I₀.tangent 1 (fun y ↦ (⟨y, X y⟩ : TangentBundle I₀ M))) {t : ℝ} {x : M}
    (hx : (t, x) ∈ flowDomain X) (v w : TangentSpace I₀ x) :
    SmoothBundleForm.eval₂ θ (flowOf X t x) (mfderiv I₀ I₀ (flowOf X t) x v)
        (mfderiv I₀ I₀ (flowOf X t) x w) =
      SmoothBundleForm.eval₂ θ x v w := sorry

end Hamiltonian

/-! ## Layer 10: the criteria and their applications to cotangent bundles -/

section AlmostExistence

open TauCeti
open scoped Manifold Topology

variable {E : Type} [NormedAddCommGroup E] [NormedSpace ℝ E] [FiniteDimensional ℝ E]

/-- **Theorem A of the source, first case** (README Layer 10 item 5; the source's Theorem A,
proved as its Theorem 5.10). Let `Q` be a closed connected oriented `n`-manifold that is not
aspherical, `S` a closed smooth oriented `n`-manifold (smooth, as in the source's Theorem 5.10:
the route uses the Morse Umkehr map `(π ∘ φ)_!` of README Layer 5 item 3), and `φ : S → T*Q`
continuous such that `π ∘ φ` has degree `d = ±1`: `(π ∘ φ)_*[S] = d • [Q]` in `H_n(Q; ℤ)`. Let
`F : T*Q → ℝ` be smooth with compact sublevel sets, `c` a regular value of `F`, and `F < c` on
`φ(S)`, so that the hypersurface `F⁻¹(c)` bounds the relatively compact domain `{F < c}`
containing `φ(S)`. Then `F⁻¹(c)` has the contractible almost existence property for the canonical
symplectic form `ω = -dλ`: for some `ε > 0`, almost every regular level `F⁻¹(c')` with
`|c' - c| < ε` carries a closed characteristic contractible in `T*Q`. The source's form
`Σ dpᵢ ∧ dqᵢ` is `-ω`, and almost existence does not see the sign of the form. -/
theorem hasContractibleAlmostExistence_of_not_isAspherical {Q S : Type} [TopologicalSpace Q]
    [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q] [CompactSpace Q] [ConnectedSpace Q]
    [TopologicalSpace S] [T2Space S] [ChartedSpace E S] [IsManifold 𝓘(ℝ, E) ∞ S]
    [CompactSpace S]
    (oQ : HomologicalOrientation Q E (Module.finrank ℝ E))
    (oS : HomologicalOrientation S E (Module.finrank ℝ E)) (q : Q) (hQ : ¬ IsAspherical Q q)
    (φ : C(S, CotangentBundle 𝓘(ℝ, E) Q)) {d : ℤ}
    (hd : oS.mapFundamentalClass rfl
        ((⟨Bundle.TotalSpace.proj, FiberBundle.continuous_proj _ _⟩ :
          C(CotangentBundle 𝓘(ℝ, E) Q, Q)).comp φ) =
      d • oQ.mapFundamentalClass rfl (ContinuousMap.id Q))
    (hd₁ : IsUnit d) (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ)
    (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
    (hFc : ∀ b : ℝ, IsCompact (F ⁻¹' Set.Iic b)) {c : ℝ}
    (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c) (hφ : ∀ s, F (φ s) < c) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c :=
  sorry

/-- **Theorem A of the source, second case** (README Layer 10 item 5; the source's Theorem A,
proved as its Theorem 5.10). As in the first case, with the hypotheses on `Q` and on the degree
exchanged: `Q` is not a rational `K(π, 1)`, that is, some `π_ℓ(Q)` with `ℓ ≥ 2` has nonzero
rationalization `π_ℓ(Q) ⊗ ℚ`, equivalently is not a torsion group, and the degree `d` of `π ∘ φ`
is nonzero. As in the first case `S` is a closed smooth oriented `n`-manifold. -/
theorem hasContractibleAlmostExistence_of_not_isTorsion_homotopyGroup {Q S : Type}
    [TopologicalSpace Q] [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q] [CompactSpace Q]
    [ConnectedSpace Q] [TopologicalSpace S] [T2Space S] [ChartedSpace E S]
    [IsManifold 𝓘(ℝ, E) ∞ S] [CompactSpace S]
    (oQ : HomologicalOrientation Q E (Module.finrank ℝ E))
    (oS : HomologicalOrientation S E (Module.finrank ℝ E)) (q : Q)
    (hQ : ∃ n : ℕ, ¬ IsMulTorsion (π_ (n + 2) Q q))
    (φ : C(S, CotangentBundle 𝓘(ℝ, E) Q)) {d : ℤ}
    (hd : oS.mapFundamentalClass rfl
        ((⟨Bundle.TotalSpace.proj, FiberBundle.continuous_proj _ _⟩ :
          C(CotangentBundle 𝓘(ℝ, E) Q, Q)).comp φ) =
      d • oQ.mapFundamentalClass rfl (ContinuousMap.id Q))
    (hd₀ : d ≠ 0) (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ)
    (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
    (hFc : ∀ b : ℝ, IsCompact (F ⁻¹' Set.Iic b)) {c : ℝ}
    (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c) (hφ : ∀ s, F (φ s) < c) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c :=
  sorry

/-- **Theorem C of the source** (README Layer 10 item 5; the source's Theorem C, proved as its
Theorem 5.15). Let `Q` be a closed connected non-orientable `n`-manifold (it has no homological
orientation) that is not a `ℤ/2`-`K(π, 1)`: for some `ℓ ≥ 2`, `π_ℓ(Q) ⊗ ℤ/2 = π_ℓ(Q)/2π_ℓ(Q)` is
nonzero, that is, squaring is not surjective on `π_ℓ(Q, q)`. Let `S` be a closed smooth
`n`-manifold and `φ : S → T*Q` continuous such that `π ∘ φ` induces a nonzero map
`H_n(S; ℤ/2) → H_n(Q; ℤ/2)`. For connected `S` this says that `π ∘ φ` has mod-2 degree `1`; for
disconnected `S` it says that some component of `S` does, and the source's statement for that
component gives the same conclusion. Let `F`, `c` be as in Theorem A, with `F < c` on `φ(S)`.
Then `F⁻¹(c)` has the contractible almost existence property for `ω = -dλ`. -/
theorem hasContractibleAlmostExistence_of_mod_two_degree_ne_zero {Q S : Type}
    [TopologicalSpace Q] [T2Space Q] [ChartedSpace E Q] [IsManifold 𝓘(ℝ, E) ∞ Q] [CompactSpace Q]
    [ConnectedSpace Q] [TopologicalSpace S] [T2Space S] [ChartedSpace E S]
    [IsManifold 𝓘(ℝ, E) ∞ S] [CompactSpace S]
    (hQo : IsEmpty (HomologicalOrientation Q E (Module.finrank ℝ E))) (q : Q)
    (hQ : ∃ n : ℕ, ¬ Function.Surjective (fun a : π_ (n + 2) Q q ↦ a ^ 2))
    (φ : C(S, CotangentBundle 𝓘(ℝ, E) Q))
    (hφ : ((AlgebraicTopology.singularHomologyFunctor (ModuleCat.{0} ℤ) (Module.finrank ℝ E)).obj
        (ModuleCat.of ℤ (ZMod 2))).map (TopCat.ofHom
          ((⟨Bundle.TotalSpace.proj, FiberBundle.continuous_proj _ _⟩ :
            C(CotangentBundle 𝓘(ℝ, E) Q, Q)).comp φ)) ≠ 0)
    (F : CotangentBundle 𝓘(ℝ, E) Q → ℝ)
    (hF : ContMDiff (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) ∞ F)
    (hFc : ∀ b : ℝ, IsCompact (F ⁻¹' Set.Iic b)) {c : ℝ}
    (hc : IsRegularValue (𝓘(ℝ, E).prod 𝓘(ℝ, E →L[ℝ] ℝ)) 𝓘(ℝ) F c) (hφc : ∀ s, F (φ s) < c) :
    (CotangentBundle.symplecticForm 𝓘(ℝ, E) Q).HasContractibleAlmostExistence Set.univ F c :=
  sorry

end AlmostExistence

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
