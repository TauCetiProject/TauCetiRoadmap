module

public import Mathlib
public import TauCeti.Geometry.Manifold.Instances.AddCircle
public import TauCeti.Geometry.Manifold.IsManifold.Pi
public import TauCeti.Geometry.Manifold.RegularValue
public import TauCeti.Geometry.Symplectic.Cotangent.Bundle.Legendre
public import TauCeti.Geometry.Symplectic.Cotangent.Bundle.Liouville
public import TauCeti.Geometry.Symplectic.Hamiltonian.Integrable
public import TauCeti.Geometry.Symplectic.Hamiltonian.Manifold

/-!
# Completely integrable systems and classical mechanics: target signatures

The roadmap is `README.md`; this file is not the roadmap. It states the roadmap's headline
theorems against the pinned Mathlib and Tau Ceti, each admitted with `sorry`, with only the
simple definitions those statements need. Hamiltonian vector fields, Poisson brackets and
integrable systems are Tau Ceti's `TauCeti.SmoothTwoForm.hamiltonianVectorField`,
`TauCeti.SmoothTwoForm.poissonBracket` and `TauCeti.SmoothTwoForm.IsIntegrableSystem`, in the
family convention `ι_(X_f) σ = df`, `{f, g} = σ(X_f, X_g) = df(X_g)`; the canonical form of a
cotangent bundle is `TauCeti.CotangentBundle.symplecticForm`, `ω = -dλ`.

Stated: the Liouville–Arnold action–angle theorem of I2 (`exists_actionAngle`), on the cotangent
bundle of the angle torus `Fin n → AddCircle p`; the second-order property of the Lagrangian
vector field (`mfderiv_proj_lagrangianVectorField`) and its transport by the Legendre map to the
Hamiltonian vector field (`mfderiv_legendreMap_lagrangianVectorField`) of I3; and the strict
annulus fixed-point theorem of I5 (`strict_annulus_two_fixed_points`), in its lifted form on the
strip for a smooth positive periodic density, the constant density being the standard-area case.

Proved at the pinned Tau Ceti, and therefore not restated: the Lagrangian regular-level theorem
of I1 (`TauCeti.SmoothTwoForm.IsIntegrableSystem.isLagrangian_ker_mfderiv`); the topological
part of I2, a compact regular component of a level being the quotient of `ℝⁿ` by a discrete
cocompact stabilizer
(`TauCeti.SmoothTwoForm.IsSymplectic.quotientHamiltonianFlowStabilizerHomeomorph`,
`TauCeti.SmoothTwoForm.IsSymplectic.compactSpace_quotient_hamiltonianFlowStabilizer`); and the
conservation of angular momentum under a central force of I4
(`TauCeti.stdSymplecticForm_poissonBracket_centralForceHamiltonian_angularMomentum`).

Not statable at the pins, and therefore absent:

* the period lattice `Λ ⊂ T*B` of a regular Lagrangian torus fibration `M → B`, its linear
  monodromy, its Chern and Lagrangian classes and the global action–angle criteria of I2: the
  pins have the stabilizer lattice at a single point
  (`TauCeti.SmoothTwoForm.IsSymplectic.hamiltonianFlowStabilizer`) and lattice families given
  by a global period map, but neither the lattice bundle `Λ ⊂ T*B` as a locally constant sheaf
  of lattices over `B` nor the sheaf `Z¹/Λ` of local Lagrangian sections, in whose cohomology
  the two classes live;
* the spherical-pendulum monodromy of I4: it is the transport of that period lattice around a
  loop of regular values, and needs the lattice bundle above.
-/
noncomputable section
@[expose] public section
open scoped Manifold ContDiff
namespace TauCetiRoadmap.SymplecticGeometry.IntegrableSystems
variable {E H M : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]
  [TopologicalSpace H] {I : ModelWithCorners ℝ E H}
  [TopologicalSpace M] [ChartedSpace H M] [IsManifold I ∞ M]

/-! ## I2: Liouville–Arnold and action–angle coordinates -/

