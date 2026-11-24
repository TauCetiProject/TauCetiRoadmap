# Roadmap: Stokes flow — stress, reciprocal work, and dissipation

**Summary.** This roadmap develops the Newtonian stress of an incompressible viscous fluid and the
integral identities of steady Stokes flow that follow from it. For a velocity `u`, pressure `p` and
body-force density `f` satisfying `Div σ(u,p) + f = 0` and `div u = 0`, with
`σ(u,p) = −p I + 2μ e(u)`, the headline theorems are as follows.

* **Lorentz reciprocity.** For two such solutions `(u,p,f)` and `(v,q,g)` with the same constant
  real viscosity `μ`, on a bounded Lipschitz domain `Ω`,
  `∫∂Ω v·σ(u,p)n dS + ∫Ω v·f dx = ∫∂Ω u·σ(v,q)n dS + ∫Ω u·g dx`.
* **Work and dissipation.** For one solution, the boundary work plus the body-force work equals
  `2μ ∫Ω e(u):e(u) dx`. More generally, against any `C¹` comparison field `v`, the boundary work
  equals `∫Ω (2μ e(u):e(v) − p div v) dx − ∫Ω v·f dx`; this needs no PDE for `v` and no
  incompressibility.
* **Boundary response.** For a finite family of zero-force solutions, the matrix of mutual
  boundary works is symmetric for every real `μ`, and positive semidefinite when `μ ≥ 0`. Its
  quadratic form is the dissipation of the superposed flow.

All of these are first proved on coordinate boxes from Mathlib's box divergence theorem, then on
bounded Lipschitz domains (in particular `C¹` domains) from the Gauss–Green formula of
[GeometricMeasureTheory](../GeometricMeasureTheory/README.md) Layer 6, on the Lipschitz-domain
model of [PDE](../PDE/README.md) §1.6. The stress and contraction algebra, the differential
identities, and the boundary-work API are reusable by later viscous-flow roadmaps.

Layer 1 is the matrix algebra of stress and contraction; Layer 2 the differential identities; Layer
3 boundary work and reciprocity on a box; Layer 4 dissipation and the boundary-response matrix on a
box; Layer 5 the same results on bounded Lipschitz domains, coordinate-free. Layers 1–4 do not
depend on Layer 5 or on general-domain Gauss–Green.

The definitive specification is this README; `Suggested.lean` states the headline theorems in
suggested forms and is not an exhaustive checklist. Suggested implementation home:
`TauCeti/Analysis/PDE/Stokes/`, with general matrix or calculus lemmas placed alongside their
existing supplier APIs.

## Conventions

The physical applications use real dimension `d ≥ 2`. Layers 1–4 use coordinates
`Fin d → ℝ`, matching Mathlib's box divergence theorem. Layer 5 is coordinate-free on the carrier
`WithLp 2 (ℝ × E)` of the domain supplier, with `E` a finite-dimensional real inner-product space
and `d = 1 + finrank ℝ E`. Layers 2 and 5 supply the bridges between the two, rather than silently
identifying their norms.

For a velocity `u`, pressure `p`, and body-force density `f`, set (Kim–Karrila, §1.2)

```
(Du)ᵢⱼ = ∂ⱼuᵢ,        e(u) = (Du + Duᵀ)/2,
σ(u,p) = −p I + 2μ e(u),
(Div σ)ᵢ = Σⱼ ∂ⱼσᵢⱼ,  div u = Σᵢ ∂ᵢuᵢ,
Div σ + f = 0,          div u = 0.
```

A *solution* satisfies both equations; an *incompressible* field satisfies `div u = 0`. Both flows
in an identity use the same constant real viscosity `μ`. `A:B = tr(Aᵀ B) = Σᵢⱼ Aᵢⱼ Bᵢⱼ` is the real
Frobenius contraction, spelled with Mathlib's `Matrix.trace`, transpose and multiplication.

