# Roadmap: meromorphic nonintegrability of the circular restricted three-body problem

The summit is Yagasaki's theorem that the **circular restricted** three-body problem is
meromorphically nonintegrable near either primary, for every fixed mass ratio
`0 < μ < 1`, in both the planar and spatial cases. More precisely, on the complex
algebraic varieties used to make the square-root potentials single-valued, there is no
complete set of first integrals in involution, functionally independent almost
everywhere, and meromorphic away from the critical set. The planar problem would need
one first integral independent of its Hamiltonian; the spatial problem would need two.

The target is [Yagasaki, *Non-integrability of the restricted three-body problem*,
Theorem 1.1](https://arxiv.org/html/2106.04925v7#S1.Thmthm1), published in
[*Ergodic Theory and Dynamical Systems* 44 (2024), 3012–3040](https://doi.org/10.1017/etds.2024.4).
The paper's more reusable engine, its Theorem 2.1, is an equally important target: a
nonintegrability criterion for meromorphic perturbations of integrable systems near a
resonant periodic orbit.

This is a library roadmap, not a plan to transcribe one calculation. The proof rests on
classical mechanics, complex manifolds and meromorphic continuation, higher variational
equations, Picard–Vessiot theory, linear algebraic groups, and the
Morales–Ramis–Simó/Ayoul–Zung obstruction. Almost all of that infrastructure is absent
from Mathlib. Build each subject as reusable mathematics before specializing it to
celestial mechanics.

Suggested homes:

- `TauCeti/Dynamics/` for vector fields, integrability, variational equations, and flows;
- `TauCeti/Geometry/Symplectic/` for the manifold-level Hamiltonian API shared with the
  [Heegaard Floer roadmap](../HeegaardFloer/README.md);
- `TauCeti/FieldTheory/Differential/` for Picard–Vessiot and differential Galois theory;
- `TauCeti/Analysis/Complex/Continuation/` for meromorphic functions on Riemann surfaces,
  analytic continuation, and monodromy;
- `TauCeti/CelestialMechanics/` for Kepler, Delaunay variables, and the restricted
  three-body application.

## Scope: what the summit does and does not say

- **Restricted, circular problem.** Two primaries move on circular orbits and the third
  body is massless. This is not the unrestricted Newtonian three-body problem, and the
  roadmap must never silently drop “circular restricted.”
- **Local meromorphic obstruction.** The theorem is near either primary on a punctured
  complex neighbourhood, not a classification of all real trajectories and not a claim
  that solutions do not exist.
- **Fixed physical mass ratio.** The conclusion holds for every `μ ∈ (0,1)`. The
  perturbation parameter `ε` used in the blow-up near a primary is not `μ`; dependence of
  putative integrals on `ε` is induced by the coordinate change and must be justified.
- **A precise integrability notion.** The general engine uses Bogoyavlenskij
  `(q,n-q)`-integrability: `q` generically independent commuting vector fields, including
  the system itself, and `n-q` generically functionally independent common first
  integrals. In the Hamiltonian application this specializes to Liouville integrability.
- **Complex meromorphic category.** “Almost everywhere” here means on a nonempty dense
  open locus (equivalently, away from a proper analytic/algebraic exceptional set in the
  applications), not measure-theoretic `ae`. Pin that convention in the API.
- **The integrable boundary matters.** At `μ = 0` the problem reduces, after the standard
  frame changes, to Kepler and is integrable. The summit assumes `0 < μ < 1`; endpoint
  simplifications are acceptance tests, not cases of the theorem.

## Coordinate and sign conventions

Work in the uniformly rotating frame, with the primaries of masses `μ` and `1-μ` at
`(1-μ,0)` and `(-μ,0)`. Use canonical coordinates and

```text
H₂ = ½(px²+py²) + px*y - py*x - U₂,
H₃ = ½(px²+py²+pz²) + px*y - py*x - U₃,

U₂ = μ/r₁ + (1-μ)/r₂,
U₃ = μ/r₁ + (1-μ)/r₂.
```

Here `r₁² = (x-1+μ)²+y²(+z²)` and
`r₂² = (x+μ)²+y²(+z²)`. The symplectic convention is
`ω = Σ dqᵢ ∧ dpᵢ` and Hamilton's equations are
`q̇ᵢ = ∂H/∂pᵢ`, `ṗᵢ = -∂H/∂qᵢ`. Fix these signs before proving any coordinate formula.

For complexification, do **not** choose a global square-root branch. Adjoin `u₁,u₂`
with `uⱼ² = rⱼ²`, restrict to the resulting algebraic variety `𝒮₂` or `𝒮₃`, and write the
vector field rationally using `uⱼ⁻³`. Remove the critical/collision locus where the
projection ramifies and the rational vector field has a pole. Prove that the real
positive-distance sheet recovers the physical equations.

For Delaunay variables use the paper's actions and angles, including
`H_K = -(1-μ)/(2 I₁²)` and `ω₁ = (1-μ)/I₁³`. Record every branch and period of the complex
inverse trigonometric functions. Equal real formulas do not automatically define the
same meromorphic continuation.

## What the pinned Mathlib already provides

The dependency audit below is against Mathlib commit
[`9caeba1`](https://github.com/leanprover-community/mathlib4/commit/9caeba1000ef8f302920981f4a08651d325abc81)
(the repository pin when this roadmap was written).

- Fréchet derivatives, higher derivatives, analytic functions, contour and interval
  integrals, matrices, finite-dimensional linear algebra, and local ODE existence and
  uniqueness. In particular, consume
  `Mathlib/Analysis/ODE/ExistUnique.lean` and do not rebuild Picard–Lindelöf.
- Vector fields on normed spaces and their Lie bracket
  [`VectorField.lieBracket`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Calculus/VectorField.html#VectorField.lieBracket),
  plus the manifold Lie bracket in
  `Mathlib/Geometry/Manifold/VectorField/LieBracket.lean`.
- Smooth and complex manifolds, tangent bundles, differential forms, and exterior
  derivatives. These are substrate, not a symplectic-manifold or Hamiltonian API.
- Local one-variable meromorphic functions on `ℂ` through `MeromorphicAt` and
  `MeromorphicOn`. The existing type is for maps whose **domain is the scalar field**;
  it is not a theory of meromorphic maps on a several-variable complex manifold or an
  algebraic variety.
- Differential rings and fields through
  [`Differential`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/RingTheory/Derivation/DifferentialRing.html#Differential),
  `DifferentialAlgebra`, and `Differential.ContainConstants`, together with logarithmic
  derivatives and the Rosenlicht/Liouville elementary-antiderivative theorem in
  `Mathlib/FieldTheory/Differential/Liouville.lean`. This is a valuable algebraic base,
  but it is **not** Picard–Vessiot theory.
- General field Galois theory and substantial affine algebraic geometry. Reuse these for
  differential automorphisms and Zariski-closed matrix groups.
- The [Contour Integration roadmap](../ContourIntegration/README.md) supplies reusable
  piecewise-smooth complex paths and classical residue/continuation infrastructure as it
  lands. The present proof needs ordinary complex contour integrals and asymptotic
  estimates, not the Hungerbühler–Wasem on-contour theorem.
- Tau Ceti already has pointwise linear symplectic forms, compatible almost-complex
  structures, and symplectic transport. Consume that work and the manifold lift in
  Heegaard Floer Lane F2.1 rather than introducing a second symplectic vocabulary.

## What is missing

No matching open Mathlib or Tau Ceti pull request was found in searches made on
2026-08-04. The missing tower is substantial:

- generic independence and Bogoyavlenskij/Liouville integrability for vector fields;
- symplectic manifolds, Hamiltonian vector fields, Poisson brackets, and canonical
  coordinate changes;
- meromorphic maps and vector fields on complex manifolds/algebraic varieties;
- parameter-dependent flows and a packaged theory of first and higher variational
  equations;
- Picard–Vessiot extensions, differential Galois groups as linear algebraic groups,
  identity components, and the monodromy subgroup;
- Morales–Ramis, Morales–Ramis–Simó, and Ayoul–Zung;
- complexified Kepler dynamics, Delaunay action-angle variables, and their branch-aware
  meromorphic continuation;
- the large-contour nonvanishing calculation that verifies Yagasaki's assumption (A2).

`Suggested.lean` pins the elementary definitions that are expressible now and a small
matrix obstruction from the middle of the proof. Add later signatures only after their
types are honest; a `Prop := sorry` called “meromorphic integrable” or “Picard–Vessiot”
would specify nothing.

---

## Lane A: dynamics and Hamiltonian mechanics

### A1. Vector fields, solutions, and integrability

1. Develop autonomous and time-dependent vector fields on finite-dimensional normed
   spaces and manifolds, solution germs/maximal solutions, equilibria, periodic orbits,
   local flows, and conjugacy under a local diffeomorphism. Bridge these definitions to
   Mathlib's ODE predicates and prove the chain-rule transport theorem used by every
   coordinate change below.
2. Define first integrals by `dF(X)=0`, commuting vector fields by the existing Lie
   bracket, pointwise linear/functional independence, and generic independence on a
   dense open locus. Prove invariance under restriction and biholomorphic coordinate
   change.
3. Define Bogoyavlenskij `(q,n-q)`-integrability and its meromorphic version on a complex
   manifold. Include the system vector field among the `q` commuting fields. Prove the
   basic dimension bounds and coordinate invariance.

### A2. Symplectic and Liouville integrability

4. On top of the shared symplectic-manifold work, build Hamiltonian vector fields,
   Poisson brackets, symplectomorphisms, canonical cotangent coordinates, Hamilton's
   equations, and the equivalence
   `PoissonCommute F G ↔ [X_F,X_G]=0` with the pinned sign convention.
5. Define Liouville integrability for a `2n`-dimensional Hamiltonian system and prove that
   it yields Bogoyavlenskij `(n,n)`-integrability. Prove preservation under
   symplectomorphism and restriction to a dense open set.

### A3. Complex analytic category

6. Build holomorphic and meromorphic scalar maps, vector fields, differential forms, and
   local equivalences on finite-dimensional complex manifolds. For algebraic varieties,
   reconcile chartwise meromorphicity with local quotients of regular/holomorphic
   functions. Supply pullback, composition, equality-on-dense-open, and removable-pole
   lemmas.
7. Construct the field of meromorphic functions on a connected Riemann surface and its
   derivation in a local time coordinate; prove coordinate independence in the form
   actually used by a linear differential system.

**Gate A.** State both “meromorphically Bogoyavlenskij-integrable near a solution” and
“meromorphically Liouville-integrable near a solution” without placeholders, and prove
that Hamiltonian coordinate changes preserve them.

## Lane B: variational equations and differential Galois obstructions

### B1. Parameter-dependent and higher variational equations

8. Prove differentiable and holomorphic dependence of local ODE solutions on initial
   conditions and parameters. Identify the derivative of the flow with the first
   variational equation `Y' = DX(x̄(t))Y` and prove functoriality under coordinate change.
9. Package higher derivatives of the flow using symmetric multilinear maps or symmetric
   powers, with a Faà di Bruno API. Derive higher variational equations and their
   linearization. Do not encode the paper's displayed low-order coordinate expansion as
   the definition.
10. For `x' = f(x;ε), ε'=0`, derive Yagasaki's `k`th reduced variational equation by
    restricting the full higher VE to the invariant subspace on which lower variations
    vanish. Prove the `1/k! · ∂_ε^k f` normalization.

### B2. Picard–Vessiot theory

11. Starting from Mathlib's `Differential`/`DifferentialAlgebra`, define linear
    differential systems over a differential field, fundamental matrices, solution
    algebras, Picard–Vessiot rings and fields, and prove existence and uniqueness when the
    constant field is algebraically closed.
12. Define the differential Galois group as differential automorphisms over the base,
    represent it faithfully as a Zariski-closed subgroup of `GLₙ(C)`, and develop fixed
    fields, base change, restriction, and the Galois correspondence needed downstream.
13. Build the identity component of a linear algebraic group, prove it is normal and of
    finite index, and distinguish carefully between “the group is noncommutative” and
    “its identity component is noncommutative.” The latter is the Morales–Ramis
    obstruction.

### B3. Analytic continuation and monodromy

14. Build germs and analytic continuation of holomorphic/meromorphic maps along paths on
    a Riemann surface, homotopy invariance away from singularities, and continuation of a
    fundamental matrix. Define the monodromy representation and prove that changing the
    fundamental matrix conjugates it.
15. For the meromorphic function field of the surface, prove that analytic continuation
    commutes with the derivation and hence every monodromy matrix belongs to the
    differential Galois group. Reuse Mathlib's fundamental-groupoid/path machinery and
    the Universal Covers roadmap where appropriate.

### B4. Morales–Ramis–Simó and Ayoul–Zung

16. Formalize the Morales–Ramis theorem: meromorphic Liouville integrability near a
    nonconstant solution forces the identity component of the differential Galois group
    of the normal variational equation to be abelian (with the precise regularity and
    base-field hypotheses).
17. Formalize higher variational equations and the Morales–Ramis–Simó theorem: the same
    abelianity conclusion holds for every linearized higher VE. Prove the reduction
    principle that passes the conclusion to Yagasaki's smaller RVE.
18. Formalize the Ayoul–Zung cotangent-lift theorem and its consequence for
    Bogoyavlenskij-integrable, possibly non-Hamiltonian systems. Keep the cotangent lift,
    preservation of meromorphic integrability, and application of Morales–Ramis as
    separate reusable theorems.

**Gate B.** Recover Yagasaki Theorems 2.2 and 2.3: meromorphic integrability of the
parameter-extended system forces the identity component of the differential Galois group
of its VE, and of every RVE, to be commutative.

## Lane C: the resonant-periodic-orbit criterion (Yagasaki Theorem 2.1)

19. Define the nearly integrable system
    `I' = ε h(I,θ;ε)`, `θ' = ω(I)+ε g(I,θ;ε)` on
    `ℂˡ × (ℂ/2πℤ)ᵐ`, including its meromorphic complex extension.
20. Formalize resonance assumption (A1): `ω(I*) ≠ 0` and its components span a
    one-dimensional `ℚ`-space, equivalently
    `ω(I*)/ω* ∈ ℤᵐ \ {0}` for a chosen positive fundamental frequency. Prove the
    periodicity statements and the harmless period refinement `ω* ↦ ω*/N`.
21. Compute the RVE's block-triangular fundamental matrix with primitives `Ξᵏ` and
    `Ψᵏ`. Continue it around both the complex loop `γ_θ` and the real period loop.
22. Generalize the `3×3` seed in `Suggested.lean` to the paper's block matrices
    `M(C₁,C₂,C₃)`. Prove Yagasaki Lemma 2.5 using Zariski closures of powers: if
    `C₃C₁' ≠ C₃'C₁`, the **identity component** is noncommutative. Merely exhibiting two
    noncommuting monodromy elements is not enough.
23. Formalize assumption (A2),
    `Dω(I*) ∮_{γ_θ} (1/k!) ∂_ε^k h(I*,ω(I*)τ+θ;0)dτ ≠ 0`, and prove Theorem 2.1 from
    B4 and the two monodromy matrices. Include the dense-set-in-`θ` conclusion and the
    Hamiltonian/Liouville corollary.

This lane is the first major reusable payoff: it applies to other nearly integrable
systems without any three-body definitions.

## Lane D: Kepler and the circular restricted problem

### D1. Celestial-mechanics models

24. Build Newtonian point-mass potentials and the inertial two-body/Kepler Hamiltonian;
    conservation of energy and angular momentum; reduction to relative coordinates;
    conic orbits; elliptic-orbit period and eccentricity formulas. Treat collision-free
    domains explicitly.
25. Derive the rotating-frame planar and spatial circular restricted Hamiltonians from
    the inertial model. Prove Hamilton's equations, conservation of the Jacobi/Hamiltonian
    integral, the `μ ↔ 1-μ` primary-exchange symmetry, and the `μ=0` Kepler limit.
26. Construct `𝒮₂,𝒮₃`, their critical sets and collision-free smooth loci; lift the
    Hamiltonians/vector fields and prove that they are rational/meromorphic there. Relate
    the physical real sheet and the complex model exactly.

### D2. Blow-up near a primary

27. Near `(-μ,0[,0])`, implement
    `x+μ=ε²ξ`, `y=ε²η`, `z=ε²ζ`, the momentum shifts/scalings, and
    `t ↦ ε³t`. Prove that this is symplectic with the stated Hamiltonian rescaling and
    derive the exact transformed vector field before taking a series.
28. Establish the Taylor expansions through the first nonzero order used by the proof:
    Coriolis terms at order `ε³`, cancellation at order `ε⁴`, and the tidal perturbation
    at order `ε⁶`. Give certified remainder statements on a named collision-free complex
    neighbourhood; a symbolic `O(ε⁷)` with no uniform domain is not an acceptance
    criterion.
29. Prove the transport lemma: a meromorphic complete set for the original fixed-`μ`
    system pulls back to one meromorphic jointly in the blown-up state and `ε` near
    `ε=0`. This is the logical bridge that allows Theorem 2.1 to prove Theorem 1.1.

### D3. Delaunay variables

30. Construct planar Delaunay action-angle variables on the elliptic, noncircular,
    noncollision Kepler locus. Prove the generating-function identities, local
    symplecticity, inverse map, periodicity, and
    `H_K=-(1-μ)/(2I₁²)`, `ω=((1-μ)/I₁³,0)`.
31. Construct the spatial Delaunay variables, including inclination and the third action,
    with the same proofs. Prove that the invariant equatorial plane
    `ψ=π/2, p_ψ=0` identifies the spatial calculation with the planar one.
32. Algebraize every square root and inverse-trigonometric branch needed for meromorphic
    continuation, as the paper does with auxiliary `v₁,v₂,v₃`. Identify the smooth
    chart and prove the coordinate transformation meromorphic there.

**Gate D.** The exact transformed CR3BP is a meromorphic nearly integrable system of the
form required by Lane C, with the paper's `h`, `g`, actions, frequencies, and resonant
periodic Kepler orbit.

## Lane E: verify (A2) and reach the summit

### E1. Planar contour calculation

33. Choose `I₁*>0` and an eccentricity `0<e<1`, set
    `I₂*=I₁*(1-μ)^(1/3)√(1-e²)`, and `ω*=ω₁/3`. Prove (A1) for the resulting resonant
    Kepler torus.
34. Compute `(Dω) ∂_ε^5 h / 5!` and reduce its first component to Yagasaki's integral
    (3.15). Make every automatic-differentiation, trigonometric, and Hamiltonian
    simplification a separately testable lemma.
35. Continue the eccentric anomaly/true anomaly relation into complex time. Locate the
    singular heights `K₁` and `K₂`, prove `K₁>0`, and establish the Laurent/asymptotic
    expansions used near `1+e cos φ=0`.
36. Define the large closed path of Figure 5, with the two small semicircular detours and
    the high horizontal segment. Prove it stays in the meromorphic domain and avoids the
    forbidden vertical lines after period refinement.
37. Bound every segment, pass first through the large-height and then small-radius limits
    in the paper's order, and prove the integral is nonzero on a dense set of phases.
    Also formalize Remark 3.1's warning that a small circle around a single apparent
    singularity has zero integral; it is a useful guard against an invalid shortcut.
38. Apply Theorem 2.1 and the transport lemma to obtain planar meromorphic
    nonintegrability near `(-μ,0)`, then use the primary-exchange symmetry for
    `(1-μ,0)`.

### E2. Spatial case and final theorem

39. Carry the spatial expansion through order `ε⁶`, construct the spatial resonant torus,
    and prove that on the equatorial invariant plane its fifth-order obstruction integral
    is the planar expression with the corresponding phase substitution.
40. Apply Theorem 2.1 to obtain the two-missing-integrals spatial conclusion, transfer it
    back to `𝒮₃`, and use primary exchange for the second primary.
41. Package Yagasaki Theorem 1.1 with separate planar and spatial statements and a final
    combined theorem. State all domains, excluded critical sets, generic independence,
    and meromorphicity hypotheses in the theorem—not only in prose.

## Acceptance tests

- Direct differentiation of `H₂,H₃` reproduces every displayed rotating-frame equation.
- At `μ=0`, the potential and scaled unperturbed dynamics reduce to Kepler; the theorem
  itself is unavailable because its strict mass hypothesis fails.
- Rotation by `π` together with `μ ↔ 1-μ` exchanges the two primaries and conjugates the
  systems.
- The first nonzero obstruction is normalized as `k=5`, corresponding to the sixth-order
  perturbation term after `ε` is made a state variable.
- The two monodromy matrices fail to commute for the exact block-product reason in
  Lemma 2.5, and the proof separately establishes noncommutativity of the identity
  component.
- The contour result proves nonzero, not merely “has a singular integrand”; the tempting
  small-circle contour evaluates to zero.
- The planar and spatial summits assert respectively one and two additional independent
  first integrals do not exist, always relative to the Hamiltonian already present.

## Ordering and parallel work

Start A1 and B2 independently. The shared symplectic-manifold work (A2) can proceed with
the Heegaard Floer roadmap, while the Riemann-surface continuation work (A3/B3) can share
paths and contour infrastructure with Contour Integration and Universal Covers. B1
depends on A1; B3 depends on A3 and B2; B4 depends on all of B1–B3. Lane C then becomes
a self-contained theorem. D1 can proceed in parallel with B, but D2/D3 require A2/A3.
Only after Gates B–D should the proof-specific calculation in Lane E dominate effort.

## References

- K. Yagasaki, [*Nonintegrability of the restricted three-body
  problem*](https://arxiv.org/abs/2106.04925), arXiv:2106.04925v7; ETDS 44 (2024),
  3012–3040. Theorem 1.1 is the summit; Theorem 2.1 is Lane C; Sections 3–4 are Lane E;
  Appendices A–B summarize the Picard–Vessiot and monodromy inputs.
- M. Ayoul and N. T. Zung, [*Galoisian obstructions to non-Hamiltonian
  integrability*](https://doi.org/10.1016/j.crma.2010.10.024), C. R. Math. 348 (2010),
  1323–1326 (Lane B4).
- J. J. Morales-Ruiz and J.-P. Ramis, [*Galoisian obstructions to integrability of
  Hamiltonian systems*](https://projecteuclid.org/journals/methods-and-applications-of-analysis/volume-8/issue-1/Galoisian-obstructions-to-integrability-of-Hamiltonian-systems/maa/1107989153.full),
  Methods Appl. Anal. 8 (2001), 33–96 (Lane B4).
- J. J. Morales-Ruiz, J.-P. Ramis and C. Simó, [*Integrability of Hamiltonian systems and
  differential Galois groups of higher variational
  equations*](https://doi.org/10.1016/j.ansens.2006.12.002), Ann. Sci. ENS 40 (2007),
  845–884 (higher VEs and Morales–Ramis–Simó).
- M. van der Put and M. F. Singer, *Galois Theory of Linear Differential Equations*,
  Springer, 2003 (Picard–Vessiot theory, algebraic differential Galois groups, and
  monodromy).
- V. I. Arnold, *Mathematical Methods of Classical Mechanics*, 2nd ed., Springer, 1989;
  K. R. Meyer, G. R. Hall and D. Offin, *Introduction to Hamiltonian Dynamical Systems
  and the N-Body Problem*, 3rd ed., Springer, 2017 (Lanes A and D).

## Research and coordination note

The audit searched the pinned Mathlib source, current Mathlib documentation, open Mathlib
and Tau Ceti pull requests, Lean Zulip search results, the arXiv v7 paper, and the published
article metadata. Before implementing a numbered target, repeat the open-PR and Zulip
search: this roadmap begins several foundational subjects in which upstream activity can
change the preferred API quickly.
