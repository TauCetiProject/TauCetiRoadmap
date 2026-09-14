# Roadmap: differential forms and smooth flows

## @deicyde — should we split the differential-geometry roadmap?

Jack, what do you think about splitting the current differential-geometry roadmap into smaller,
more focused PRs?

The proposal is to take **differential forms and smooth flows first**, using Mathlib as the
foundation and consuming existing Tau Ceti and upstream Lean work wherever it already exists. The
remaining pieces of the broader roadmap can then follow as separate PRs.

This is deliberately a roadmap and interface proposal, not a claim that the hard implementation
has already been solved. The intention is to give the Tau Ceti implementation/LLM work a precise
mathematical target while leaving exact repository APIs and proof engineering to the compiler-driven
implementation stage.

## 1. Mathematical driver and scope

The mathematical driver is **Loring W. Tu, _Differential Geometry: Connections, Curvature, and
Characteristic Classes_**. In particular, Chapter 4, §21 (Vector-Valued Forms), including §21.2
(Products of Vector-Valued Forms), §21.4 (Exterior Derivative of a Vector-Valued Form), §21.5
(Differential Forms with Values in a Lie Algebra), and §21.6 (Pullback of Vector-Valued Forms),
gives the mathematical pattern we want the formalisation to support. Tu's Chapters 2, §§10–11,
and Chapter 5, §22.2 are the downstream connection/curvature/Bianchi motivation.

Tu is the **mathematical driver**, not a claim about the provenance of the Lean implementations.
Yury Kudryashov and Sam Lindauer's `DeRhamCohomology` is Lean prior art; Mathlib is the foundational
library; Tau Ceti is the target codebase in which these pieces should be integrated.

The first sub-PR covers two connected pieces of infrastructure:

### Differential forms

- smooth alternating-form bundles;
- rough and smooth manifold forms;
- pullback;
- a coefficient-general `wedgeWith` interface;
- the ordinary real-valued wedge as a specialization;
- vector-valued and Lie-algebra-valued forms;
- manifold exterior differentiation;
- `d² = 0`, naturality and the graded Leibniz rule;
- the finite-regularity statements needed by the smooth theory;
- the basic Cartan-calculus operations needed by downstream differential geometry.

### Smooth flows

- the existing integral-curve/ODE foundation;
- the continuous flow work of Winston Yin and Yury Kudryashov;
- the existing continuous maximal-flow development;
- the missing **joint smooth-dependence** theorem corresponding to Lee, Theorem 9.12 (2nd ed.);
- consumption of the existing `expLie`, fundamental-vector-field and Lie-bracket work.

The exact finite-regularity hypotheses of the smooth-flow theorem are intentionally left for the
implementation to establish against the live Tau Ceti/Mathlib APIs. The `Suggested.lean` signature
is an interface sketch, not a claim that its particular `minSmoothness` arithmetic is already proved.

## 2. What this roadmap does not own

The following remain later roadmap work:

- orientations and orientation covers;
- integration and Stokes;
- de Rham cohomology and comparison with singular cohomology;
- singular chains and Poincaré duality;
- degree;
- Riemannian geometry and Levi–Civita connections;
- the full connection/curvature library;
- Laplace–Beltrami;
- Frobenius;
- Einstein equations and gravitational-wave applications.

The point of this split is to establish the forms/flow substrate on which those later developments
can build. Connection, curvature and the Bianchi identity are mathematical motivation and downstream
acceptance tests, not the implementation boundary of this sub-PR.

## 3. Dependency map

```text
                              Mathlib
                                │
              ┌─────────────────┴─────────────────┐
              │                                   │
       manifold calculus                    ODE / integral curves
       tangent maps                         existence / uniqueness
       alternating maps                     Lie brackets
       smooth bundles                              │
       flat extDeriv                         Yin–Kudryashov
              │                              continuous-flow prior art
              │                                   │
              ▼                            continuous MaximalFlow
       smooth manifold forms                      │
              │                                   │
       ┌──────┼─────────┐                         │
       │      │         │                         │
   pullback wedgeWith mextDeriv                   │
       │      │         │                         │
       │      │      d²/naturality/Leibniz         │
       │      │                                   │
       │      │                         smooth-flow theorem
       │      │                         (Lee 9.12 target)
       │      │                                   │
       │      │                                   ▼
       │      │                            existing expLie
       │      │                                   │
       │      │                                   ▼
       │      │                              funVF/bracket
       └──────┴──────────────────┬────────────────┘
                                 │
                                 ▼
                    Lie-algebra-valued forms
                    → connection/curvature later
                    → Bianchi later
```

## 4. Mathlib foundation