All fields extend to an open neighbourhood of the closure of the domain. Solution velocities are
`C²`, pressures `C¹`, and body-force densities continuous there. The general boundary-work identity
only requires its comparison velocity to be `C¹` (Layer 3). The equations hold on the domain
interior; regularity holds on a neighbourhood of its closure.

Algebraic and local differential identities hold for arbitrary real `μ` in every finite dimension.
Integrated reciprocity and the dissipation equality hold for arbitrary real `μ` in every positive
dimension `d ≥ 1`. Nonnegative dissipation and positive semidefiniteness require `μ ≥ 0`;
response-matrix symmetry and congruence do not. The physical corollaries for `d ≥ 2` and `μ > 0` are
targets too, without imposing those stronger assumptions on the underlying identities.

The normal `n` points out of the **fluid domain** and traction is `σ n`. On an internal solid
boundary this normal points into the solid; force exerted by fluid on solid has the opposite sign.
Body forces are per unit volume. Pressure has no imposed gauge.

Layers 3–4 use a coordinate box `Q = Πᵢ[aᵢ,bᵢ]`, with `aᵢ < bᵢ`, product Lebesgue volume, and
explicit `(d−1)`-dimensional face integrals. No global smooth boundary or normal is required at
edges and corners. Layer 5 uses a bounded open `Ω ⊆ WithLp 2 (ℝ × E)` satisfying
`Set.IsLipschitzDomainWith`, the surface measure `Hᵈ⁻¹ = μHE[finrank ℝ E]` (Mathlib's normalized
Euclidean Hausdorff measure) restricted to `frontier Ω`, and the outer normal
`TauCeti.outerNormal volume ⊤ Ω`. Connectedness is not needed for reciprocity.

## Layer 1: Stress and contraction

Define symmetric gradient, Newtonian stress and traction. Prove component formulas, linearity of
stress in the pair `(u,p)` for fixed `μ`, stress symmetry, traction linearity in the normal, and its
sign under normal reversal. Establish the pressure-shift formula `σ(u,p+c) = σ(u,p) − cI`. Use
`Matrix.mulVec` for traction and prove its coordinate formula. Establish compatibility of these
definitions with restriction to open subsets and equality of fields on a neighbourhood, so
derivatives do not depend on chosen extensions.

Develop finite-matrix contraction lemmas: symmetry and bilinearity, contraction with transpose,
orthogonality of symmetric and skew-symmetric matrices, and `A:A ≥ 0` with equality iff `A=0`. Use
`tr(Aᵀ B)` as the contraction spelling and prove its component-sum formula. Reuse
`Matrix.trace_mul_comm`, `Matrix.trace_transpose`, and existing trace linearity; do not build a
parallel trace or Frobenius-norm API. For arbitrary matrices `A,B` and scalars `p,q`, prove the
identity

```
σμ(A,p):B − σμ(B,q):A = −p tr B + q tr A.
```

For trace-free `A,B` deduce reciprocal contraction; prove `σμ(A,p):A = 2μ sym(A):sym(A)` when
`tr A=0`. These algebraic statements must not assume the PDE or a domain.

Prove orthogonal covariance of the matrix operations: for an orthogonal matrix `O`, symmetric
gradient and stress transform by `A ↦ O A Oᵀ`, traction by `n ↦ O n`, and contraction is invariant.
Include reflections as well as rotations. These are algebraic targets independent of boundary
integration.

## Layer 2: Differential identities

Connect the matrix entries to the Fréchet derivative in the standard basis. Prove the
constant-viscosity bridge

```
Div σ(u,p) = −grad p + μ Δu + μ grad(div u).
```

Use Mathlib's `gradient` and vector-valued Laplacian on `EuclideanSpace`, proving their agreement
with the coordinate formulas and the required interchange of second derivatives for `C²`
velocities. For incompressibility on an open set, deduce equivalence of the momentum equation with
`−grad p + μ Δu + f = 0` there. Vanishing divergence only at one point does not justify dropping its
gradient. No sign or nonzero assumption on `μ` is needed.

