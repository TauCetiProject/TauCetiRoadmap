# Roadmap: Poincaré's classical nonintegrability theorem for the planar CR3BP

The single summit of this roadmap is Poincaré's classical theorem for the **planar
circular restricted three-body problem** (CR3BP): there is no additional first integral
that is real-analytic in the state variables, functionally independent of the
Hamiltonian, and also real-analytic in the mass parameter `μ` near `μ = 0` on the
specified collision-free elliptic domain. The dependence on `μ` is essential. This is
not a fixed-mass theorem and it is not a theorem about the unrestricted three-body
problem.

The proof expands a hypothetical integral in `μ`, passes to action-angle coordinates for
the integrable Kepler limit, and uses a dense set of effective resonances to force its
leading coefficient to be a function of the unperturbed Hamiltonian. After the classical
normalization of a genuinely new integral, this is a contradiction.

This narrower summit is still a substantial library project. The reusable prerequisites
are finite-dimensional Hamiltonian mechanics, analytic parameter families, Fourier
analysis on tori, Kepler/Delaunay coordinates, and the Poincaré-set obstruction. It does
**not** require Picard--Vessiot theory, differential Galois groups, higher variational
equations, singular fixed-mass blow-ups, or the spatial problem.

Suggested homes:

- `TauCeti/Dynamics/Hamiltonian/` for flat finite-dimensional Hamiltonian mechanics,
  first integrals, and canonical coordinate changes;
- `TauCeti/Analysis/Analytic/Parameter/` for jointly analytic families and coefficient
  extraction;
- `TauCeti/Analysis/Fourier/Torus/` for the analytic Fourier lemmas;
- `TauCeti/CelestialMechanics/` for Kepler, planar Delaunay variables, and the CR3BP.

## Scope and theorem hygiene

- **Circular restricted problem.** Two primaries move on circular orbits and the third
  body is massless. Never shorten the target to “the three-body problem” in a theorem
  statement.
- **Planar problem.** The classical summit has two degrees of freedom. No spatial claim
  is part of this roadmap.
- **Parameter-analytic obstruction.** The hypothetical integral is jointly
  real-analytic in phase variables and `μ` on a fixed phase domain times an interval
  about `μ = 0`. The theorem does not rule out an integral supplied separately for one
  fixed `μ > 0`.
- **One additional integral.** The Hamiltonian is already a first integral. The target
  rules out another integral functionally independent of it on the stated domain.
- **Uniformity and domain matter.** Pin the collision exclusions, elliptic/noncircular
  action domain, angle torus, and meaning of joint analyticity in the final statement.
  A vague “near `μ = 0`” is not an acceptance criterion.
- **No claim about numerical solvability.** Nonexistence of an analytic first integral
  does not say that trajectories cannot be approximated or certified by finite
  computation. That distinction is part of the motivation for this roadmap.

## Coordinate and sign conventions

Work in the uniformly rotating frame, with primaries of masses `μ` and `1-μ` at
`(1-μ,0)` and `(-μ,0)`. In canonical coordinates use

```text
Hμ(x,y,px,py) = ½(px²+py²) + px*y - py*x - Uμ(x,y),

Uμ(x,y) = μ/r₁ + (1-μ)/r₂,
r₁² = (x-1+μ)²+y²,
r₂² = (x+μ)²+y².
```

Fix `ω = dx ∧ dpx + dy ∧ dpy` and
`q̇ᵢ = ∂H/∂pᵢ`, `ṗᵢ = -∂H/∂qᵢ`. Direct differentiation of this formula is the source of
truth for every displayed equation.