Mathlib is the first source of truth. The implementation should consume existing infrastructure
for manifold calculus, tangent spaces and bundles, continuous alternating maps, `mfderiv`,
`ContMDiff`, `IsMIntegralCurve`, vector-field brackets and flat exterior differentiation wherever
available.

The exact declarations should be discovered against the live repository rather than guessed in this
roadmap.

### Yury and Sam's May 2026 progress report

The **May 12, 2026 ICERM progress report**, _Formalizing de Rham cohomology — Progress report_, by
**Yury Kudryashov and Sam Lindauer**, is an important part of the prior-art picture, not merely a
bibliographic footnote.

The report records progress through:

- differential forms on normed vector spaces;
- flat exterior differentiation;
- `d² = 0`;
- pullback/naturality of the exterior derivative;
- a topological vector bundle of continuous alternating maps;
- a smooth vector bundle of continuous alternating maps;
- bundled `r`-smooth `k`-forms on a manifold;
- transfer of properties from normed spaces to manifolds.

The report also identifies the principal obstacle that matters directly to this roadmap:
**smoothness of `ContinuousAlternatingMap.compContinuousLinearMap`**. It discusses several possible
workarounds, the difficulty of transferring results to manifolds through charts, and the need for
better notation for common operations. In particular, it explicitly observes that writing a
pullback using `ContinuousAlternatingMap.compContinuousLinearMap` and `mfderiv` is not the desired
final notation.

This is precisely why the Tau Ceti proposal is framed as **reuse + integration + bridges**, rather
than as a fresh de Rham implementation. The proposed `mpullback` uses the same operation, so its
smoothness is a real implementation seam. The implementation should first check whether upstream
work has resolved it; otherwise the seam should be exposed explicitly.

Slides:
https://app.icerm.brown.edu/assets/583/10880/10880_6142_Kudryashov_051220260900_Slides.pdf

## 5. Existing Tau Ceti work

The rule for this PR is **consume existing Tau Ceti infrastructure; do not create competing public
structures merely because a more general form is now being proposed.**

### Existing `SmoothTwoForm`

Tau Ceti already has the degree-2 structure we need to bridge to. Do not search for a file called
`SmoothTwoForm.lean`. Open this file directly:

```text
TauCeti/Geometry/Manifold/TwoForm.lean
```

and search for:

```lean
structure SmoothTwoForm
```

This is existing Tau Ceti code. Its representation is based on a `ContMDiffSection` with fibre

```text
TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] ℝ
```

plus the pointwise alternating condition. The general `k`-form API should **bridge to this existing
representation at degree 2** rather than introduce a second public `SmoothTwoForm` type.

### Existing flow/Lie work

The relevant existing work includes the integral-curve and maximal-flow development, `ExpLie.lean`,
and `FundamentalVF.lean`, together with the existing `funVF`, `contMDiff_expLie` and
`mlieBracket_funVF_eq_neg` results.

Where exact authorship is not established from repository history, the roadmap deliberately does
not make an authorship claim. The important point for this PR is to consume those declarations and
remove the existing flow axiom rather than duplicate the surrounding theory.

## 6. Lean prior art: `DeRhamCohomology`

The main Lean prior art is Yury Kudryashov's public repository:

https://github.com/urkud/DeRhamCohomology

It already contains a coefficient-general wedge architecture through
`ContinuousAlternatingMap.wedge_product`. In particular, the coefficient pairing is an explicit
continuous bilinear map, schematically:

```lean
def wedge_product
    (g : M [⋀^Fin m]→L[𝕜] N)
    (h : M [⋀^Fin n]→L[𝕜] N')
    (f : N →L[𝕜] N' →L[𝕜] N'') :
    M [⋀^Fin (m + n)]→L[𝕜] N''
```

with notation of the form:

```text
g ∧[f] h
```

and scalar multiplication as the coefficient pairing in the real-valued specialization.

The current upstream API is `ContinuousAlternatingMap.wedge_product`; `wedgeWith` is deliberately a Tau Ceti-facing adaptation rather than a replacement for that upstream construction.

Therefore the proposal **does not claim that DeRhamCohomology lacks a coefficient-bilinear wedge**.
Quite the opposite: its architecture is important prior art for the proposed Tau Ceti interface.

### Why retain `wedgeWith`?

The proposed Tau Ceti-facing name is:

```lean
wedgeWith μ ω η
```

where `μ` is the coefficient pairing. This is an API/adaptation choice, not a claim of novel
mathematics.

The reason the pairing belongs in the interface is mathematical: Tu's vector-valued-form product
in §21.2 takes a bilinear map between coefficient spaces. This is what lets the same mechanism cover
scalar forms, matrix-valued forms, and Lie-algebra-valued forms. It is essential for the later
connection/curvature story.