Develop the product rule for `Div` and the velocity/stress pairing, with explicit
differentiability assumptions. For the flux `J = σ(u,p)ᵀv − σ(v,q)ᵀu`, prove

```
div J = v·Div σ(u,p) − u·Div σ(v,q) − p div v + q div u.
```

For incompressible solutions with forces `f,g`, derive `div J = u·g − v·f`. For a solution
`(u,p)` with force `f`, prove the single-flow identity
`div(σ(u,p)ᵀu) = 2μ e(u):e(u) − p div u − u·f`, and so `div(σ(u,p)ᵀu) = 2μ e(u):e(u) − u·f` when `u`
is incompressible. The zero-force specializations are required corollaries. Establish regularity of
the stress and flux from the standing assumptions, so Layer 3 can consume Layer 2. Prove closure of
the incompressibility and momentum equations under addition and real scalar multiplication,
scaling the body force with the solution. Include finite linear combinations and constant pressure
shifts. State the equations as explicit hypotheses, or as a transparent predicate containing
exactly those equations; regularity and domain hypotheses remain separate.

For `T(x)=O x+c`, transport fields by `u'(T x)=O u(x)`, `p'(T x)=p(x)` and `f'(T x)=O f(x)`. Prove
covariance of derivatives, stress, traction, and the momentum/incompressibility equations using
Layer 1 and the chain rule. Establish the corresponding coordinate-free formulation on any
positive-dimensional finite real inner-product space, with stress `−p I + μ (Du + Du*)` using
`ContinuousLinearMap.adjoint` and divergence `LinearMap.trace`, and prove that in every orthonormal
basis it agrees with the coordinate formulation, independently of the basis. Use the existing
isometry and derivative APIs, not a second notion of Euclidean vector or tensor. Boundary-work
transport is in Layer 5; arbitrary rotations need not preserve coordinate boxes.

## Layer 3: Box boundary work and Lorentz reciprocity

First integrate the Layer 2 identities over a nondegenerate closed coordinate box, using Mathlib's
face-integral theorem. Express its boundary sum as opposing tractions on each pair of faces, and
verify the orientation signs.

For each coordinate `i`, let `Qᵢ = Πⱼ≠ᵢ[aⱼ,bⱼ]` and let `ιᵢ⁺` and `ιᵢ⁻` insert `bᵢ` and `aᵢ`
respectively. Define the boundary-work functional

```
B_Q(v;u,p) = Σᵢ [∫Qᵢ v(ιᵢ⁺y)·σ(u,p)(ιᵢ⁺y)eᵢ dy
                 − ∫Qᵢ v(ιᵢ⁻y)·σ(u,p)(ιᵢ⁻y)eᵢ dy].
```

Use `Fin.insertNth` and `Fin.succAbove` as in Mathlib's box theorem, writing `d = n+1` at that
interface. Prove integrability of all face and volume integrands from the standing regularity and
compactness. Include `n=0`: integration over the zero-dimensional face gives evaluation at the
corresponding interval endpoint. Prove the pairing identity for a single stress and comparison
field and integrate it to obtain the general boundary-work identity

```
B_Q(v;u,p) + ∫Q v·f dx = ∫Q (2μ e(u):e(v) − p div v) dx.
```

Here `u` is `C²`, `p` is `C¹`, `f` is continuous, and `Div σ(u,p)+f=0` in the interior; `v` need
only be `C¹` near the closure. Neither a PDE for `v` nor incompressibility of either field is needed
for this identity. Prove integrability at this regularity. Prove the reciprocal-flux pairing
identity `J·n = v·σ(u,p)n − u·σ(v,q)n`, and from it the Lorentz reciprocal theorem for two
incompressible solutions (Kim–Karrila, §2.3; Happel–Brenner, §3-5, p. 85)

```
B_Q(v;u,p) + ∫Q v·f dx = B_Q(u;v,q) + ∫Q u·g dx.
```