/-- **The Liouville–Arnold theorem: action–angle coordinates** (I2; Arnold, Mathematical
Methods of Classical Mechanics, §§49–50; Cannas da Silva, Lectures on Symplectic Geometry,
§18.4, Theorem 18.12(b)). Let `F : M → ℝⁿ` be an integrable system on a Hausdorff boundaryless
symplectic manifold `(M, σ)` of dimension `2n`, and let `L` be the connected component through
`x₀` of the level `F⁻¹(F x₀)`; assume `L` compact and every point of `L` a regular point of `F`;
other components of the level need not be regular, and no completeness is assumed. Then for every
positive period `p` there are an open neighbourhood `U` of `L`, an open set `D ⊆ ℝⁿ` and a map
`φ` from `M` to the cotangent bundle of the angle torus `Tⁿ = (ℝ/pℤ)ⁿ` which, on `U`, is an
injective local diffeomorphism onto the covectors `ξ` whose actions `Iᵢ(ξ) = ξ(eᵢ)` lie in `D`,
that is onto `Tⁿ × D`; which pulls the canonical form `ω = -dλ = Σ dθᵢ ∧ dIᵢ` back to `σ`; and
along which `F` is a function of the actions. For `p = 2π` these are the classical action–angle
coordinates. -/
theorem exists_actionAngle [FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M]
    {σ : TauCeti.SmoothTwoForm I M} (hσ : σ.IsSymplectic) {n : ℕ} {F : M → Fin n → ℝ}
    (hF : σ.IsIntegrableSystem F) {L : Set M} {x₀ : M}
    (hL : L = connectedComponentIn (F ⁻¹' {F x₀}) x₀) (hLc : IsCompact L)
    (hreg : ∀ x ∈ L, TauCeti.IsRegularPoint I 𝓘(ℝ, Fin n → ℝ) F x)
    (p : ℝ) [Fact (0 < p)] :
    ∃ U : Set M, IsOpen U ∧ L ⊆ U ∧ ∃ D : Set (Fin n → ℝ), IsOpen D ∧
      ∃ φ : M → TauCeti.CotangentBundle (ModelWithCorners.pi fun _ : Fin n ↦ 𝓘(ℝ))
          (Fin n → AddCircle p),
        Set.InjOn φ U ∧
        IsLocalDiffeomorphOn I ((ModelWithCorners.pi fun _ : Fin n ↦ 𝓘(ℝ)).prod
          𝓘(ℝ, (Fin n → ℝ) →L[ℝ] ℝ)) ∞ φ U ∧
        φ '' U = {ξ | (fun i ↦ ξ.2 (Pi.single i 1)) ∈ D} ∧
        (∀ x ∈ U, ∀ v w : TangentSpace I x,
          TauCeti.SmoothBundleForm.eval₂
              (TauCeti.CotangentBundle.symplecticForm
                (ModelWithCorners.pi fun _ : Fin n ↦ 𝓘(ℝ)) (Fin n → AddCircle p)) (φ x)
              (mfderiv I ((ModelWithCorners.pi fun _ : Fin n ↦ 𝓘(ℝ)).prod
                𝓘(ℝ, (Fin n → ℝ) →L[ℝ] ℝ)) φ x v)
              (mfderiv I ((ModelWithCorners.pi fun _ : Fin n ↦ 𝓘(ℝ)).prod
                𝓘(ℝ, (Fin n → ℝ) →L[ℝ] ℝ)) φ x w) =
            TauCeti.SmoothBundleForm.eval₂ σ x v w) ∧
        ∃ h : (Fin n → ℝ) → Fin n → ℝ, ∀ x ∈ U, F x = h (fun i ↦ (φ x).2 (Pi.single i 1)) := by
  sorry

/-! ## I3: Hamiltonian and Lagrangian mechanics -/

/-- **The Lagrangian vector field is second order** (I3; Marsden–Ratiu, Introduction to
Mechanics and Symmetry, Chapter 7). Let `L : TM → ℝ` be a smooth regular Lagrangian on a
finite-dimensional boundaryless manifold `M`, and let `X_E` be the Lagrangian vector field on
`TM`: the Hamiltonian vector field of the energy `E_L(v) = FL(v)(v) - L(v)` for the Cartan
two-form `ω_L = FL^*ω`. Then the projection `π : TM → M` maps `X_E(v)` to `v` itself,
`dπ(X_E(v)) = v`, at every tangent vector `v`. So the integral curves of `X_E` are the velocity
curves of curves in `M`, and these curves are the solutions of the Euler–Lagrange equations
`d/dt (∂L/∂v) = ∂L/∂q` in every chart. -/
theorem mfderiv_proj_lagrangianVectorField [FiniteDimensional ℝ E] [I.Boundaryless]
    {L : TangentBundle I M → ℝ} (hL : ContMDiff I.tangent 𝓘(ℝ, ℝ) ∞ L)
    (hreg : TauCeti.IsRegularLagrangian L) (v : TangentBundle I M) :
    mfderiv I.tangent I (Bundle.TotalSpace.proj : TangentBundle I M → M) v
        ((TauCeti.cartanTwoForm L hL).hamiltonianVectorField (TauCeti.lagrangianEnergy L) v) =
      v.2 := by
  sorry

/-- **The Legendre map carries the Euler–Lagrange flow to Hamilton's equations** (I3;
Marsden–Ratiu, Introduction to Mechanics and Symmetry, Chapter 7). Let `L : TM → ℝ` be a smooth
hyperregular Lagrangian on a finite-dimensional boundaryless manifold `M`: regular, with
bijective Legendre map `FL : TM → T*M`, which is then a diffeomorphism. Put `H = E_L ∘ FL⁻¹` on
the cotangent bundle. Then the derivative of `FL` carries the Lagrangian vector field `X_E` to the
Hamiltonian vector field of `H` for the canonical form `ω = -dλ`: `dFL(X_E(v)) = X_H(FL v)` for
every tangent vector `v`. -/
theorem mfderiv_legendreMap_lagrangianVectorField [FiniteDimensional ℝ E] [I.Boundaryless]
    {L : TangentBundle I M → ℝ} (hL : ContMDiff I.tangent 𝓘(ℝ, ℝ) ∞ L)
    (hreg : TauCeti.IsRegularLagrangian L)
    (hbij : Function.Bijective (TauCeti.legendreMap L)) (v : TangentBundle I M) :
    mfderiv I.tangent (I.prod 𝓘(ℝ, E →L[ℝ] ℝ)) (TauCeti.legendreMap L) v
        ((TauCeti.cartanTwoForm L hL).hamiltonianVectorField (TauCeti.lagrangianEnergy L) v) =
      (TauCeti.CotangentBundle.symplecticForm I M).hamiltonianVectorField
        (TauCeti.lagrangianEnergy L ∘ (Equiv.ofBijective _ hbij).symm)
        (TauCeti.legendreMap L v) := by
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

end TauCetiRoadmap.SymplecticGeometry.IntegrableSystems
