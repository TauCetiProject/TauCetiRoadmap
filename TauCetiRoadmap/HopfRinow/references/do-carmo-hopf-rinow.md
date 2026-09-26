# Fair-use extract: do Carmo, geodesics and Hopf–Rinow

**Source.** M. P. do Carmo, *Riemannian Geometry*, Birkhäuser, 1992.

**Locus.** Chapter 1, Definition 2.9; Chapter 2, §§2–3; Chapter 3, §§2–4;
Chapter 7, §2, especially Definition 2.4, Theorem 2.8, and Corollary 2.9; and
Chapter 9, §2, especially Propositions 2.4–2.5.

**Supports.** HopfRinow roadmap, Layers 0–4.

This is a short attributed summary of the statements and proof dependencies used by the roadmap,
not a transcription of the source.

## Numbering note

In this edition, Chapter 3 §1 is introductory material. The geodesic flow begins in §2:
Definition 2.1 gives the covariant geodesic equation, Propositions 2.5–2.7 give local
existence/uniqueness and the flow, and Proposition 2.9 gives the derivative and local behavior of
the exponential map. Minimizing properties occupy §3, and convex neighborhoods occupy §4. These
item numbers are more reliable locators than a broad chapter range.

## Layers 0–2

- Chapter 1, Definition 2.9 defines arc length by integrating speed.
- Chapter 2, §§2–3 develops covariant differentiation along a curve, parallel transport, metric
  compatibility, torsion-freeness, and the Riemannian connection used in the geodesic equation.
- Chapter 3, Definition 2.1 defines a geodesic by vanishing covariant acceleration, gives its
  coordinate equation, and proves constant speed.
- Chapter 3, Propositions 2.5–2.7 establish local existence and uniqueness from initial data and
  organize those solutions as the geodesic flow. The exponential map is introduced after this
  flow, and Proposition 2.9 identifies its derivative at zero and its local inverse behavior.
- Chapter 3, Lemma 3.5 is the Gauss lemma. Proposition 3.6 gives radial minimization and its
  equality case; Theorem 3.7 gives totally normal neighborhoods; Corollary 3.9 identifies
  minimizing curves as geodesics. Section 4 constructs convex neighborhoods.
- Chapter 9, Definition 2.1 introduces variations. Proposition 2.4 is the first-variation formula,
  and Proposition 2.5 characterizes geodesics as critical points of energy.

## Riemannian distance

Chapter 7 §2 carries the standing convention that manifolds are connected. Definition 2.4 defines
the Riemannian distance as the infimum of lengths of piecewise differentiable curves. The results
immediately following establish finiteness, metric separation, agreement with the manifold
topology, and continuity of distance from a fixed point. For Tau Ceti, this formulation must be
compared with Mathlib's `Manifold.riemannianEDist`, whose infimum is over `C¹` paths.

## Theorem 2.8

For a connected Riemannian manifold and a fixed `p`, Theorem 2.8 states the equivalence of:

- `(a_p)`: `exp_p` is defined on all of `T_p M`;
- (b): closed bounded subsets are compact;
- (c): metric completeness;
- (d): global geodesic completeness; and
- `(e_p)`: a nested compact exhaustion whose escaping diagonal sequences diverge in distance
  from `p`.

Each condition also implies `(f_p)`: every point is joined to `p` by a distance-realizing
geodesic.

The proof dependencies used by the roadmap are:

1. `(c) ⇒ (d)`: a finite-endpoint geodesic has Cauchy base points; after obtaining a limiting
   tangent state, local flow existence and uniqueness extend it.
2. `(d) ⇒ (a_p)`: an all-time geodesic with each initial velocity is defined at time `1`.
3. `(a_p) ⇒ (f_p)`: minimize distance on geodesic spheres and extend the radial minimizer.
4. `(a_p) ∧ (f_p) ⇒ (b)`: bounded sets are controlled by compact tangent balls through `exp_p`.
5. `(b) ⇒ (c)`: proper metric spaces are complete.
6. `(b) ⇔ (e_p)`: one direction uses closed balls centered at `p`; the other forces every closed
   bounded set into one compact exhaustion set.

This graph explains why `(d) ⇒ (c)` is not a reverse finite-endpoint argument: it proceeds through
`(a_p)`, `(f_p)`, and (b).

## Corollary 2.9

Corollary 2.9 states that a compact Riemannian manifold is geodesically complete. Its proof uses
compact metric space completeness and then Theorem 2.8. It does not require a direct compactness
argument for the geodesic flow on `TM`.
