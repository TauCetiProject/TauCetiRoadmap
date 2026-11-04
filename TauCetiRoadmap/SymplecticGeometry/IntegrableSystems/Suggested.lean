import Mathlib
import TauCeti.Geometry.Symplectic.Manifold.TwoForm
import TauCeti.Geometry.Symplectic.Lagrangian.Basic
import TauCeti.Geometry.Symplectic.StandardCompatible

/-!
# Completely integrable systems and classical mechanics: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, with only the
simple definitions those statements need. Stated: the Lagrangian regular-level theorem of I1
(`regularLevel_lagrangian`, for an `IntegrableSystem` whose bracket is the family's
`bracketValue`), the conservation of planar angular momentum under a central force of I4
(`centralForce_commutes`), and the strict annulus fixed-point theorem of I5
(`strict_annulus_two_fixed_points`), in its lifted form on the strip for a smooth positive
periodic density; the constant density is the standard-area case.

Not statable at the pins, and therefore absent:

* the Liouville–Arnold action-angle normal form of I2, the period lattice bundle, its Chern and
  Lagrangian classes and the global action-angle criteria: `AddCircle (2 * Real.pi)` carries no
  `ChartedSpace` or `IsManifold` instance at the pinned Mathlib or Tau Ceti, so the angle torus is
  not a smooth manifold there and no symplectic form on an action-angle domain can be written;
* the positive-period circle atlas, its time form and the parameter families of I2.0, for the
  same reason;
* the Legendre transform and the Euler–Lagrange/Hamilton equivalence of I3: there is no carrier
  for the fibre derivative of a Lagrangian on a tangent bundle;
* the spherical-pendulum monodromy of I4: it needs the period lattice bundle of I2.
-/
noncomputable section
open scoped Manifold ContDiff
namespace TauCetiRoadmap.SymplecticGeometry
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-! ## I1: involutive functions and regular fibers -/

open Classical in
/-- The Hamiltonian vector field of `g` in the family convention `ι_(X_g) σ = dg`, that is the
tangent vector `v` at `x` with `σ x v w = dg_x(w)` for every `w`; it is unique when `σ` is
nondegenerate, and the value is `0` where no such vector exists. -/
def chosenHamiltonianField (σ : TauCeti.SmoothTwoForm I M) (g : M → ℝ) (x : M) :
    TangentSpace I x :=
  if h : ∃ v : TangentSpace I x, ∀ w, σ x v w = mvfderiv I g x w then h.choose else 0

/-- The Poisson bracket value `{f, g}(x) = df_x(X_g)` of the family conventions. -/
def bracketValue (σ : TauCeti.SmoothTwoForm I M) (f g : M → ℝ) (x : M) : ℝ :=
  mvfderiv I f x (chosenHamiltonianField σ g x)

/-- Complete integrability on a 2n-dimensional symplectic manifold: n smooth Poisson-commuting
integrals of a smooth Hamiltonian, independent on a dense set. -/
structure IntegrableSystem [FiniteDimensional ℝ E]
    (σ : TauCeti.SmoothTwoForm I M) (Hamiltonian : M → ℝ) (n : ℕ) where
  symplectic : σ.IsSymplectic
  dimension : Module.finrank ℝ E = 2 * n
  integral : Fin n → M → ℝ
  smooth : ∀ i, ContMDiff I 𝓘(ℝ, ℝ) ∞ (integral i)
  smoothHamiltonian : ContMDiff I 𝓘(ℝ, ℝ) ∞ Hamiltonian
  involution : ∀ i j x, bracketValue σ (integral i) (integral j) x = 0
  firstIntegral : ∀ i x, bracketValue σ (integral i) Hamiltonian x = 0
  denseRegular : Dense {x : M | Function.Surjective
    (mfderiv I 𝓘(ℝ, Fin n → ℝ) (fun y i ↦ integral i y) x)}

/-- At a regular point of the integral map, the tangent space of the common level, which is the
kernel of the derivative of the integral map, is a Lagrangian subspace of the symplectic tangent
space (I1; Cannas da Silva, Lectures on Symplectic Geometry, §18.3). -/
theorem regularLevel_lagrangian [FiniteDimensional ℝ E]
    {σ : TauCeti.SmoothTwoForm I M} {Hamiltonian : M → ℝ} {n : ℕ}
    (s : IntegrableSystem σ Hamiltonian n) (x : M)
    (hx : Function.Surjective
      (mfderiv I 𝓘(ℝ, Fin n → ℝ) (fun y i ↦ s.integral i y) x)) :
    (s.symplectic.isNondegenerate.symplecticFormAt x).IsLagrangian
      (LinearMap.ker
        (mfderiv I 𝓘(ℝ, Fin n → ℝ) (fun y i ↦ s.integral i y) x).toLinearMap) := by
  sorry

