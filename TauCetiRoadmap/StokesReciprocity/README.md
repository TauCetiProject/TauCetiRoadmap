# Stokes flow: stress, reciprocal work, and dissipation

Develop the classical Lorentz reciprocal theorem as a consequence of reusable
Newtonian-stress algebra, differential identities, and boundary integration.
The application is symmetry of the boundary response of an incompressible viscous
fluid. The resulting API supports comparisons of known and unknown flows through
their boundary work, and supplies energy identities for viscous-flow applications.
The definitive specification is this README; `Suggested.lean` illustrates a subset
of the interfaces and is not an exhaustive checklist.

S1–S4 form a complete box-domain development, resting on existing Mathlib
algebra, calculus, and box integration. S5 is a separate required general-domain
milestone with the supplier contract below. S1–S4 have no dependency on S5 or on
general-domain Gauss–Green.

Suggested implementation home: `TauCeti/Analysis/PDE/Stokes/`, with general
matrix or calculus lemmas placed alongside their existing supplier APIs.

## Scope and conventions

The physical applications use real Euclidean dimension `d ≥ 2`.
Coordinate prototypes use `Fin d → ℝ`;
the geometric statements use `EuclideanSpace ℝ (Fin d)`. Supply the coordinate
equivalence and derivative/volume bridges, rather than silently identifying their
norms. All fields extend to an open neighbourhood of the closure of the domain.
Velocities are `C²`, pressures `C¹`, and body-force densities continuous there.
Both flows use the same constant real viscosity `μ`.
The equations hold on the domain interior; regularity holds on a neighbourhood
of its closure. Algebraic identities and local differential identities are stated
for arbitrary real `μ` and every finite dimension. Integrated reciprocity and the
dissipation equality use arbitrary real `μ` in every positive dimension `d ≥ 1`.
Nonnegative dissipation and positive semidefiniteness require `μ ≥ 0`;
response-matrix symmetry and congruence do not. Supply the physical corollaries
for `d ≥ 2` and `μ > 0` without imposing those stronger assumptions on the
underlying identities.

For a velocity `u`, pressure `p`, and body-force density `f`, set

```
(Du)ᵢⱼ = ∂ⱼuᵢ,        e(u) = (Du + Duᵀ)/2,
σ(u,p) = −p I + 2μ e(u),
(Div σ)ᵢ = Σⱼ ∂ⱼσᵢⱼ,  div u = Σᵢ ∂ᵢuᵢ,
Div σ + f = 0,          div u = 0.
```

`A:B = tr(Aᵀ B) = Σᵢⱼ Aᵢⱼ Bᵢⱼ` is the real Frobenius contraction, expressed
using Mathlib's `Matrix.trace`, transpose, and multiplication. The normal `n` points
out of the **fluid domain** and traction is `σ n`. On an internal solid boundary
this normal points into the solid; force exerted by fluid on solid has the opposite
sign. Body forces are per unit volume. Pressure has no imposed gauge.

S3–S4 use a coordinate box `Q = Πᵢ[aᵢ,bᵢ]`, with `aᵢ < bᵢ`, product Lebesgue
volume, and explicit `(d−1)`-dimensional face integrals. No global smooth boundary
or normal is required at edges and corners. S5 concerns bounded open domains
with `C¹` boundary, using normalized Euclidean Hausdorff surface measure
`H^(d−1)`. Connectedness is not needed for reciprocity.

These are identities for supplied classical solutions. Stokes existence theory,
weak tractions, exterior-domain limits, Stokeslets, slender-body estimates,
non-Newtonian constitutive laws, and unsteady reciprocity are outside this roadmap.
No solution existence, invertibility, or strict resistance positivity follows
merely from the reciprocal identity.

## Suppliers and ownership

* Mathlib: matrices, finite sums, `fderiv`, `ContDiffOn`, product and chain rules,
  Bochner integration, and
  `MeasureTheory.integral_divergence_of_hasFDerivAt_off_countable` in
  `Mathlib/MeasureTheory/Integral/DivergenceTheorem.lean` for boxes.
  For S5 coordinate transport, use `PiLp.continuousLinearEquiv` in
  `Mathlib/Analysis/Normed/Lp/PiLp.lean` and the existing
  `PiLp.volume_preserving_toLp` / `PiLp.volume_preserving_ofLp` in
  `Mathlib/MeasureTheory/Measure/Haar/InnerProductSpace.lean`. The new work is
  their specialization to the Stokes derivatives and integrands, not a new
  coordinate equivalence or proof of volume preservation.
* [GeometricMeasureTheory](../GeometricMeasureTheory/README.md), G2 and G6:
  normalized surface measure, Gauss–Green, and its agreement with classical
  normals on `C¹` domains. G6 uses the domain charts of
  [PDE](../PDE/README.md), A.6. These are suppliers for S5 only. Consume those
  domain definitions; a supplier specification is not an implemented theorem.
* This roadmap owns Newtonian stress and traction, reciprocal flux, the
  application of Gauss–Green to those fields, and the resulting work identities.
  It does not introduce a second surface measure, domain class, or general
  divergence theorem. The coordinate/Euclidean bridges and the localization
  needed to apply G6 to fields defined near a compact closure are explicit targets
  in S5 below.