Do not copy the incompatible Delaunay normalization in §3 of
[Yagasaki's 2024 paper](https://arxiv.org/html/2106.04925v7). Derive the coordinates
intrinsically. For a Kepler Hamiltonian of gravitational parameter `α`, use standard
actions and `2π`-periodic angles

```text
L = √(α a),        G = L√(1-e²),
HKepler = -α²/(2L²),
∂HKepler/∂L = α²/L³.
```

At the `μ = 0` endpoint of the convention above, `α = 1` and the rotating-frame
unperturbed Hamiltonian is `H₀ = -1/(2L²) - G`. Any rescaling of an action or angle must
be introduced as a separate canonical transformation with its period and symplecticity
proved.

## What the pinned Mathlib already provides

The audit is against Mathlib commit
[`9caeba1`](https://github.com/leanprover-community/mathlib4/commit/9caeba1000ef8f302920981f4a08651d325abc81),
the repository pin when this roadmap was written.

- Fréchet derivatives, higher derivatives, real-analytic functions, interval integrals,
  matrices, and finite-dimensional linear algebra.
- Local ODE existence and uniqueness in `Mathlib/Analysis/ODE/ExistUnique.lean`.
- Vector fields and Lie brackets, although the classical route needs only Hamiltonian
  vector fields in a fixed finite-dimensional canonical space.
- Basic Fourier analysis, trigonometric functions, power series, and analytic-function
  infrastructure. These must be audited at implementation time before introducing a new
  torus Fourier API.
- Pointwise linear symplectic forms in Tau Ceti. The roadmap should reuse them, but need
  not wait for a complete manifold-level symplectic library.

## What is missing

- a focused canonical Hamiltonian and Poisson-bracket API on `ℝ^(2n)`;
- jointly real-analytic parameter families on a fixed open domain, their convergent
  coefficient expansions, and coefficient extraction from analytic identities;
- analytic Fourier series on a finite-dimensional torus, including uniqueness,
  termwise differentiation, and parameter dependence;
- the local functional-dependence lemma for two analytic functions when one is a
  submersion and their differentials are collinear;
- collision-aware Kepler reduction and correctly normalized planar Delaunay variables;
- a rigorous formal statement and proof of the effective-resonance/nonvanishing result
  for the first CR3BP disturbing function.

`Suggested.lean` pins only elementary definitions that are honest against current
Mathlib. Add theorem signatures for analytic families and the summit only when their
domains and regularity predicates can be expressed without placeholder definitions.

---

## Lane A: focused Hamiltonian and analytic foundations

### A1. Canonical Hamiltonian mechanics

1. On `Fin (2*n) → ℝ`, define the standard symplectic form, Hamiltonian vector field,
   coordinate Poisson bracket, and first-integral predicate on an open set. Include the
   differentiability hypotheses in theorem statements; do not rely on Mathlib's total
   derivative silently becoming zero at nondifferentiable points.
2. Prove Hamilton's equations, bilinearity/antisymmetry/Jacobi for the Poisson bracket,
   and the equivalence between `{H,F}=0` and `F` being constant along solutions of
   `X_H`.
3. Define canonical changes of variables on named open sets and prove transport of
   Hamiltonians, Poisson brackets, solutions, first integrals, and functional
   independence. A global manifold theory is optional, not a dependency of the summit.

### A2. Analytic parameter and torus Fourier tools

4. Define a jointly real-analytic family `f : U × (-δ,δ) → ℝ` on a fixed open phase
   domain. Develop its locally uniformly convergent expansion in `μ`, uniqueness of
   coefficients, derivatives of coefficients, products, composition, and coefficient
   extraction from an identity.
5. Develop Fourier coefficients for analytic functions on `(ℝ / 2πℤ)^n`, including
   uniqueness, reality symmetry, differentiation in angles and actions, and the
   coefficient formula for a Poisson bracket with an action-only Hamiltonian.
6. Prove the convergence and termwise-operation lemmas actually used by the homological
   equations. State the action domain and uniformity in the angle variables explicitly.

**Gate A.** Starting from `{H(μ),F(μ)}=0`, Lean can extract the equations at orders
`μ⁰` and `μ¹` on one fixed action-angle domain, with every regularity assumption visible.

## Lane B: planar celestial mechanics

### B1. Kepler and the rotating CR3BP

7. Build the planar Kepler Hamiltonian on its collision-free domain. Prove conservation
   of energy and angular momentum and the elliptic-orbit relations needed for Delaunay
   variables.
8. Derive the planar rotating-frame CR3BP Hamiltonian from the inertial model. Prove its
   Hamilton equations and Hamiltonian/Jacobi conservation, and verify directly that
   `μ = 0` reduces to the rotating Kepler problem.
9. Fix a product domain `U × (-δ,δ)` avoiding both primaries for every parameter in the
   interval and prove that `Hμ` is jointly real-analytic there. All parameter-series
   manipulations downstream must occur on such a uniform domain.

### B2. Planar Delaunay variables

10. Construct `(L,G,ℓ,g)` on an explicit elliptic, noncircular, collision-free Kepler
    locus. Prove the inverse formulas, local canonicality, `2π` periods of both angles,
    and `HKepler = -α²/(2L²)` without importing the paper's inconsistent rescaling.
11. Express the `μ = 0` rotating Hamiltonian as `H₀ = -1/(2L²)-G`. Compute its frequency
    map and its derivative and characterize integer resonances on a named action domain.
12. Pull the CR3BP family into these variables on a uniform local domain and prove a
    convergent expansion `H = H₀ + μH₁ + μ²H₂ + ⋯`. Identify `H₁` as the first
    disturbing function from a derived formula.

**Gate B.** The coordinate map is canonical with standard action normalization, the
angles have proved periods, and the transformed Hamiltonian is a jointly analytic family
on a named domain.

## Lane C: the abstract Poincaré obstruction

13. Suppose `F = F₀ + μF₁ + ⋯` is an additional analytic first integral. From the
    order-zero homological equation, prove by Fourier expansion that `F₀` depends only
    on the actions on the nonresonant locus, then extend the conclusion across the
    domain by analyticity.
14. At a resonance `k · ω(I) = 0`, extract the `k`th Fourier coefficient of the
    first-order homological equation. If `H₁,k(I) ≠ 0`, prove
    `k · D F₀(I) = 0`. Define the **effective Poincaré set** by these two conditions.
15. Prove the geometric Poincaré-set lemma with all missing hypotheses included: on a
    connected action neighbourhood where `D H₀ ≠ 0`, if the effective Poincaré set is
    dense and its resonant directions impose the required rank condition, then
    `D F₀` is collinear with `D H₀` everywhere.
16. Use the submersion/constant-rank theorem to conclude locally that
    `F₀ = φ ∘ H₀`. Density and collinearity alone are not sufficient without the
    submersion and local connected-fibre hypotheses.
17. Formalize the classical normalization: after subtracting an analytic function of
    `H` and dividing by the first possible power of `μ`, a genuinely new integral may
    be chosen whose leading coefficient is not locally a function of `H₀`. Combine this
    with milestones 13--16 to obtain the abstract nonexistence theorem.

**Gate C.** The abstract theorem states its analyticity domain, Fourier uniformity,
submersion, rank, density, and functional-independence hypotheses. No step is hidden in
the phrase “the Poincaré set is dense.”

## Lane D: the classical CR3BP summit

18. Compute the Fourier coefficients of the first disturbing function `H₁` in the
    standard Delaunay normalization. Make the coefficient convention, resonance vector,
    eccentricity range, and every denominator explicit.
19. On a named open elliptic action domain, prove the required coefficients are nonzero
    on enough resonances and that the resulting effective Poincaré set is dense with the
    rank property required by milestone 15. Subdivide this calculation into lemmas by
    resonance family; it is the principal source-sensitive bottleneck of the roadmap.
20. Audit a primary or rigorous modern source against milestones 18--19. Whittaker §165
    is useful exposition but does not by itself discharge a formal theorem with a named
    domain and a proved coefficient-density statement. If the available source proves a
    narrower domain or hypothesis, narrow the summit rather than silently strengthening
    it.
21. Apply Lane C and package Poincaré's classical planar theorem. The theorem statement
    must include joint real-analyticity in `(state,μ)`, the parameter interval about
    zero, the fixed collision-free elliptic phase domain, angle uniformity, and
    functional independence from the Hamiltonian.

**Gate D / summit.** Poincaré's parameter-analytic nonexistence theorem for the planar
circular restricted three-body problem is available with no fixed-mass or spatial
corollary attached.

## Acceptance tests

- Direct differentiation of `Hμ` reproduces every rotating-frame equation with the
  pinned sign convention.
- At `μ = 0`, the potential is the one-primary Kepler potential and the Delaunay form is
  exactly `-1/(2L²)-G`.
- The Delaunay map pulls back the canonical symplectic form exactly, without an omitted
  constant factor, and both angles have proved `2π` periods.
- Coefficient extraction from `{H,F}=0` is justified by joint analyticity on one fixed
  domain, not by a merely formal series unless the theorem is explicitly stated in a
  formal-series category.
- The effective-resonance calculation proves both nonvanishing and density/rank on a
  named domain.
- The functional-dependence step invokes a proved submersion/constant-rank lemma.
- The final theorem says “planar circular restricted,” assumes analytic dependence on
  `μ` near zero, and makes no assertion for an individually fixed positive mass ratio.

## Ordering and parallel work

Start A1 and A2 independently. B1 can proceed in parallel once the coordinate Poisson
bracket is stable. B2 consumes the canonical-change API from A1 and the Kepler results
from B1. Lane C consumes A2 but can initially be developed for an abstract action-only
Hamiltonian independently of celestial mechanics. Lane D joins the abstract theorem and
the CR3BP calculation.

Milestones 18--20 are the highest mathematical risk. Seek expert review there before
expanding the general foundations. A successful formalization should prefer the smallest
flat-space API sufficient for the classical theorem over completing unrelated theories
of complex manifolds or differential Galois groups.

## Future direction: fixed-mass meromorphic nonintegrability

[Yagasaki's fixed-mass theorem](https://arxiv.org/html/2106.04925v7#S1.Thmthm1) remains
an important possible successor, but it is **not a summit, milestone, or dependency of
this roadmap**. The previously proposed route contained an invalid bridge: the singular
blow-up includes a momentum scaling of the form `p_x = p_ξ/ε`, and pullback does not in
general turn a fixed-mass meromorphic first integral into a family meromorphic at
`ε = 0`. If `F` is a first integral then `exp(F)` is also a first integral where defined,
while its pullback may contain `exp(p_ξ/ε)`-type essential dependence. Thus no purely
function-theoretic transport lemma can supply the parameter-meromorphic hypothesis used
by the perturbative criterion.

A future roadmap must first resolve this proof-audit question. Plausible research
directions include:

- weakening the target to rational or algebraic first integrals, whose behaviour under
  rational rescaling is controlled;
- proving a new controlled-growth or controlled-representative theorem for meromorphic
  first integrals;
- in the planar case, formalizing a regularization/Hill-problem route instead of the
  singular parameter transport.

Until one route is supported by a precise theorem and source, the fixed-mass planar and
spatial claims should remain a research issue separate from this mergeable roadmap.

## References

- H. Poincaré, *Les méthodes nouvelles de la mécanique céleste*, Gauthier-Villars,
  1892--1899; English translation: *New Methods of Celestial Mechanics*, AIP, 1993. The
  relevant parameter-series argument must be pinned to exact volume/sections during
  milestone 20 rather than inferred from a general historical citation.
- E. T. Whittaker, [*A Treatise on the Analytical Dynamics of Particles and Rigid
  Bodies*](https://commons.wikimedia.org/wiki/File:A_treatise_on_the_analytical_dynamics_of_particles_and_rigid_bodies;_with_an_introduction_to_the_problem_of_three_bodies_(IA_treatisanalytdyn00whitrich).pdf),
  4th ed., Cambridge, 1937, Chapter XIV, §165. This is an accessible presentation, not
  by itself the acceptance certificate for milestones 18--20.
- K. Yagasaki, [*A new proof of Poincaré's result on the restricted three-body
  problem*](https://arxiv.org/abs/2111.11031), *Journal of Mathematical Physics* 66
  (2025), 051101, [doi:10.1063/5.0266087](https://doi.org/10.1063/5.0266087). This is a
  useful comparison for theorem scope, although its differential-Galois proof is not the
  classical route selected here.
- V. I. Arnold, *Mathematical Methods of Classical Mechanics*, 2nd ed., Springer, 1989,
  for canonical Hamiltonian mechanics and action-angle variables.
- K. R. Meyer, G. R. Hall and D. Offin, *Introduction to Hamiltonian Dynamical Systems
  and the N-Body Problem*, 3rd ed., Springer, 2017, for celestial-mechanics conventions
  and Delaunay variables.

## Research and coordination note

Before implementing a numbered target, repeat the Mathlib, Tau Ceti pull-request, and
Lean Zulip searches. The first expert-review request should focus on the exact classical
theorem statement and milestones 18--20: the Delaunay normalization, disturbing-function
coefficients, and effective-resonance density are more consequential than broad API
preferences at this stage.