For zero body forces deduce equality of the two boundary work integrals. Prove bilinearity in the
comparison velocity and the solution pair for fields with the stated regularity, ensuring the
integrability needed for linearity of the Bochner integrals. The comparison field need not solve
the PDE for this bilinearity assertion. Prove invariance of the total pairing under constant
pressure shifts, using the box divergence theorem to show total flux is zero for an incompressible
comparison velocity. Individual faces need not have pressure-invariant work.

## Layer 4: Box dissipation and finite boundary response

For an incompressible solution `(u,p)` with force `f`, prove the work/dissipation identity
(Kim–Karrila, §2.2)

```
B_Q(u;u,p) + ∫Q u·f dx = 2μ ∫Q e(u):e(u) dx.
```

The equality holds for arbitrary real `μ`; prove nonnegativity when `μ ≥ 0`. Without
incompressibility the right side is `∫Q (2μ e(u):e(u) − p div u) dx`, the case `v = u` of Layer 3.

For a finite family of zero-force incompressible solutions `(uₐ,pₐ)` on the same box, define
`Rₐᵦ = B_Q(uₐ;uᵦ,pᵦ)`. Prove symmetry for arbitrary real `μ` and positive semidefiniteness for
`μ ≥ 0`, identifying its quadratic form with the dissipation of `Σₐ cₐuₐ`. Prove compatibility with
linear changes of the family (congruence of the matrix) and pressure gauge changes. Explicitly, for
`ũ_b = Σₐ Cₐb uₐ`, `p̃_b = Σₐ Cₐb pₐ`, the response is `Cᵀ R C`. Use Mathlib's `Matrix.IsSymm` and
`Matrix.PosSemidef` and prove the real quadratic-form identity
`cᵀ R c = 2μ ∫Q e(Σₐ cₐuₐ):e(Σₐ cₐuₐ)`. This is a boundary-work response matrix; claiming a
physical rigid-body resistance matrix requires specifying its boundary modes and force/torque
convention, which is outside this scope.

## Layer 5: Bounded Lipschitz domains

Let `Ω ⊆ WithLp 2 (ℝ × E)` be bounded and open with `Ω.IsLipschitzDomainWith L` for some `L`. `C¹`
domains are included through `TauCeti.isLipschitzDomainWith_of_contDiffAt`; this layer introduces
no other domain class. Define

```
B_Ω(v;u,p) = ∫∂Ω v·σ(u,p)n dHᵈ⁻¹,
```

with `Hᵈ⁻¹ = μHE[finrank ℝ E]` restricted to `frontier Ω` and `n = TauCeti.outerNormal volume ⊤ Ω`,
using the coordinate-free stress of Layer 2. The momentum equation is used through its components
along constant vectors: for the symmetric stress, `(Div σ)·a = div(σ a)`.

Apply the divergence theorem of GeometricMeasureTheory §6.2, `∫Ω div F = ∫∂Ω F·n dHᵈ⁻¹`, to the
actual fields. That theorem is stated for compactly supported `C¹` fields; this layer owns the
smooth-cutoff localization that applies it to fields that are `C¹` only near `closure Ω`, and the
proof that all integrands meet its hypotheses. Establish, in order:

* the general boundary-work identity of Layer 3 on `Ω`, with the same `C¹` comparison-field
  regularity and without incompressibility assumptions;
* Lorentz reciprocity
  `B_Ω(v;u,p) + ∫Ω v·f dx = B_Ω(u;v,q) + ∫Ω u·g dx` for incompressible solutions;
* the dissipation identity, pressure-gauge invariance, and the finite response-matrix results of
  Layer 4 on `Ω`.

Prove independence of measurable normal representatives that agree `Hᵈ⁻¹`-almost everywhere on
`frontier Ω`, and identify `n` with the classical outward normal of a `C¹` domain through §6.2. For
finite measurable pieces covering the frontier up to a null set and pairwise intersecting in null
sets, prove boundary-work additivity; establish integrability of each restricted integrand. No
pressure-gauge invariance of an individual piece is asserted.