The operation in `Suggested.lean` is deliberately **Layer 0 and fibrewise**: it acts on continuous
alternating maps at a single normed space. The manifold-form wedge is its bundled/fibrewise lift; the
two should not be presented as competing definitions.

## 7. Forms: Layer 0

The intended Layer-0 interface is:

```lean
noncomputable def wedgeWith
    (μ : F₁ →L[ℝ] F₂ →L[ℝ] F₃)
    (φ : E [⋀^Fin k]→L[ℝ] F₁)
    (ψ : E [⋀^Fin l]→L[ℝ] F₂) :
    E [⋀^Fin (k + l)]→L[ℝ] F₃
```

The first normalization gate is the degree-one determinant identity:

```lean
wedge φ ψ ![v, w] =
  φ ![v] * ψ ![w] - φ ![w] * ψ ![v]
```

The generic construction should only assert algebraic properties justified by hypotheses on `μ`.
For example, associativity requires compatibility of the coefficient pairings; graded commutativity
requires the corresponding commutativity condition.

For Lie-algebra-valued forms, the bracket product is the relevant operation. The implementation
should preserve the distinction between the Lie-algebra convention involving `½[ω ∧ ω]` and the
matrix-valued convention `ω ∧ ω`; these should not be conflated.

## 8. Smooth manifold forms and pullback

The proposed rough form is an unbundled section of the alternating bundle:

```lean
def RoughForm (k : ℕ) :=
  (x : M) → TangentSpace I x [⋀^Fin k]→L[ℝ] F
```

The natural pointwise pullback has the shape:

```lean
mpullback f ω x :=
  (ω (f x)).compContinuousLinearMap (mfderiv I I' f x)
```

This makes the upstream `compContinuousLinearMap` smoothness issue load-bearing rather than
incidental. The implementation should seek an upstream theorem first and otherwise prove the
needed smoothness at the appropriate finite regularity.

The eventual API should include identity/composition, linearity, smoothness preservation and
compatibility with wedge, with the appropriate differentiability hypotheses made explicit.

At degree 2, the bundled construction must bridge to the existing `SmoothTwoForm` rather than
create a second representation.

## 9. Exterior derivative

The manifold exterior derivative should be obtained by transferring the flat `extDeriv`/`extDerivWithin`
construction through charts. The precise bundled declaration is intentionally **not guessed** in
`Suggested.lean`.

The implementation target includes:

- locality;
- linearity;
- agreement with the flat exterior derivative on vector spaces;
- the degree-zero case;
- naturality under pullback;
- `d² = 0`;
- the graded Leibniz rule;
- the finite-regularity loss from differentiating once.

The May 2026 ICERM report is particularly relevant here: it already separates the flat calculus from
the alternating-map algebra and identifies the chart/bundle transfer as the difficult seam. The Tau
Ceti implementation should exploit that work rather than reproduce it independently.

## 10. Cartan calculus and downstream geometry

The forms layer should expose the operations needed by downstream geometry:

- interior product;
- Lie derivative of forms;
- the relation with `VectorField.mlieBracket`;
- Cartan's formula where the required hypotheses are available.

The smooth-flow layer can then provide the flow-based interpretation of Lie derivatives.

The longer mathematical path is:

```text
forms
  → coefficient-paired wedge
  → Lie-algebra-valued forms
  → connection forms
  → curvature
  → Bianchi identity
```

This is why the coefficient-general wedge is not cosmetic. It is the interface required by the
mathematics in Tu §21 and the later connection/curvature chapters. The connection/curvature and
Bianchi formalisation itself remains downstream of this sub-PR.

## 11. Smooth flows

### Existing continuous-flow foundation

The flow side builds on the existing integral-curve and continuous maximal-flow work, together with
Winston Yin and Yury Kudryashov's formalisation:

> Weichen Winston Yin and Yury Kudryashov, _Integral Curves and Flows on Banach Manifolds in Lean_,
> arXiv:2602.13247.

https://arxiv.org/abs/2602.13247

That work is important Lean prior art. It should not be described merely as a citation: the proposed
smooth theorem sits on top of this ODE/integral-curve foundation.

### The actual gap

The existing `MaximalFlow.lean` development establishes the continuous side and explicitly records
the distinction between its result and Lee's smooth theorem. The missing target is **joint smooth
dependence on time and initial condition**.

The mathematical reference is Lee, _Introduction to Smooth Manifolds_, 2nd ed., Theorem 9.12,
the Fundamental Theorem on Flows. Lee's theorem is stated in the smooth category. The Tau Ceti
implementation is intended to establish the finite-regularity version actually supported by its
manifold/ODE infrastructure.