/-! ## I4: the planar central force -/

/-- The planar central-force Hamiltonian `‖p‖²/(2m) + V(‖q‖)` on the ambient phase space
`ℝ² × ℝ²`; its conservation theorem is restricted to the punctured configuration space. -/
def planarCentralHamiltonian (mass : ℝ) (V : ℝ → ℝ)
    (z : EuclideanSpace ℝ (Fin 2) × EuclideanSpace ℝ (Fin 2)) : ℝ :=
  (z.2 0 ^ 2 + z.2 1 ^ 2) / (2 * mass) +
    V (Real.sqrt (z.1 0 ^ 2 + z.1 1 ^ 2))

/-- The angular momentum `q₁p₂ − q₂p₁`, the momentum of the positive planar rotation. -/
def planarAngularMomentum (z : EuclideanSpace ℝ (Fin 2) × EuclideanSpace ℝ (Fin 2)) : ℝ :=
  z.1 0 * z.2 1 - z.1 1 * z.2 0

/-- Angular momentum Poisson-commutes with every central-force Hamiltonian at positive mass,
pointwise on the noncollision domain `q ≠ 0`, where the potential is smooth (I4). -/
theorem centralForce_commutes (mass : ℝ) (hmass : 0 < mass) (V : ℝ → ℝ)
    (hV : ContDiffOn ℝ ∞ V (Set.Ioi 0))
    (z : EuclideanSpace ℝ (Fin 2) × EuclideanSpace ℝ (Fin 2)) (hq : z.1 ≠ 0) :
    bracketValue (TauCeti.stdSymplecticForm (V := EuclideanSpace ℝ (Fin 2))).constSmooth
      (planarCentralHamiltonian mass V) planarAngularMomentum z = 0 := by
  sorry

/-! ## I5: the strict annulus fixed-point theorem -/

/-- The closed strip `ℝ × [0,1]`, the universal cover of the compact annulus `(ℝ/ℤ) × [0,1]`. -/
def strip : Set (ℝ × ℝ) := {p | p.2 ∈ Set.Icc 0 1}

/-- A half-open fundamental domain for the interior points of the annulus: two of its points are
distinct annulus points, not integer translates of one point. -/
def interiorFundamentalDomain : Set (ℝ × ℝ) :=
  {p | p.1 ∈ Set.Ico 0 1 ∧ p.2 ∈ Set.Ioo 0 1}

/-- The strict annulus fixed-point theorem (Poincaré–Birkhoff; Le Calvez–Wang, Thm. 1) in lifted
coordinates. `F` is a lift to the strip of a smooth diffeomorphism of the closed annulus which
commutes with the deck translation, preserves each boundary circle and the area form `ρ dx∧dy`
for a smooth positive periodic density `ρ` (so that `ρ(F p)·det DF_p = ρ(p)`), and displaces the
two boundary circles strictly in opposite directions. Then `F` has at least two fixed points
which are distinct points of the annulus; no nondegeneracy or interior twist is assumed, and the
constant density is the standard-area case. -/
theorem strict_annulus_two_fixed_points (F : OpenPartialHomeomorph (ℝ × ℝ) (ℝ × ℝ))
    (ρ : ℝ × ℝ → ℝ) (hρ : ContDiffOn ℝ ∞ ρ strip) (hρpos : ∀ p ∈ strip, 0 < ρ p)
    (hρdeck : ∀ p ∈ strip, ρ (p.1 + 1, p.2) = ρ p)
    (hsource : strip ⊆ F.source) (htarget : strip ⊆ F.target)
    (hsmooth : ContDiffOn ℝ ∞ F F.source)
    (hinverse : ContDiffOn ℝ ∞ F.symm F.target)
    (hstrip : Set.MapsTo F strip strip)
    (hstrip_inv : Set.MapsTo F.symm strip strip)
    (hdeck : ∀ p ∈ strip, F (p.1 + 1, p.2) = ((F p).1 + 1, (F p).2))
    (harea : ∀ p ∈ strip, ρ (F p) * LinearMap.det (fderiv ℝ F p).toLinearMap = ρ p)
    (hlower : ∀ x : ℝ, (F (x, 0)).2 = 0 ∧ (F (x, 0)).1 < x)
    (hupper : ∀ x : ℝ, (F (x, 1)).2 = 1 ∧ x < (F (x, 1)).1) :
    ∃ p ∈ interiorFundamentalDomain, ∃ q ∈ interiorFundamentalDomain,
      p ≠ q ∧ F p = p ∧ F q = q := by
  sorry

end TauCetiRoadmap.SymplecticGeometry