Using Layer 2, the suppliers' normal transformation laws, and isometry invariance of volume and
surface measure, prove boundary-work and dissipation invariance under `T(x)=O x+c` for a linear
isometry `O`, with transformed fields as specified in Layer 2 and outward normal `n'(T x)=O n(x)`
almost everywhere. No determinant sign enters the unsigned surface measure, including for
reflections. Transport the results to arbitrary positive-dimensional finite real inner-product
spaces through a linear isometry equivalence with `WithLp 2 (ℝ × E)`, and prove independence of the
chosen identification. Do not derive reciprocity by assuming the reciprocal identity, or by
declaring a private Gauss–Green axiom.

## Worked examples

All examples use the developed definitions and theorems.

1. Constant velocities and constant pressures: zero strain, balanced total flux, and zero total work
   on a closed boundary.
2. Affine divergence-free flows `u(x)=Ax+b`, with `tr A=0` and constant pressure: constant stress,
   zero body force, and the reciprocal identity on a box.
3. Planar shear embedded in any dimension `d≥2`: verify that dissipation is nonnegative and that
   opposite box faces use opposite traction signs.
4. A forced polynomial flow: take `u(x)=(x₂²,0,…,0)`, `p=0`, `f=(-2μ,0,…,0)`, and comparison flow
   `v=(1,0,…,0)`, `q=0`, `g=0`. Check both sides of the forced reciprocal identity on a box. This
   detects a sign error that zero-force examples cannot expose.
5. In dimension `d≥2`, use the affine flow `u(x)=Ax`, where `A=diag(1,−1,0,…,0)`, with zero pressure
   and force on a ball and on a concentric annulus `r<‖x‖<R`, `0<r<R`. Establish the
   Lipschitz-domain hypotheses using the supplier APIs, and compute total work as `4μ|Ω|`. On the
   annulus, compute outer and inner contributions as `4μ|ball 0 R|` and `−4μ|ball 0 r|`,
   respectively. This exercises Layer 5's surface measure, inner normal, and partition API.
6. On a box in dimension `d≥2`, take zero-pressure, zero-force velocities `u₁=x₂e₁` and `u₂=x₁e₂`.
   Compute `R=μ|Q| [[1,1],[1,1]]`. For the new family `(u₁+u₂,u₁−u₂)`, compute
   `CᵀRC=μ|Q| diag(4,0)` with `C=[[1,1],[1,−1]]`. Verify the quadratic-form identity and positive
   semidefiniteness when `μ≥0`.
7. Rigid rotation `u(x)=Wx` with a nonzero skew-symmetric `W`, and zero pressure and force: strain,
   stress, and dissipation vanish although velocity need not vanish. Include this on a box and a
   ball; it tests the null direction in the preceding response example without claiming
   coercivity.
8. Apply a translation and an orthogonal map, including a reflection, to the ball/annulus examples
   and verify unchanged work and transformed tractions. Verify the one-dimensional endpoint
   specialization and `μ=0` identities, and use an affine comparison field with nonzero divergence
   and constant nonzero pressure to test the pressure term in the general boundary-work identity.

## Scope and ownership

This roadmap owns Newtonian stress and traction, reciprocal flux, the application of the box and
general-domain divergence theorems to those fields, and the resulting work, reciprocity,
dissipation and response identities. It does not introduce a second surface measure, domain class,
or divergence theorem.

These are identities for supplied classical solutions. Stokes existence theory, weak tractions,
exterior-domain limits, Stokeslets, slender-body estimates, non-Newtonian constitutive laws, and
unsteady reciprocity are outside this roadmap. No solution existence, invertibility, or strict
resistance positivity follows from the reciprocal identity, and none is claimed.

Layers 1–2 are complete with their definitions, algebra and calculus API, the Laplacian bridge,
coordinate covariance and basis independence, and local identities. Layer 3 is complete with the
general boundary-work identity, the explicit face-integral theorem, and the zero-force and gauge
corollaries; Layer 4 with dissipation, finite superposition and the response-matrix API. Layer 5 is
complete with the general-domain results, normal-representative independence, partition
additivity and isometric transport, proved from the supplier theorems below. An abstract bilinear
form assumed symmetric, or a boundary-work identity assumed as a hypothesis, does not implement
these results.