## S1 — Stress and contraction API

Define symmetric gradient, Newtonian stress and traction. Prove component
formulas, linearity of stress in the pair `(u,p)` for fixed `μ`, stress symmetry,
traction linearity in the normal, and its sign under normal reversal. Establish
the pressure-shift formula `σ(u,p+c) = σ(u,p) − cI`.
Use `Matrix.mulVec` for traction and prove its coordinate formula. Establish
compatibility of these definitions with restriction to open subsets and equality
of fields on a neighbourhood, so derivatives do not depend on chosen extensions.

Develop finite-matrix contraction lemmas: symmetry and bilinearity, contraction
with transpose, orthogonality of symmetric and skew-symmetric matrices, and
`A:A ≥ 0` with equality iff `A=0`. Use `tr(Aᵀ B)` as the contraction spelling
and prove its component-sum formula. Reuse `Matrix.trace_mul_comm`,
`Matrix.trace_transpose`, and existing trace linearity; do not build a parallel
trace or Frobenius-norm API.
For arbitrary matrices `A,B` and scalars `p,q`, prove the identity

```
σμ(A,p):B − σμ(B,q):A = −p tr B + q tr A.
```

For trace-free `A,B` deduce reciprocal contraction; prove
`σμ(A,p):A = 2μ sym(A):sym(A)` when `tr A=0`. These algebraic statements
must not assume the PDE or a domain.

## S2 — Differential identities

Connect the matrix entries to the Fréchet derivative in the standard basis.
Develop the product rule for `Div` and the velocity/stress pairing, with explicit
differentiability assumptions. For the flux `J = σ(u,p)ᵀv − σ(v,q)ᵀu`, prove

```
div J = v·Div σ(u,p) − u·Div σ(v,q) − p div v + q div u.
```

For incompressible supplied solutions with forces `f,g`, derive
`div J = u·g − v·f`. Also prove the single-flow identity
`div(σ(u,p)ᵀu) = 2μ e(u):e(u) − u·f`.
The zero-force specializations are required corollaries. Establish regularity
of the stress and flux from the standing assumptions, so S3 can consume S2.
Prove closure of the incompressibility and momentum equations under addition and
real scalar multiplication, scaling the body force with the solution. Include
finite linear combinations and constant pressure shifts. State the equations as
explicit hypotheses, or as a transparent predicate containing exactly those
equations; regularity and domain hypotheses remain separate.

## S3 — Box boundary work and Lorentz reciprocity

First integrate the S2 identities over a nondegenerate closed coordinate box,
using Mathlib's face-integral theorem. Express its boundary sum as opposing
tractions on each pair of faces, and verify the orientation signs.

For each coordinate `i`, let `Qᵢ = Πⱼ≠ᵢ[aⱼ,bⱼ]` and let `ιᵢ⁺` and `ιᵢ⁻`
insert `bᵢ` and `aᵢ` respectively. Define the actual boundary-work functional

```
B_Q(v;u,p) = Σᵢ [∫Qᵢ v(ιᵢ⁺y)·σ(u,p)(ιᵢ⁺y)eᵢ dy
                 − ∫Qᵢ v(ιᵢ⁻y)·σ(u,p)(ιᵢ⁻y)eᵢ dy].
```

Use `Fin.insertNth` and `Fin.succAbove` as in Mathlib's box theorem, writing
`d = n+1` at that interface. Prove integrability of all face and volume
integrands from the standing regularity and compactness. Include `n=0`: integration
over the zero-dimensional face gives evaluation at the corresponding interval
endpoint. Prove the pairing
identity `J·n = v·σ(u,p)n − u·σ(v,q)n`, then establish

```
B_Q(v;u,p) + ∫Q v·f dx = B_Q(u;v,q) + ∫Q u·g dx.
```

For zero body forces deduce equality of the two boundary work integrals.
Prove bilinearity in the comparison velocity and the solution pair for fields
with the stated regularity, ensuring the integrability needed for linearity of
the Bochner integrals. The comparison field need not solve the PDE for this
bilinearity assertion. Prove
invariance of the total pairing under constant pressure shifts, using the box
divergence theorem to show total flux is zero for an incompressible comparison
velocity. Individual faces need not have pressure-invariant work.

## S4 — Box dissipation and finite boundary response

Prove the work/dissipation identity

```
B_Q(u;u,p) + ∫Q u·f dx = 2μ ∫Q e(u):e(u) dx.
```

The equality holds for arbitrary real `μ`; prove nonnegativity when `μ ≥ 0`.