The current `Suggested.lean` signature uses `minSmoothness ℝ 2` for the field and joint-flow
conclusion and `minSmoothness ℝ 3` for the manifold. **Those numbers are interface placeholders to
be verified**, not a claim made by this roadmap that the exact 2/3/2 theorem has already been
established. The implementation should determine the precise regularity assumptions from the live
ODE and manifold APIs.

The existing `ExpLie.lean` work contains the `contMDiff_flow_like` axiom/interface representing this
gap. The goal is to replace that axiom with a theorem, not to add another flow axiom alongside it.

The zero-time condition

```lean
hΦ₀ : ∀ x, Φ 0 x = x
```

is part of the intended flow interface: the integral-curve property alone does not identify an
arbitrary family of curves with the flow based at its initial point.

### Acceptance chain

```text
Yin–Kudryashov ODE / continuous-dependence prior art
                    ↓
          existing continuous MaximalFlow
                    ↓
       NEW: joint smooth dependence
          (Lee 9.12 target)
                    ↓
          existing `contMDiff_expLie`
                    ↓
              existing `funVF`
                    ↓
       existing fundamental-VF bracket
```

## 12. Implementation discipline

This package intentionally does **not** try to solve the repository's proof engineering in advance.
The division of labour is:

- this roadmap: mathematics, architecture, dependency ordering and known gaps;
- Tau Ceti's LLMs: discover exact live APIs, implement bridges and proofs, and iterate;
- Lean/compiler/CI: determine whether the resulting declarations actually typecheck;
- Jack: review the architecture and whether the split fits Tau Ceti.

In particular, do not invent exact bundled `mextDeriv` signatures or exact finite-regularity theorem
names in order to make the roadmap look complete.

`Suggested.lean` is deliberately a **compiled interface sketch** with four intentional `sorry`s.
Those placeholders are not implementation failures to be hidden; they mark the mathematical targets
that the implementation work must discharge.

## 13. Acceptance criteria

### Forms

- Layer-0 coefficient-paired wedge is implemented or cleanly bridged to upstream infrastructure.
- The degree-one normalization is fixed.
- The general manifold-form representation does not duplicate `SmoothTwoForm`.
- Pullback has the correct differentiability/smoothness hypotheses.
- Exterior derivative is transferred from the flat theory without guessing an incompatible API.
- `d² = 0`, naturality and the graded Leibniz rule are available at the appropriate regularity.
- Lie-algebra-valued forms can use the coefficient pairing needed by connection/curvature work.

### Flows

- Existing continuous maximal-flow work is reused.
- The precise finite-regularity smooth-dependence theorem is established against the live APIs.
- `contMDiff_flow_like` is a theorem rather than an axiom.
- Existing `expLie` smoothness consumes the theorem rather than a parallel result.

### Integration

- Degree 2 bridges to `TauCeti/Geometry/Manifold/TwoForm.lean`.
- No competing public form/flow structures are introduced unnecessarily.
- The README, PR description and `Suggested.lean` agree about what is proposed, existing, deferred,
and still uncertain.

## Acknowledgements

This roadmap is addressed to **Jack McCarthy (`deicyde`)** and builds on the differential-geometric
foundation already present in Tau Ceti.

The forms side is informed by **Yury Kudryashov and Sam Lindauer's** `DeRhamCohomology` work and
by their May 2026 ICERM progress report.

The flow side builds on **Winston Yin and Yury Kudryashov's** formalisation of integral curves and
flows.

No additional differential-geometry repository is assigned authorship or API provenance here unless
it is checked directly against the live source.

## References

- Loring W. Tu, _Differential Geometry: Connections, Curvature, and Characteristic Classes_,
  Chapter 4 §21 (especially §§21.2, 21.4–21.6), with Chapters 2 §§10–11 and Chapter 5 §22.2 as
downstream connection/curvature/Bianchi motivation.
- John M. Lee, _Introduction to Smooth Manifolds_, 2nd ed., Springer GTM 218, Theorem 9.12.
- Yury Kudryashov and Sam Lindauer, _Formalizing de Rham cohomology — Progress report_, ICERM,
  12 May 2026:
  https://app.icerm.brown.edu/assets/583/10880/10880_6142_Kudryashov_051220260900_Slides.pdf
- Yury Kudryashov, `urkud/DeRhamCohomology`:
  https://github.com/urkud/DeRhamCohomology
- Weichen Winston Yin and Yury Kudryashov, _Integral Curves and Flows on Banach Manifolds in Lean_,
  arXiv:2602.13247:
  https://arxiv.org/abs/2602.13247
- Existing Tau Ceti smooth 2-form declaration:
  `TauCeti/Geometry/Manifold/TwoForm.lean`, `SmoothTwoForm`.
- Tau Ceti Differential Geometry roadmap PR #178:
  https://github.com/TauCetiProject/TauCetiRoadmap/pull/178