## Exact supplier contracts

### From Mathlib

Matrices, finite sums, `Matrix.trace`, `Matrix.IsSymm`, `Matrix.PosSemidef`, `fderiv`,
`ContDiffAt`, product and chain rules, `LinearMap.trace`, `ContinuousLinearMap.adjoint`, linear
and affine isometries, and Bochner integration. `gradient` is in
`Mathlib/Analysis/Calculus/Gradient/Basic.lean`, and the Laplacian (the trace of the Hessian) in
`Mathlib/Analysis/InnerProductSpace/Laplacian.lean`. Layers 3–4 use
`MeasureTheory.integral_divergence_of_hasFDerivAt_off_countable` in
`Mathlib/MeasureTheory/Integral/DivergenceTheorem.lean`. Layer 5 uses
`MeasureTheory.Measure.euclideanHausdorffMeasure` (`μHE[k]`) and its comparisons with `volume`.
The coordinate bridges of Layers 2 and 5 use `OrthonormalBasis.repr`,
`PiLp.continuousLinearEquiv` in `Mathlib/Analysis/Normed/Lp/PiLp.lean` and
`PiLp.volume_preserving_toLp` / `PiLp.volume_preserving_ofLp` in
`Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean`; the new work is their specialization
to the Stokes derivatives and integrands, not a new coordinate equivalence or proof of volume
preservation.

### From PDE

§1.6 (A6): the Lipschitz-domain predicate `Set.IsLipschitzDomainWith` on `WithLp 2 (ℝ × E)`, its
chart restriction and finite chart cover for bounded domains, and the Lipschitz-graph surface
measure. Tau Ceti already has `Set.IsLipschitzDomainWith` and the `C¹` comparison
`TauCeti.isLipschitzDomainWith_of_contDiffAt`. Layer 5 only.

### From GeometricMeasureTheory

Layer 6. §6.1: `TauCeti.outerNormal`, `TauCeti.reducedBoundary`, and the Gauss–Green formula
`TauCeti.integral_trace_fderiv_mul_indicator_eq_integral_inner_outerNormal`, already in Tau Ceti.
§6.2: for a bounded Lipschitz domain, finite perimeter, `Hᵈ⁻¹`-almost every boundary point in the
reduced boundary, `|Dχ_Ω| = Hᵈ⁻¹⌊∂Ω`, the divergence theorem `∫Ω div φ = ∫∂Ω ⟪φ, ν_Ω⟫ dHᵈ⁻¹` for
compactly supported `C¹` fields, and agreement of `ν_Ω` with the classical normal of a `C¹`
domain. Layer 5 only.

## References

* Sangtae Kim and Seppo J. Karrila, *Microhydrodynamics: Principles and Selected Applications*,
  Butterworth–Heinemann, 1991. §1.2 (governing equations), §2.2 (energy dissipation), §2.3 (the
  Lorentz reciprocal theorem); Chapter 5 gives the physical resistance/mobility context, without
  adding its scope to this roadmap.
  [Publisher contents](https://shop.elsevier.com/books/microhydrodynamics/kim/978-0-7506-9173-4).
* John Happel and Howard Brenner, *Low Reynolds Number Hydrodynamics: With Special Applications to
  Particulate Media*, 1983 edition. §3-5 (generalized reciprocal theorem, p. 85).
  [Publisher record](https://link.springer.com/book/10.1007/978-94-009-8352-6) and
  [publisher contents](https://link.springer.com/content/pdf/bfm:978-94-009-8352-6/1).

These references anchor the classical mathematics. The dimension-general, body-force-explicit
statements, box endpoint, supplier contract, and Lean API are specified here with their own
hypotheses; they are not claimed to be verbatim textbook theorems.