For a finite family of supplied zero-force solutions `(uₐ,pₐ)` on the same
box, define `Rₐᵦ = B_Q(uₐ;uᵦ,pᵦ)`. Prove symmetry for arbitrary real `μ` and
positive semidefiniteness for `μ ≥ 0`, identifying its quadratic form with the
dissipation of
`Σₐ cₐuₐ`. Prove compatibility with linear changes of the family (congruence of
the matrix) and pressure gauge changes. Explicitly, for
`ũ_b = Σₐ Cₐb uₐ`, `p̃_b = Σₐ Cₐb pₐ`, the response is `Cᵀ R C`.
Use Mathlib's `Matrix.PosSemidef` and prove the real quadratic-form identity
`cᵀ R c = 2μ ∫Q e(Σₐ cₐuₐ):e(Σₐ cₐuₐ)`.
This is a boundary-work response matrix;
claiming a physical rigid-body resistance matrix requires specifying its boundary
modes and force/torque convention, which is outside this scope.

## S5 — General bounded domains: supplier contract and specialization

Consume GMT G2/G6 and PDE A.6 for a bounded open `Ω` with `C¹` boundary.
Here `C¹` boundary means that the existing local graph charts can be chosen with
`C¹` graph functions; use those supplier charts and their classical-normal
comparison, rather than an unrelated smooth-domain class. Establish the bridge
from these charts to the supplier's Lipschitz-domain hypotheses by shrinking
charts and using compactness of the boundary.
The required supplier statement, in their canonical domain and measure APIs, is

```
∫Ω div F dx = ∫∂Ω F·n dH^(d−1),
```

for a vector field `F` that is `C¹` on an open neighbourhood of `closure Ω`.
The supplier must provide the outward normal almost everywhere, its measurability
and unit length, finite boundary measure, and agreement of normalized Hausdorff
surface measure with classical chart integration. A compact-support version is
sufficient provided localization supplies the displayed version. This contract
is a theorem target in G6, not a hypothesis to bundle into a new domain type.

This milestone owns the derivative/volume transport from coordinates to
`EuclideanSpace`, the smooth-cutoff localization for the reciprocal flux, and
the proof that all integrands meet the supplier's hypotheses. Apply the supplier
in its classical-domain form; when using the finite-perimeter formulation,
explicitly obtain finite perimeter of `Ω` and identify its reduced-boundary
normal and perimeter measure with the classical ones through G6's comparison.
Apply Gauss–Green
to the actual flux and use S1–S2 to obtain reciprocity with
`B_Ω(v;u,p) = ∫∂Ω v·σ(u,p)n dH^(d−1)`. Prove the corresponding dissipation,
pressure-gauge invariance, finite response-matrix results, and additivity over
finite measurable boundary partitions. Do not derive this theorem by assuming
the reciprocal identity, or by declaring a private Gauss–Green axiom.

Completion of S3–S4 is independent of this supplier contract. Completion of the
whole roadmap includes S5 and requires an actual supplier theorem and checked
interface; citing G6 alone does not discharge this milestone.

## Completion criteria

S1–S2 supply definitions, their usable algebra/calculus API, and local identities.
S3 supplies the explicit face-integral theorem and its zero-force and gauge
corollaries. S4 supplies dissipation, finite superposition, and the response-matrix
API. S5 supplies the geometric specialization on canonical surface/domain APIs.
All four acceptance examples below must use the developed definitions and
theorems. An abstract bilinear form assumed symmetric, or a boundary-work identity
assumed as a hypothesis, does not implement the Stokes results. No claim about
strict positivity or existence of solutions is part of the completion criterion.

## Acceptance examples

1. Constant velocities and constant pressures: zero strain, balanced total flux,
   and zero total work on a closed boundary.
2. Affine divergence-free flows `u(x)=Ax+b`, with `tr A=0` and constant pressure:
   constant stress, zero body force, and the reciprocal identity on a box.
3. Planar shear embedded in any dimension `d≥2`: verify that dissipation is
   nonnegative and that opposite box faces use opposite traction signs.
4. A forced polynomial flow: take `u(x)=(x₂²,0,…,0)`, `p=0`,
   `f=(-2μ,0,…,0)`, and comparison flow `v=(1,0,…,0)`, `q=0`, `g=0`.
   Check both sides of the forced reciprocal identity on a box. This detects a
   sign error that zero-force examples cannot expose.

## Mathematical references

* Sangtae Kim and Seppo J. Karrila, *Microhydrodynamics: Principles and Selected
  Applications*, Butterworth–Heinemann, 1991. §1.2 gives the governing equations;
  §2.2 covers energy dissipation and §2.3 the Lorentz reciprocal theorem. These
  are the primary textbook anchors for S1–S4. Chapter 5 supplies the physical
  resistance/mobility context, without adding its full scope to this roadmap.
  [Publisher contents](https://shop.elsevier.com/books/microhydrodynamics/kim/978-0-7506-9173-4).
* John Happel and Howard Brenner, *Low Reynolds Number Hydrodynamics: With Special
  Applications to Particulate Media*, 1983 edition. A complementary classic
  reference for the Stokes-flow framework and hydrodynamic reciprocity.
  [Publisher record](https://link.springer.com/book/10.1007/978-94-009-8352-6).

These references anchor the classical mathematics. The dimension-general,
body-force-explicit statements, box endpoint, supplier contract, and Lean API
are specified here with their own hypotheses; they are not claimed to be verbatim
textbook theorems. Textbook references do not certify library coverage.
