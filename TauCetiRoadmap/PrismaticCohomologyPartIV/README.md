# Roadmap: prismatic cohomology, Part IV — Logarithmic prismatic cohomology

**Summary.** Construct logarithmic delta algebra, saturated and animated log prismatic cohomology, log Hodge–Tate, crystalline and q-de Rham comparisons, and Laurent realizations in p-Kummer local systems. Preserve integral chart lattices and the proper Cartier-type nonzero-parameter comparison.

## Scope and ownership

The four roadmaps form the chain [PrismaticCohomology](../PrismaticCohomology/README.md) (Layers 0–2) `→` [PrismaticCohomologyPartII](../PrismaticCohomologyPartII/README.md) (Layers 3–5) `→` [PrismaticCohomologyPartIII](../PrismaticCohomologyPartIII/README.md) (Layers 6–7) `→` [PrismaticCohomologyPartIV](../PrismaticCohomologyPartIV/README.md) (Layer 8). Layer and section labels agree across the four parts. PerfectoidQuotients §0.0 and AInfCohomology Layers AI.0–AI.6 supply the perfectoid and integral period inputs; PadicHodgeTheory §§0.2–0.5 supplies the rational period rings used in the comparison diagrams.

This part consumes PrismaticCohomology Layers 0–2, PrismaticCohomologyPartII Layers 3–5 and PrismaticCohomologyPartIII Layers 6–7. Log monoids and log crystalline foundations come from CrystallineCohomology Layers CR.5:log-algebra and CR.5. DerivedDeRhamCohomology §6.20 supplies the shared log cotangent and derived de Rham constructors; CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18 supplies their logarithmic deformation, flatness and descent applications. The new objects here are logarithmic delta and prism data, their derived and saturated sites, log adic and diamond Kummer adapters, and the p-Kummer realization. Ordinary adic geometry, diamond sites, lisse descent and Tau Ceti’s pro-p predicate are imported. The monoid tilt is Mathlib `Perfection M p`, with its existing projection and root maps. Perfect monoids use Mathlib `PerfectRing M p`; pseudo-perfectoid monoids use `PerfectRing (Associates M) p`. These supplied notions have no separate carriers or predicates here. Kummer homomorphisms of monoids and Kummer morphisms of fs log schemes are CrystallineCohomology's (§CR.5:log-algebra.2, Kummer homomorphisms and Kummer morphisms); this part owns the Kummer-étale site built from them. Integral perfectoidization, used for saturations of log diamonds, is PrismaticCohomology §2.31.

Part IV is the sole supplier of the generic logarithmic delta, prism, site and cohomology constructions (§§8.1–8.29), their crystalline, de Rham and semistable `AΩ` comparisons (§§8.35, 8.41–8.42, 8.56), the Kummer-étale comparison (§8.69), and the shared log adic structures and Kummer-étale site (§8.60). CohomologyComparisons §4.6 is a downstream consumer of these interfaces with their stated hypotheses and owns the additional period and Hyodo–Kato compatibility diagrams and specializations. Its §6.1 consumes §8.60 for divisorial cusp log structures and the Kummer-étale site, and owns the pro-Kummer-étale tower and logarithmic period-sheaf adapters. The dependency order is Part IV before these CohomologyComparisons applications.

### Imported log quasisyntomic sites (§8.43)

Use CrystallineCohomology §CR.DDR.6.15 (log quasisyntomic sites and QRSP bases) with the following hypotheses and laws. A map of pre-log rings `A → B` is p-completely homologically log flat (resp. faithfully flat) if `B ⊗^L_A A/p ≅ B/p` is discrete and `(A/p, M_A) → (B/p, M_B)` is homologically log flat (resp. homologically log faithfully flat) in the sense supplied by DerivedDeRhamCohomology §6.20 and CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18 (`B′ ⊕^L_A B ≅ B′ ⊕_A B` for all `A → B′`, plus faithful flatness of rings). A pre-log ring `(A, M_A)` is quasisyntomic if `A` is p-complete with bounded `p^∞`-torsion and the Gabber log cotangent complex `L_{(A,M_A)/ℤ_p}` has p-complete Tor amplitude in `[−1, 0]`. A map `A → B` of p-complete pre-log rings with bounded `p^∞`-torsion is quasisyntomic (resp. a quasisyntomic cover) if it is p-completely homologically log flat (resp. faithfully flat) and `L_{B/A} ⊗^L_B B/p` has Tor amplitude in `[−1, 0]`. `QSyn^prelog` is the category of quasisyntomic pre-log rings; its opposite is a site with quasisyntomic covers. For `(R, M) p`-complete with bounded `p^∞`-torsion, `qSyn_{(R,M)}` is the small site of quasisyntomic maps `(R, M) → (S, N)`; for perfectoid quasisyntomic `(R, M), QSyn_{(R,M)}` is the slice. On these sites the p-completion of `∧^i L_{(S,N)/(R,M)}[−i]` lies in `D^{≥0}(S)`.

Gabber's log cotangent complex and homologically log flat maps as supplied by DerivedDeRhamCohomology §6.20 and CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18. For trivial pre-log structures one recovers BMS2's quasisyntomic site (DerivedDeRhamCohomology §§5.1–5.7).

(KY, §3.1, Definition 3.2 (p. 27); KY, §3.1, Definition 3.3 (p. 27); KY, §3.1, Corollary 3.7 (p. 28).)

*Supplied by:* CrystallineCohomology Layer CR.5:log-algebra, Mathlib `CategoryTheory.GrothendieckTopology`, CrystallineCohomology §CR.DDR.6.15, CrystallineCohomology §CR.DDR.6.6, DerivedDeRhamCohomology §6.20 (`gabberLogCotangent`), DerivedDeRhamCohomology §5.1.

- **Objects.** The quasisyntomic condition on a pre-log ring.
- **Maps.** The quasisyntomic condition on a map, with the cover variant.
- **Sites.** The site `QSyn^{prelog,op}` with quasisyntomic covers, and its small variant `qSyn_{(R,M)}`.
- **Cover descent.** For a quasisyntomic cover `A → B, A` is quasisyntomic iff `B` is.
- **Composition.** Quasisyntomic maps compose.
- **Pushouts.** The p-completed pushout of a quasisyntomic map along any map is discrete with bounded `p^∞`-torsion and quasisyntomic.
- **Strict agreement.** On pre-log rings with trivial pre-log structure, the notions agree with BMS2's quasisyntomic rings and maps (DerivedDeRhamCohomology §§5.1–5.7).
- **Cotangent bound.** For `(S, N)` in `qSyn_{(R,M)}, (∧^i L_{(S,N)/(R,M)}[−i])^∧_p ∈ D^{≥0}(S)`.

Use CrystallineCohomology §§CR.DDR.6.15–CR.DDR.6.17: KY Lemma 3.5 for a quasisyntomic cover `A → B, A ∈ QSyn^prelog` iff `B ∈ QSyn^prelog` (transitivity triangle and faithful flatness of `A/p → B/p`). Lemma 3.6: quasisyntomic maps compose; their p-completed pushouts are discrete with bounded `p^∞`-torsion and quasisyntomic over the other factor (using BMS2 Corollary 4.8 and base change of `L`). Corollary 3.7: `QSyn^{prelog,op}` is a site; Remarks 3.8–3.9 for the slice and small sites and the `D^{≥0}` property.

**Checks.**

- **Smooth log coordinate.** `(ℤ_p⟨T⟩, T^N)` is quasisyntomic: its log cotangent complex is free of rank 1 on `dlog T`.
- **Trivial log structure.** `(R, {e})` is in `QSyn^prelog` iff `R` is in BMS2's QSyn.
- **Zero chart.** `(ℤ_p, N → ℤ_p, 1 ↦ 0)` is quasisyntomic: `L_{(ℤ_p,N)/ℤ_p}` is concentrated in degrees `[−1, 0]` (KY Example 2.30).
- **Nonintegral negative control.** For `k` of characteristic `p ≠ 2, (k, P) → (k[x, y]/(x^2, xy, y^2), N^2)`, with `P ⊂ N^2` generated by `(2,0), (0,2), (1,1)` and `P∖{0} ↦ 0`, is log étale in Kato's sense but not quasisyntomic: its log cotangent complex is unbounded on the left (KY Remark 2.13).
- **Identity cover.** The identity of a quasisyntomic pre-log ring is a quasisyntomic cover.

### Imported log QRSP inputs (§§8.44–8.45)

**§8.44 Quasiregular semiperfectoid pre-log rings.**

Use CrystallineCohomology §CR.DDR.6.16 (log quasiregular semiperfectoid objects) with the following hypotheses and laws. A p-complete pre-log ring `S = (S, M)` is semiperfectoid if (1) there is a ring map `R → S` from a perfectoid ring; (2) `S/p` is semiperfect; (3) the natural map `M♭ → M/M^×` is surjective. It is quasiregular semiperfectoid if moreover (4) `S` is quasisyntomic. `QRSPerfd^prelog` denotes the category of quasiregular semiperfectoid pre-log rings. Conditions (2)–(3) (log-semiperfect) imply `L_{(S,M)/R} ⊗^L S/p ∈ D^{≤−1}(S/p)` for any `R → S`; for `S` quasiregular semiperfectoid, `L̂_{(S,M)/ℤ_p}[−1]` is p-completely flat. Equivalently (when `S/p` is log-semiperfect, `S p`-complete with bounded `p^∞`-torsion), `S ∈ QRSPerfd^prelog` iff there exists a perfectoid ring map `R → S` with trivial source prelog structure such that `L_{(S,M)/R} ⊗^L S/p` has Tor amplitude in degree `−1`. Once such a map exists, the cotangent condition holds for every perfectoid ring map `R → S`.

p-complete pre-log rings; perfectoid in the sense of BMS1.

(KY, §3.2, Definition 3.11 (p. 29); KY, §3.2, Lemma 3.16 (p. 30–31).)

- **Semiperfectoid objects.** Conditions (1)–(3).
- **QRSP objects.** Conditions (1)–(4).
- **Cotangent flatness.** For `S ∈ QRSPerfd^prelog, L̂_{(S,M)/ℤ_p}[−1]` is p-completely flat.
- **`R`elative cotangent criterion.** Lemma 3.16: with `S/p` log-semiperfect and `S p`-complete with bounded `p^∞`-torsion, `S` is quasiregular semiperfectoid iff there exists a perfectoid ring map `R → S` with trivial source prelog structure for which `L_{(S,M)/R} ⊗^L S/p` has Tor amplitude in degree `−1`. If such a map exists, this condition holds for every perfectoid ring map `R → S`.
- **Perfectoid source.** The map `(R ⊗̂ W(S♭) ⊗̂ ℤ_p⟨M♭⟩, M♭) → (S, M)` of Remark 3.13.
- **Quotient monoids.** Condition (3) passes to quotient monoids and pushouts (Remark 3.14).

Use CrystallineCohomology §CR.DDR.6.16’s four defining conditions and the variants (5)–(6) of Remark 3.12 and their implications. Remark 3.13: a semiperfectoid `(S, M)` receives `(R ⊗̂ W(S♭) ⊗̂ ℤ_p⟨M♭⟩, M♭) → (S, M)`, surjective on rings and modulo units on monoids. Lemma 3.16: purity of `π_1` of `L_{R/ℤ_p} ⊗ S/p → L_{S/ℤ_p} ⊗ S/p`, reduced to perfect fields `k` and Lemma 2.9 (via DerivedDeRhamCohomology §6.20 and CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18).

**Checks.**

- **Divisible coordinate.** `(O_C⟨T^{1/p^∞}⟩, N[1/p] → T^{N[1/p]})` is quasiregular semiperfectoid.
- **Strict agreement.** `(S, S^×)` is in `QRSPerfd^prelog` iff `S` is in BMS2's QRSPerfd (PrismaticCohomology Layer 2/DerivedDeRhamCohomology §§5.1–5.7).
- **Nondivisible chart.** `(ℤ_p⟨T⟩, T^N)` is quasisyntomic but not semiperfectoid: `N♭ = 0` does not surject onto `N`.
- **Missing perfectoid source.** `(ℤ_p,{1})` has semiperfect reduction and the monoid tilt condition, but receives no perfectoid ring map. A universal cotangent test over the empty collection of such maps cannot make it QRSP (CrystallineCohomology §CR.DDR.6.16).
- **Zero ring.** The zero ring with the trivial monoid is quasiregular semiperfectoid. With the chart `N → 0` it is not semiperfectoid: `N♭` is trivial and does not surject onto `N`.

**§8.45 Quasiregular semiperfectoid pre-log rings form a basis.**

Use CrystallineCohomology §CR.DDR.6.17 (compatible-root covers of prelog rings, with its QRSP bases and unfolding) for (1)–(4). (1) For maps `A → B, A → C` in `QRSPerfd^prelog` with `A → B` a quasisyntomic cover, the p-completed pushout lies in `QRSPerfd^prelog` and is a quasisyntomic cover of `C`; `QRSPerfd^{prelog,op}` is a site. (2) Every `R ∈ QSyn^prelog` admits a quasisyntomic cover `R → S` with `S ∈ QRSPerfd^prelog`, which can be chosen with p-divisible monoid. (3) For such a cover every term of the Čech nerve lies in `QRSPerfd^prelog`. (4) Consequently, for every presentable `∞-category C`, restriction induces an equivalence `Shv_C(QSyn^{prelog,op}) ≅ Shv_C(QRSPerfd^{prelog,op})`.

Quasisyntomic topology; presentable target.

(KY, §3.2, Lemma 3.18 (p. 32); KY, §3.2, Corollary 3.20 (p. 32).)

**Proof route.** (1) Lemma 3.17 via Lemma 3.6 and Remark 3.14. (2) Lemma 3.18: choose surjections `ℤ_p[X_i] → R` and `N^J → M`, base change along `(ℤ_p⟨X_i, Y_j⟩, N^J) → (O_C⟨X_i^{1/p^∞}, Y_j^{1/p^∞}⟩, N[1/p]^J)`.

*Supplied by:* CrystallineCohomology §§CR.DDR.6.15–CR.DDR.6.17, CrystallineCohomology §§CR.DDR.6.16–CR.DDR.6.17, DerivedDeRhamCohomology §6.20 (`gabberLogCotangent`), DerivedDeRhamCohomology §6.20 (`logCotangentFunctoriality`), DerivedDeRhamCohomology §§5.1–5.7.

## Conventions

Use PrismaticCohomology Conventions for `δ`-rings, cohomological indexing and derived completion, and Parts II–III for twists, Nygaard filtrations and realizations. Rings in logarithmic geometry are `ℤ_(p)`-algebras. Relative cohomology uses bounded prelog bases with integral charts; the algebraic prelog-prism definition itself permits arbitrary monoids. Every completion is marked by its ideal.

Log monoids are multiplicative unless a chart is written additively. Every saturation or fs assertion includes integrality. The diagonal `N→N^r` for a semistable chart gives `dlog x₁+⋯+dlog x_r=0`; for `xy=π, dlog y=−dlog x`. A p-divisible chart is not an all-integer uniquely divisible chart. Corrected Laurent realizations land in p-Kummer local systems: prime-to-p boundary inertia is a negative control, not part of the essential image. KYcorr Theorem 7 replaces KY arXiv-v1 Theorems 7.36–7.37 (published Theorems 7.35–7.36); the proper pushforward result KY v1 Proposition 7.38 (published Proposition 7.37) is retained.

The two-direction cochain Koszul convention is `d⁰(m)=(D₁m,D₂m), d¹(a,b)=D₂a−D₁b`, as in Part II. In §8.40 `e_s=dlog X_s` and the ordered exterior basis fixes the corresponding chain homotopy sign.

## Exact supplier contracts

A supplier row specifies the interface used, under the hypotheses shown. Its theories are imported. Each target lists its own additional prerequisites.

| Supplier | Layers | Required interface |
| --- | --- | --- |
| [PrismaticCohomology](../PrismaticCohomology/README.md), Layers 0–2 | 8 | `δ`-rings, prisms, prismatic envelopes and the `δ`-ring constructions of PrismaticCohomology Layer 0; the relative prismatic site, Čech–Alexander complexes, Hodge–Tate comparison and base change of PrismaticCohomology Layer 1; derived prismatic cohomology, QRSP prisms and perfectoidization, including integral perfectoidization (§2.31), of PrismaticCohomology Layer 2. |
| [PrismaticCohomologyPartII](../PrismaticCohomologyPartII/README.md), Layers 3–5 | 8 | Breuil–Kisin twists, the Nygaard filtration, the `Lη` factorisation and Frobenius isogeny (Layer 3); absolute prismatic cohomology (Layer 4); q-PD pairs, q-crystalline cohomology and the q-de Rham comparison (Layer 5). In §§5.2–5.3, use the supplied q-PD pairs `(D,I)` over `(ℤ_p[[q−1]],(q−1)): D,I` are derived `(p,[p]_q)`-complete, `(D,([p]_q))` is a bounded prism, `φ(I) ⊂ [p]_qD, γ(I) ⊂ I` for `γ(x) = φ(x)/[p]_q − δ(x)`, and `D/(q−1)` is p-torsion-free with finite `(p,[p]_q)`-complete Tor amplitude over `D`. The logarithmic applications additionally assume that `D/I` is classically p-complete. |
| [PrismaticCohomologyPartIII](../PrismaticCohomologyPartIII/README.md), Layers 6–7 | 8 | Derived Frobenius fixed points (§6.1) and the étale comparison (§§6.4–6.5); descent of prismatic crystals (§7.2) and the equivalence of Laurent F-crystals with `ℤ_p`-local systems (§7.8). |
| `TauCetiRoadmap.AdicSpaces`, Layers 0–3 | 8 | Huber pairs, adic spectra `Spa(A,A⁺)` and rational localizations; used for the adic spaces `Spa(R[1/p],R⁺)` of §§8.60–8.61 and 8.64. |
| AdicEtaleGeometry, Layer A1 | 8 | The small étale site of an analytic adic space and its structure sheaves `O` and `O⁺` (§§A1.6, A1.9). |
| SchemeAndStackFoundations, Layers 2 and 4 | 8 | Sites, scheme cohomology and perfect complexes (SchemeAndStackFoundations Layer 2); formal schemes, deformations and models (SchemeAndStackFoundations Layer 4). |
| EnhancedDerivedSheaves, Layers E1–E3 and E5 | 8 | The enhanced derived category with homotopy category Mathlib's `DerivedCategory` (E1); coherent diagrams and Kan extensions (E3); repleteness, inverse limits, Postnikov convergence and descent (E2); symmetric monoidal `∞-categories` and algebras (E5:abstract); animated commutative rings with polynomial generators and their universal property (E5:animation). Animated prelog rings use DerivedDeRhamCohomology §6.20. |
| DerivedModuleAlgebra, §§0.13, 1.1–1.9; DerivedDeRhamCohomology, §§5.1–5.7 | 8 | The cotangent complex of a regular quotient (DerivedModuleAlgebra §0.13); derived completeness and complete flatness (DerivedModuleAlgebra §§1.1–1.9); the quasisyntomic site and QRSP basis, completed faithfully flat cotangent-power descent, unfolding and completed left Kan extension (DerivedDeRhamCohomology §§5.1–5.7). BMS2 Lemma 4.34 supplies the relative cotangent-flatness condition only in its perfect-base range. |
| DerivedDeRhamCohomology, §6.20; CrystallineCohomology, §§CR.DDR.6.3–CR.DDR.6.18 | 8 | Shared animated prelog rings, free prelog resolutions, Gabber log cotangent and log derived de Rham constructors (DerivedDeRhamCohomology §6.20); derived log derivations and square-zero extensions (CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.3.1), homological log flatness (§CR.DDR.6.6), integral smooth Cartier comparison (§CR.DDR.6.11), log quasisyntomic sites and log QRSP objects with compatible-root bases (§§CR.DDR.6.15–CR.DDR.6.17), and log cotangent-power descent (§CR.DDR.6.18). |
| DerivedDeRhamCohomology, §§PD.6–PD.7; CrystallineCohomology, Layers CR.5:log-algebra, CR.5 and CR.6 | 8 | Compatible PD envelopes and their p-completions (DerivedDeRhamCohomology §§PD.6–PD.7); integral, fine and saturated monoids, prelog and associated log structures, characteristic monoids, charts, exact and integral morphisms, integral log fibre products, Kummer morphisms and the log smooth chart criterion (CR.5:log-algebra); log differentials, log PD envelopes and thickenings, log PD de Rham complexes, embedding descent and p-adic log crystalline cohomology (CR.5); Hyodo–Kato complexes and the semistable comparison in the semistable-DVR range (CR.6). Formal completion, arbitrary integral chart ranges and the proper Cartier-type deformation are made explicit in Layer 8; the arbitrary proper Cartier-type `O_C` range of §8.77 uses its separate Kato and Hyodo–Kato inputs. |
| AInfCohomology, Layers AI.0–AI.2, AI.5–AI.6 | 8 | `A_inf` with its cyclotomic coordinates and Witt-vector API (AI.0); `Lη` for an invertible ideal with its cohomology, truncation, Bockstein and Koszul adapters (AI.1); Breuil–Kisin–Fargues modules (AInfCohomology §AI.2.2); finiteness and p-local freeness from period comparisons (AI.5); semistable `AΩ` with its log Hodge–Tate, de Rham and crystalline specializations (AI.6), with the semistable hypotheses retained. |
| ClassicalAdicEtaleCohomology, §§1.2–1.4 and 2.5 | 8 | Geometric stalks at field pairs, Cartan–Leray spectral sequences and Tate twists on étale sites of adic spaces (§§1.2–1.4); the Spec–Spa comparison for arbitrary torsion abelian sheaves under the complete-Huber-pair standing hypotheses (§2.5, the sheaf comparison for `X = Spec A^▷`, Huber Theorem 3.2.9). |
| DiamondsAndVStacks, Layers D1–D2, D4–D6 | 8 | Strictly totally disconnected perfectoid spaces and covers (D1); v-descent of `O` and `O⁺` and higher v-acyclicity on affinoid perfectoids (D2); diamonds, small v-stacks and their underlying spaces (D4); quasi-pro-étale maps and fibre products of locally spatial diamonds (D5); `Spd` of Huber pairs through marked untilts, and descent of untilts along v-covers (D6). The completed sheaves Ǒ and Ô and the logarithmic, Kummer and marked-structure adapters are §§8.62a–8.68. |
| DiamondEtaleCohomology, Layers C0 and C2 | 8 | The quasi-pro-étale site of a diamond, pullbacks preserving limits, full faithfulness of quasi-pro-étale pullback and condensed coefficients (C0); testing on one v-cover (C2). |
| PerfectoidSpaces, §§P1.16–P1.18, P1.24–P1.25 | 8 | Perfectoid rings and spaces, tilts and untilts; integral perfectoid inputs, `A_inf, θ` and primitive kernels reach this part through PrismaticCohomology and AInfCohomology. |
| PadicHodgeTheory, §§0.2–0.5 | 8 | The de Rham period ring and filtration, crystalline period maps and the semistable logarithmic period ring, with their Frobenius and comparison maps. These supply the rational period coefficients in §8.42; the integral log PD deformation in §§8.76a–8.77 is constructed here. |

### Existing library interface

| Declaration | Provision |
| --- | --- |
| Mathlib `TruncatedWittVector` | Existing length-n p-typical Witt-vector carrier and transported Witt ring structure, not the pointwise product ring. |
| Mathlib `Ideal.jacobson` | The Jacobson radical (infimum of maximal ideals containing an ideal); the hypothesis `p ∈ rad(A)` of the monoid Frobenius and of the extension to `M^gp`. |
| Mathlib `MvPolynomial` | Multivariate polynomial rings; the free `δ_log`-ring on one generator is a polynomial ring on `x, δ_log(x), δ^n(δ_log(x))`. |
| Mathlib `WittVector` | The p-typical Witt-vector carrier and its ring operations; the rings `W(k), W(R♭)` and `A_inf = W(O_C♭)`. |
| Mathlib `WittVector.teichmuller` | The Teichmüller lift `R →* 𝕎 R` as a monoid homomorphism; it gives the rank-1 prelog structures `R♭ → W(R♭)` and `M♭ → A_inf(R)`. |
| Mathlib `PreTilt` | For a commutative ring `O, PreTilt O p = Perfection (ModP O p) p`, the inverse Frobenius perfection of `O/p`. This provides the pre-tilt carrier; identifying it with the tilt of a perfectoid ring requires the perfectoid theory of PrismaticCohomology Layer 0. |
| Mathlib `TensorProduct` | Tensor products of modules; carrier of `A ⊗_{ℤ_(p)[M]} ℤ_(p)[N]` in the extension of `δ_log` along `M ⊂ N ⊂ M^gp`. |
| Mathlib `DividedPowers` | Divided power structures on an ideal; the PD ideals `J` of `δ_log`-PD triples. |
| Mathlib `PowerSeries` | Formal power series; the ring `W(k)[[u]]` of the Breuil–Kisin prelog prism. |
| Mathlib `PadicInt` | The ring of p-adic integers |
| Mathlib `CategoryTheory.GrothendieckTopology` | Grothendieck topologies on a category; the étale and flat topologies on log prismatic sites, the Kummer étale and quasisyntomic topologies are instances. |
| Mathlib `DerivedCategory` | The derived category of an abelian category (homological complexes up to quasi-isomorphism); a 1-categorical shadow of `D(A)` in which log prismatic cohomology lives. |
| Mathlib `KaehlerDifferential` | Kähler differentials `Ω[S⁄R]` as the cotangent module of the diagonal ideal; the non-log `Ω¹` with which log differentials are compared `(Ω¹ → Ω¹_log)`. |
| Mathlib `MonoidAlgebra` | The monoid algebra `R[M]` of a monoid over a semiring; used for `ℤ_(p)[M], A[P]` and the chart rings `A⟨P⟩` before completion. |
| Mathlib `Algebra.GrothendieckGroup`, `Algebra.GrothendieckGroup.of`, `Algebra.GrothendieckGroup.of_injective` | The group completion `M^gp` of a commutative monoid, as localization at the top submonoid; the map `M →* M^gp` is injective for cancellative `M`. |
| Mathlib `Perfection`, `Perfection.coeffMonoidHom`, `Perfection.pthRootMonoidHom` | The monoid perfection `{f : ℕ → M // ∀ n, f (n+1)^p = f n}`, with its commutative monoid structure, coefficient projections and shift root map. This is the tilt `M♭ = lim_(m ↦ m^p) M` of KY Definition 2.18. |
| Mathlib `CategoryTheory.CosimplicialObject` | Cosimplicial objects `SimplexCategory ⥤ C`; carriers of Čech–Alexander nerves `C^•` and the cosimplicial algebras of Appendix B. |
| Mathlib `TruncatedWittVector.mk` | Length-two Witt coordinate carrier and constructor, used with coeff to state the `δ_log` Witt section contract. |
| Mathlib `PadicInt.toZModPow` | Ring homomorphism `ℤ_p→ℤ/p^n`; the coefficient reductions in finite-level inertia representations. |
| Mathlib `Matrix.GeneralLinearGroup.map` | A ring homomorphism induces a group homomorphism on invertible matrices; reduces inertia actions coefficientwise. |
| Mathlib `IsPGroup`, `IsPGroup.iff_card` | Every element is killed by some p-power; for finite groups and prime `p`, the supplied equivalence identifies this with p-power cardinality. |
| Mathlib `CategoryTheory.ObjectProperty.FullSubcategory` | An object satisfying a fixed predicate and the inherited full morphism category; realizes the p-Kummer essential-image category. |
| Mathlib `PerfectRing`, `PerfectRing.bijective_frobenius`, `powMulEquiv` | Unique p-divisibility of a commutative monoid; `PerfectRing (Associates M) p` is the pseudo-perfectoid condition. The carrier only needs a natural-power operation; no ring or characteristic hypothesis is imposed. |
| Mathlib `Associates, Associated` | The quotient `M/M^×` of a commutative monoid and the relation of differing by a unit; the perfectoid and pseudo-perfectoid conditions of §8.14 are stated with them. |
| Mathlib `nonZeroDivisors` | The submonoid of nonzerodivisors; the chart hypothesis for uniqueness and existence of `δ_log`-structures in §8.1. |
| Mathlib `powersHom` | The monoid map `n ↦ x^n` from `ℕ` (written multiplicatively); the chart `N → A, 1 ↦ x`. |
| Mathlib `Nat.Prime.multiplicity_factorial_pow`, `Nat.Prime.emultiplicity_factorial_mul` | Legendre's formula `v_p((p^n)!) = 1 + p + ⋯ + p^(n−1)` and `v_p((pn)!) = v_p(n!) + n`; together they give the contraction exponent `r·e(n)` of §8.76a. |
| Mathlib `Condensed` | Condensed objects (sheaves on compact Hausdorff spaces); the condensed coefficient rings of §§8.62a and 8.70. |
| Tau Ceti `TauCeti.IsProP` (`TauCeti.Topology.Algebra.Group.Profinite.ProP.Basic`) | Every quotient by an open normal subgroup is a p-group. This existing pinned predicate, rather than a second pro-p group theory, expresses local inertia. |

## How to read the build

Layer 8 is built in seven stages. §§8.0–8.0d set up the formal logarithmic geometry and the characteristic-p Riemann–Hilbert input. §§8.1–8.17 develop `δ_log`-rings, prelog and log prisms, their envelopes and perfect log prisms. §§8.18–8.29 build the relative log prismatic site and prove the log Hodge–Tate comparison and base change. §§8.30–8.42 give the `δ_log`-crystalline and log q-crystalline theories, the log crystalline comparison, the log q-de Rham complexes and the comparison with semistable `AΩ`. Using the supplied log quasisyntomic interfaces of §§8.43–8.45, §§8.46–8.58 pass to animated inputs, the log Nygaard filtration with its de Rham comparison and Frobenius isogeny, and Breuil–Kisin log cohomology. §§8.59–8.75 construct Kummer-étale sites on log schemes, log adic spaces and log diamonds, prove the Kummer-étale comparison, and identify Laurent F-crystals with p-Kummer local systems. §§8.76–8.79 apply the theory over `A_inf`: the étale comparison, log PD rigidity, the Hyodo–Kato isomorphism over `A_crys`, Breuil–Kisin–Fargues modules and the standard semistable chart. Within a stage the *Needs* lines fix the construction order; earlier parts are cited by roadmap name and section.

`Suggested.lean` contains no theorem declarations: the pinned Mathlib and Tau Ceti do not provide the log formal schemes, log prisms, log cohomology complexes, log diamonds or Laurent F-crystals needed to state the headline comparisons and realization theorems. Its module docstring identifies the missing objects for each group of headline results.

## Layer 8: Logarithmic prismatic cohomology

Begin with logarithmic delta algebra and its logification, Frobenius and exactification. Construct relative, animated, saturated and absolute log prismatic theories, preserving the non-fine and boundedness distinctions. The de Rham, crystalline and Nygaard comparisons lead to Kummer-étale realization on log schemes and diamonds. The final Laurent equivalence uses the corrected p-Kummer essential image and the proper pushforward and BKF consequences in their stated ranges.

### 8.0 Algebraic Witt–Frobenius modules and extension by zero

For an `𝔽_p`-algebra `R` and `n≥1`, define an *algebraic Frobenius module* over `W_n(R)` to be a `W_n(R)`-module `M` with an invertible semilinear Frobenius such that each `x∈M` is annihilated by a monic polynomial in the skew operator `F` with coefficients in `W_n(R)`. Invertible Frobenius means an automorphism of the additive group; it does not mean that `M` is finite projective as a ring-module. Define the *algebraic derived category* as the full subcategory of bounded complexes of perfect Frobenius `W_n(R)`-modules (Frobenius bijective) with algebraic cohomology. Prove the *solution equivalence*: derived Frobenius solutions give an equivalence with `Dᵇ(Spec R_ét,ℤ/p^n)`, including arbitrary sheaves, natural under pullback. Its compatibility with derived Witt reduction has the boundedness hypotheses of the Witt reduction comparison below. Bhatt–Lurie prove the abelian equivalence and the comparison of all Ext groups between algebraic objects (Theorem 9.6.1, Proposition 9.6.2); the bounded derived equivalence follows by dévissage and is the target here. Prove *extension by zero*: for a principal open immersion `j: Spec R[1/t] → Spec R`, the algebraic left adjoint corresponds to `j_!` and its bounded derived functor. (BLRH, Definition 2.4.1 and Theorem 2.4.3, pp.16–17; Definition 5.2.1, Propositions 5.2.2, 5.2.4, pp.38–42; Definition 9.5.2, Proposition 9.5.6, Theorem 9.6.1, Proposition 9.6.2, pp.83–87.)

*Needs:* [PrismaticCohomologyPartIII §6.1](../PrismaticCohomologyPartIII/README.md#s6-1), [PrismaticCohomologyPartIII §7.7](../PrismaticCohomologyPartIII/README.md#s7-7), SchemeAndStackFoundations Layer 2, EnhancedDerivedSheaves §0.3 and §E1.4 (derived coefficient change and finite Tor amplitude), EnhancedDerivedSheaves Layer E3, EnhancedDerivedSheaves Layer E5:abstract, Mathlib `WittVector`, Mathlib `TruncatedWittVector`, [PrismaticCohomology §0.65](../PrismaticCohomology/README.md#s0-65).

- The algebraic Frobenius module predicate and its equivalent formulation on the successive p-power subquotients, including p-torsion modules.
- The Frobenius colimit, with its invertible Frobenius and universal property.
- The étale sheaf of Frobenius-fixed sections after étale scalar extension; its derived version uses the fibre of `F−1`.
- The solution equivalence and all nonnegative Ext comparisons, rather than only `Hom` on lisse objects.
- Extension by zero: the left adjoint, its restriction to the open and its compatibility with the solution functor and with Cartesian open base change.
- Witt reduction. For `n≥2` and `K` in the algebraic derived category over `W_n(R)`, put `F=Sol_n(K)`. Assume both derived reductions are bounded. Then `Sol_(n−1)(K_red) ≅ F⊗ᴸ_(ℤ/p^n)ℤ/p^(n−1)` in `Dᵇ(Spec R_ét,ℤ/p^(n−1))`. Define `K_red` by transporting `K` to `W_n(R_perf)` using the equivalence on perfect Frobenius modules, deriving scalar extension to `W_(n−1)(R_perf)`, and restricting to `W_(n−1)(R)`. Finite Tor amplitude of `K` over `W_n(R_perf)` and of `F` over `ℤ/p^n` is a sufficient hypothesis. This is a comparison on the full subcategories with bounded reductions, not a coefficient-change functor on all bounded objects. (BLRH, Proposition 9.2.3 and Corollary 9.2.4, p.76; Theorem 9.6.1 and Proposition 9.6.2, pp.85–87.)

The p-filtration uses ordinary subquotients. For an algebraic module `M`, solutions identify the short exact sequences `0→pM→M→M/pM→0` and `0→M[p]→M→pM→0` with their sheaf counterparts; these give bounded distinguished triangles. The corresponding statements hold for every successive p-power subquotient. The cone of multiplication by `p` has cohomology `M[p]` in degree `−1` and `M/pM` in degree zero; it is not in general the derived reduction from `ℤ/p^n` to `𝔽_p`. These exact sequences impose no Tor-amplitude condition. (BLRH, Proposition 9.5.1 and Propositions 9.5.5–9.5.6, pp.82–84.)

**Proof route.** At Witt length one, construct the left adjoint from étale free generators: monic skew-Frobenius equations and perfection give exact, acyclic solutions, with finite presentations detecting holonomicity and filtered colimits giving arbitrary algebraic modules. Induct on Witt length through `pM` and `M[p]`, using lifted monic equations for algebraicity. Acyclic injective resolutions give the Ext comparison and bounded Postnikov towers the derived equivalence. For Witt reduction, restriction of scalars across lengths corresponds under solutions by BLRH Remark 9.4.2. Its derived left adjoints therefore correspond: compute Frobenius scalar extension over `R_perf` and sheaf coefficient change in the supplied enhanced categories, and use the bounded-reduction hypotheses to obtain the comparison in the bounded subcategories (BLRH Proposition 9.2.3, Corollary 9.2.4 and Remark 9.4.2, pp.76, 80; Definition 2.4.1 and Theorem 2.4.3, pp.16–17; Theorem 9.6.1, pp.85–87).

**Proof route.** Over a principal open, clear denominators in a finitely presented Frobenius lattice and multiply by a high power of `t` so its perfected closed fibre vanishes while localization is unchanged; this constructs extension by zero on holonomic objects. Filtered colimits and the p-filtration with Ext comparison extend it to all algebraic modules and Witt lengths. The open/closed fibre criterion and bounded Postnikov descent identify solutions with `Rj_!` and its localization triangle (BLRH Proposition 5.2.4).

In the special valuation case `R=O_(C^♭), t` a nonzero topologically nilpotent element and `j:Spec C^♭→Spec R`, the constant sheaf on the generic point extended by zero corresponds to `W_n(m_(C^♭))`, the p-power radical Witt ideal, with its Frobenius; this is the non-lisse input to §8.76.

**Proof route.** Modulo `p` this is the union of `t^(1/p^r)R`, whose tensor square is itself and whose residue-field tensor vanishes. Witt induction gives the length-n assertion, so tensoring by the ideal realizes KY Lemma 8.5’s extension by zero. The cone of the integral inclusion `W_n(m_(C^♭)) → W_n(O_(C^♭))`, corresponding to extension by zero followed by the constant extension, is supported at the closed point and killed by the Teichmüller ideal `[m_(C^♭)]`. This is the integral constant extension in KY Lemma 8.5, not generic localization to `W_n(C^♭)`.

**Checks.** For `R=𝔽_p, W_n(R)` with its identity Frobenius has solutions the constant `ℤ/p^n` sheaf. Over algebraically closed `R=k`, direct sums of `W_n(k)` with Witt Frobenius give constant free `ℤ/p^n`-module sheaves; infinite sums are usually not perfect ring-modules. General constant modules require nonfree algebraic Frobenius modules: at `n=2`, the constant `ℤ/p` sheaf corresponds to `W_2(k)/p` with Witt Frobenius, and is not a nonzero sum of the unit. For this object, the free resolution over `ℤ/p²` with multiplication by `p` in every degree becomes a complex with zero differentials after tensoring with `𝔽_p`; hence `Tor_i^(ℤ/p²)(𝔽_p,𝔽_p)=𝔽_p` for every `i≥0`. Its derived reduction is unbounded below and fails the hypothesis of the Witt reduction comparison; the same calculation over `W_2(k)` gives `k` in every Tor degree. A bounded complex of finite free coefficients has bounded reduction and satisfies the comparison, including the zero complex. For `R=O_(C^♭), W_n(m_(C^♭))` has zero geometric stalk at the closed point and a rank-one stalk on `Spec C^♭`, so it is algebraic and fails the lisse condition on `Spec R`. At `n=1`, perfection of a nilpotent Frobenius module is zero, so forgetting the perfection would give the wrong category. For `t=0` the open is empty and extension by zero is zero; for `t=1` it is the identity. These include the two excluded localization extremes. At `n=1` the integral inclusion `m_(C^♭) → O_(C^♭)` has residue-field cokernel killed by `m_(C^♭)`. In contrast, `C^♭/m_(C^♭)` is not almost zero: for nonzero `t∈m_(C^♭)`, multiplying the class of `t⁻²` by `t` gives a nonzero class. At `n=1`, on complexes whose solutions are lisse, the solution equivalence restricts to the lisse Riemann–Hilbert correspondence of PrismaticCohomologyPartIII §7.7(1); the algebraic, non-lisse objects such as `W_n(m_(C^♭))` are what this subsection adds.

### 8.0a Formal integral logarithmic charts

Construct formal integral log charts over a classically `J`-complete ring `A`, with `J` finitely generated, using the finitely generated adic formal carrier of SchemeAndStackFoundations Layer 4. Its formal étale charts are compatible étale charts of the nilpotent reductions; uniqueness of étale lifting identifies their overlaps and coverings. For bounded p-adic objects this agrees with §1.0. A log structure is an integral monoid sheaf on that site with its structure map to `O_X` and the usual identification above `O_X^×`. A chart `P→Γ(X,M_X)` induces this sheaf after logification. For a fixed integral base chart `M→A`, distinguish: relatively coherent means `P` is finitely generated over `M`; relatively fine means finitely presented over `M` in integral monoids; small means `P` surjects onto `Γ(X,M_X)/Γ(X,O_X^×)`; exact at `x` means the chart map to the geometric stalk is exact. Log affine means that the identity on `Γ(X,M_X)` is a chart. These predicates are extra data/properties of charts, not consequences of affine underlying geometry.

Use CrystallineCohomology Layer CR.5's integral monoid pushouts, groupifications and logification. In particular, exactify a surjection `h:P→Q` of integral monoids by `P^ex=(h^gp)⁻¹(Q)` inside `P^gp`, and use the completed monoid-algebra base change on the ring. An exact surjection has `P/P^×≃Q/Q^×` and gives a strict exact closed immersion after logification. None of these definitions requires a fine base monoid.

(K1, Appendix A.2, Definitions A.2–A.3, Lemmas A.4–A.5 and Corollaries A.6–A.7, pp.51–53; Definition A.8 and Lemmas A.9–A.10, pp.53–54; Definitions A.22–A.23, pp.59–60; §3, proof of Proposition 3.9, pp.17–18.)

*Needs:* [PrismaticCohomology §1.0](../PrismaticCohomology/README.md#s1-0), CrystallineCohomology §CR.5:log-algebra.1, CrystallineCohomology §§CR.5:log-algebra.1–CR.5:log-algebra.2, EnhancedDerivedSheaves Layer E1.

- Compatible logifications on the formal étale site and on every `X/J^n`, with descent of charts and their morphisms.
- An integral injection `M→P` with `P` finitely generated over `M` is relatively fine. Consequently chart maps out of `P` and equality of such maps extend from a geometric stalk to an étale neighbourhood.
- Assume `(X,M_X)` over `(A,M)` admits a relatively fine chart `M→P`, and let `M′→A` be another integral chart of the same base log structure `(Spf(A),M)^a`. Fix a geometric point `x`, an abelian group `G` containing `M′^gp` and finitely generated over it, and a homomorphism `h:G→M_X,x^gp` compatible with the base map `M′→M_X,x`. Assume its quotient `h̄:G→M_X,x^gp/O_X,x^×` is surjective and `ker(M′^gp→M_X,x^gp/O_X,x^×)` is finitely generated modulo `M′^×`. Then `P′=h̄⁻¹(M_X,x/O_X,x^×)` is finitely presented over `M′` as an integral monoid, and `h|P′:P′→M_X,x` extends to a chart on an étale neighbourhood of `x`, exact at `x` (K1 Corollary A.7, pp.52–53).
- If |X| is locally noetherian and either `Spec M` is finite or the images of `M∖M^×` lie in `√J`, a relatively coherent chart is small on sufficiently small Zariski neighbourhoods of `x` and on their smaller neighbourhoods containing `x`. Affine such neighbourhoods are log affine.
- For a small chart exact at `x`, integrality or exactness of `M→P` passes to `M→Γ(X,M_X)`.
- The groupification formula, its universal property, and the exact-closed-immersion conclusion for exact surjections.

**Proof route.** Apply CrystallineCohomology Layer CR.5’s logification on ordinary étale charts and pass through the common étale topoi of nilpotent reductions. For the exact-neighbourhood bullet, the relatively fine chart and kernel hypotheses give finite generation of `P′` over `M′`; Lemma A.4 gives relative finite presentation. Lemma A.5 extends the map `h|P′` from the stalk to an étale neighbourhood. The induced map of log structures is an isomorphism at `x`; Corollary A.6 extends this isomorphism after shrinking, using the relatively fine charts on both sides. The chart is exact at `x` by the inverse-image definition. Integral smooth charts supply relative fineness through the relative-fineness bullet above. Under the stated small-chart hypotheses only finitely many characteristic faces occur: stabilize their unit loci, then use characteristic-section surjectivity and exactness (K1 Definitions A.2–A.3, Lemmas A.4–A.5 and Corollaries A.6–A.7, pp.51–53; Definition A.8 and Lemmas A.9–A.10, pp.53–54).

**Checks.**

- The identity over `(A,Q_{≥0}→A)` is relatively coherent and integral although the base monoid need not be fine.
- Affineness alone is not used to infer that `Γ(X,M_X)` is a chart; the small-chart hypothesis is retained in the small-neighbourhood bullet.
- For `2N⊂Z` mapping isomorphically to its image 2N, exactification does not introduce the missing generator 1. For a surjection `N²→N` adding the exponents, it introduces the kernel units in `ℤ²`, rather than replacing both labelled generators by one freely.
- Relative finite presentation is not silently replaced by finite presentation of `ℤ[P]` over `ℤ[M]`. The smoothness definition below therefore makes no general finite-presentation claim about `X/A`.
- **Relative finiteness boundary.** Over an algebraically closed field `k` of characteristic `p`, take `A=k`, `J=0`, trivial base chart and `X=Spec k[t]` with the integral chart `⊕_(a∈k) N e_a→k[t]`, `e_a↦t−a`. At a geometric generic point `x` the characteristic is zero, so `M′=G=0` admits the compatible lift `h=0` and satisfies the group and kernel conditions. Every étale neighbourhood of `x` has open image containing a closed point `t=a`, where the characteristic is `N`; hence the log structure is never trivial on such a neighbourhood. No relatively fine chart exists near `x`, even though `X` is noetherian.
- **Log-group lift boundary.** Let `k` be separably closed and imperfect of characteristic `p`, and choose `u∈k^×` without a p-th root. The integral monoid `Q⊂ℤ²` generated by `b=(1,0)`, `a=(1,1)`, `c=(0,p)` and `−c` has units `ℤc` and relation `pa=pb+c`. Its chart on `Spec k` sends `a,b` to zero and `c` to `u`, and is relatively fine over the trivial base. The associated log monoid is `Q⊕_(ℤc)k^×`, with characteristic group `G=ℤ⊕ℤ/p`. The identity on `G` satisfies the quotient and kernel conditions, but has no lift to the log group: every lift of the order-p class `a−b` has p-th power `uv^p` for some `v∈k^×`, which cannot equal one. An étale neighbourhood cannot adjoin the missing purely inseparable root.

### 8.0b Smooth formal logarithmic geometry

Define smoothness of a log formal scheme over `(A,M)` by the following local chart criterion. There is a relatively coherent integral chart `M→P` which is integral and injective on groupifications; the torsion subgroup of `P^gp/M^gp` is finite of order invertible on `X/J`; and `X→Spf(A⟨P⟩)×_{Spf(A⟨M⟩)}Spf(A)` is étale. For étaleness require the whole group quotient to be finite of invertible order. Dropping integrality of `M→P` defines the corresponding Kato variants. Smoothness includes integrality; the Kato variant need not give flat underlying geometry. All formal fibre products and monoid algebras here are `J`-completed.

Prove stability under completed base change between integral prelog bases, using integral log fibre products for the Kato variant. Integral smoothness gives flat maps on ordinary reductions modulo `J^n`. To conclude derived `J`-complete flatness in the sense of DerivedModuleAlgebra §1.7, also assume the comparison between classical and derived completion for the chart algebra and its étale localizations. For `J=(p)`, bounded `p^∞`-torsion in `A` gives this comparison for the smooth chart models; bounded-prism applications use the corresponding `(p,I)` comparison before asserting derived complete flatness (DerivedModuleAlgebra §§1.7–1.9; BMS2 Lemma 4.7, pp.221–222). Its completed log differentials are finite locally free. At each finite level, maps from affine integral exact nilpotent thickenings lift to a smooth affine target. If that target is also of finite presentation over `A`, a log-affine nilideal thickening is allowed; the ideal need not have one uniform nilpotence exponent. An exact closed immersion `X→Y` of smooth log schemes over `A/J` is quasi-regular; it is regular if `Y` is locally of finite presentation over `A/J`.

(K1, Definition A.11 and Remarks A.12–A.14, pp.54–55; Proposition A.15, pp.55–56; Remark A.16 and Proposition A.17, pp.57–58; Remarks A.18–A.19 and Proposition A.20, pp.58–59.)

*Needs:* §8.0a, CrystallineCohomology §CR.5:log-algebra.3, CrystallineCohomology §CR.5:log-algebra.2, CrystallineCohomology §CR.5:log-algebra.5, CrystallineCohomology §CR.5.1, DerivedModuleAlgebra §0.13, DerivedModuleAlgebra §§1.7–1.9, SchemeAndStackFoundations Layer 4.

- The completed base-change theorem, retaining integrality of the chart and the invertible torsion condition.
- Under the classical-to-derived completion comparison just specified, the underlying ring is derived `J`-completely flat. In the p-adic case retain bounded `p^∞`-torsion in `A`; in the bounded-prism case retain the `(p,I)` completion comparison.
- `A` Kato-smooth chart is an integral base change of a fine chart whose reductions are formally smooth. If `X/A` is locally of finite presentation, the fine model is log smooth. A finitely presented original chart permits such a log-smooth fine model after enlarging the fine base monoid. Compare with CrystallineCohomology Layer CR.5's finite-model notion exactly in this range.
- The affine exact nilpotent lifting property and finite locally free completed `Ω^i_log`.
- The stronger log-affine lifting theorem with finite presentation of the affine smooth target as an explicit hypothesis.
- Flat conormal module and `Sym(J/J²)≃gr_J` for an exact closed immersion of smooth log schemes, with the stated finite-presentation upgrade to regularity.
- For another integral base chart `M′` defining the same log structure, smooth/étale charts exist near `x` if `ker(M′^gp→M_X,x^gp/O_X,x^×)` is finitely generated modulo `M′^×`. They may be chosen exact at `x`. An exact base chart satisfies this kernel condition for an integral smooth morphism.

**Checks.**

- With trivial charts the étale polynomial model gives ordinary smooth formal geometry and its completed differentials.
- The diagonal `N→N^r` yields the completed chart `A⟨x_1,…,x_r⟩/(x_1⋯x_r−a)`, finite free log differentials modulo `Σ dlog x_i`, and flat ordinary reductions over `A/J^n`. Derived complete flatness uses the completion comparison of the complete-flatness bullet, in particular bounded base p-power torsion when `J=(p)`.
- `N→N, 1↦m`, meets the étale group condition only when `m` is invertible on `X/J`; `m=p` over a characteristic-p reduction is excluded.
- A fine model that is merely formally smooth at each reduction is not called a fine log-smooth finite-presentation model without the additional hypothesis of the fine-model bullet.
- For `A=∏_{n≥1}ℤ/p^n` and `B=A⟨T⟩`, the free integral chart `0→N` is smooth and both rings are classically p-complete. Let `e_n` be the nth coordinate idempotent. The restricted series `f=Σ_{n≥1}e_n p^(n−1)T^n` lies in `B[p]` but not in `Ann_A(p)B`: that ideal contains only polynomials, since `Ann_A(p)` kills every sufficiently p-divisible coefficient tail. Thus `Tor₁^A(A/p,B)=B[p]/Ann_A(p)B≠0`, excluding derived complete flatness without the comparison hypotheses.
- The nilpotent theorem and the finite-presentation nilideal theorem have different hypotheses; neither is obtained from formal smoothness by dropping those hypotheses.

**Proof route.** Integral injective monoid maps give flat monoid algebra maps and flat ordinary reductions after completion and étale localization. Use DerivedModuleAlgebra §§1.7–1.9 and the stated completion comparison to pass to derived complete flatness. The group quotient computes logarithmic differentials, and its torsion vanishes after tensoring with `O_X`, leaving finite free modules.

### 8.0c Completed logarithmic cotangent sheaves

Construct the completed log cotangent complex for maps of bounded integral log `J`-adic formal schemes by étale descent of the derived `J`-completion of DerivedDeRhamCohomology §6.20 and CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18's affine Gabber log cotangent complex. Retain its universal `d` and `dlog`. It has the completed transitivity triangle, derived base change and logification invariance in the supplier's ranges. For integral smooth charts of §8.0b it is `Ω¹_log` in degree zero, finite locally free; its derived exterior powers are the completed ordinary `Ω^i_log`. Integral étale charts give zero. A nonintegral Kato-étale map is not included in this degree-zero/vanishing assertion.

Also prove the following discrete deformation statement without a finite-presentation assumption: if `L_log(B/A)=0` for a map of discrete integral log rings, maps from `B` lift uniquely across strict square-zero extensions of discrete integral log rings over `A`. Iterate for nilpotent extensions; take limits only for compatible complete rings and log structures. This is the formal lifting statement, with no assertion that the morphism is of finite presentation. Applied levelwise to `(A_inf(R),M^♭)^a` and then to the complete `(p,I)`-tower, it supplies the lifting step of KY Lemma 2.40.

(KY, Definition 2.5, Lemmas 2.9–2.10 and Theorem 2.11 with Remark 2.12, pp.13–15; Remark 2.13, pp.15–16; Lemma 2.40, pp.21–22; SSV, Theorem 4.17 and Remark 4.18, pp.19–21, and the proof of Theorem 5.6, pp.23–24. The formal lifting implication uses that proof; the theorem's additional finiteness hypotheses are needed for its finite-presentation conclusion.)

*Needs:* §8.0b, DerivedDeRhamCohomology §6.20 (`gabberLogCotangent`), DerivedDeRhamCohomology §6.20 (`logCotangentFunctoriality`), CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.3.1, DerivedDeRhamCohomology §6.20 (`freePrelogResolutions`), DerivedModuleAlgebra §§1.2–1.5, EnhancedDerivedSheaves §E1.3, SchemeAndStackFoundations Layer 4.

- The affine-to-formal sheaf and its étale base-change maps, independent of chart and compatible with logification.
- The completed triangle and derived base change, replacing ordinary pushouts only in the supplied homologically log-flat range.
- The degree-zero smooth calculation and exterior-power identification.
- The unique discrete strict square-zero and nilpotent lifting statements, with the complete-tower version under completeness.

**Proof route.** Strict étale base change from DerivedDeRhamCohomology §6.20 and CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18 descends affine log cotangent complexes and derivations. On an integral smooth chart the toric pushout is a homotopy pushout, and the injective groupification map with invertible torsion gives `O_X⊗ᴸ_Z(P^gp/M^gp)`; strict étale extension contributes zero. Strict discrete square-zero extensions are classified by derivations into `J[1]`, so `L_log=0` makes the lifting fibre contractible, and compatible uniqueness handles the complete tower (SSV Theorem 4.17 and Remark 4.18, pp.19–21; KY Theorem 2.11, pp.14–15).

**Checks.**

- For the completed free log coordinate `(A,0)→(A⟨x⟩,N)`, the result is `R·dlog x` in degree zero with `dx=x dlog x`.
- For `(k,0)→(k,N→0)`, the full complex retains its degree `−1` term; formal completion cannot remove the log point's derived cotangent term.
- The nonintegral log-étale chart of KY Remark 2.13 is excluded from the degree-zero smooth calculation; its unbounded Gabber homology is preserved.
- If the complex vanishes, the space of lifts across a strict square-zero extension has one component and no automorphism ambiguity. Merely requiring `H⁰L_log=0` does not suffice.

### 8.0d Completed log PD envelopes and the big formal site

Construct the completed log PD envelope for an exactified closed embedding `Spf(R,P)^a→Spf(B,N)^a` over a p-adic log PD base: first use CrystallineCohomology Layer CR.5's integral log exactification and DerivedDeRhamCohomology §PD.6's ordinary compatible PD envelope, then p-complete its ring and logify the chart. Its universal property is among classically p-complete log PD thickenings with continuous maps and compatible base divided powers. The embedding ideal is p-closed, the quotient is `R` when `R` is already classically p-complete, and each divided-power operation is continuous. Require the divided powers on the embedding ideal and on the base ideal to extend jointly; the image of the base ideal is not required to lie in the embedding ideal for a general mixed-characteristic object. No assertion of p-torsion-freeness is made for an arbitrary PD envelope.

Construct the big formal log crystalline site with objects `(B,J,M_B)^a, B` and `B/J` classically p-complete, integral quasi-coherent log structure, a map `Spf(B/J)→X` and an exact closed immersion into `Spf B` over the base. Each object also carries continuous divided powers on the p-closed ideal `J`, extending jointly with the prescribed base divided powers; the base PD ideal need not map into `J`. Morphisms preserve the divided powers as well as the ring and log data. Take ordinary étale coverings and the sheaf `B`. There is no delta structure and no p-torsion-freeness condition on `B`. For a p-torsion-free base `A` with a compatible PD ideal `I` and `X` smooth over `(A/I,M_A)`, prove the local completed log PD-envelope Čech computation and independence of presentations. If `p∈I`, comparison with the small characteristic-p sites modulo `p^m` and their derived inverse limit gives the usual p-adic log crystalline cohomology. For general formal `X` the corresponding reductions are `X_m`; one does not identify a mixed-characteristic `X` with a fixed characteristic-p scheme.

(K1, Remark 6.6, pp.32–33, Remark 6.7 and Proposition 6.8 with its proof, pp.33–34; Remark 6.9, p.34. The ordinary finite-level PD envelopes and log PD de Rham computation are CrystallineCohomology §CR.5.2, CrystallineCohomology §CR.5.4, CrystallineCohomology §CR.5.4 and CrystallineCohomology §CR.5.4; the completion and big-site adapters are the targets here.)

*Needs:* §8.0b, §8.0a, DerivedDeRhamCohomology §PD.6, CrystallineCohomology §CR.5.2, CrystallineCohomology §CR.5.3, CrystallineCohomology §CR.5.4, [PrismaticCohomology §0.71](../PrismaticCohomology/README.md#s0-71), EnhancedDerivedSheaves Layer E2, EnhancedDerivedSheaves Layer E3.

- The continuous PD/log universal property and its uniqueness, compatible with exactification and étale localization.
- Comparison with the compatible finite-level envelopes, with derived reduction asserted only in the complete-flat setting used below.
- The site, its ring sheaf and the morphism to `X_ét`, allowing p-torsion in objects.
- For smooth `X` over the stated p-torsion-free base, an exactified completed free prelog presentation and its completed PD-envelope nerve compute derived sections; unions of presentations give the comparison coherences.
- The characteristic-p small/big and inverse-limit comparison; derived tensor with `A/p^m` is used in the reduction statement.
- If `p∈I` and a surjection from a p-completely smooth delta-log algebra of topologically finite presentation is chosen as in K1 Remark 6.9, its envelope is PD smooth at every finite level, and its log PD de Rham complex and its Čech nerve compute the same cohomology, functorially for Frobenius maps.

**Proof route.** Extend maps from the ordinary envelope by p-completion; for fixed `r`, PD identities bound the continuity loss of `γ_r` by `v_p(r!)`, extending operations to the closed ideal. Surjectivity of the ambient map identifies the quotient, and finite-level exactification plus the PD universal property give reduction maps. Use an ordinary quotient only under the stated torsion hypotheses, rather than replacing derived tensor without justification (K1 Remarks 6.6–6.7 and Proposition 6.8, pp.32–34; DerivedDeRhamCohomology §PD.6).

**Proof route.** Choose a completed free prelog presentation, exactify, and express the extra units as a filtered union of finite-rank free groups; regular-envelope flatness makes these envelope terms p-completely flat, hence p-torsion-free over the stipulated base, and their local lifting property gives Čech descent. On a topologically finitely presented smooth ambient, the nilideal lifting theorem supplies PD smoothness, so finite-level log PD Poincaré and embedding descent compute the same object. Take the compatible derived inverse limit, using `A/p^m` perfect over p-regular A for the projection formula and universal PD/log maps for Frobenius compatibility (K1 Proposition 3.9, pp.17–18; Remark 6.9, p.34).

**Checks.**

- Trivial monoids recover the ordinary p-completed compatible PD envelope with its continuous universal property.
- The envelope of the identity `R=B` with zero embedding ideal is `B`, with the prescribed base PD structure; a nonzero base PD ideal is not thereby forced into the zero embedding ideal.
- An arbitrary PD envelope is allowed to have p-torsion. Complete-flatness hypotheses are required before using derived reduction as ordinary reduction.
- A finite-level PD thickening with p-torsion is an object of the ordinary big site but need not be an object of the delta-log crystalline site.
- When `p∈I`, reduction modulo `p^m` and the limit use the same `X`; otherwise the system is `X_m`, so the two statements cannot be interchanged.
- With trivial logs, `(ℤ_p[[t]],(t))` without PD data is not an object: `γ_p(t)=t^p/p` does not belong to this ring. The completed compatible PD envelope supplies the required object instead.
- The PD de Rham theorem uses a topologically finitely presented smooth ambient and its nilideal lifting property. A weakly finitely generated target chart is not itself declared to have that stronger lifting property.

### 8.1 `δ_log`-rings

Fix a prime `p`. A `δ_log`-ring is a tuple (`A, δ, α: M → A, δ_log: M → A`) where `(A, δ)` is a `δ`-ring (a `ℤ_(p)`-algebra with a p-derivation), `(A, α)` is a prelog ring (`M` a commutative monoid, `α` a map to the multiplicative monoid of `A`), and `δ_log: M → A` is a map of sets satisfying (1) `δ_log(e) = 0` for the unit `e` of `M`; (2) `α(m)^p·δ_log(m) = δ(α(m))` for every `m ∈ M`; (3) `δ_log(mm′) = δ_log(m) + δ_log(m′) + p·δ_log(m)·δ_log(m′)` for all `m, m′ ∈ M`. A morphism `(A, M) → (B, N)` of `δ_log`-rings is a morphism of prelog rings (a ring map `f` and a monoid map `h` with `α_N∘h = f∘α_M`) commuting with `δ` and with `δ_log (δ_log∘h = f∘δ_log)`. A `δ_log`-ring is of rank 1 if `δ_log = 0`. Equivalently (Remark 2.5) a `δ_log`-structure is a monoid map `w_log: M → W_2(A), m ↦ (1, δ_log(m))`, with `w(α(m)) = (α(m), 0)·w_log(m)` for the `δ`-section `w(x) = (x, δ(x))`.

All rings are `ℤ_(p)`-algebras (Koshikawa's standing convention in §2). `M` is an arbitrary commutative monoid (written multiplicatively); no integrality is imposed in the definition. The `δ`-ring axioms are those of PrismaticCohomology Layer 0, imported, not restated.

(K1, §2, Definition 2.2 (p. 6–7); K1, §2, Remark 2.5 (p. 8).)

*Needs:* [PrismaticCohomology §0.3](../PrismaticCohomology/README.md#s0-3), Mathlib `MonoidAlgebra`, Mathlib `WittVector.teichmuller`, CrystallineCohomology §CR.5:log-algebra.1, Mathlib `TruncatedWittVector.mk`.

- From a `δ`-structure `δ` on `A`, a prelog structure `α: M → A` and `δ_log: M → A` satisfying (1)–(3), a `δ_log`-ring.
- `φ(α(m)) = α(m)^p·(1 + p·δ_log(m))` for every `m ∈ M`, where `φ(x) = x^p + pδ(x)`.
- The correction factor `m ↦ 1 + p·δ_log(m)`.
- The map `m ↦ 1 + p·δ_log(m)` is a monoid map `M → (A, ·)`.
- `φ^n(α(m)) ∈ α(m)^{p^n}·(1 + pA)` for all `n ≥ 0`.
- If `α(M) ⊂ A` consists of nonzerodivisors, two `δ_log`-structures on `(A, δ, α)` coincide.
- If `α(M)` consists of nonzerodivisors, a `δ_log`-structure exists iff `α(m)^p` divides `δ(α(m))` for every `m`. No p-torsion-freeness is needed: the product rule for `δ` and cancellation of `α(mm′)^p` give axiom (3).
- `δ_log`-structures on `(A, δ, α)` correspond bijectively to monoid maps `w_log: M → W_2(A)` of the form `m ↦ (1, δ_log(m))` with `w(α(m)) = (α(m), 0)·w_log(m)`.
- Morphisms of `δ_log`-rings: prelog ring maps commuting with `δ` and `δ_log`; identity and composition.
- The predicate `δ_log = 0`; rank-1 `δ_log`-rings satisfy `φ(α(m)) = α(m)^p`.
- If `δ` vanishes on `α(M)`, then `δ_log = 0` is a `δ_log`-structure, of rank 1; the monoid-algebra, Teichmüller and Breuil–Kisin charts are instances.
- On any `δ`-ring `A` the units `A^× ⊂ A` carry the unique `δ_log`-structure `δ_log(x) = δ(x)·x^{-p}`.
- `(ℤ_(p)[M], M)` with the `δ`-structure whose Frobenius is `m ↦ m^p` is a `δ_log`-ring of rank 1.
- For a `δ_log`-ring `(A, M)` and a `δ`-ring map `A → B, (B, M)` with the composite `α` and `δ_log` is a `δ_log`-ring (K1 Example 2.4(4)).
- Two `δ_log`-ring structures on fixed `A` and `M` are equal if their `δ`-structures, prelog maps `α`, and maps `δ_log` are equal.
- Two morphisms of `δ_log`-rings are equal if their underlying ring maps and monoid maps are equal.

**Checks.**

- On `ℤ_(p)` with its unique `δ`-structure and the trivial log structure `ℤ_(p)^×, δ_log(1 + p) = δ(1 + p)/(1 + p)^p` with `δ(1+p) = (1 + p − (1 + p)^p)/p`.
- With `M` the trivial monoid `{e}, δ_log`-structures on `(A, δ, α)` are unique `(δ_log(e) = 0)` and every `δ`-ring is a `δ_log`-ring of rank 1.
- On `ℤ_(p)[N] = ℤ_(p)[x]` with `α(1) = x` and `φ(x) = x^p, δ_log(1) = 0` and `δ(x) = 0`, agreeing with PrismaticCohomology Layer 0's `δ`-structure of the monoid algebra.
- On `ℤ_(p)[x]` with `δ(x) = 1 (φ(x) = x^p + p)` and `α(1) = x`, there is no `δ_log`-structure, since `x^p` does not divide `δ(x) = 1`: a `δ_log`-structure is not determined by an arbitrary choice of `δ_log` values.
- At `p=2`, take `A=ℤ, M=N, alpha(0)=1` and `alpha(n)=0` for `n>0`, with `deltaLog(n)=(3^n−1)/2`. The quotient is integral and `deltaLog(n+m)=deltaLog(n)+deltaLog(m)+2deltaLog(n)deltaLog(m)`. Thus `deltaLog(1)=1, deltaLog(2)=4` and `1+2deltaLog(1)=3`. This structure is not of rank one and extends to `ℤ_(2)`, giving the same zero-chart witness over a p-local ring.
- In any `δ_log`-ring, `φ(α(m)) − α(m)^p = p·α(m)^p·δ_log(m)`; for `A = ℤ_(p)[x, y_0, y_1, …]` with `α(1) = x` and `δ_log(1) = y_0` free, `φ(x) = x^p(1 + p y_0)`.

**Proof route.** Define the structure as the data `(δ, α, δ_log)` with axioms (1)–(3) on top of PrismaticCohomology Layer 0's `δ`-structure and CrystallineCohomology Layer CR.5's prelog ring. Derive from (2) and (3) that `φ(α(m)) = α(m)^p·(1 + p·δ_log(m))` and that `m ↦ 1 + p·δ_log(m)` is multiplicative (K1, after Definition 2.2).

### 8.2 The monoid Frobenius of a `δ_log` log ring

Let `(A, α: M → A, δ_log)` be a `δ_log`-ring such that `(A, M)` is a log ring `(α^{-1}(A^×) ≅ A^×)` and `p` lies in the Jacobson radical of `A`. Then `1 + pδ_log(m) ∈ A^×` for all `m`, and `φ_M(m) := m^p·α^{-1}(1 + pδ_log(m))` defines a monoid endomorphism of `M` with `α∘φ_M = φ_A∘α`, so `(φ_A, φ_M)` is an endomorphism of the log ring `(A, M)`. If the `δ_log`-ring is of rank 1 the p-th power map of `M` lifts `φ_A` for any prelog ring.

`(A, M)` is a log ring; `p ∈ rad(A)` (for instance `A` classically p-complete). For rank-1 `δ_log`-rings no log-ring hypothesis is needed.

(K1, §2, Remark 2.3 (p. 7).)

*Needs:* §8.1, Mathlib `Ideal.jacobson`, CrystallineCohomology §CR.5:log-algebra.1.

- For a `δ_log` log ring with `p ∈ rad(A)`, the monoid endomorphism `φ_M(m) = m^p·α^{-1}(1 + pδ_log(m))`.
- `α(φ_M(m)) = φ_A(α(m))`.
- If `δ_log = 0` then `φ_M(m) = m^p`.
- On `M^× = A^×` the map `φ_M` is the restriction of `φ_A`.
- A morphism of `δ_log` log rings commutes with `φ_M`.
- For a rank-one prelog delta-log ring, the p-th power map of `M` is the chosen monoid Frobenius lift. No log-ring or Jacobson-radical hypothesis is needed for this lift.
- For rank-one `D, alpha(m^p)=phi_A(alpha(m))`; for the Breuil–Kisin `N` chart this is the lift `n↦pn` before logification.

**Checks.**

- For the rank-one Breuil–Kisin prelog chart `(ℤ_p[[u]], N, n↦u^n)`, the chosen p-th-power monoid lift sends `n` to `pn` for every `n`, and `alpha(phi_M(n))=phi_A(u^n)`. Use this rank-one prelog lift; the `N` chart is not assumed to satisfy the log-ring condition required by the monoid Frobenius above.
- For the trivial log structure `A^× → A, φ_M(x) = φ_A(x)` for every unit `x`.
- In the log ring associated with the p-completed free `δ_log`-ring `(ℤ_p⟨x, y_0, y_1, …⟩, x^N) (δ_log(x) = y_0), φ_M(x) = x^p·(1 + p·y_0)` with `1 + p·y_0 ≠ 1` a unit, so `φ_M` is not the p-th power map of the monoid.

**Proof route.** Since `p ∈ rad(A), 1 + pδ_log(m)` is a unit; as `(A, M)` is a log ring it has a unique preimage in `M^× ⊂ M`. Multiplicativity of `φ_M` follows from axiom (3) of `δ_log`-rings and multiplicativity of `α^{-1}` on `A^×`. `α(φ_M(m)) = α(m)^p(1 + pδ_log(m)) = φ_A(α(m))` by axiom (2).

### 8.3–8.6 Logification, free constructions and exactification

**§8.3 Limits, colimits and free `δ_log`-rings.**

The category of `δ_log`-rings has all limits and colimits, computed on underlying rings and monoids; the forgetful functors to prelog rings and to pairs (ring, monoid) have left adjoints that are the identity on the monoid part, and the forgetful functor to prelog rings has a right adjoint. For a `δ_log`-ring `(A, M_A)` and a monoid `M, (A{M}_δlog, M_A ⊕ M)` denotes the `δ_log`-ring freely obtained from the prelog ring `(A[M], M_A ⊕ M)`. The free `δ_log`-ring on one log generator, `ℤ_(p){x}_δlog`, is the polynomial ring `ℤ_(p)[x, δ_log(x), δ(δ_log(x)), δ^2(δ_log(x)), …]` with prelog structure `x^N`, and its Frobenius is faithfully flat; `ℤ_(p){x}_δlog[1/p]` is the polynomial ring on `x, φ(x)/x^p, φ(φ(x)/x^p), …`; and `(ℤ_(p){x}_δlog[x^{-1}], x^Z) → (ℤ_(p){x^{±1}}_δlog, x^Z)` becomes an isomorphism after classical p-completion.

(K1, §2, Lemma 2.11 (p. 9); K1, §2, Remark 2.6 (p. 8); K1, §2, Notation 2.7 (p. 8).)

- For a `δ_log`-ring `(A, M_A)` and a monoid `M`, the `δ_log`-ring `(A{M}_δlog, M_A ⊕ M)` with its prelog-ring map from `(A[M], M_A ⊕ M)`.
- `δ_log`-maps `(A{M}_δlog, M_A ⊕ M) → (B, N)` over `(A, M_A)` correspond to monoid maps `M → N` compatible with prelog structures (lift ∘ canonical `=` given map, and uniqueness).
- `ℤ_(p){x}_δlog ≅ ℤ_(p)[x, y_0, y_1, …]` with `y_0 = δ_log(x), y_{i+1} = δ(y_i)`.
- `φ` on `ℤ_(p){x}_δlog` is faithfully flat.
- The category of `δ_log`-rings has all small limits and colimits, preserved by the forgetful functor to (ring, monoid) pairs.
- `(ℤ_(p){x}_δlog[x^{-1}], x^Z) → (ℤ_(p){x^{±1}}_δlog, x^Z)` is an isomorphism after classical p-completion.
- For a delta-log `ℤ_(p)`-algebra (B,N) and `m∈N`, evaluate the free model `x↦alpha(m), y_0↦delta_log(m), y_(i+1)↦delta(y_i)`, with the canonical coefficient map and generator `1∈N` mapping to `m`.
- A delta-log map from the one-generator free model is uniquely determined by its value on the monoid generator and its coefficient algebra map; it equals the evaluation lift.

**Checks.**

- In `ℤ_(p){x}_δlog, φ(x) = x^p(1 + p·δ_log(x))` and `φ(δ_log(x)) = δ_log(x)^p + p·δ(δ_log(x))`.
- For `M` the trivial monoid, `(A{M}_δlog, M_A ⊕ M) = (A, M_A)`.
- `ℤ_(p){x}_δlog` is not `ℤ_(p)[x]`: the element `δ_log(x)` is algebraically independent of `x`, so the rank-1 algebra `ℤ_(p)[x]` is a proper quotient.
- For `M = N[1/p]` and a classically p-complete `δ_log`-ring `(A, M), δ(α(m)) = 0` for all `m` (K1 Example 2.10).

*Needs:* §8.1; PrismaticCohomology §0.6 and Layer 0 (free delta rings and Witt adjoints); Mathlib `MvPolynomial`.

**§8.4 `δ_log`-structures pass to completions and completely étale extensions.**

Prove completion (1) and completely étale extension (2) of `δ_log`-structures. Let `(A, M)` be a `δ_log`-ring and `I ⊂ A` a finitely generated ideal containing `p`. (1) The classical `I`-adic completion `A^∧_cl` with the composite prelog structure `M → A → A^∧_cl` carries a unique `δ_log`-structure making `A → A^∧_cl` a map of `δ_log`-rings. (2) If `A → B` is `I`-completely étale, then `(B, M)` carries a unique `δ_log`-structure compatible with `(A, M)`.

`I` is finitely generated and `p ∈ I`. In (2), `A → B` is `I`-completely étale in the sense of BS22.

(K1, §2, Lemma 2.9 (p. 8–9); K1, §2, Lemma 2.13 (p. 10).)

*Needs:* §8.1; PrismaticCohomology §0.39 (completion) and §0.28 (completely étale extension).

**§8.5 `δ_log`-structures on associated log structures.**

Prove the associated-log (1) and étale-local (2) extensions of `δ_log`-structures. (1) Let `(A, M)` be a `δ_log`-ring and `N := M ⊔_{α^{-1}(A^×)} A^×` the pushout of monoids. There is a unique `δ_log`-structure on the prelog ring `(A, N)` compatible with that of `(A, M)`. (2) If moreover `A` is classically `I`-complete for a finitely generated ideal `I ∋ p`, then for every affine `U = Spf(B)` étale over `Spf(A)`, the log ring `(B, Γ(U, M^a))` of the associated log structure `M^a` on `Spf(A)_ét` carries a unique `δ_log`-structure compatible with `(A, M)` and with étale localisation. Hence `δ_log`-structures make sense on log structures (on the étale site of `Spf(A)`).

(2): `A` classically `I`-complete, `I` finitely generated, `p ∈ I`.

(K1, §2, Proposition 2.14 (p. 10); K1, §2, Corollary 2.15 (p. 10).)

*Needs:* §§8.1, 8.4, 8.0a; CrystallineCohomology Layer CR.5:log-algebra (logification and sheaf descent).

**§8.6 Extension of `δ_log` along `M ⊂ N ⊂ M^gp`.**

Prove groupification (1), extension (2) and its universal property (3) for `δ_log`-structures. Let `(A, M, α)` be a `δ_log`-ring with `M` integral and `p ∈ rad(A)`. (1) There is a unique map `δ_log: M^gp → A` extending the given `δ_log` on `M` and satisfying `δ_log(mm′) = δ_log(m) + δ_log(m′) + pδ_log(m)δ_log(m′)` on `M^gp`, namely `δ_log(m′/m) = (δ_log(m′) − δ_log(m))/(1 + pδ_log(m))`. (2) For submonoid `N ⊂ M^gp` containing `M` there is a unique `δ`-structure on `A ⊗_{ℤ_(p)[M]} ℤ_(p)[N]` making `(A ⊗_{ℤ_(p)[M]} ℤ_(p)[N], N)` a `δ_log`-ring over `(A, M)` with this `δ_log`. (3) The map `(A, M) → (A ⊗_{ℤ_(p)[M]} ℤ_(p)[N], N)` is universal among maps of `δ_log`-rings `(A, M) → (B, N)` compatible with `M ⊂ N`, and its formation commutes with base change `A → A′`.

`M` integral; `p` in the Jacobson radical of `A`; `N` a submonoid of `M^gp` containing `M`.

(K1, §2, Proposition 2.16 (p. 11); K1, §2, Proposition 2.16 (p. 11); K1, §1, `p`. 5.)

**Proof route.** (1): define `δ_log` on fractions by the displayed formula; check independence of representatives and the cocycle identity using integrality of `M` and invertibility of `1 + pδ_log(m)`.

*Needs:* §§8.1–8.3; CrystallineCohomology §CR.5:log-algebra.1; Mathlib `Algebra.GrothendieckGroup`, `TensorProduct`; PrismaticCohomology Layer 0 (delta localization).

### 8.7 Exactification of `δ_log`-triples

Let `(A, I, M)` be a `δ_log`-triple (a `δ_log`-ring with an ideal `I`) with `A` classically p-complete, `(A/I, N)` a prelog ring and `(A, M) → (A/I, N)` a surjective map of prelog rings with `M` and `N` integral. Let `h: M → N`, h̄: `M → N/N^×` and `M′ := (h^gp)^{-1}(N) = (h̄^gp)^{-1}(N/N^×) ⊂ M^gp`; `M′` is generated by `M` and `(h̄^gp)^{-1}(e)`. The exactification is the `δ_log`-triple `(A′, I′, M′)` with `A′ := A ⊗_{ℤ_(p)[M]} ℤ_(p)[M′]` (with the `δ_log`-structure of Proposition 2.16), the induced exact surjection `(A′, M′) → (A/I, N)`, and `I′ := ker(A′ → A/I)`. The construction is functorial and the formation of `(A′, M′)` commutes with base change on `A`. If `(A, M) → (A/I, N)` lives over `(B, M_B)` with `M_B → N` integral, then `M_B → M′` is integral.

`A` classically p-complete; `M, N` integral; `(A, M) → (A/I, N)` surjective on rings and monoids.

(K1, §2, Construction 2.17 (p. 12); K1, §2, Remark 2.18 (p. 13); OgusDraft, `I`, Proposition 4.3.17(1), pp. 92–93.)

*Needs:* §8.0a, §8.6, CrystallineCohomology Layer CR.5:log-algebra.

- The `δ_log`-triple `(A′, I′, M′)` with `A′ = A ⊗_{ℤ_(p)[M]} ℤ_(p)[(h^gp)^{-1}(N)]`.
- `(A′, M′) → (A/I, N)` is surjective and `M′/M′^× ≅ N/N^×`.
- Every map of `δ_log`-triples `(A, I, M) → (B, J, M_B)` whose target surjects exactly onto `(A/I, N)` compatibly factors uniquely through `(A′, I′, M′)`.
- For `A → A″` the exactification of the base change is the base change of `(A′, M′)`.
- If `M_B → N` is integral for a base `(B, M_B)`, then the induced `M_B → M′` is integral.

**Checks.**

- If `(A, M) → (A/I, N)` is already exact surjective then `(A′, I′, M′) = (A, I, M)`.
- For `(ℤ_p⟨X_0, X_1⟩, X_0^N X_1^N) → (ℤ_p⟨X_0⟩, X_0^N)` sending both generators to `X_0, M′ = X_0^N·(X_1/X_0)^Z` and `A′ = ℤ_p⟨X_0, X_1⟩[T,T^{-1}]/(X_0T − X_1)`. This exactification is algebraic; completion is a separate step in the envelope construction.
- The exactification is not the kernel-ideal construction on `A` alone: for the diagonal example the ring changes (`X_1/X_0` is adjoined), so the prismatic envelope of `A → A/I` without exactification is the wrong object.
- For integral `M` and `N`, the exactification monoid is exactly `(h^gp)^{-1}(N) ⊂ M^gp: x` lies in `M′` iff `h^gp(x)` lies in the image of `N → N^gp`, using Mathlib’s Algebra.GrothendieckGroup. This is the carrier used by CrystallineCohomology Layer CR.5’s monoid exactification.

**Proof route.** `M′` is the monoid exactification of `h` (owned by CrystallineCohomology Layer C`R`.5's log algebra); `A′` is the induced ring. Apply Extension of `δ_log` along `M ⊂ N ⊂ M^gp` to `(A, M)` and `M ⊂ M′ ⊂ M^gp` (`p ∈ rad(A)` by p-completeness).

### 8.8 Prelog prisms

A prelog prism is a `δ_log`-triple `(A, I, M)` (a `δ_log`-ring `(A, M)` with an ideal `I`) such that `(A, I)` is a prism in the sense of BS22 (`I` defines a Cartier divisor, `A` is derived `(p, I)`-complete, `p ∈ I + φ(I)A`). It is bounded if `(A, I)` is bounded (`A/I` has bounded `p^∞`-torsion), and of rank 1 if `δ_log = 0`. Maps of prelog prisms are maps of `δ_log`-triples (maps of `δ_log`-rings carrying `I` into `J`). Rigidity: if `(A, I, M)` is a prelog prism and `A → B` a map of `δ`-rings with `B (p, I)`-complete, then `(B, IB, M)` is a prelog prism iff `B[I] = 0`; this holds when `(A, I)` is bounded and `B` is `(p, I)`-completely flat over `A`.

The prism conditions are PrismaticCohomology Layer 0's. No condition on the monoid `M` (integrality is imposed where needed).

(K1, §3, Definition 3.3 (p. 14); K1, §3, after Example 3.4 (p. 14).)

*Needs:* §8.1, PrismaticCohomology Layer 0.

- From a `δ_log`-ring `(A, M)` and an ideal `I` with `(A, I)` a prism, a prelog prism.
- The underlying prism `(A, I)`.
- Boundedness of the underlying prism.
- `δ_log = 0`.
- If `(A, I)` is bounded and `A → B` is a `(p, I)`-completely flat `δ`-map with `B (p, I)`-complete, then `(B, IB, M)` is a prelog prism.
- For a `δ`-map `A → B` with `B (p, I)`-complete, `(B, IB, M)` is a prelog prism iff `B[I] = 0`.

**Checks.**

- `(ℤ_p, (p), N → ℤ_p, 1 ↦ 0)` is a bounded prelog prism of rank 1.
- With `M = {e}`, prelog prisms are exactly prisms.
- `(ℤ_p[x], (x), x^N)` with `δ(x) = 0` is a `δ_log`-triple of rank 1 that is not a prelog prism: `x` is not distinguished and `ℤ_p[x]` is not `(p, x)`-complete.
- The forgetful functor to prisms sends `(W(k), (p), N → 0)` to PrismaticCohomology Layer 0's crystalline prism `(W(k), (p))`.

**Proof route.** Define as the full subcategory of `δ_log`-triples whose underlying `δ-pair` is a prism. Rigidity: the condition only involves the underlying `δ-pair`, so BS Lemma 3.5 and Lemma 3.7(3) (PrismaticCohomology Layer 0) apply.

### 8.9 Log prisms

Let `(A, I, M)` be a bounded prelog prism. Then `Spf(A)` (with the `(p, I)`-adic topology; `A` is classically `(p, I)`-complete) carries the associated log structure `M^a_{Spf(A)}` with its `δ_log`-structure (Corollary 2.15). A log prism is a triple `(A, I, M_{Spf(A)})` of a bounded prism `(A, I)` and a log structure on `Spf(A)` with a `δ_log`-structure arising from some bounded prelog prism; `(A, I, M)^a` denotes the associated log prism. A map of log prisms is a map of log formal schemes inducing a map of prisms and preserving `δ_log`. Conversely `(A, I, Γ(Spf(A), M_{Spf(A)}))` is a prelog prism. A map of bounded prelog prisms `(A, I, M_A) → (B, J, Γ(Spf(B), M_{Spf(B)}))` induces a unique map of log prisms `(A, I, M_A)^a → (B, J, M_{Spf(B)})`. In the convention of Koshikawa–Yao, a ''log prism'' (in quotation marks) is a bounded prelog prism whose `(A, M_A)` is a log ring; for `(A, M_A)` a log ring with `A` classically p-complete the `δ_log`-structure induces the Frobenius lift `φ(m) = m^p(1 + pδ_log(m))`.

Bounded prelog prism; `A` classically `(p, I)`-complete (BS Lemma 3.7).

(K1, §3, Definition 3.3 (p. 14); KY, §2.3, Convention 2.34 (p. 21).)

*Needs:* §8.8, §8.5, CrystallineCohomology Layer CR.5:log-algebra.

- The associated log prism `(A, I, M)^a` of a bounded prelog prism.
- The prelog prism `(A, I, Γ(Spf(A), M_{Spf(A)}))`.
- Maps of prelog prisms `(A, I, M_A) → (B, J, Γ(Spf(B), M))` correspond bijectively to maps of log prisms `(A, I, M_A)^a → (B, J, M)`.
- For a log prism the Frobenius lift `(φ_A, φ_M)` of the log formal scheme `Spf(A)` (from The monoid Frobenius of a `δ_log` log ring).
- The log structure is integral.
- Any bounded prism with the trivial log structure `O^×`.

**Checks.**

- For the trivial log structure the Frobenius of the log prism is `φ_A`.
- The associated log structure of `(W(k)[[u]], (E(u)), N → u^n)` on `Spf(W(k)[[u]])` has characteristic monoid `M/O^× ≅ N`, generated by `u`.
- `(B, J, Γ(Spf(B), M))^a → (B, J, M)` need not be an isomorphism (K1 Remark 3.5): a log prism is not the same as a prelog prism on global sections.
- Forgetting the log structure sends log prisms to PrismaticCohomology Layer 0's bounded prisms, and the trivial log prism functor is a section.

**Proof route.** Use `δ_log`-structures on associated log structures on the étale site of `Spf(A)` to put a `δ_log`-structure on `M^a`. Maps from prelog prisms: by rigidity `J = IB`; the constant prelog structure `M_A` maps to `M_{Spf(B)}` compatibly with `δ_log`, inducing a map of associated log structures (K1 Remark 3.5).

### 8.10 The standard prelog prisms

The following are bounded prelog prisms: (1) for a bounded prism `(A, I)`, the trivial log structure `(A, I, O^×)`, and separately the rank-1 zero chart `(A, I, N → A, 1 ↦ 0)`; (2) for a perfect prism `(A, I) = (W(R♭), ker θ)` with `R` perfectoid, `(W(R♭), ker θ, R♭)` with the Teichmüller prelog structure, of rank 1, and for `R♭` a domain `(A_inf, (ξ), O_C♭∖{0})`; (3) the crystalline prelog prism `(W(k), (p), N → W(k), 1 ↦ 0)` of rank 1 (Hyodo–Kato base); (4) for `K/W(k)[1/p]` totally ramified with uniformiser `π` and Eisenstein polynomial `E(u)`, the Breuil–Kisin prelog prism `(W(k)[[u]], (E(u)), N → W(k)[[u]], n ↦ u^n)` with `δ_log = 0` and `φ(u) = u^p`. These are related by the maps of prelog prisms `W(k)[[u]] → W(k)` (u `↦` 0, identity on `N`) and `W(k)[[u]] → A_inf (u ↦ [π♭], 1 ↦ π♭)`.

`k` a perfect field of characteristic `p`; `O_K` totally ramified over `W(k)` with uniformiser `π`; `C` the completed algebraic closure; `π♭` a compatible system of p-power roots.

(K1, §3, Example 3.4(4) (p. 14); K1, §3, Example 3.4(3) (p. 14); K1, §1, Example 1.3 (p. 2–3).)

*Needs:* §8.8, PrismaticCohomology Layer 0, AInfCohomology Layer AI.0, Mathlib `WittVector.teichmuller`, Mathlib `PowerSeries`.

- The Breuil–Kisin prelog prism `(W(k)[[u]], (E(u)), N → u^n)` of rank 1.
- The prelog prism `(A_inf, ker θ, O_C♭∖{0})` with Teichmüller prelog structure, of rank 1.
- The prelog prism `(W(k), (p), N → W(k), 1 ↦ 0)`.
- The map of prelog prisms `u ↦ 0` from the Breuil–Kisin prelog prism to `(W(k), (p), N)`.
- The map of prelog prisms `u ↦ [π♭]` to `(A_inf, ker θ, O_C♭∖{0})`, with `N → O_C♭∖{0}, 1 ↦ π♭`.

**Checks.**

- In the Breuil–Kisin prelog prism `φ(u) = u^p` and `δ_log(1) = 0`, so `φ_M` is multiplication by `p` on `N`.
- Reducing the Breuil–Kisin prelog prism along `u ↦ 0` gives `(W(k), (p), N → 0)` since `E(0) = p·unit`.
- In `(A_inf, ker θ, O_C♭∖{0}), δ([x]) = 0` for all `x`, so `δ_log = 0` is forced (Lemma 2.1 of K1).
- With the Frobenius `φ(u) = u^p + p` on `W(k)[[u]], (W(k)[[u]], (E), N → u)` is not a `δ_log`-ring of rank 1, and no `δ_log` exists since `u^p` does not divide `δ(u) = 1`.

**Proof route.** Each underlying prism is a prism by the examples of PrismaticCohomology Layer 0. Each prelog structure has `δ(α(m)) = 0` (`α(m)` a Teichmüller element, 0 or `u` with `φ(u) = u^p`), so `δ_log = 0` is a `δ_log`-structure.

### 8.11–8.13 Prelog prismatic envelopes

**§8.11 Prelog prismatic envelopes.**

Fix an orientable prelog prism `(A, I, M_A)` with `M_A` integral. Let `(B, J, M_B)` be a `δ_log`-triple over `(A, I, M_A)` and `(B, M_B) → (B/J, N)` a surjection of prelog rings with `M_B, N` integral. There is a universal map `(B, J, M_B) → (B′, IB′, M_{B′})` of `δ_log`-triples over `(A, I, M_A)` to a prelog prism with an exact surjection `(B′, M_{B′}) → (B′/IB′, N)`; moreover `M_{B′}` is integral. It is called the prelog prismatic envelope.

`(A, I)` orientable; `M_A, M_B, N` integral; `(B, M_B) → (B/J, N)` surjective.

(K1, §3, Proposition 3.6 (p. 15); K1, §3, Proposition 3.6 proof (p. 15).)

- The prelog prismatic envelope `(B′, IB′, M_{B′})` of `(B, J, M_B) → (B/J, N)` over `(A, I, M_A)`.
- Maps of `δ_log`-triples from `(B, J, M_B)` to a prelog prism `(C, IC, M_C)` over `(A, I, M_A)` with an exact surjection `(C, M_C) → (C/IC, N)` compatible with `(B/J, N)` factor uniquely through the envelope.
- `(B′, M_{B′}) → (B′/IB′, N)` is exact surjective.
- `M_{B′}` is integral.
- For an exact surjection the envelope is PrismaticCohomology Layer 0's prismatic envelope of `(B, J)` with the monoid `M_B` unchanged.

**Checks.**

- The envelope of `(A, I, M_A) → (A/I, M_A)` itself is `(A, I, M_A)`.
- With all monoids trivial, the prelog prismatic envelope is the BS22 prismatic envelope.
- For `(A⟨X_0, X_1⟩, X_0^N X_1^N) → (A/I⟨X_0⟩, X_0^N)` the envelope is the completion of `A⟨X_0, X_1⟩{(I, X_1/X_0 − 1)/I}_δ` with monoid `X_0^N(X_1/X_0)^Z` (K1 §5.4).
- Without exactification the non-log prismatic envelope of `(A⟨X_0, X_1⟩, (I, X_1 − X_0))` gives the non-log Čech nerve, whose Hodge–Tate cohomology is ordinary `Ω`, not log `Ω`.

*Needs:* §§8.7–8.8; PrismaticCohomology Layer 0 (prismatic envelopes).

**§8.12 Universal property of log prismatic envelopes.**

Prove finality of the log prismatic envelope and its key lemma, the exact-surjective torsor property. In the situation of the prelog prismatic envelope, assume `(B′, IB′, M_{B′})` is bounded. Then `(B′, IB′, M_{B′})^a` with the exact closed immersion `(Spf(B′/IB′), N^a) ↪ (Spf(B′), M^a_{B′})` is final among commutative squares with top arrow an exact closed immersion `(Spf(C/IC), N^a) ↪ (Spf(C), M_{Spf(C)})` for log prisms `(C, IC, M_{Spf(C)})` with integral log structure over `(Spf(B/J), N^a) → (Spf(B), M^a_B)`. Key lemma: for such a log prism, with `N^a_{C/I} := Γ(Spf(C/IC), N^a)`, the map `(C, Γ(Spf(C), M_{Spf(C)})) → (C/IC, N^a_{C/I})` is exact surjective and a `(1 + IC)`-torsor on monoids.

`(A, I, M_A)` orientable with integral `M_A`; the prelog prismatic envelope is bounded.

(K1, §3, Proposition 3.7 (p. 15); K1, §3, Lemma 3.8 (p. 15–16).)

*Needs:* §§8.11, 8.9; CrystallineCohomology Layer CR.5:log-algebra (exact log immersions and unit torsors).

**§8.13 Flatness of prelog prismatic envelopes for smooth log algebras.**

Prove flatness of prelog prismatic envelopes (1) and its smooth-chart variant (2). Fix a bounded prelog prism `(A, I, M_A)` with `M_A` integral. (1) Let `(B_0, M_B)` be a prelog ring over `(A, M_A)` with `M_B` integral and `(B_0, M_B) → (B_0/J, N)` a surjection onto a p-completely smooth prelog ring over `(A/I, M_A)` (smooth in Koshikawa's Appendix A sense). Assume `M_A → N` is integral, `N` is weakly finitely generated over `M_A`, and (∗): `M_A → M_B` is injective and integral, `M_B^gp/M_A^gp` is free abelian, and `B_0` is `(p, I)`-completely free over the completion of `A ⊗_{ℤ_(p)[M_A]} ℤ_(p)[M_B]`. Let `(B, M_B)` be the `(p, I)`-completed free `δ_log`-ring over `(A, M_A)` generated by `(B_0, M_B)`. Then the prelog prismatic envelope `(B′, IB′, M_{B′})` of `(B, (JB)^∧, M_B)` exists, is `(p, I)`-completely flat over `A` (hence bounded), and its formation commutes with base change on `(A, I, M_A)` and with `(p, I)`-completely flat base change on `B_0`. (2) Variant: if `(B, M_B)` is a `(p, I)`-completely smooth `δ_log`-ring over `(A, M_A)` with `M_A → M_B` a smooth chart, `(B, M_B) → (R, P)` a surjection onto a p-completely smooth prelog ring over `(A/I, M_A)` with `M_A → P` integral, then the prelog prismatic envelope exists, is `(p, I)`-completely flat over `A` and commutes with base change on `(A, I, M_A)`.

smoothness in the sense of Koshikawa Appendix A (CR.5); hypotheses (∗) and weak finite generation in (1).

(K1, §3, Proposition 3.9 (p. 17); K1, §3, Proposition 3.11 (p. 18); K1, §3, before Proposition 3.9 (p. 16).)

**Proof route.** Replace `M_A` by `M_A′ =` inverse image of `N` in `M_A^gp` (flat base change, Proposition 2.16) so `M_A → N` is exact; the envelope does not change by universality.

### 8.14–8.17 Perfectoid monoids and perfect log prisms

*Needs:* §§8.11–8.12, 8.0b, 8.3; PrismaticCohomology Layer 0 (regular-envelope flatness and completion comparisons); CrystallineCohomology Layer CR.5:log-algebra.

**§8.14 Perfectoid monoids and perfectoid log rings.**

For a commutative monoid `M`, use Mathlib `Perfection M p` for its tilt `M♭`, with the projections and root maps in the exact supplier contracts. Define a monoid `M` to be *perfectoid* by bijectivity of the induced map `M♭/(M♭)^× → M/M^×`. Perfectness and pseudo-perfectoidness use the supplied predicates `PerfectRing M p` and `PerfectRing (Associates M) p`; Mathlib supplies unique p-divisibility of `M♭`. Prove that for `[PerfectRing M p]` the quotient `Associates M` is perfect. The inverse power automorphism preserves units and descends to associates, giving the inverse to the quotient power map. Apply this result to `M♭` to obtain unique p-divisibility of `M♭/(M♭)^×` (KY §2.3, p.16, and Definition 2.18, p.17). A pre-log ring `(R, M)` is perfectoid if `R` is a perfectoid ring (in the sense of BMS1) and `M` is perfectoid; then `(R, M♭) → (R, M)` induces an isomorphism of associated log rings, and the tilt `(R♭, M♭)` with `α♭(m_0, m_1, …) = (α(m_0), α(m_1), …)` and `A_inf(R) := (W(R♭), M♭ → W(R♭), m ↦ [α♭(m)])` are defined. An integral log ring `(R, M)` is a perfectoid log ring if it is perfectoid as a pre-log ring, equivalently `R` is perfectoid and `M/M^×` is uniquely p-divisible.

`p` fixed; `R` perfectoid in the sense of BMS1 (as used by PrismaticCohomology Layer 0).

(KY, §2.3, Definition 2.18 (p. 17); KY, §2.3, Definition 2.25 (p. 18); KY, §2.3, Construction 2.22 (p. 17).)

- `M♭/(M♭)^× → M/M^×` is bijective.
- Unique p-divisibility descends from a commutative monoid to its associates quotient.
- Perfect monoids are perfectoid.
- Perfectoid monoids are pseudo-perfectoid.
- For a perfectoid pre-log ring `(R, M)`, the pre-log ring `(R♭, M♭, α♭)`.
- `A_inf(R) = (W(R♭), M♭ → W(R♭), m ↦ [α♭(m)])`.
- For an integral log ring `(R, M)` with `R` perfectoid, `M` is perfectoid iff `M/M^×` is uniquely p-divisible.

**Checks.**

- **Uniquely p-divisible chart**: For `M = N[1/p]` (additive), `M♭ ≅ N[1/p]` and `M` is perfect.
- Every group is perfectoid in this sense since `M/M^×` is trivial; its tilt is `lim_{x ↦ x^p} M`.
- `O_C∖{0}` for `C` algebraically closed perfectoid is perfectoid but not perfect, since 1 `+ p` has many p-th roots.
- The monoid generated by `x_0, x_1, …, y_1^{±1}, …` with `x_j^p = x_{j−1}y_j` is pseudo-perfectoid with `M/M^× ≅ N[1/p]` but `M♭` the trivial monoid.
- The additive monoid `N` is not perfect at `p = 2`, since 1 has no half. Its tilt is trivial while `N/N^× = N`, so `N` is not perfectoid either.
- For any commutative group `G`, `Associates G` is a singleton. For a commutative monoid `M` with every unit equal to `1`, `Associates.mk` is injective. For any such group `G` and any commutative monoid `M`, `Associates (G×M) ≃* Associates M`. Specializing to sharp perfect `M=N[1/p]` tests removal of all, none and only the group unit directions; these quotient identifications themselves require no perfectness hypothesis.
- **Agreement with the pre-tilt**: For an integral perfectoid ring `R`, the multiplicative monoid of Mathlib `PreTilt` agrees with Mathlib `Perfection R p` under the multiplicative bijection `R♭ ≅ lim_{x ↦ x^p} R`.

*Needs:* Mathlib `Perfection`, `PreTilt`, `WittVector.teichmuller`; PrismaticCohomology Layer 0 (perfectoid rings and Fontaine prisms); CrystallineCohomology §CR.5:log-algebra.1.

**§8.15 Perfect log prisms.**

A ''log prism'' `(A, I, M_A)` (bounded prelog prism with `(A, M_A)` a log ring) is perfect if `M_A` is integral and its Frobenius `(φ_A, φ_{M_A})` is an isomorphism. If `(A, I)` is perfect, `(A, I, M_A)` is perfect iff `M_A/A^×` is uniquely p-divisible; a perfect ''log prism'' has p-saturated monoid. Every integral ''log prism'' has a perfection `(A_perf, IA_perf, M_{A,perf})`: the derived `(p,I)`-completed Frobenius colimit of A from PrismaticCohomology Layer 0, with the log structure associated to `colim_φ M_A → A_perf`. The raw ring colimit is not substituted for this completed prism. For a perfectoid integral pre-log ring `(R, M)`, the Teichmüller prelog prism `(A_inf(R), ker θ, M♭)` has rank one; its associated log prism is perfect and admits this specified rank-one chart. Rank one is asserted on the chart, not on all sections of the associated log structure.

Integral monoid; `(A, M_A)` a log ring; boundedness as for log prisms.

(KY, §2.4, Definition 2.35 and Remark 2.36 (p. 21); Example 2.37 for perfection, Example 2.38 and Proposition 2.39 for the rank-one chart (p. 21).)

- `M_A` integral and `(φ_A, φ_{M_A})` bijective.
- For perfect `(A, I)`: perfect iff `M_A/A^×` is uniquely p-divisible.
- A perfect ''log prism'' has p-saturated monoid.
- The perfection `(A_perf, IA_perf, M_{A,perf})` of an integral ''log prism''.
- Maps from an integral ''log prism'' to a perfect one factor uniquely through its perfection.
- For a perfectoid integral pre-log ring `(R, M)`, `(A_inf(R), ker θ, M♭)` is a rank-one prelog prism and its associated log prism is perfect with this rank-one chart.

**Checks.**

- `(A_inf, (ξ), O_C♭∖{0})^a` is a perfect log prism.
- With the trivial log structure, a log prism is perfect iff the underlying prism is perfect.
- The Breuil–Kisin log prism `(W(k)[[u]], (E), N)` is not perfect: `u` is not a p-th power and `φ` is not surjective.
- `(W(k), (p), N → 0)^a` is not perfect (`N` is not p-divisible), while its perfection has monoid `N[1/p]` modulo units.
- At `p=2`, for `R=O_C` with `C/ℚ₂` algebraically closed and complete, the trivial prelog chart has `δ_log=0`. Its logification contains the unit `3`, with `φ(3)=3`, `δ(3)=−3` and `δ_log(3)=−1/3≠0`. The associated log prism is perfect and its full log structure fails the rank-one predicate of §8.1.

*Needs:* §§8.14, 8.9, 8.2; PrismaticCohomology Layer 0 (completed prism perfection).

**§8.16 Log cotangent complexes of perfectoid pre-log rings.**

Prove the vanishing of the relative log cotangent complex of perfectoid pre-log rings, absolutely and relatively. Let `(R, M)` be a perfectoid (or pseudo-perfectoid) pre-log ring and `ℤ_p` the trivial pre-log ring. Then the natural map `L̂_{R/ℤ_p} → L̂_{(R,M)/ℤ_p}` of p-completed (Gabber) log cotangent complexes is an isomorphism; equivalently `L̂_{(R,M)/R} = 0`; in particular `L̂_{(R,M)/ℤ_p}[−1]{−1} ≅ R`. For a map `f: (R, M) → (S, N)` of perfectoid pre-log rings, `L̂_{(S,N)/(R,M)} = 0`.

Perfectoid or pseudo-perfectoid pre-log rings; p-completed Gabber log cotangent complex as supplied by DerivedDeRhamCohomology §6.20 and CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18.

(KY, §2.3, Lemma 2.28 (p. 18); KY, §2.3, Corollary 2.29 (p. 19).)

*Needs:* §8.14; DerivedDeRhamCohomology §6.20 (`gabberLogCotangent`, `logCotangentFunctoriality`); CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18.

**§8.17 Perfect log prisms are perfectoid log rings.**

Prove the equivalence of perfect log prisms with perfectoid log rings and the initiality of `A_inf`. The functor `(A, I, M_A) ↦ (A/I, M_A)^a` is an equivalence from perfect ''log prisms'' to perfectoid log rings, with quasi-inverse `(R, M) ↦ (A_inf(R), ker θ, M♭)^a ≅ (A_inf(R), ker θ, M♭_{R/p})^a`. In particular every perfect ''log prism'' admits a chart `N → A` of rank 1. Moreover, for a perfectoid integral pre-log ring `(R, M)` and an integral ''log prism'' `(A, I, M_A)`, every map `(R, M) → (A/I, M_A)^a` of pre-log rings lifts uniquely to a map of pre-log prisms `(A_inf(R), ker θ, M♭) → (A, I, M_A)`; so `(A_inf(R), ker θ, M♭)^a` is initial among integral ''log prisms'' under `(R, M)` (also with exact-surjection or associated-log variants).

Perfect ''log prisms'' are integral and bounded; the lifting statement assumes `(A, I, M_A)` bounded and integral.

(KY, §2.4, Proposition 2.39 (p. 21); KY, §2.4, Lemma 2.40 (p. 22).)

**Proof route.** Lifting (Lemma 2.40): `L_{(A_inf(R)/p^m)^a/(ℤ/p^m)} = 0`, so `(ℤ/p^m, (ℤ/p^m)^×) → (A_inf(R)/p^m)^a` is formally log-étale (Sagave–Schürg–Vezzosi Theorem 5.6, imported through DerivedDeRhamCohomology §6.20 and CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18); lift through `(A, M_A)` by classical p-completeness.

*Needs:* §§8.14–8.16, 8.0c; PrismaticCohomology Layer 0; DerivedDeRhamCohomology §6.20 and CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18 (completed cotangent and lifting inputs).

### 8.18 The relative log prismatic site

Fix a bounded prelog prism `(A, I, M_A)` with `M_A` integral and a log `(p, I)`-adic formal scheme `(X, M_X)` smooth over `(A/I, M_A)` in Koshikawa's sense (so `M_X` is integral). The log prismatic site `((X, M_X)/(A, M_A))_Δ` is the opposite of the category of triples consisting of: a log prism `(B, IB, M_{Spf(B)}) = (B, IB, M_B)^a` with integral log structure and a map of log prisms `(A, I, M_A)^a → (B, IB, M_{Spf(B)})`; a map of formal schemes `f: Spf(B/IB) → X` over `A/I`; and an exact closed immersion of log formal schemes `(Spf(B/IB), f^*M_X) ↪ (Spf(B), M_{Spf(B)})` over `(A, M_A)`. A morphism is an étale cover if `B → C` is `(p, I)`-completely étale and faithfully flat and `(Spf(C), M) → (Spf(B), M)` is strict étale. The structure sheaves are `O_Δ: B ↦ B` and `Ō_Δ: B ↦ B/IB`, with `O_Δ ⊗^L_A A/I ≅ Ō_Δ`. The site depends only on `(Spf(A), M_A)^a` and `(X, M_X)`, not on the chart `M_A → A`.

`(X, M_X)` smooth over `(A/I, M_A)` in the sense of Koshikawa Appendix A (CR.5). Étale topology; the `(p, I)`-completely faithfully flat topology gives the same cohomology (Remark 4.3).

(K1, §4.1, Definition 4.1 (p. 19); K1, §4.1, Definition 4.1 (p. 19); K1, §4.1, Remark 4.4 (p. 19).)

*Needs:* §8.0b, §8.9, §8.4, §8.5, PrismaticCohomology Layer 1, CrystallineCohomology Layer CR.5:log-algebra, Mathlib `CategoryTheory.GrothendieckTopology`.

- The site `((X, M_X)/(A, M_A))_Δ` with the étale topology.
- The sheaf `O_Δ: (B, IB, M) ↦ B`, valued in `(p, I)`-complete A-algebras with `δ`-structure.
- `Ō_Δ`: `(B, IB, M) ↦ B/IB`, with `O_Δ ⊗^L_A A/I ≅ Ō_Δ`.
- For an object `B` and a p-completely étale `B/IB → C̄` there is a unique étale map of objects `B → C` with `C/IC ≅ C̄` (Remark 4.2).
- The morphism of topoi `ν`: `Shv(((X, M_X)/(A, M_A))_Δ) → Shv(X_ét)` with `(ν_*F)(U) = H⁰(((U, M_U)/(A, M_A))_Δ, F)`.
- Replacing étale covers by `(p, I)`-completely faithfully flat covers does not change the cohomology of `O_Δ` (Remark 4.3).
- For trivial log structures the site is equivalent to PrismaticCohomology Layer 1's relative prismatic site with the étale topology.
- The site depends only on `(Spf(A), M_A)^a` and `(X, M_X)`.

**Checks.**

- For `(X, M_X) = (Spf(A/I⟨X⟩), M_A ⊕ N)^a`, the triple `(A⟨X⟩, I, M_A ⊕ N)^a` with `δ_log(N) = 0` and the identity `Spf(A/I⟨X⟩) → X` is an object.
- With `M_A` and `M_X` trivial, the site equals the PrismaticCohomology Layer 1 relative prismatic site (étale variant) and the structure sheaves agree.
- For `X = Spf(A/I)` with the log structure from `M_A, (A, I, M_A)^a` is a final object.
- For the log affine line with trivial base log structure, forgetting logs sends `(A⟨X⟩, I, N)^a` to a valid object of the underlying non-log prismatic site. It does not preserve the Hodge–Tate differential module: the canonical map `R·dX → R·dlog X` sends `dX` to `X·dlog X` and is not an isomorphism when `X` is not a unit.

**Proof route.** Objects and morphisms as stated; étale covers form a pretopology because étale maps of `B/IB` lift uniquely (Remark 4.2: Lemma 2.13 and Corollary 2.15), so étale objects over `B` are equivalent to p-completely étale `B/IB`-algebras.

### 8.19 Log prismatic cohomology complexes

In the setting of the log prismatic site, define `Δ_{(X,M_X)/(A,M_A)} := Rν_*O_Δ ∈ D(X_ét, A)` and its reduction `Δ̄_{(X,M_X)/(A,M_A)} := Rν_*Ō_Δ ∈ D(X_ét, A/I)`, commutative algebra objects with `Δ̄ ≅ Δ ⊗^L_A A/I`, and `RΓ_Δ((X, M_X)/(A, M_A)) := RΓ(((X, M_X)/(A, M_A))_Δ, O_Δ)`, a `(p, I)`-complete `E_∞-A`-algebra with a `φ_A`-semilinear endomorphism `φ` induced by the `δ`-structures. For `X = Spf(R)` with an integral chart `P → Γ(X, M_X)` over `M_A` that is integral and weakly finitely generated over `M_A`, write `Δ_{(R,P)/(A,M_A)}`; it may be computed with the indiscrete topology and depends only on `(Spf(R), P)^a` and `(A, I, M_A)^a`.

`(X, M_X)` smooth over `(A/I, M_A)`.

(K1, §4.1, Remark 4.5 (p. 20); K1, §4.2 (p. 20).)

*Needs:* §8.18, Mathlib `DerivedCategory`, PrismaticCohomology Layer 1.

- `RΓ_Δ((X, M_X)/(A, M_A))` as a `(p, I)`-complete `E_∞-A`-algebra.
- `Δ_{(X,M_X)/(A,M_A)} = Rν_*O_Δ ∈ D(X_ét, A)`.
- `Δ̄_{(X,M_X)/(A,M_A)} = Rν_*Ō_Δ ∈ D(X_ét, A/I)`.
- `Δ̄ ≅ Δ ⊗^L_A A/I`.
- The `φ_A`-semilinear Frobenius `φ: Δ → φ_{A,*}Δ`.
- `RΓ_Δ` is derived `(p, I)`-complete.
- Functoriality in `(X, M_X)` over `(A, M_A)` and in maps of bounded prelog prisms.

**Checks.**

- For `X = Spf(A/I)` with log structure from `M_A, RΓ_Δ((X, M_X)/(A, M_A)) ≅ A` with `φ = φ_A`.
- With trivial log structures, `Δ_{(X,M_X)/(A,M_A)} ≅` PrismaticCohomology Layer 1's `Δ_{X/A}`.
- For `(A/I⟨X⟩, M_A ⊕ N): H⁰(Δ̄) = A/I⟨X⟩` and `H¹(Δ̄){1} ≅ A/I⟨X⟩·dlog X`, a free module of rank 1 (K1 §5.4).
- For the log affine line, `H¹(Δ̄){1}` is generated by `dlog X` rather than `dX`: the log and non-log cohomologies differ (the map `Ω¹ → Ω¹_log` is `X·`, not an isomorphism).

**Proof route.** Construct `ν` as in BS Remark 4.4 using the equivalence of étale objects (The relative log prismatic site API). Frobenius: `O_Δ → φ_{A,*}O_Δ` from the `δ`-structures of the objects. `Δ̄ ≅ Δ ⊗^L A/I` from `O_Δ ⊗^L A/I ≅ Ō_Δ` and the projection formula.

### 8.20 The absolute saturated log prismatic site

For an integral log p-adic formal scheme `(X, M_X)`, the absolute log prismatic site `(X, M_X)_Δ` has objects diagrams `(Spf(B), M_{Spf(B)}) ↩ (Spf(B/J), M_{Spf(B/J)}) → (X, M_X)` where `(B, J, M_{Spf(B)})` is a log prism with `M_{Spf(B)}` integral, `M_{Spf(B/J)}` its restriction, and the right map admits an integral chart étale locally; it carries the flat topology. For a bounded fs log p-adic formal scheme, the absolute saturated log prismatic site has objects saturated log prisms `(A, I, M_A)^a` with a map `(Spf(A/I), M_A)^a → (X, M_X)` admitting a saturated chart étale locally, with the strict flat topology. There is a strict variant requiring the right map to be strict, and the relative site maps to it.

`(X, M_X)` integral (resp. bounded fs for the saturated variant).

(K1, §4.1, Remark 4.6 (p. 20); KY, §7.5, Definition 7.34 (p. 80).)

*Needs:* §8.9, §8.18, PrismaticCohomology Layer 1, CrystallineCohomology Layer CR.5:log-algebra, §8.12, PrismaticCohomologyPartII Layer 4.

- The site `(X, M_X)_Δ` with the flat topology (integral variant).
- The absolute saturated log prismatic site of a bounded fs log p-adic formal scheme, with the strict flat topology.
- `O_Δ`: `(B, J, M) ↦ B` and the ideal sheaf `I_Δ: (B, J, M) ↦ J`.
- The forgetful functor from the relative site `((X, M_X)/(A, M_A))_Δ` to the strict variant.
- For trivial log structures the strict variant is PrismaticCohomologyPartII Layer 4's absolute prismatic site.

**Checks.**

- For `(X, M_X) = (Spf(O_K), O_K∖{0})^a`, the Breuil–Kisin log prism `(W(k)[[u]], (E(u)), u^N)^a` covers the final object (K1 Lemma 4.14).
- For `(Spf(O_C), O_C∖{0})^a`, the perfect log prism `(A_inf, (ξ), O_C♭∖{0})^a` is weakly final.
- With trivial log structure, the strict absolute log prismatic site is equivalent to PrismaticCohomologyPartII Layer 4’s ordinary absolute prismatic site, including its morphisms.

**Proof route.** Define objects and the (strict) flat topology; check fibre products of covers exist using log prismatic envelopes. Construct the forgetful functor from the relative site of Definition 4.1 to the strict variant.

### 8.21–8.26 Log Hodge–Tate complexes

**§8.21 Čech–Alexander complexes for log prismatic cohomology.**

Let `X = Spf(R)` be affine with an integral chart `P` over `M_A` that is integral and weakly finitely generated over `M_A`. Choose a surjection `M_B = M_A ⊕ N^T → P` and a surjection `B_0 := A⟨(X_s)_{s∈S}, N^T⟩ → R` compatible with it, and let `B := (A{(X_s)}_δ{N^T}_δlog)^∧_(p,I)` be the free `δ_log`-ring. Let `(B_0^•, M_B^•) ↪ (B^•, M_B^•)` be the `(p, I)`-completed Čech nerves over `(A, M_A)` and `J^• := ker(B_0^• → R)`. Applying the flatness theorem for envelopes levelwise gives a cosimplicial prelog prism `(C^•, IC^•, M_C^•)` with exact surjections onto `(C^•/IC^•, P)`, each `C^n (p, I)`-completely flat over `A`; its associated cosimplicial object is the Čech nerve of `(C^0, IC^0, M_C^0)^a`, which covers the final object of the topos. Hence `Δ_{(R,P)/(A,M_A)}` is computed by the cosimplicial `δ-A`-algebra `C^•`, compatibly with base change in `(A, I, M_A)`. Taking `P = Γ(X, M_X)` and `B_0 = A⟨N^R ⊕ N^P⟩` gives a strictly functorial complex `C^•((R, P)/(A, M_A), O_Δ)`. This latter choice does not itself commute with arbitrary base changes (K1 Remark 4.8); its totalisation computes the same cohomology.

`M_A → P` integral and weakly finitely generated; `(R, P) p`-completely smooth.

(K1, §4.2, Construction 4.7 (p. 21); K1, §4.2, Remark 4.8 (p. 22).)

- The cosimplicial `δ-A`-algebra `C^•` attached to a choice of surjections `(B_0, M_B) → (R, P)`.
- Each `C^n` is `(p, I)`-completely flat over `A`.
- `Tot(C^•) ≅ Δ_{(R,P)/(A,M_A)}` compatibly with Frobenius.
- For a chosen free presentation, `C^•` commutes with completed base change along maps of bounded prelog prisms when the same presentation is base changed. This does not assert base change of the strictly functorial presentation indexed by all elements of `R` and `P` (K1 Remark 4.8).
- The strictly functorial complex for `P = Γ(X, M_X)` and `B_0 = A⟨N^R ⊕ N^P⟩`.
- Two choices of surjections give canonically quasi-isomorphic totalisations.

**Checks.**

- For `(A/I⟨X_0⟩, M_A ⊕ X_0^N)` with `B_0 = A⟨X_0⟩, C^n` is the completion of `A⟨X_0, …, X_n⟩{(I, X_1/X_0 − 1, …, X_n/X_0 − 1)/I}_δ` (K1 §5.4).
- For `R = A/I` and `P = M_A`, the constant cosimplicial algebra `A` computes `Δ = A`.
- With trivial log structures, `C^•` is BS22's Čech–Alexander complex (PrismaticCohomology Layer 1).
- Using the non-exactified `δ-pair (B^1, (I, X_1 − X_0))` for the log affine line gives the non-log Čech nerve, whose cohomology has `H¹(Δ̄) ≅ R·dX` rather than `R·dlog X`.

*Needs:* §§8.13, 8.3, 8.12, 8.19; Mathlib `CategoryTheory.CosimplicialObject`; PrismaticCohomology Layer 1 (Čech descent).

**§8.22 Affine base change for log prismatic cohomology.**

Prove affine base change. Let `(R, P)` be as in the Čech–Alexander construction and `(A, I, M_A) → (A′, IA′, M_{A′})` a map of bounded prelog prisms with `M_{A′}` integral and `A → A′` of finite `(p, I)`-complete Tor amplitude. With `(R′, P′)` the p-completed base change of `(R, P)` as a prelog ring, the natural map `Δ_{(R,P)/(A,M_A)} ⊗̂^L_A A′ → Δ_{(R′,P′)/(A′,M_{A′})}` is an isomorphism, and similarly for `Δ̄`.

Finite `(p, I)`-complete Tor amplitude of `A → A′`; `M_{A′}` integral.

(K1, §4.2, Lemma 4.11 (p. 22).)

*Needs:* §8.21; PrismaticCohomology Layer 1 (finite complete Tor-amplitude base change).

**§8.23 Strict étale localisation.**

Prove strict étale localisation. Let `(A, I, M_A)` be a bounded prelog prism with `M_A` integral, `(R, P)` a p-completely smooth prelog ring over `(A/I, M_A)`, and `R → S` a p-completely étale map with the pulled-back chart `P`. Then `Δ̄_{(R,P)/(A,M_A)} ⊗̂^L_R S → Δ̄_{(S,P)/(A,M_A)}` is an isomorphism. Consequently the reduced log prismatic complex `Δ̄` is a quasi-coherent derived p-complete complex on strict-étale localisations. This `R`-linear statement concerns `Δ̄`, not the unreduced `Δ`, which is naturally an A-complex.

Bounded base prism with integral `M_A`; `(R, P) p`-completely smooth over `(A/I, M_A)`. `R → S p`-completely étale; same pulled-back chart `P`; `Δ̄ := Δ ⊗^L_A A/I`.

(K1, §4.2, Lemma 4.12 (p. 22).)

*Needs:* §§8.21–8.22, 8.18; PrismaticCohomology Layer 1 (strict étale localization).

**§8.24 Envelopes of smooth charts cover the final object.**

Prove that prelog prismatic envelopes cover the final object, and that the Breuil–Kisin log prism covers the absolute topos. Work with the flat topology. Let `(R, P)` be p-completely smooth over `(A/I, M_A)` with `M_A → P` a smooth chart, and `(B, IB, M_B)` a prelog prism over `(A, I, M_A)` that is `(p, I)`-completely smooth over `(A, M_A)` with `M_A → M_B` a smooth chart, together with a surjection `(B, M_B) → (R, P)`; let `(B′, IB′, M_{B′})` be its prelog prismatic envelope. Then for every object `(C, IC, M_C)^a` of `((R, P)/(A, M_A))_Δ` the product of `(B′, IB′, M_{B′})^a` and `(C, IC, M_C)^a` exists and is `(p, I)`-completely faithfully flat over `C`; in particular `(B′, IB′, M_{B′})^a` covers the final object. If `(A, M_A)` has rank 1, a smooth lift `(R̃, P̃)` of `(R, P)` over `(A, M_A)` with its rank-1 `δ_log`-structure gives such a covering. In the absolute setting, the Breuil–Kisin log prism `(W(k)[[u]], (E(u)), u^N)^a` covers the final object of the topos of `(O_K, O_K∖{0})_Δ`.

Flat topology; smooth charts in Koshikawa's sense; `(A, I)` may be assumed orientable for faithful flatness.

(K1, §4.3, Proposition 4.13 (p. 23); K1, §4.3, Lemma 4.14 (p. 23).)

*Needs:* §§8.13, 8.12, 8.18, 8.7, 8.20, 8.0b; PrismaticCohomology Layers 0–1 (flat prism products and the Breuil–Kisin cover).

**§8.24a The degree-zero and degree-one log Hodge–Tate maps.**

Let `(A, I, M_A)` be a bounded prelog prism with `M_A` integral and `(X, M_X)` smooth over `(A/I, M_A)`. Construct the degree-zero Hodge–Tate map, the structure map `η⁰: O_X → H⁰(Δ̄)`, and the degree-one Hodge–Tate map, the `O_X`-linear map `η¹: Ω¹_{(X,M_X)/(A/I,M_A)} → H¹(Δ̄){1}`. Locally, for `X = Spf(R)` with chart `P` and a site object `(B, IB, M_B)^a` with exact surjection `M_B → P`, use the natural cotangent maps
`RΓ(L̂_{(R,P)/(A,M_A)}) → RΓ(L̂_{(B/IB,P)/(B,M_B)}) ≅ RΓ(L̂_{(B/IB,M_B)/(B,M_B)}) ≅ IB/I²B[1] ≅ I/I² ⊗^L_{A/I} B/IB[1]`.
Taking derived sections over the site and then `H⁰` defines `η¹`. Prove that `η¹` is identified with this cotangent construction, and its compatibility with maps of smooth log formal schemes and bounded prelog bases. Restriction along `Ω¹_{X/(A/I)} → Ω¹_log` agrees with the ordinary Bockstein construction followed by the forgetful comparison.

The twists are `{i} = ⊗ I^i/I^{i+1}`; the degree-zero and degree-one maps do not require a choice of orientation.

(K1, §5.2, pp.26–27, construction preceding Lemma 5.2.)

**Checks.**

- On the base `(Spf(A/I), M_A)^a`, `η⁰` sends `1` to `1` and `η¹` has zero source.
- With trivial log structures, `η¹(df) = β_I(η⁰(f))` is the ordinary degree-one Hodge–Tate map.
- Under the identity map of a charted input both maps are unchanged; under successive base maps their naturality identifications compose.

*Needs:* §§8.0c, 8.19, 8.24; DerivedDeRhamCohomology §6.20 and CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18 (log cotangent maps); PrismaticCohomology Layer 1 (Bockstein and non-log comparison).

**§8.25 Hodge–Tate cohomology of group-ring Čech nerves.**

Prove the group-ring Hodge–Tate computation. Let `(A, I)` be a bounded prism and `G′ → G` a surjection of finitely generated abelian groups without p-torsion, with kernel `H`; `R := A/I⟨G⟩` and `A⟨G′⟩ → R`. Let `B^•` be the Čech nerve of the prismatic envelope `B^0` in `(R/A)_Δ, H_n := ker((G′)^{⊕(n+1)} → G′)`, and `C^• := A⟨H ⊕ H_n⟩{(I, (h − 1)_{h∈H⊕H_n})/I}_δ ⊗_A A/I`, so that `B^• ⊗_A A/I ≅ R ⊗̂_{A/I} C^•`. Then the map `∧^i(A/I ⊗_Z G) → H^i(Tot(C^•)){i}` induced by `g ↦ (g̃ − 1)/d ⊗ d` (for a lift `g̃ ∈ G′` and an orientation `d`) is an isomorphism of `A/I`-modules for every `i`.

`G, G′` finitely generated abelian with trivial p-torsion; `(A, I)` bounded.

(K1, §5.3, Lemma 5.7 (p. 29); K1, §5.3 (p. 28).)

*Needs:* PrismaticCohomology Layers 0–1 (group-ring prismatic envelopes and their Hodge–Tate calculation); Mathlib `CategoryTheory.CosimplicialObject`.

**§8.26 Hodge–Tate comparison for the log affine line.**

Prove the Hodge–Tate computation for the log affine line. Let `(A, I, M_A)` be a bounded prelog prism with `M_A` integral and `(R, P) = (A/I⟨X_0⟩, M_A ⊕ X_0^N)`. Then the maps `η⁰` and `η¹` of §8.24a are isomorphisms in degrees zero and one: `H⁰(Δ̄) ≅ R` and `H¹(Δ̄){1} ≅ R ⊗_Z X_0^Z`, with `η¹(dlog X_0)` corresponding to `1 ⊗ X_0`. Moreover `H^i(Δ̄) = 0` for `i ≥ 2`; the square of `η¹(dlog X_0)` and its Bockstein therefore vanish.

`(A, I, M_A)` bounded, `M_A` integral.

(K1, §5.4, Proposition 5.8 (p. 29); K1, §5.4 (p. 29).)

**Proof route.** The lift `(A⟨N⟩, M_A ⊕ N)` with `δ_log(N) = 0` is an object; its Čech nerve computes `Δ` (Envelopes of smooth charts cover the final object), with `B^n` the completion of `A⟨X_0, …, X_n⟩{(I, X_1/X_0 − 1, …, X_n/X_0 − 1)/I}_δ`.

*Needs:* §§8.24, 8.24a, 8.25, 8.21, 8.19; PrismaticCohomology Layer 0 (rank-one lifts).

### 8.27–8.29 Log crystalline structures

**§8.27 The log Hodge–Tate comparison map.**

Let `(A, I, M_A)` be bounded with `M_A` integral and `(X, M_X)` smooth over `(A/I, M_A)`. Use `η⁰` and `η¹` from §8.24a. Apply naturality to the log-line calculation of §8.26 for local sections of `M_X`, and extend to `M_X^gp` by additivity and graded commutativity. This gives `η^1(dlog m)^2 = 0` and `β_I(η^1(dlog m)) = 0`, where `β_I` is the Bockstein differential on `H^*(Δ̄){*}`. Since `Ω¹_log` has local bases of the form `dlog m, η^1` extends uniquely to a map of commutative differential graded `A/I`-algebras `η^*: Ω^*_{(X,M_X)/(A/I,M_A)} → (H^*(Δ̄){*}, β_I)`, compatible with the `O_X`-module structures; its composite with the canonical map `Ω¹_{R/(A/I)} → Ω¹_log` agrees with the non-log Hodge–Tate map followed by the forgetful comparison map.

Bounded prelog prism with integral monoid; smoothness in Koshikawa's sense; the Breuil–Kisin twist `{i} = ⊗ I^i/I^{i+1}`.

(K1, §5.2 (p. 26–27); K1, §5.2, Lemma 5.2 (p. 27); K1, §5.2 (p. 27).)

- `η^*`: `Ω^*_{(X,M_X)/(A/I,M_A)} → H^*(Δ̄_{(X,M_X)/(A,M_A)}){*}` as a map of cdgas with the Bockstein differential.
- `η^1(dlog m)^2 = 0` for `m ∈ M_X^gp`.
- `β_I(η^1(dlog m)) = 0`.
- The square comparing the non-log and log Hodge–Tate maps commutes along the canonical map `Ω¹_{X/(A/I)} → Ω¹_log` and the map induced by forgetting logs. The differential map is not asserted to be injective.
- `η^*` is natural in `(X, M_X)` and in maps of bounded prelog prisms.

**Checks.**

- For `(A/I⟨X_0⟩, M_A ⊕ X_0^N), η^1(dlog X_0)` corresponds to the class of `(X_1/X_0 − 1)/d ⊗ d` in `H¹` of the Čech–Alexander complex, for an orientation `d`.
- In degree zero the full map is the structure map `η⁰` of §8.24a.
- With trivial log structures `η^*` equals PrismaticCohomology Layer 1's Hodge–Tate comparison map.
- `η^1(dlog X_0)` is not `η^1(dX_0)`: they differ by the factor `X_0`, which is not a unit on `A/I⟨X_0⟩`.

*Needs:* §§8.24a, 8.26; PrismaticCohomology Layer 1 (Bockstein and non-log comparison); Mathlib `KaehlerDifferential`.

**§8.28 The log Hodge–Tate comparison.**

Prove the log Hodge–Tate comparison and the cotangent truncation identification. Let `(A, I, M_A)` be a bounded prelog prism with `M_A` integral and `(X, M_X)` a log p-adic formal scheme smooth over `(A/I, M_A)` in Koshikawa's sense. Then `η^*: Ω^*_{(X,M_X)/(A/I,M_A)} → H^*(Δ̄_{(X,M_X)/(A,M_A)}){*}` is an isomorphism of differential graded `A/I`-algebras (sheaves on `X_ét`); in particular `Δ̄_{(X,M_X)/(A,M_A)}` is a perfect complex. Moreover `RΓ(Spf(R)_ét, L̂_{(R,P)/(A,M_A)}) ≅ (τ^{≤1}Δ̄_{(R,P)/(A,M_A)}){1}[1]` locally.

`(X, M_X)` smooth over `(A/I, M_A)` in the sense of Koshikawa Appendix A (integral, relatively coherent charts).

(K1, §5.2, Theorem 5.3 and Remark 5.4 (p. 27); KY, §1, Theorem 2(1) (p. 2).)

*Needs:* §§8.27, 8.25–8.26, 8.24, 8.22; CrystallineCohomology Layer CR.5:log-algebra (smooth charts and log differentials).

**§8.29 Completed base change for log prismatic cohomology.**

Prove completed base change. Let `(A, I, M_A) → (A′, IA′, M_{A′})` be a map of bounded prelog prisms with integral monoids, `(X, M_X)` smooth over `(A/I, M_A)` with qcqs underlying formal scheme, and `X′ := X ×_{(Spf A/I, M_A)^a} (Spf A′/IA′, M_{A′})^a` (an integral log formal scheme, smooth over the new base). Then `RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_A A′ ≅ RΓ_Δ(X′/(A′, M_{A′}))`, and the same holds for the sheaves `Δ`.

Bounded prelog prisms with integral monoids; base change in the category of integral log formal schemes; qcqs `X` for the global form.

(K1, §5.2, Corollary 5.5 (p. 27); KY, §1, Theorem 2(2) (p. 3).)

**Proof route.** Reduce to `Δ̄` by derived Nakayama (`(p, I)`-completeness). `Δ̄` is computed by the Hodge–Tate comparison, and `Ω^*_log` commutes with base change (Koshikawa smoothness is stable under base change, Remark A.12(3)).

*Needs:* §§8.28, 8.22, 8.0b; CrystallineCohomology Layer CR.5:log-algebra (log base change); PrismaticCohomology Layer 1 (derived Nakayama and completed descent).

### 8.30–8.35 Log crystalline comparisons

**§8.30 The `δ_log`-crystalline site.**

Let `(A, (p), M_A)` be a bounded prelog prism with `M_A` integral and `(X, M_X)` a log p-adic formal scheme over `(A, M_A)`. A `δ_log`-PD triple over `(A, M_A)` is `(B, J, M_B)^a` where `(B, (p), M_B)` is a bounded prelog prism over `(A, (p), M_A)` with integral log structure and `J ⊂ B` is a p-completed PD ideal with `B/J` classically p-complete. The (big) `δ_log`-crystalline site `((X, M_X)/(A, M_A))_δCRYS` is the opposite of the category of `δ_log`-PD triples with a map `f: Spf(B/J) → X` over `A` and an exact closed immersion `(Spf(B/J), f^*M_X) ↪ (Spf(B), M_{Spf(B)})` over `(A, M_A)`, with the étale topology and structure sheaf `O_δCRYS: (B, J, M_B)^a ↦ B`. Dropping `δ` and `δ_log` gives a version `((X, M_X)/(A, M_A))_CRYS` of the big log crystalline site with étale topology; forgetting is a cocontinuous functor inducing `u_X^δ: Shv(δCRYS) → Shv(X_ét)` and a canonical map `Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS`.

`I = (p)`; `(A, M_A)` of rank 1 or a log ring (so `A` is p-torsion free); objects only those receiving a map from `(A, (p), M_A)` (a chart-dependent simplification, K1 §6.1).

(K1, §6.1, Definition 6.4 (p. 32); K1, §6.1, Remark 6.5 (p. 32).)

- The site `((X, M_X)/(A, M_A))_δCRYS` with étale topology.
- `O_δCRYS`: `(B, J, M_B)^a ↦ B`.
- The cocontinuous forgetful functor to the big log crystalline site `((X, M_X)/(A, M_A))_CRYS` and the map `Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS`.
- For a PD ideal `I` of `A`, the divided powers of `I` and `J` are compatible on every object.
- The morphism of topoi `u^δ_X` to `X_ét`.

**Checks.**

- For `X = Spf(A/p)` with log structure `M_A`, the triple `(A, (p), M_A)^a` is final and `RΓ_δCRYS = A`.
- With trivial log structures, the cohomology agrees with crystalline cohomology for smooth `X` (BS22 Theorem 5.2's `δ`-crystalline site).
- A PD thickening `(B, J)` with `B` having p-torsion is not an object: objects are bounded prelog prisms with `I = (p)`, so `B` is p-torsion free.
- For `(A/p⟨X⟩, M_A ⊕ N)`, the rank-one triple `(A⟨X⟩, (p), M_A ⊕ N)^a` is an object, but it is not asserted weakly final: an arbitrary target log generator can have nonzero `δ_log`. A weakly final object for the Čech computation is obtained from the free `δ_log` ring and its log PD envelope (K1 Remark 6.9, p.34).

*Needs:* §§8.0d, 8.8–8.9; CrystallineCohomology Layer CR.5; Mathlib `DividedPowers`.

**§8.31 `δ_log`-crystalline cohomology is log crystalline cohomology.**

Prove the comparison of the `δ_log`-crystalline and big log crystalline sites. Let `I ⊂ A` be a p-completed PD ideal with `A/I` classically p-complete and `(X, M_X)` smooth over `(A/I, M_A)`. Then the natural map `Ru_{X*}O_CRYS → Ru^δ_{X*}O_δCRYS` is an isomorphism of `E_∞-A`-algebras on `X_ét`. In the characteristic-p case `p ∈ I`, for every `m ≥ 1` reduction mod `p^m` identifies `Ru_{X*}O_CRYS ⊗^L A/p^m` with `Ru^crys_*O_{(X,M_X)/(A/p^m,M_A)}` (small log crystalline site), and passing to the limit `Ru^crys_*O_{(X,M_X)/(A,M_A)} ≅ Ru_{X*}O_CRYS`. When `I ∋ p` and the chart `M_A → P` is integral and weakly finitely generated, the Čech nerve of the p-completed log PD envelope of a surjection from a p-completely smooth `δ_log`-ring of topologically finite presentation, and also the log de Rham complex with coefficients in that envelope, compute these cohomologies.

`I` a p-completed PD ideal, `A/I` classically p-complete; `(X, M_X)` smooth over `(A/I, M_A)` in Koshikawa's sense; `(A, (p), M_A)` bounded of rank 1 or a log ring.

(K1, §6.1, Proposition 6.8 (p. 33); K1, §6.1, Remark 6.7 (p. 33); K1, §6.1, Remark 6.9 (p. 34).)

*Needs:* §§8.30, 8.0d, 8.3, 8.13; CrystallineCohomology Layer CR.5 (log PD Poincaré and embedding descent); PrismaticCohomology Layer 0 (regular-envelope flatness).

**§8.32 Cosimplicial relative Frobenius for Cartier-type monoid maps.**

Prove the cosimplicial log Cartier homotopy. Let `k` be a ring with a prelog structure `M → k, M → Q` an injective integral map of integral monoids with `G := Q^gp/M^gp`, and `Q^(1)` the base change of `M → Q` along the p-th power map of `M`, with relative Frobenius `Q^(1) → Q`. Consider the cosimplicial `k`-algebras `A^• = k ⊗_{ℤ[M]} ℤ[Q ⊕ G^•], A^{•(1)}` and `B^n := k ⊗_{ℤ[M]} ℤ[Q^(1) ⊕ G^n]`, with inclusion `ι^•: B^• → A^•` through relative Frobenius (the Čech-type nerves of K1 Appendix B). If `Q^(1) → Q` is exact and injective (`M → Q` of Cartier type), the projection `pr^•: A^• → B^•` (killing `q ∉ Q^(1)`) has `ι^•∘pr^•` homotopic to the identity as an endomorphism of cosimplicial `A^{•(1)}`-modules, so `B^• ⊗_{A^{•(1)}} M^• → A^• ⊗_{A^{•(1)}} M^•` is a homotopy equivalence for every cosimplicial `A^{•(1)}`-module `M^•`. If moreover `G` is free abelian, `M^• → A^• ⊗_{A^{•(1)}} M^•` is a quasi-isomorphism on associated cochain complexes of `k`-modules.

`M → Q` injective and integral of integral monoids; `Q^(1) → Q` exact and injective (Cartier type); `G` free abelian for the last assertion.

(K1, Appendix B, Proposition B.1 (p. 61); K1, Appendix B, Proposition B.3 (p. 61); K1, Appendix B, Lemma B.4 (pp. 61–62).)

*Needs:* CrystallineCohomology Layer CR.5:log-algebra (integral monoids and Cartier type); Mathlib `CategoryTheory.CosimplicialObject`, `MonoidAlgebra`.

**§8.33 The log crystalline comparison map.**

Let `(A, (p), M_A)` be a bounded prelog prism with `M_A` integral, of rank 1 or with `(A, M_A)` a log ring, `I ⊂ A` a PD ideal containing `p`, and `ψ: (A/I, M_A) → (φ_*A/p, φ_*M_A)` the factorisation of Frobenius. For `(X, M_X)` over `A/I` let `(X^(1), M_X^(1))` be its base change along `ψ`. There is a cocontinuous functor `((X, M_X)/(A, M_A))_δCRYS → ((X^(1), M_X^(1))/(φ_*A, φ_*M_A))_Δ` sending `(B, J, M_B)^a` (with `(B, M_B)` a log ring) to `(φ_*B, (p), M_B^(1))^a`, where `M_B^(1) = M_B ⊔_{M_A, φ_{M_A}} φ_*M_A` with `M_B^(1) → φ_*M_B` induced by `φ_{M_B}`, and `Spf(φ_*B/p) → X^(1)` induced by `ψ_B: B/J → φ_*B/p`. It induces a morphism of ringed topoi `(Shv(δCRYS), φ_*O_δCRYS) → (Shv(log prismatic site of X^(1)), O_Δ)` and hence the crystalline comparison map `Δ_{(X^(1),M^(1))/(φ_*A,φ_*M_A)} → φ_*Ru^δ_{X*}O_δCRYS` of `E_∞-φ_*A`-algebras on `X_ét`, compatible with Frobenius.

The prism ideal is `(p)`; `I` denotes a separate auxiliary PD ideal containing `p`. `M_A` is integral; `(A, M_A)` is of rank 1 or a log ring.

(K1, §6.2 (p. 34–35); K1, §6.2 (p. 35).)

- The cocontinuous functor `((X, M_X)/(A, M_A))_δCRYS → ((X^(1), M^(1))/(φ_*A, φ_*M_A))_Δ`.
- The functor is cocontinuous for the étale topologies.
- The induced map `Δ_{(X^(1),M^(1))/(φ_*A,φ_*M_A)} → φ_*Ru^δ_{X*}O_δCRYS` of `E_∞`-algebras.
- The comparison map is compatible with the Frobenius endomorphisms.
- Natural in `(X, M_X)` and in the base.

**Checks.**

- For `X = Spf(A/I)` with log structure `M_A`, the comparison map is the identity of `φ_*A`.
- With trivial log structures it equals the map of PrismaticCohomology Layer 1's crystalline comparison (BS22 Theorem 5.2).
- For the log point `(k, N → 0)` over `(W(k), (p), N → 0)`, the functor sends the object `(W(k), (p), N)` to (`φ_*W(k), (p), N^(1)`) with `N^(1) = N ⊔_{N, ·p} N`.
- Without the Frobenius twist (sending `(B, J, M_B)` to `(B, (p), M_B)`) one does not get an object over `X: Spf(B/p)` need not map to `X` since only `B/J` does.

*Needs:* §§8.30, 8.18, 8.2; PrismaticCohomology Layer 1 (comparison maps of ringed topoi); CrystallineCohomology Layer CR.5 (PD Frobenius factorization).

**§8.34 Local log crystalline comparison.**

Prove the local log crystalline comparison. In the setting of the comparison map, let `(R, P)` be a smooth prelog ring over `(A/I, M_A)` with `P` integral, `M_A → P` integral, (weakly) finitely generated and of Cartier type (`M_A/M_A^× → P/P^×` integral with exact relative Frobenius `P^(1) → P`), and assume `(R, P)` admits an exact surjection from a smooth lift `(R̃, P̃)` over `(A/p, M_A)`. Then there is a canonical isomorphism `Δ_{(R^(1),P^(1))/(φ_*A,φ_*M_A)} ≅ φ_*RΓ_crys((R, P)/(A, M_A))` of `E_∞-φ_*A`-algebras compatible with Frobenius; by base change the left side is the p-completed base change of `Δ_{(R̃,P̃)/(A,M_A)}` along `φ`.

As in the comparison map; Cartier type of `M_A → P`; existence of the exact surjection from a smooth lift.

(K1, §6, Theorem 6.1 (p. 31); K1, §6.2 (p. 36).)

*Needs:* §§8.33, 8.31–8.32, 8.21, 8.13, 8.29; PrismaticCohomology Layers 0–1; CrystallineCohomology Layer CR.5:log-algebra (Cartier charts).

**§8.35 The log crystalline comparison.**

Prove the log crystalline comparison. Let `(A, (p), M_A)` be a bounded prelog prism with `M_A` integral, of rank 1 or with `(A, M_A)` a log ring, `I` a PD ideal of A containing `p`, and `(X, M_X)` a smooth log scheme over `(A/I, M_A)` of Cartier type (Kato 4.8). Then the crystalline comparison map is an isomorphism of `E_∞-φ_*A`-algebras on `X_ét: Δ_{(X^(1),M_X^(1))/(φ_*A,φ_*M_A)} ≅ φ_*Ru^crys_*O_crys`. Globally, for `I = (p)` and `X` qcqs of Cartier type over `(A/p, M_A): RΓ_logcrys((X, M_X)/(A, M_A)) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_{A,φ_A} A, φ-equivariantly`, as `E_∞-A`-algebras.

The prism ideal is `(p)`; the auxiliary PD ideal `I` contains `p`. The smooth log scheme over `(A/I, M_A)` is of Cartier type. For the displayed global form specialize `I = (p)` and assume `X` qcqs.

(K1, §6, Theorem 6.3 (p. 31); KY, §1, Theorem 2(3) (p. 3).)

**Proof route.** Étale locally on `X` there is a smooth chart of Cartier type and a smooth lift (Remark 6.2, Remark A.19 of CR.5). Apply Local log crystalline comparison and glue: the comparison map is defined globally by The log crystalline comparison map.

*Needs:* §§8.34, 8.33, 8.29; CrystallineCohomology Layer CR.5 and Layer CR.5:log-algebra (local smooth Cartier lifts and crystalline descent).

### 8.36 Log q-PD triples and log q-PD envelopes

Use the complete delta base `A = ℤ_p[[q − 1]]`, `δ(q) = 0`, and its q-PD setting from PrismaticCohomologyPartII §§5.0–5.1. The polynomial q-integer `[p]_q = Σ_(0≤i<p) q^i` is supplied by AInfCohomology §AI.3.3. Use the q-PD pairs of PrismaticCohomologyPartII §§5.2–5.3 with the coefficient and completeness contract in the supplier table. A prelog q-PD triple is `(D, I, M_D)` with `(D, I)` a q-PD pair and `(D, I, M_D)` a `δ_log`-triple; a log q-PD triple is `(D, I, M_{Spf(D)})` arising as `(D, [p]_q, M_D)^a`. Étale maps lift uniquely (Lemma 7.3). For a prelog q-PD triple `(D_1, I_1, M_{D_1})` with integral monoid, a p-completely smooth `(R, P)` over `(D_1/I_1, M_{D_1})` with `M_{D_1} → P` integral and weakly finitely generated admitting a smooth lift, and a surjection `(D_2, M_{D_2}) → (R, P)` as in Lemma 7.4, there is a universal map to a prelog q-PD triple `(D_3, I_3, M_{D_3})` with an exact surjection `M_{D_3} → P` and `D_2/I_2 ≅ D_3/I_3`; `D_3` is `(p, [p]_q)`-completely flat over `D_1`, the construction commutes with completed base change, and `D_3 ⊗̂ D_1/(q − 1)` is the p-completed log PD envelope. This is the log q-PD envelope.

`A = ℤ_p[[q − 1]]`; `(D_1, I_1, M_{D_1})` a prelog q-PD triple with integral `M_{D_1}`. `(R, P) p`-completely smooth over `(D_1/I_1, M_{D_1})`; `M_{D_1} → P` integral and weakly finitely generated; `(R, P)^a` admits a smooth lift over `(D_1, M_{D_1})`. A surjection `(D_{2,0}, M_{D_2}) → (R, P)` over `(D_1, M_{D_1})` satisfies one of: `(i) (D_{2,0}, M_{D_2})` is a `(p, [p]_q)`-completely smooth `δ_log` ring of topologically finite presentation; (ii) `M_{D_1} → M_{D_2}` is injective integral, `M_{D_2}^gp/M_{D_1}^gp` is free abelian, and `D_{2,0}` is `(p, [p]_q)`-completely free over the completion of `D_1 ⊗_{ℤ_(p)[M_{D_1}]} ℤ_(p)[M_{D_2}]`. In `(i), D_2 = D_{2,0}`; in (ii), `D_2` is the completed universal `δ_log` ring generated by `D_{2,0}`. `I_{2,0} = ker(D_{2,0} → R)`, and `I_2` is the `(p, [p]_q)`-completion of `I_{2,0}D_2`.

(K1, §7.1, Definition 7.1 (p. 37); K1, §7.1, Lemma 7.4 (p. 38); K1, §7.1, Example 7.2 (p. 37).)

*Needs:* §8.0d, §8.8, §8.7, §8.4, PrismaticCohomologyPartII Layer 5, CrystallineCohomology Layer CR.5.

- A prelog q-PD triple `(D, I, M_D)` over `ℤ_p[[q − 1]]`.
- For `x ∈ I, γ(x) = φ(x)/[p]_q − δ(x) ∈ I`.
- A p-completely étale `D/I → Ē` lifts uniquely to a prelog q-PD triple `(E, J, M_D)` over `(D, I, M_D)` (Lemma 7.3).
- The log q-PD envelope `(D_3, I_3, M_{D_3})` of Lemma 7.4.
- `D_3` is `(p, [p]_q)`-completely flat over `D_1`.
- `D_3 ⊗̂_{D_1} D_1/(q − 1)` is the p-completed log PD envelope of `I_2/(q − 1)` (CR.5).

**Checks.**

- `(A_inf(O_C), (ξ), O_C♭∖{0})` with `q = [ε]` is a prelog q-PD triple and `ξ = φ^{-1}([p]_q)`.
- At `q = 1` a prelog q-PD triple is the same as a `pre-δ_log`-PD triple (`D p`-torsion free and p-complete, `D/I` classically p-complete, `I` with divided powers).
- For `(R, P) = (D_1/I_1, M_{D_1})` and the identity surjection, the envelope is `(D_1, I_1, M_{D_1})`.
- `(ℤ_p[[q − 1]], (q − 1))` is a q-PD pair but `([p]_q)` cannot be replaced by `(q − 1)` as the prism ideal: `(ℤ_p[[q − 1]], (q − 1))` is not a prism.

**Proof route.** Define q-PD pairs following BS22 §16 (PrismaticCohomologyPartII Layer 5) with the added condition `D/I` classically p-complete. Lemma 7.3: lift étale maps by Lemma 2.13 and BS Lemma 16.5; check `γ(J) ⊂ J` using `γ(x + y)` and `γ(fx)` formulas and completeness.

### 8.37–8.39 Log q-crystalline constructions

**§8.37 The log q-crystalline site.**

Fix a prelog q-PD triple `(D, I, M_D)` with `M_D` integral and `(X, M_X)` smooth over `(D/I, M_D)`. The log q-crystalline site `((X, M_X)/(D, M_D))_qCRYS` is the opposite of the category of log q-PD triples `(E, J, M_{Spf(E)})` from prelog q-PD triples `(E, J, M_E)` over `(D, I, M_D)` with `M_E` integral, with `f: Spf(E/J) → X` over `D/I` and an exact closed immersion `(Spf(E/J), f^*M_X) ↪ (Spf(E), M_{Spf(E)})` over `(D, M_D)`; étale topology; structure sheaf `O_qCRYS: E ↦ E`. Write `RΓ_qCRYS((X, M_X)/(D, M_D))`, a `(p, [p]_q)`-complete `E_∞-D`-algebra with `φ_D`-semilinear endomorphism, and `qΩ_{(X,M_X)/(D,M_D)} := Ru^q_{X*}O_qCRYS` on `X_ét`. For affine `X` with a smooth lift and integral weakly finitely generated chart, the Čech nerve of the log q-PD envelope of a free surjection computes it (Construction 7.8), strictly functorially for `(E_0, M_E) = (D⟨N^R, N^P⟩, M_D ⊕ N^P)`. At `q = 1` it is the `δ_log`-crystalline site.

`(D, I, M_D)` prelog q-PD triple with `M_D` integral; `(X, M_X)` smooth over `(D/I, M_D)`.

(K1, §7.2, Definition 7.5 (p. 39); K1, §7.2, Remark 7.7 (p. 40).)

- The site `((X, M_X)/(D, M_D))_qCRYS`.
- `qΩ_{(X,M_X)/(D,M_D)} = Ru^q_{X*}O_qCRYS`, an `E_∞-D`-algebra on `X_ét` with `φ_D`-semilinear Frobenius.
- For affine `X` with chart and smooth lift, the Čech nerve of a log q-PD envelope computes `qΩ` (Construction 7.8, Remark 7.9).
- The functor from `((X, M_X)/(D/(q − 1), M_D))_δCRYS` and the induced map `qΩ ⊗̂^L D/(q − 1) → Ru^δ_{X*}O_δCRYS`.
- For a strict map `(D, I, M_D) → (D, I′, M_D), qΩ_{(X,M_X)/(D,M_D)} ≅ qΩ_{(X,M_X)_{D/I′}/(D,M_D)}` (Lemma 7.12).

**Checks.**

- For `X = Spf(D/I)` with log structure `M_D, qΩ = D`.
- If `q = 1` in `D` the site is the `δ_log`-crystalline site.
- For (`D/I⟨X⟩, M_D ⊕ N`) with `D` flat over `A, qΩ` is computed by the two-term complex `D⟨X⟩ → D⟨X⟩·dlog X, f ↦ (γ(f) − f)/(q − 1)·dlog X` with `γ(X) =` qX (Construction 7.15 with `S` a point).
- The log q-crystalline site is not the log prismatic site over `(D, ([p]_q))`: its objects carry a q-PD ideal `J` containing the image of the base q-PD ideal `I`, with `γ(J) ⊂ J` and `φ(J) ⊂ [p]_qE`. `J` need not contain `[p]_q` (for example `J = (ξ)` in `A_inf`). The comparison of Theorem 7.13 uses a Frobenius twist.

*Needs:* §§8.36, 8.30; PrismaticCohomologyPartII Layer 5 (q-PD envelopes and Čech descent).

**§8.38 Log q-crystalline cohomology modulo `q − 1`.**

Prove the reduction modulo `q − 1`. The canonical map induces an isomorphism `qΩ_{(X,M_X)/(D,M_D)} ⊗̂^L_D D/(q − 1) ≅ Ru^δ_{X*}O_δCRYS`, and hence with the ordinary big formal log crystalline complex of §8.0d. Its small-site interpretation is the derived inverse limit of the small log crystalline complexes of `X_m` over `D/(q−1,p^m)`, with the induced compatible PD base. If `p` lies in the reduced PD ideal, `X` is already in characteristic `p` and the same `X` occurs at every level. For a general p-adic `X` the reductions `X_m` must be retained.

As in the log q-crystalline site. The reduced PD ideal is the image of the arbitrary base q-PD ideal `I`, not necessarily `(p)`; use the arbitrary PD-base version of CR.5.

(K1, §7.2, Theorem 7.10 (p. 41).)

*Needs:* §§8.37, 8.31, 8.0d; CrystallineCohomology Layer CR.5 (arbitrary PD bases); PrismaticCohomologyPartII Layer 5 (q-PD specialization).

**§8.39 Log q-crystalline versus log prismatic cohomology.**

Prove the log q-crystalline–prismatic comparison. Let `(D, I, M_D)` be a prelog q-PD triple of rank 1 or with `(D, M_D)` a log ring, `ψ_D: (D/I, M_D) → (φ_*D/[p]_q, φ_*M_D)` induced by Frobenius, and `(X^(1), M_X^(1))` the base change of `(X, M_X)` along `ψ_D`. If the mod `p` fibre of `(X, M_X)` is of Cartier type over `(D/(p, I), M_D)`, there is a canonical isomorphism `Δ_{(X^(1),M_X^(1))/(φ_*D,φ_*M_D)} ≅ φ_*qΩ_{(X,M_X)/(D,M_D)}` of `E_∞-φ_*D`-algebras on `X_ét`, relative to the log prism `(φ_*D, ([p]_q), φ_*M_D)`. By base change the left side is the `(p, [p]_q)`-completed base change along `φ_D` of `Δ_{(X̃,M̃)/(D,M_D)}` for a lift.

Cartier type of the mod `p` fibre; rank 1 or log ring base. `M_D` is integral, as fixed in K1 §7.2 before Definition 7.5 (p. 39).

(K1, §7.2, Theorem 7.13 (p. 42).)

**Proof route.** Construct a functor `((X, M_X)/(D, M_D))_qCRYS → ((X^(1), M^(1))/(D, M_D))_Δ` by Frobenius twisting as in The log crystalline comparison map. Show the induced map is an isomorphism by reducing modulo `(q − 1)` (both sides `(p, [p]_q)`-complete) to the log crystalline comparison (The log crystalline comparison) via Log q-crystalline cohomology modulo `q − 1`.

*Needs:* §§8.38, 8.35, 8.33, 8.29, 8.36; PrismaticCohomologyPartII Layer 5 (Frobenius-twisted q-crystalline comparison).

### 8.40 Log q-de Rham complexes

Work over a prelog q-PD base `(D,I,M_D)` with `D` flat over `ℤ_p[[q−1]]`. Let `(R,P)` be integral, weakly finitely generated and log smooth over `(D/I,M_D)`, with a log smooth lift over `(D,M_D)`. The q-PD ideal `I` contains `q−1`. There are two presentations of the computational model, distinguished by the lattice they use.

For a free chart `M_D⊕N^S`, put `E=D⟨N^S⟩`, completed for `(p,[p]_q)`, and write `X_s` for its generators. The automorphisms `γ_s(X_s)=qX_s, γ_s(X_t)=X_t` for `t≠s`, commute. Define `D_s=(γ_s−1)/(q−1)`. Division is integral because `γ_s≡1` modulo `q−1` and `q−1` is regular. Form the completed cochain Koszul complex `K_S(E;D_s)`, with formal exterior basis `e_s=dlog X_s`. Extend the automorphisms and their divided differences to the exactification and the log q-PD envelope `F` of a surjection `(E,M_D⊕N^S)→(R,P)`. This gives `K_S(F;D_s)`. Its terms are `F⊗̂_E Ω^j_{(E,M_D⊕N^S)/(D,M_D)}`; all completions use `(p,[p]_q)`.

For an integral submonoid `N⊂M_D^gp⊕ℤ^S` containing `M_D, E_N` denotes the completed monoid algebra `D⊗_{ℤ_(p)[M_D]}ℤ_(p)[N]`. Ambient `γ_s` and `D_s` still act on its monomials: for relative exponent `a_s∈Z, γ_s(X^a)=q^{a_s}X^a` and `D_s(X^a)=[a_s]_qX^a`, with `[−n]_q=−q^{−n}[n]_q`. They do **not** identify `Ω¹_log(E_N/D)` with `E_N⊗ℤ^S` unless the relative group lattice is identified with that lattice. In particular no ambient `dlog X_s` is declared an integral log form when `X_s` is absent. For such a chart define the **resolved log q-de Rham model** by the completed Čech–Alexander envelope complex of §8.37, using free prelog presentations, exactification and log q-PD envelopes. Ordinary polynomial generators are allowed in these presentations; they are not assigned an unsupported `dlog` basis. On a free log-coordinate presentation the comparison below identifies this model with `K_S(F;D_s)`. Unions of presentations supply its derived maps and independence. This construction includes every integral `N` above; it does not assert that an arbitrary lattice presentation has a free differential basis.

Prove a canonical comparison `qΩ_{(R,P)/(D,M_D)}≃K_S(F;D_s)` for free presentations, and with the resolved model for arbitrary integral charts. These comparisons are natural in `(R,P)`, in presentations, in refinements and in maps identifying coordinates, as morphisms in `D_comp(D)`. Composition and all higher compatibilities are inherited from derived sections on the log q-crystalline site. No ordinary pullback on log forms is used as a q-complex map. Modulo `q−1` the comparison identifies the resolved model with the intrinsic log de Rham complex of the p-completed log PD envelope, and a free presentation with its usual free-coordinate model.

On a free model Frobenius sends `e_s` to `[p]_q e_s`. If `R` is topologically finitely presented and its mod `p` fibre is of Cartier type, the resulting complex has cohomology in [0,r], where `r` is the rank of `Ω¹_log(R/(D/I))`, and the linearised Frobenius induces `φ_D^*qΩ≃Lη_{[p]_q}qΩ`. This statement concerns the intrinsic complex, so auxiliary free presentations with more than `r` generators do not change its amplitude.

(K1, Constructions 7.15–7.16, pp.43–44; Theorem 7.17 and its proof, pp.44–45; Remark 7.18, p.45. The unrestricted ambient-basis reading of Construction 7.15 is replaced here by free presentations. The comparison retains arbitrary integral charts and coordinate identifications.)

*Needs:* §8.36, §8.37, §8.6, §8.38, PrismaticCohomologyPartII Layer 5, CrystallineCohomology Layer CR.5, AInfCohomology Layer AI.1, EnhancedDerivedSheaves Layer E2.

- The commuting ambient automorphisms `γ_s` on `E_N` and their extensions to free-chart q-PD envelopes, with `q` acting as a unit. For a chosen intrinsic generator `Y` the free-chart automorphism is `γ_Y(Y)=qY`.
- The integral operator `D_s=(γ_s−1)/(q−1)`, giving `Σ_sD_s(f)e_s` on a free chart. On an arbitrary `N` its ambient scalar operators are kept separate from intrinsic log forms.
- `K_S(F;D_s)` on free charts, and the completed resolved model on integral charts; a natural comparison from each free presentation to the resolved model.
- For a map of coordinate sets, the q-dependent Koszul map described below; its reduction is ordinary log pullback. It is `D`-linear and is not asserted F-linear in positive degrees.
- The presentation-independent equivalence with `qΩ`, natural for all maps of surjections in the derived category, including coordinate identifications.
- The derived maps for two successive refinements compose to the map for their composite; the comparison supplies coherent homotopies for changing ordering or presentations.
- Reduction gives intrinsic log de Rham cohomology of the p-completed log PD envelope.
- On free coordinates Frobenius sends `dlog X_s` to `[p]_q dlog X_s`.
- Under the Cartier-type and finiteness hypotheses, `φ_D^*qΩ≃Lη_{[p]_q}qΩ`, so Frobenius admits an inverse up to `[p]_q^r`.

**Argument.** For ordered finite `S` and `f:S→T`, write `b_t=Σ_(f(s)=t)a_s`. On `X^a e_s` the merge is `Y^b q^(Σ_(r<s,f(r)=f(s))a_r)e_(f(s))`; extend by exterior powers, killing coincident directions. The telescoping identity `Σ_(f(s)=t)q^(Σ_(r<s,f(r)=t)a_r)[a_s]_q=[b_t]_q` proves the chain equation, also for negative exponents. On the envelope use the commuting operators `∏_(r<s,f(r)=f(s))γ_r` followed by its universal chart map; `δ`-compatibility and identity modulo `I` extend `γ_r` to the q-PD envelope. The identity for `∏γ_r−1` proves the same equation without requiring a monomial grading. Completion and regular `q−1` preserve these integral divided differences (K1 Construction 7.16, p.44).

For a two-direction merge put `A=[a]_q, B=[b]_q, t=q−1`. The first ordering `F` has degree-one coefficients `(1,q^a)`, the reversed ordering `G` has `(q^b,1)`, so `G−F=(tB,−tA)`. With `d⁰(m)=(Am,Bm), d¹(u,v)=Bu−Av`, the homotopy `H²(w)=tw` in the target degree one satisfies `G−F=Hd+dH`. Thus at `a=b=1` the difference on `(u,v)` is `(q−1)(u−v)`. This fixes the sign relative to Conventions; reversing the exterior degree-two basis reverses both `d¹` and `H²`. Larger changes of order are compared through augmented Čech diagrams, with coherent homotopies rather than strict equality of independently ordered maps.

For the comparison use the free presentation's Čech nerve, with coordinates ordered first by simplex slot. Cofaces are coordinate injections, so its semicosimplicial Čech–Koszul diagram is defined integrally. Its zero row computes site sections. Modulo `q−1` the positive rows have the free log differential basis and the classical coordinate contractions (BdJ11 Lemmas 2.15, 2.17 and Example 2.16, pp.5–6); PrismaticCohomologyPartII §5.18's initiality of `Δ_inj→Δ` identifies their totalisations. Reduction commutes with limits since the principal regular quotient is perfect; derived completeness and Nakayama give acyclicity before reduction. Column cofaces are likewise equivalences by log crystalline embedding independence modulo `q−1` and Nakayama. The first-quadrant totalisation therefore maps equivalently to the zero row and zero column.

Apply the operator merge slotwise to these diagrams. Slot injections preserve order within each merging fibre, and newly inserted automorphisms fix the image; hence the map commutes with cofaces. On the zero row it is the envelope map and on the zero column it is the displayed merge. Both comparison projections commute, identifying that merge with the map of site sections, rather than only matching its reduction. Unions compare free presentations and supply higher compatibilities. For arbitrary integral charts use the free prelog envelope Čech model, including ordinary generators, and never invert an ambient lattice index. At `q=1, N=2N⊂Z` uses `Y=X²` and intrinsic `dlog Y` with coefficient one, even at `p=2`; an ambient `X`-basis would give `1+q` and require division by 2. Frobenius and the amplitude conclusion follow from intrinsic log Cartier as in K1 Remark 7.18, p.45.

**Checks.**

- In the free log affine line, `D(X^n)=[n]_q X^n`, including `n=0` and `n=2`.
- Empty relative coordinates give the envelope in degree zero.
- At `q=1` the free operators become `X_s∂/∂X_s`, the merge coefficients all become 1 and the resolved model gives intrinsic log de Rham cohomology.
- Under `X₀,X₁↦X` the q-dependent degree-one map sends `X₀X₁(e₀+e₁)` to `(1+q)X²e`, exactly the differential of `X²`. Ordinary pullback would give `2X²e` and fail by `(q−1)X²e`.
- Swapping the two source coordinates gives coefficients `(q,1)` instead of `(1,q)` on `X₀X₁`. With `d¹(u,v)=Bu−Av, H²(w)=(q−1)w` accounts for `G−F`; strict equality of these chain maps is not a requirement.
- For `N=2N⊂Z` at `p=2`, use its intrinsic generator `Y=X²`. The free presentation in `Y` has differential `Y↦Y dlog Y`. Its ambient-X operator gives `(1+q)Y`, but `e_X` is not an integral log form: converting it to `dlog Y` would divide by 2. The resolved model makes no such conversion and its `q=1` reduction has coefficient 1 in the intrinsic basis.
- For `N=Z` the invertible generator has `D(X^{−1})=−q^{−1}X^{−1}`; a formula using only nonnegative exponents misses this chart.
- On `X^n` the log operator gives `[n]_qX^n`, whereas the ordinary q-derivative gives `[n]_qX^{n−1}`. Dividing by `X` changes the theory and is not permitted at a boundary point.

### 8.41 Comparison with semistable `AΩ`

Prove the comparison with semistable `AΩ`. Let `k` be algebraically closed of characteristic `p, C` the completed algebraic closure of `W(k)[1/p]`, and `X` a p-adic formal scheme over `O_C` that is étale locally étale over `O_C⟨t_0, …, t_r, t_{r+1}^{±1}, …, t_d^{±1}⟩/(t_0⋯t_r − π)` for a nonzero non-unit `π ∈ O_C`, with its canonical log structure `M_X` (Česnavičius–Koshikawa 1.6). Then there is an isomorphism `qΩ_{(X,M_X)/(A_inf,O_C♭∖{0})} ≅ AΩ_X` in `D(X_ét, A_inf)` compatible with Frobenius, where the left side is formed over the prelog q-PD triple `(A_inf, (ξ), O_C♭∖{0})` and the right side is ČK's semistable `A_inf-cohomology`. Since the mod `p` fibre is of Cartier type, `qΩ` is the `(p, μ)`-completed base change of `Δ_{(X,M_X)/(A_inf,O_C♭∖{0})}` along `φ_{A_inf}`; hence `(φ^*_{A_inf}RΓ_Δ((X, M_X)/(A_inf, O_C♭∖{0})))^∧_{(p,φ(ξ))} ≅ RΓ_{A_inf}(X)`.

Semistable formal scheme over `O_C` in the sense of ČK19, with nonzero non-unit chart parameter `π`; `C` algebraically closed; compatible roots fixed as in ČK19 §1.5.

(K1, §8, Theorem 8.1 (p. 45); K1, §8, Remark 8.3 (p. 45); K1, §1, Example 1.5 (p. 4).)

*Needs:* §8.40, §8.39, §8.10, AInfCohomology Layer AI.6, PrismaticCohomologyPartII Layer 5.

**Proof route.** Work étale locally with the ČK presentations `X ↪ Spf(R^□_Σ) × ∏_λ Spf(R_λ)`, each `R_λ = O_C⟨N^{r_λ+1} ⊕ ℤ^{d−r_λ}⟩/(t_{λ,0}⋯t_{λ,r_λ} − p^{q_λ})` giving a small smooth chart.

### 8.42 The semistable `C_st` comparison diagram

Prove the commutativity of the semistable comparison diagram. Let `X` be as in the semistable `AΩ` comparison and proper over `O_C`. The intended commutative comparison diagram has left column `RΓ_logcrys((X,M_X)/(A_crys,O_C♭∖{0})) ≅ RΓ_qCRYS((X,M_X)/(A_inf,O_C♭∖{0})) ⊗^L_{A_inf} A_crys ≅ RΓ(X_ét,AΩ_X) ⊗^L_{A_inf} A_crys`. The right column starts with `RΓ_crys(X_C^ad/B_dR^+) → RΓ_ét(X_C^ad,ℤ_p) ⊗^L_{ℤ_p} B_dR^+`, the period comparison map of ČK19 Proposition 6.8, followed by the usual isomorphism with `RΓ_ét(X_C^ad,A_inf,X_C^ad) ⊗^L_{A_inf} B_dR^+`. The first right-column map is not asserted an isomorphism over `B_dR^+`; it becomes one over `B_dR`. Horizontals are the ČK19 §6.8 maps transported via Theorem 8.1 and Remark 8.4. K1 Theorem 8.5 contains diagram misprints; this target specifies the corrected intended diagram, not the erroneous isomorphism as printed.

`X` proper semistable over `O_C`.

(K1, §8, Theorem 8.5 (p. 49); K1, §8 (p. 49); CK, §6.7; Proposition 6.8 and its diagram, pp. 65–66.)

*Needs:* PadicHodgeTheory §§0.2–0.5, §8.41, §8.40, AInfCohomology Layer AI.6, AInfCohomology Layer AI.0, CrystallineCohomology Layer CR.5.

**Proof route.** Use the corrected diagram of ČK19 Proposition 6.8: its right vertical period map is unlabelled, and its lower comparison arrow is an isomorphism because `φ^{-1}(μ)` is a unit in `B_dR^+`.

### 8.46–8.50 Animated logarithmic theory

**§8.46 Derived log prismatic cohomology.**

Fix a bounded prelog prism `(A, I, M_A)` with `M_A` integral. On the log-free pre-log rings `Σ_{S,T} := (A/I⟨(X_s)_{s∈S}, N^T⟩, M_A ⊕ N^T) (S, T finite)` consider `Σ_{S,T} ↦ Δ_{Σ_{S,T}/(A,M_A)} := RΓ_Δ(Spf(Σ_{S,T})^a/(A, M_A))`, a `(p, I)`-complete commutative algebra in `D(A)` with `φ_A`-semilinear Frobenius. The derived log prismatic cohomology `(R, P) ↦ Δ^L_{(R,P)/(A,M_A)}` is its left Kan extension (animation) to all simplicial (animated) pre-log rings over `(A/I, M_A)`, followed by `(p, I)`-completion; it depends only on the derived p-completion of `(R, P)`; `Δ̄^L := Δ^L ⊗^L_A A/I`. For a log p-adic formal scheme `(X, M_X)` over `(A/I, M_A)`, the étale sheaf `Δ^L_{(X,M_X)/(A,M_A)}` is the `(p, I)`-complete étale sheafification of `U = Spf(R) ↦ Δ^L_{(R,Γ(U,M_X))/(A,M_A)}`; similarly `Δ̄^L` and the conjugate filtration.

Animated pre-log rings as supplied by DerivedDeRhamCohomology §6.20 and CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18 (KY Remark 2.8) built on EDS E5:animation; `(A, I, M_A)` bounded with integral monoid.

(KY, §4.1, Definition 4.3 (p. 33); KY, §4.2, Definition 4.9 (p. 35).)

- The functor `(R, P) ↦ Δ^L_{(R,P)/(A,M_A)}` on animated pre-log (`A/I, M_A`)-algebras, with Frobenius.
- `Δ̄^L := Δ^L ⊗^L_A A/I`.
- On `Σ_{S,T}, Δ^L` agrees with the site-theoretic log prismatic cohomology.
- `Δ^L` preserves sifted colimits and is the unique such extension of its values on log-free algebras (after completion).
- `Δ^L` depends only on the derived p-completion of `(R, P)`.
- The étale sheaf `Δ^L_{(X,M_X)/(A,M_A)}` on a log p-adic formal scheme.
- Functoriality in `(R, P)` and in maps of bounded prelog prisms.

**Checks.**

- For `(A/I⟨N⟩, M_A ⊕ N), Δ̄^L` has `H⁰ = A/I⟨X⟩` and `H¹{1}` free on `dlog X`.
- For `(R, P) = (A/I, M_A), Δ^L = A`.
- For `P = M_A` pulled back from the base, `Δ^L_{(R,M_A)/(A,M_A)} ≅` BS22's `Δ_{R/A}` (PrismaticCohomology Layer 2).
- For `(R, P) = (A/I, N → 0)` over trivial `M_A`, the log cotangent complex is the two-term complex `(A/I → A/I)` with zero differential, in degrees `−1` and 0 (KY Example 2.30, p.19). Thus the first conjugate graded piece has both degree-zero and degree-one cohomology. This does not infer the cohomology of the whole filtered object from a single graded piece.

*Needs:* §§8.19, 8.28; EnhancedDerivedSheaves Layer E5:animation; DerivedDeRhamCohomology §6.20 (`freePrelogResolutions`); PrismaticCohomology Layer 2 (ordinary animation).

**§8.47 Derived log Hodge–Tate comparison.**

Construct the conjugate filtration. For a simplicial pre-log ring `(R, P)` over `(A/I, M_A)`, there is an increasing exhaustive multiplicative filtration `Fil_• Δ̄_{(R,P)/(A,M_A)}` (the conjugate filtration) by derived p-complete objects with `gr_i Δ̄_{(R,P)/(A,M_A)} ≅ (∧^i L_{(R,P)/(A/I,M_A)}{−i}[−i])^∧_p`. Globally, `gr_i Δ̄^L_{(X,M_X)/(A,M_A)} ≅ LΩ̂^i_{(X,M_X)/(A/I,M_A)}{−i}[−i] := (∧^i L_{(X,M_X)/(A/I,M_A)})^∧{−i}[−i]`.

(KY, §4.1, Proposition 4.5 (p. 34); KY, §4.2, Remark 4.10 (p. 36).)

*Needs:* §§8.46, 8.28; DerivedDeRhamCohomology §6.20 (log cotangent complexes and derived exterior powers).

**§8.47a Cotangent invariance under unrestricted logification.**

Prove logification invariance of the log cotangent complex: for a map `(R,P)→(R,Q)` of discrete prelog rings inducing an isomorphism of associated log rings, the relative Gabber complex `L_log((R,Q)/(R,P))` vanishes, without an integrality assumption on either monoid. Transitivity gives the cotangent comparison over any fixed prelog base and hence its completed exterior-power comparison. Extend these natural comparisons through the free prelog resolutions of §8.46 to the animated logification construction. On integral inputs this agrees with DerivedDeRhamCohomology §6.20's logification comparison.

(KY, Lemma 2.10, p.14; Proposition 4.7(2) and proof, pp.34–35.)

*Needs:* DerivedDeRhamCohomology §6.20 (`gabberLogCotangent`, `logCotangentFunctoriality`, `freePrelogResolutions`), EnhancedDerivedSheaves Layer E5:animation, DerivedModuleAlgebra §§1.2–1.5.

**Checks.**

- For a unit-valued chart `N→R, 1↦u∈R^×`, logification gives the trivial log structure and the relative complex vanishes, retaining the specified unit `u`.
- For the nonintegral monoid `{1,e}` with `e²=e` and `e↦1` over `𝔽_p`, logification again gives the trivial log structure and the relative complex is zero. Cancellation in the input monoid is unavailable.
- For the hollow chart `N→k, 1↦0`, logification keeps characteristic `N`. Its relative logification complex is zero, while its cotangent complex over `(k,0)` retains the two terms of §8.46's zero-chart Check.

**§8.48 Basic properties of derived log prismatic cohomology.**

Prove the basic properties of derived log prismatic cohomology: strict pull-back (1), associated-log invariance (2), base change (3), multiplicativity (4) and perfectoid bases (5). Let `(A, I, M_A)` be a bounded prelog prism with `M_A` integral. (1) For derived p-complete simplicial ring `R` over `A/I, Δ_{R/A} ≅ Δ^L_{(R,M_A)/(A,M_A)}` (strict pull-back of the base log structure). (2) `Δ^L` is invariant under passing to the associated log ring: `Δ^L_{(R,P)/(A,M_A)} ≅ Δ^L_{(R,P)^a/(A,M_A)}`. (3) Base change: for a map of bounded prelog prisms `(A, I, M_A) → (A′, IA′, M_{A′})` and `(R′, P′)` the homotopy base change, `Δ^L_{(R,P)/(A,M_A)} ⊗̂^L_A A′ ≅ Δ^L_{(R′,P′)/(A′,M_{A′})}`. (4) Multiplicativity: for the homotopy cofibre product `(R_3, P_3)` of `(R_1, P_1), (R_2, P_2)` over `(A/I, M_A), Δ_1 ⊗̂^L_A Δ_2 ≅ Δ_3`, compatibly with conjugate filtrations (Day convolution); `Δ^L_{−/(A,M_A)}` commutes with all colimits into the infinity category of derived `(p,I)`-complete commutative A-algebras. This is an algebra-valued assertion: the coproduct of two unit A-algebras is `A`, whereas their coproduct as A-modules is `A⊕A`. (5) For `(A/I, M_A)` perfectoid or pseudo-perfectoid, `Δ^L_{(R,P)/A} ≅ Δ^L_{(R,P)/(A,M_A)}`.

As in Derived log prismatic cohomology. Clause (2) uses §8.47a without restricting the input chart to integral monoids.

**Proof route.** For (2), apply §8.47a to the cotangent complexes and their completed exterior powers, then §8.47 to the conjugate graded pieces and derived Nakayama. The comparison is natural through the free resolutions defining the animated functor.

(KY, §4.1, Proposition 4.7 (p. 34); KY, §4.1, Proposition 4.7(3) (p. 34); KY, §6, Remark 6.2 (p. 59).)

*Needs:* §§8.47, 8.16, 8.47a; DerivedDeRhamCohomology §6.20 (`logCotangentFunctoriality`, including homotopy base change); CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18.

**§8.49 Derived and site-theoretic log prismatic cohomology agree for smooth log formal schemes.**

Prove agreement with the site-theoretic cohomology. Let `(A, I, M_A)` be bounded with `M_A` integral and `(X, M_X)` smooth over `(A/I, M_A)`. (1) For affine `U = Spf(R)` in `X_ét, Δ^L_{(X,M_X)/(A,M_A)}(U) ≅ RΓ(((U, M_U)/(A, M_A))_Δ, O_Δ)`. (2) If `P → Γ(U, M_X)` is a smooth chart, `Δ^L_{(R,P)/(A,M_A)} ≅ Δ^L_{(X,M_X)/(A,M_A)}(U)`; in particular for `X = Spf(R)` with smooth chart `M_A → P, Δ^L_{(R,P)/(A,M_A)} ≅ RΓ_Δ((X, M_X)/(A, M_A))` compatibly with Hodge–Tate maps. Hence `Δ^L_{(X,M_X)} ≅ Rν_*O_Δ, RΓ_Δ((X, M_X)/(A, M_A)) ≅ RΓ(X_ét, Δ^L_{(X,M_X)}), Δ̄^L ≅ Rν_*Ō_Δ`, and the derived conjugate filtration is the canonical filtration `τ_{≤i}Δ̄`.

`(X, M_X)` smooth in Koshikawa's sense over a bounded prelog prism with integral monoid.

(KY, §4.2, Proposition 4.12 (p. 36); KY, §4.1, Corollary 4.6 (p. 34).)

*Needs:* §§8.46–8.47, 8.28, 8.48; the natural derived-to-site comparison obtained by augmenting the free prelog resolutions of §8.46 and étale sheafifying their maps to site-theoretic cohomology.

**§8.50 Log quasisyntomic descent.**

Prove log quasisyntomic descent. Let `(A, I, M_A)` be a bounded prelog prism with `M_A` integral. On the small log quasisyntomic site `qSyn_{(A/I,M_A)}` the presheaf `(R, P) ↦ Δ^L_{(R,P)/(A,M_A)}` is a sheaf (with values in `(p, I)`-complete objects of `D(A)`); if `(A/I, M_A)` is a perfectoid pre-log ring, the same holds on `QSyn_{(A/I,M_A)}`. The same holds for each step of the conjugate filtration of `Δ̄^L`.

for the big site, `(A/I, M_A)` perfectoid.

(KY, §4.1, Proposition 4.8 (p. 35).)

**Proof route.** In both cases the p-completion of `∧^i L_{(R,P)/(A/I,M_A)}[−i]` lies in `D^{≥0}(R)` (The log quasisyntomic site). By derived Nakayama and the derived Hodge–Tate comparison, reduce to descent for `(∧^i L)^∧[−i]`.

*Needs:* §8.47 and §§8.43–8.45; CrystallineCohomology §§CR.DDR.6.15, CR.DDR.6.18 (log quasisyntomic sites and cotangent-power descent).

### 8.51 Initial log prisms of semiperfectoid pre-log rings

Prove the initiality of the semiperfectoid log prism (1)–(2), its perfection (3) and p-saturation invariance (4). Let `S = (S, N)` be a semiperfectoid integral pre-log ring and `(R, M) → (S, N)` a map from a perfectoid integral pre-log ring, surjective on rings and modulo units on monoids. Exactify `M♭ → M → N` as `M♭ → M̃ → N` and put `A_inf(R, M̃) := A_inf(R) ⊗̂ ℤ_p⟨M̃⟩` with the bounded rank-1 prelog prism `(A_inf(R, M̃), (ξ), M̃)`. Applying prismatic envelopes to `A_inf(R, M̃) → S` gives a prelog prism (`Δ^init_{S/R}, (ξ), M^init_{S/R} := M̃`) with `S → Δ^init/ξ` and an exact surjection onto `(Δ^init/ξ, N)^a`, and its perfection `Δ^init_{S/R,perf}`. (1) For integral ''log prism'' `(A, I, M_A)` with `S → A/I` and an exact surjection `(A, M_A) → (A/I, N → A/I)^a` there is a unique compatible map `(Δ^init_{S/R}, (ξ), M^init) → (A, I, M_A)`; similarly for the perfections among perfect `A` (resp. perfect log prisms). (2) If `S` is quasiregular semiperfectoid, `Δ_{S/A_inf(R)}` is discrete with a `δ`-structure, `Δ_{S/A_inf(R)} ≅ Δ^init_{S/R}`, the latter is bounded and independent of `R`, giving an initial ''log prism'' `(Δ^init_S, (ξ), M^init_S)` for the category of exact-surjection diagrams. (3) If `S` is semiperfectoid, `Δ_{S/R,perf}` is discrete, a perfect prism, and `Δ_{S/A_inf(R),perf} ≅ Δ^init_{S,perf}`. (4) If moreover `N` is semiperfect (`N♭ → N` surjective), the p-saturation `S^{p-sat}` is semiperfectoid and `Δ_{S/R,perf} ≅ Δ_{S^{p-sat}/R,perf}`.

`S` semiperfectoid integral; `R` perfectoid integral; `(R, M) → (S, N)` surjective on rings and modulo units on monoids.

(KY, §4.3, Proposition 4.14 (p. 38); KY, §4.3, Proposition 4.17 (p. 39); KY, §4.3, Proposition 4.19 (p. 40); KY, §4.3, Corollary 4.21 (p. 41).)

*Needs:* §8.17, §8.44, §8.49, §8.7, §8.48, PrismaticCohomology Layer 2, PrismaticCohomology Layer 0.

**Proof route.** Universality (Proposition 4.14): from `(A/ξ, M_A)^a ≅ (A/ξ, N → A/ξ)^a` and initiality of `A_inf` (Perfect log prisms are perfectoid log rings) build the map, then use the universal property of envelopes.

### 8.52–8.57 Log Nygaard filtration and comparisons

**§8.52 The log Nygaard filtration.**

Let `(A, I, M_A)` be an integral bounded prelog prism and write `Δ^(1)_{(R,P)/(A,M_A)} := Δ_{(R,P)/(A,M_A)} ⊗̂^L_{A,φ_A} A`. For the non-log local setup of KY §5.2 take `A_0 = A⟨X_1,…,X_d⟩` with `δ(X_i)=0` and `R = A_0/(I,f_1,…,f_r)`, where the `f_i` form a p-completely regular sequence relative to `A/I`, and assume `∆^(1)_{R/A_0}` is `(p,I)`-completely flat (Assumption 5.3). In this setup the Nygaard filtration is `Fil^i_N Δ^(1)_{R/A_0} = {x : φ_{R/A_0}(x) ∈ I^iΔ_{R/A_0}}` (Definition 5.5). For the log-free algebra `(R, P) = (A/I⟨N^S⟩, M_A ⊕ N^S)`, choose a surjection `M_A ⊕ N → M_A ⊕ N^S`, exactify it (Construction 5.11) to obtain non-log prismatic cohomologies over the non-perfect base prisms `Ã^•_∞` obtained by extracting p-power roots (Construction 5.9), and define `Fil^i_N Δ^(1)_{(R,P)/(A,M_A)}` as the totalisation of `Fil^i_N Δ_{(A/I)^•/Ã^•_∞} ⊗̂^L_{Ã^•_∞,φ} Ã^•_∞` (Definition 5.13), independent of the choice; extend to `Σ_{S,T}` by Day convolution with BS22's Nygaard filtration. Left Kan extension gives the derived Nygaard filtration `Fil^•_N Δ^{L,(1)}_{(R,P)/(A,M_A)}` on all simplicial pre-log rings, with a filtered Frobenius `φ: Fil^•_N Δ^{L,(1)} → I^•Δ^L` and maps `I ⊗ Fil^{•−1}_N → Fil^•_N`; étale sheafification gives the global Nygaard filtration on `Δ^{L,(1)}_{(X,M_X)/(A,M_A)}` (Constructions 5.25–5.26). It is multiplicative.

`(A, I, M_A)` integral bounded prelog prism; animated pre-log rings (DerivedDeRhamCohomology §6.20 and CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18). The displayed non-log preimage formula is restricted to the §5.2 regular-presentation setup and Assumption 5.3; Proposition 5.7 gives its completed flat base-change compatibility, rather than defining it for arbitrary flat maps.

(KY, §5.2, Assumption 5.3 and Definition 5.5 (pp. 43–44); KY, §5.2, Proposition 5.7 (pp. 45–46); KY, §5.4, Definition 5.13 (p. 49); KY, §5.5 (p. 50); KY, §1 (p. 5).)

- The decreasing multiplicative filtration `Fil^•_N Δ^{L,(1)}_{(R,P)/(A,M_A)}` by `(p, I)`-complete objects.
- The filtered Frobenius `φ: Fil^i_N Δ^{L,(1)} → I^iΔ^L`.
- The maps `I ⊗^L Fil^{i−1}_N → Fil^i_N` (Construction 5.21).
- `Fil^i_N ⊗ Fil^j_N → Fil^{i+j}_N` (Remark 5.20).
- For trivial log structures, `Fil^•_N` is BS22's Nygaard filtration on `Δ^(1)` (PrismaticCohomologyPartII Layer 3).
- Formation of `Fil^•_N` commutes with `(p, I)`-completely flat base change on `A`.
- The global Nygaard filtration on `Δ^{L,(1)}_{(X,M_X)/(A,M_A)}` by étale sheafification.
- On log-free algebras the totalisation is independent of the chosen surjection `M_A ⊕ N → M_A ⊕ N^S`.

**Checks.**

- `Fil^0_N Δ^{L,(1)} = Δ^{L,(1)}`.
- For (`R, P) = (A/I⟨X⟩, M_A`) with trivial `M_A, Fil^•_N` agrees with BS22's Nygaard filtration on `Δ^(1)_{R/A}`.
- For `(R, P) = (A/I⟨N⟩, M_A ⊕ N), gr^1_N Δ^(1) ≅ τ_{≤1}Δ̄{1}`, a two-term object with `H⁰ ≅ R{1}` and `H¹ ≅ R·dlog X`.
- For KY's toy example over `(A_inf, (ξ))` the naive filtration `{x : φ(x) ∈ ξ^iΔ}` on `Δ^(1)_{(S,M)/(A,M_A)}` differs from `Fil^•_N` (KY §5.1).
- `φ(Fil^1_N) ⊂ IΔ` and the induced map `gr^0_N → Δ̄` is the inclusion of `Fil_0 Δ̄ =` (derived) `R`.

*Needs:* §§8.46–8.47, 8.7, 8.21; PrismaticCohomologyPartII Layer 3 (non-log Nygaard and filtered tensor products).

**§8.53 Graded pieces of the log Nygaard filtration.**

Prove the Nygaard graded-piece isomorphism. Let `(A, I, M_A)` be an integral bounded prelog prism and `(R, P)` a simplicial pre-log ring over `(A/I, M_A)`. The Frobenius induces an isomorphism `gr^i_N Δ^{L,(1)}_{(R,P)/(A,M_A)} ≅ Fil_i Δ̄^L_{(R,P)/(A,M_A)}{i}`, where `Fil_i` is the conjugate filtration. For `Σ_{S,T}` this reads `gr^i_N Δ^(1)_{Σ_{S,T}} ≅ τ_{≤i}Δ̄_{Σ_{S,T}}{i}`; globally `gr^i_N Δ^{L,(1)}_{(X,M_X)} ≅ Fil_i Δ̄^L_{(X,M_X)}{i}`, and for `(X, M_X)` smooth over `(A/I, M_A), gr^•_N Δ^(1)_{(X,M_X)/(A,M_A)} ≅ τ_{≤•}Δ̄_{(X,M_X)/(A,M_A)}{•}`.

As in The log Nygaard filtration; smoothness for the last assertion.

(KY, §5, Theorem 5.1 (p. 42); KY, §5.7, Corollary 5.27 (p. 54).)

*Needs:* §§8.52, 8.47, 8.49; PrismaticCohomologyPartII Layer 3 (non-log graded pieces).

**§8.54 The Nygaard–Hodge fibre sequence and Nygaard completeness.**

Prove the Hodge fibre sequence and Nygaard completeness. For a simplicial pre-log ring `(R, P)` over `(A/I, M_A)` there is a functorial fibre sequence `I ⊗^L_A Fil^{•−1}_N Δ^{L,(1)} → Fil^•_N Δ^{L,(1)} → Fil^•_H LΩ̂_{(R,P)/(A/I,M_A)}` of filtered objects, the second map being the derived de Rham specialisation `γ^•` (Construction 5.21, Lemma 5.22). Globally on `X_ét` it holds with the p-complete étale sheafified Hodge-filtered derived log de Rham complex. If `(X, M_X)` is smooth over `(A/I, M_A)` with mod `p` fibre of Cartier type, the right term becomes `Ω^{≥•}_{(X,M_X)/(A/I,M_A)}`; if moreover `X` is qcqs and `Ω¹_log` has finite rank `D`, then for `i ≥ 0` and `j ≥ D` the maps `RΓ(Fil^j_N Δ^(1)) ⊗^L I^i → RΓ(Fil^{i+j}_N Δ^(1))` are isomorphisms and `RΓ(X_ét, Δ^(1))` is complete for the Nygaard filtration.

Derived log de Rham with Hodge filtration from DerivedDeRhamCohomology §6.20 and CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18; Cartier type and finite rank for the last assertions.

(KY, §5.6, Proposition 5.24 (pp.53–54); KY, §5.7, Corollary 5.35 (p. 58).)

*Needs:* §§8.52–8.53, 8.49; DerivedDeRhamCohomology §6.20 (Hodge-filtered log derived de Rham); CrystallineCohomology §§CR.DDR.6.3–CR.DDR.6.18, especially §CR.DDR.6.11 (integral log smooth Cartier-type comparison); PrismaticCohomologyPartII Layer 4 (filtered de Rham specialization).

**§8.55 The `Lη_I` factorisation of Frobenius.**

Prove the `Lη` factorisation of Frobenius. Let `(A, I, M_A)` be bounded with `M_A` integral. (1) If `(R, P)` is p-complete with bounded `p^∞`-torsion and `M_A → P` is a smooth chart over `(A/I, M_A)`, then `gr^i_N Δ^{L,(1)} ≅ τ_{≤i}Δ̄^L{i}` and the Frobenius factors as `Δ^L ⊗̂^L_{A,φ} A = Δ^{L,(1)} → Lη_IΔ^L → Δ^L`; if `M_A → P` is of Cartier type, `Δ^{L,(1)} → Lη_IΔ^L` is an isomorphism identifying the Nygaard filtration with the truncations of the `I`-adic filtration for the Beilinson `t`-structure. (2) For `(X, M_X)` smooth over `(A/I, M_A), U ↦ Lη_I(Δ_{(X,M_X)}(U))` is a sheaf on the affine étale site, defining `Lη_IΔ_{(X,M_X)/(A,M_A)}`; if the mod `p` fibre is of Cartier type, Frobenius induces an isomorphism of étale sheaves `Δ^(1)_{(X,M_X)/(A,M_A)} ≅ Lη_IΔ_{(X,M_X)/(A,M_A)}`, and `RΓ_Δ((U, M_U)/(A, M_A))^(1) ≅ Lη_I RΓ_Δ((U, M_U)/(A, M_A))` for affine `U`.

Smooth log formal algebras in (1), with the stated chart; Cartier type of the chart (1) or of the mod `p` fibre (2); `Lη_I` as supplied by AI.1 through PrismaticCohomologyPartII Layer 3.

(KY, §5.5, Corollary 5.17 (p. 51); KY, §5.7, Proposition 5.29 (p. 55).)

*Needs:* §§8.53–8.54, 8.49, 8.28; PrismaticCohomologyPartII Layer 3 (`Lη` and the Beilinson filtration).

**§8.56 The log de Rham comparison.**

Prove the log de Rham comparison. (1) If `M_A → P` is a smooth chart of Cartier type over `(A/I, M_A), Δ^L_{(R,P)/(A,M_A)} ⊗̂^L_{A,φ} A/I ≅ Ω̂^•_{(R,P)/(A/I,M_A)}` as `E_∞`-algebras in `D(A/I)`. (2) For simplicial pre-log ring `(R, P)` over (`A/I, M_A), Δ^L ⊗̂^L_{A,φ} A/I ≅ LΩ̂_{(R,P)/(A/I,M_A)} (p`-completed derived log de Rham). (3) For `(X, M_X)` smooth over `(A/I, M_A)` with mod `p` fibre of Cartier type, `Δ_{(X,M_X)/(A,M_A)} ⊗̂^L_{A,φ_A} A/I ≅ Ω^•_{(X,M_X)/(A/I,M_A)}` as étale sheaves, and for qcqs `X, RΓ_logdR((X, M_X)/(A/I, M_A)) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗̂^L_{A,φ_A} A/I` as `E_∞-A`-algebras.

`(A, I, M_A)` is bounded with `M_A` integral. Cartier type is required for the smooth-chart clause (1) and the mod-p fibre in the global smooth clause (3); clause (2) applies to every animated pre-log algebra without a Cartier-type assumption.

(KY, §5.5, Corollary 5.18 (p. 51); KY, §1, Theorem 2(4) (p. 3).)

*Needs:* §§8.54–8.55, 8.49, 8.35; DerivedDeRhamCohomology §6.20 (`logDerivedDeRham`); CrystallineCohomology §CR.DDR.6.11 (Cartier comparison).

**§8.57 Frobenius is an isogeny.**

Prove the Frobenius isogeny. Let `(X, M_X)` be smooth over `(A/I, M_A)` with mod `p` fibre of Cartier type. For each `i ≥ 0` there are natural maps `V_i: τ_{≤i}Δ_{(X,M_X)/(A,M_A)} ⊗^L_A I^i → τ_{≤i}Δ^(1)_{(X,M_X)/(A,M_A)}` with `φ∘V_i` and `V_i∘(φ ⊗ 1)` equal to the maps induced by `I^i ⊂ A`. If `X` is qcqs, `V_i: H^i_Δ((X, M_X)/(A, M_A)) ⊗_A I^i → H^i(RΓ_Δ ⊗̂^L_{A,φ_A} A)` inverts Frobenius up to `I^i`; for `I = (d)` principal, `φ∘V_i = V_i∘φ = d^i`. If `Ω¹_log` has finite rank `D`, a single `V` inverts `φ` up to `I^D`; in particular the linearised Frobenius `RΓ_Δ ⊗̂^L_{A,φ_A} A → RΓ_Δ` becomes an isomorphism after inverting `I`.

Mod `p` fibre of Cartier type; qcqs for the global maps; finite rank `D` for the uniform bound.

(KY, §5.7, Corollary 5.31 (p. 56–57); KY, §1, Theorem 2(6) (p. 3).)

**Proof route.** From Proposition 5.29 apply BMS1 Lemma 6.9 (`Lη_I` has an inverse up to `I^i` on `τ_{≤i}`, via AI.1) as in BS22 Corollary 15.5 (PrismaticCohomologyPartII Layer 3). Take cohomology for the global maps (Corollary 5.31); uniform bound by Remark 5.32.

*Needs:* §§8.55, 8.28; PrismaticCohomologyPartII Layer 3 (bounded inverse for `Lη`).

### 8.58 Breuil–Kisin cohomology of semistable formal schemes

Let `K` be a totally ramified finite extension of `W(k)[1/p]` with uniformiser `π` and `X` a qcqs semistable formal scheme over `O_K` with canonical log structure `M_X`. Define `RΓ_BK(X) := RΓ_Δ((X, M_X)/(W(k)[[u]], N))` over the Breuil–Kisin prelog prism. Then `(A_inf ⊗^L_{W(k)[[u]]} RΓ_BK(X))^∧_(p,ξ) ≅ RΓ_Δ((X, M_X)_{O_C}/(A_inf, O_C♭∖{0}))`, which together with the semistable `AΩ` comparison is a Breuil–Kisin descent of the `A_inf-cohomology` of `X_{O_C}`; if `X` is proper, `RΓ_BK(X)` is perfect and the base change holds without completion. Its Frobenius is `φ`-semilinear over `u ↦ u^p`, and over `(W(k)[[u]], N)` the Frobenius is an isogeny when the mod `p` fibre is of Cartier type.

`X` qcqs semistable over `O_K`; canonical log structure `M_X = (O_X[1/p])^×` ∩ `O_X`.

(K1, §1, Example 1.6 (p. 5); K1, §1, Example 1.6 (p. 5).)

*Needs:* §8.10, §8.29, §8.28, §8.41, CrystallineCohomology Layer CR.5:log-algebra, §8.57.

- `RΓ_BK(X) := RΓ_Δ((X, M_X)/(W(k)[[u]], N))`.
- `(A_inf ⊗^L_{W(k)[[u]]} RΓ_BK(X))^∧ ≅ RΓ_Δ((X, M_X)_{O_C}/(A_inf, O_C♭∖{0}))`.
- For `X` proper, `RΓ_BK(X)` is a perfect `W(k)[[u]]`-complex.
- Base change along `u ↦ 0` and Frobenius twist gives `RΓ_crys((X_k, M)/(W(k), N))` (The log crystalline comparison).
- The `φ`-semilinear Frobenius over `u ↦ u^p`.

**Checks.**

- For `X = Spf(O_K)` with `M_X = O_K∖{0}, RΓ_BK(X) = W(k)[[u]]`.
- If `X` is smooth over `O_K` (no boundary), `M_X` is pulled back from `O_K∖{0}`, and `RΓ_BK(X)` agrees with the non-log prismatic cohomology of `X` over the Breuil–Kisin prism (PrismaticCohomology Layer 1), as the strict case of Basic properties of derived log prismatic cohomology (1).
- For a proper semistable curve with geometrically connected generic fibre, `H⁰(RΓ_BK(X)) = W(k)[[u]]`.
- Using the trivial log structure on a semistable `X` (not smooth over `O_K`) does not give a perfect complex with Hodge–Tate graded pieces `Ω^i_log`; the log structure is essential.

**Proof route.** `(X, M_X)` is smooth over `(O_K, N → π^n)` in Koshikawa's sense (K1 Appendix A, Example (2)), hence over `(W(k)[[u]]/E, N)`. Base change along the map of prelog prisms `u ↦ [π♭]` (The standard prelog prisms) and Completed base change for log prismatic cohomology.

### 8.59 The Kummer étale site of an fs log scheme

Kummer homomorphisms of fs monoids (injective, with a positive power of every target element in the image) and Kummer morphisms of fs log schemes (Kummer on every characteristic stalk) are CrystallineCohomology's (CrystallineCohomology §CR.5:log-algebra.2, Kummer homomorphisms and Kummer morphisms; KatoII Definitions 2.1–2.2). For an fs log scheme `X`, define `X_két` to be the small site whose objects are fs Kummer-étale morphisms `U → X`, with log morphisms over `X` and jointly surjective covering families; `RΓ_két(X, Λ)` is its cohomology. For a pre-log ring `(R[1/p], P)` with `P` saturated (not necessarily fine), `RΓ_két(Spec(R[1/p], P)^a, Λ) := colim_{P_i ⊂ P} RΓ_két(Spec(R[1/p], P_i)^a, Λ)`, over fine saturated submonoids `P_i` (a filtered colimit). Standard covers: for `P → Q` of Kummer type with `Q` fs, `Spec(R ⊗_{ℤ[P]} ℤ[Q], Q)^a → Spec(R, P)^a` is a Kummer étale cover when the index is invertible on `R`.

fs log schemes (CrystallineCohomology Layer CR.5:log-algebra); Kummer-étale coverings are log étale (Kato) and of Kummer type.

(KatoII, §2, Definition 2.1 (p. 6); KatoII, §2, Definition 2.3 (p. 7); KY, §6, after Theorem 6.1 (p. 59).)

*Needs:* Mathlib `CategoryTheory.GrothendieckTopology`, CrystallineCohomology §CR.5:log-algebra.1, CrystallineCohomology §CR.5:log-algebra.2.

- The small Kummer étale site `X_két` of an fs log scheme.
- `RΓ_két(X, Λ)` for a torsion abelian group `Λ`, and its colimit extension to saturated charts.
- For `P → Q` of Kummer type with index invertible, `Spec(R ⊗_{ℤ[P]} ℤ[Q], Q)^a → Spec(R, P)^a` is a covering.
- For trivial log structure `X_két ≃ X_ét`, the small étale site.
- Kummer étale covers are stable under fs base change; morphisms of fs log schemes induce morphisms of sites.
- For constant torsion `Λ`, Kummer étale and full log étale cohomology agree (Nakayama II Proposition 5.4, KY Remark 6.3).

**Checks.**

- For `X` with trivial log structure, `RΓ_két(X, Λ) = RΓ_ét(X, Λ)`. For an algebraically closed field `k`, `Spec k[T] → Spec k` with trivial logs is not an object of this small site: it is not étale; the big category of all fs `X`-schemes contains it.
- The diagonal `N → N², 1 ↦` (1,1), is not a Kummer homomorphism, since no positive multiple of (1,0) lies in its image; its chart base change is log smooth but is not a standard Kummer-étale cover. For `n ≥ 1` the map 1 `↦ n` is Kummer and gives a standard cover once `n` is invertible.
- The empty family covers the empty log scheme.
- For `n > 1` and `K` algebraically closed of characteristic 0 and the log point `X = Spec(K, N → 0)^a, H¹_két(X, ℤ/n) ≅ ℤ/n(−1) ≠ 0 = H¹_ét(Spec K, ℤ/n)`: Kummer étale cohomology is not étale cohomology of the underlying scheme.

**Proof route.** Use CrystallineCohomology's Kummer morphisms (Kato II Definitions 2.1–2.2). Show coverings are stable under fs base change and composition (Kato II Lemma 2.4, Nakayama 2.2.2) so they define a Grothendieck topology (Kato II Definition 2.3 (i)′).

### 8.60–8.61 Fs log adic Kummer geometry

**§8.60 Fs log adic Kummer foundations.**

Construct log structures on an étale-sheafy adic space `X`, as a carrier shared by every log adic consumer: a log structure is a sheaf of commutative monoids `M→O_X` on `X_ét` whose inverse image of `O_X^×` maps isomorphically to `O_X^×`. Construct logification as the sheaf pushout along those units, with its adjunction to inclusion of log structures, unit, counit and idempotence. Construct log pullback by pulling back the prelog sheaf and then logifying; give the identity and composition isomorphisms and their coherence. An integral chart is an adic chart `P→M` identifying the associated log sheaf whose map to `O_X` factors through `O_X^+`; fs means fs charts exist étale locally. Strictness means the pullback log structure maps isomorphically to the source log structure. For locally noetherian fs `X`, construct the shared Kummer-étale site `X_két`: it consists of fs Kummer log-étale spaces over `X` with jointly surjective coverings, using fs fibre products. The interfaces below use this site and these log structures. A Kummer map is injective on sharp characteristic stalks and every target element has a positive power in the image. `Loc_Λ(X_két)` consists of finite locally free `Λ-sheaves`; in the finite-free convention of KYcorr a `ℤ_p`-local system is a compatible inverse system of finite free `ℤ/p^n`-local systems, `n≥1` (DLLZ Definition 6.3.1 also permits finitely generated torsion stalks). For `ε:X_két→X_ét` and `n` invertible on `X, R^iε_*(ℤ/n)≅∧^i(M̄_X^gp/nM̄_X^gp)(−i)`, including `i=0`. Local log inertia at a geometric point `ξ` is `Hom(M̄_ξ^gp,Ẑ′(1))`; its continuous action computes higher direct-image stalks. These noetherian site/cohomology claims do not impose noetherianity on the separate perfectoid log adic construction.

Basic log definitions require an étale-sheafy adic space; both locally noetherian and perfectoid adic spaces have this property. The Kummer site, inertia and higher direct-image statements here require locally noetherian fs spaces; torsion coefficient index `n` is positive and invertible on the base. The cup-product formula keeps the Tate twist: `∧^i R^1ε_*μ_n` maps to `R^iε_*(μ_n^{⊗i})`. The untwisted `μ_n`-only formula does not give the degree-i coefficient system.

(DLLZ, Definition 2.2.2, Remark 2.2.3 and Definition 2.3.1, pp. 8–9, 13; §4.1, pp. 41–47; Theorem 4.4.15 and Corollaries 4.4.18, 4.4.22, pp. 61–63; Lemma 4.4.27, (4.4.28) and Lemma 4.4.29, pp. 64–65; KYcorr, Setup before Definition 4 (pp. 2–3).)

- The category of fs Kummer log-étale objects over a locally noetherian fs log adic space, underlying the shared Kummer-étale site.
- The topology of families jointly surjective on underlying spaces, with fs pullbacks.
- The shared finite locally free `Λ-sheaves` on the Kummer-étale site; `ℤ_p` coefficients are read as compatible finite-free positive levels.
- Derived Kummer-étale cohomology with constant finite torsion coefficients.
- For trivial logs the Kummer-étale site is equivalent to the ordinary étale site.
- For a geometric point, `R^iε_*(ℤ/n)` is the i-th exterior characteristic group modulo `n` with twist `(−i)`.

**Checks.**

- Logifying the one-element prelog sheaf gives `O_X^×`. On `Spa(ℚ_p,ℤ_p)`, both `1↦p` and `1↦p⁻¹` logify to the trivial log structure, but only the former is an integral chart.
- For the log disc with chart `1↦T`, the characteristic is `N` at the origin and zero off it. Pullback to the origin retains characteristic `N`; identity and composite pullbacks preserve the associated log structure.
- The Kummer site of a noetherian adic space with trivial log recovers its ordinary étale site.
- At a geometric rank-one log point over an algebraically closed complete characteristic-zero field, `H¹` of constant `ℤ/n` is noncanonically `ℤ/n, n>1`.
- The same underlying geometric point with trivial log has zero `H¹` of constant `ℤ/n, n>0`.

*Needs:* AdicEtaleGeometry §§A1.6, A1.9 (étale sites and structure sheaves); CrystallineCohomology Layer CR.5:log-algebra; Mathlib `CategoryTheory.GrothendieckTopology`; ClassicalAdicEtaleCohomology §§1.2–1.4 (geometric stalks, Cartan–Leray and twists).

**§8.61 Kummer étale cohomology of log schemes and of log adic spaces.**

Prove the scheme–adic Kummer-étale comparison. Let `n ≥ 1` and `Λ = ℤ/nZ` and `(R, P)` a classically p-complete fs pre-log ring with `R` topologically finitely generated over a noetherian ring `A_0`. With `X = Spec(R[1/p], P)^a` and `X^ad = (Spa(R[1/p], R), P)^a` the associated fs log adic space (Diao–Lan–Liu–Zhu), there is a natural isomorphism `RΓ_két(X, Λ) ≅ RΓ_két(X^ad, Λ)`.

Fs pre-log ring; `R` topologically of finite type over a noetherian base; `Spa(R[1/p], R)` is then an adic space. The coefficient modulus `n` is positive; ZMod 0 `= Z` is outside this torsion comparison.

(KY, §6, Lemma 6.5 (p. 60).)

**Proof route.** With `ε: X → X̊` and `ε^ad: X^ad → X̊^ad` the maps to underlying (adic) spaces, by Huber Corollary 3.2.3 and Grothendieck–Serre it suffices that `R^iε^ad_*Λ ≅ f^*R^iε_*Λ` for `f: X̊^ad → X̊`.

*Needs:* §§8.59–8.60; ClassicalAdicEtaleCohomology §2.5 (the sheaf comparison for `X = Spec A^▷`, Huber Theorem 3.2.9, for arbitrary torsion abelian sheaves, specializing its complete-Huber-pair standing hypotheses to `(R[1/p],R)`), and §§1.2–1.4 for stalks and descent; CrystallineCohomology Layer CR.5:log-algebra.

### 8.62 The affine Kummer-étale comparison

Prove the affine Kummer-étale comparison. Let `(A, I = (d))` be a perfect prism with `I ≠ (p)`, and `(R, P)` a p-adically complete pre-log `A/I`-algebra with `P` saturated and `R` of bounded `p^∞`-torsion. For each `n ≥ 1` there is a canonical isomorphism `RΓ_két(Spec(R[1/p], P)^a, ℤ/p^n) ≅ (Δ^L_{(R,P)/A}[1/d]/p^n)^{φ=1}`, functorial in `(R, P)`, where `(−)^{φ=1}` is the derived fibre of `φ − 1`. The base prism may be replaced by any perfect log prism, or by a pre-log prism with `(A/I, M_A)` perfectoid or pseudo-perfectoid (Basic properties of derived log prismatic cohomology (5)); the left side may equally be the full log étale cohomology.

Perfect prism, `I ≠ (p)` (both sides vanish for `I = (p)`); `P` saturated; bounded `p^∞`-torsion.

(KY, §6, Theorem 6.1 (p. 59); KY, §1 (p. 6).)

*Needs:* §8.59, §8.46, §8.48, §8.51, §8.50, [PrismaticCohomologyPartIII §6.4](../PrismaticCohomologyPartIII/README.md#s6-4), [PrismaticCohomologyPartIII §6.5](../PrismaticCohomologyPartIII/README.md#s6-5).

**Proof route.** Descendability (§6.1, Lemma 6.6, Corollary 6.7): the cover `(R, P) → (R_∞, P_∞)` adjoining p-power roots of coordinates and monoid elements makes the log prismatic side satisfy descent.

### 8.62a Completed untilt sheaves and profinite coefficients

Let `Y` be a diamond with a specified map `Y→Spd ℚ_p`. On an affinoid perfectoid `U=Spa(R,R⁺)` in `Y_v` this map chooses a marked untilt `U^♯=Spa(R^♯,R^♯⁺)`. Define the ring sheaves `Ǒ_Y` and `Ǒ⁺_Y` by the sections `R^♯` and `R^♯⁺` on this basis. Restrict to `Y_qproét` to obtain `Ô_Y` and `Ô⁺_Y`. The marked map is part of the data; the characteristic-p diamond alone does not determine these rings. Pullback of marked untilts gives their restriction maps. With `λ:Y_v→Y_qproét`, prove `λ_*Ǒ^(+)_Y=Ô^(+)_Y, Rλ_*Ǒ_Y≃Ô_Y`, and the corresponding almost comparisons for `Ǒ⁺` and its pseudouniformizer quotients. The integral higher direct images are not asserted to vanish exactly.

For a condensed ring `Λ`, represented using Mathlib `Condensed CommRingCat`, use the existing condensed carrier and define `Λ_Y` as inverse image under `Y_qproét→Profinite`, with the finite jointly surjective topology, and similarly on `Y_v`. These geometric morphisms send a profinite set `S` to the relative constant diamond `Y×S`. For a `T₁` topological coefficient ring `Λ`, its v-sheaf has sections `Cont(|U|,Λ)`. For `Λ=ℤ_p` the topology is its p-adic topology. Define its local systems to be sheaves locally isomorphic to `Λ_Y^r` for a finite locally constant rank `r`. Prove `Loc_(ℤ_p)(Y_qproét)≃lim_n Loc_(ℤ/p^n)(Y_qproét)`, and the same on the v-site, with quasi-pro-étale/v equivalence for these coefficients. On a locally spatial `Y`, the finite discrete coefficient local systems also agree with their étale versions. This does not identify p-adic local systems with local systems for the discrete ring `ℤ_p`.

(MW20, Definition 2.1 and equation (2.1.1), p.9; Lemmas 2.7, 2.9, pp.11–12; Definitions 3.1–3.3, pp.16–17; Lemma 3.4 and Proposition 3.5, pp.17–19; Propositions 3.7, 3.9, pp.20–21; Corollary 3.15, pp.23–24. KY, §7.1, pp.71–72.)

*Needs:* DiamondsAndVStacks §§D6.1–D6.3, DiamondsAndVStacks §D6.2, DiamondsAndVStacks §D2.7, DiamondsAndVStacks §§D2.8–D2.9, DiamondsAndVStacks Layer D1, DiamondEtaleCohomology §C0.2, DiamondEtaleCohomology §C0.13, DiamondEtaleCohomology §C0.14, DiamondEtaleCohomology §C2.3, EnhancedDerivedSheaves Layer E1, PerfectoidSpaces Layer P1, and Mathlib `CondensedSet` and `Condensed` applied to `CommRingCat` (Mathlib/Condensed/Basic.lean). The latter reuses the generic condensed-object carrier; it does not require a separately named condensed-ring structure.

- The pair `(Ǒ_Y,Ǒ⁺_Y)` of `v`-ring sheaves associated to the marked map to `Spd ℚ_p`; restrictions along marked morphisms and their composition laws.
- `(Ô_Y,Ô⁺_Y)` with sections `(R^♯,R^♯⁺)` on the quasi-pro-étale affinoid perfectoid basis, and its natural `λ_`* identification.
- The rational exact and integral almost derived `λ_`* comparisons, including the quotient by a global pseudouniformizer.
- If `Y=X^♦` for locally noetherian or perfectoid `X` over `ℚ_p`, then `Ô⁺_Y≃lim_n ν⁻¹O⁺_X/p^n` and `Ô_Y≃Ô⁺_Y[1/p]`.
- `Λ↦Λ_Y` on the quasi-pro-étale and v-sites, compatible with pullback and all limits as well as colimits.
- For `T₁` topological `Λ`, sections on `U` of its constant v-sheaf are `Cont(|U|,Λ)`.
- The inverse-limit equivalence for finite-rank `ℤ_p`-local systems, compatible with base change, tensor products and internal `Hom`; require compatibility along `ℤ/p^(n+1)→ℤ/p^n`.
- Quasi-pro-étale/v equivalence for `ℤ_p` and `ℤ/p^n`, with the discrete-coefficient étale comparison when `Y` is locally spatial.

**Proof route.** Untilting descent from D6 and v-descent from D2 give the sheaves; affinoid perfectoid higher-v-acyclicity computes `λ_`* exactly for rational coefficients and almost for integral coefficients. On a perfectoid pro-étale basis, the untilted plus ring is the p-completion of `colim O⁺(U_i)`. Passing through all `p^n` with integral separatedness gives the exact completed identification, without assuming exact quotient sections at each level (MW20 Lemmas 2.7 and 2.9, pp.11–12).

**Proof route.** On strictly totally disconnected `U`, inverse image evaluates `Λ` on `π₀U`; the site construction gives colimit compatibility, this formula gives limit compatibility, and quotient descent extends the `T₁` continuous-function description. Finite-level local systems descend by finite bases and matrices, and compatible p-power towers trivialize on quasi-pro-étale weakly contractible covers built from w-strictly local covers with extremally disconnected component space. On the v-site use inverse limits of countable trivializing towers; fixed rank and compatible matrices yield `ℤ_p` descent, `Hom` and tensor compatibility (MW20 Lemma 1.2, pp.7–8; Proposition 3.5, pp.18–19).

**Checks.**

- On `U=Spa(C^♭,C^♭⁺)` with the marking supplied by `Spa(C,C⁺)`, the two ring sections are `C` and `C⁺`, rather than `C^♭` and `C^♭⁺`.
- Replacing the marked untilt changes the structure-sheaf construction even though the underlying characteristic-p space and its étale site stay fixed.
- Higher v-cohomology of the integral sheaf is tested in the almost category; exact vanishing is required only after inverting a pseudouniformizer.
- For nonempty `Y`, on `Y×ℤ_p` the coefficient section given by the coordinate `ℤ_p→ℤ_p` is continuous and not locally constant. Replacing p-adic `ℤ_p` by its discrete topology loses this section.
- For `Λ=ℤ/p^n`, continuous maps from a profinite component space are locally constant, recovering the usual finite-coefficient constant sheaf.
- The compatible constant rank-r systems `(ℤ/p^n)^r` recover `ℤ_p^r`; a sequence of objects with no compatible reduction isomorphisms is not an object of the inverse-limit category.

### 8.63 Log diamonds

A log (locally spatial) diamond over `ℚ_p` is a (locally spatial) diamond `Y` with a map `Y → Spd ℚ_p` and a log structure `M_Y → Ô_Y` on the quasi-pro-étale site `Y_qproét`, where `Ô_Y` and `Ô^+_Y` are the completed structure sheaves (for affinoid perfectoid `Y′ = Spa(R, R^+)` quasi-pro-étale over `Y` with untilt `(R^♯, R^{♯+}), Ô_Y(Y′) = R^♯`). A chart is `P → Γ(Y_qproét, M_Y)` inducing `P^a ≅ M_Y` and factoring through `Ô^+_Y`; `(Y, M_Y)` is quasi-coherent (integral, saturated, fine, fs) if such charts exist quasi-pro-étale locally. Maps are assumed to have compatible charts locally (Convention 7.5). Saturation exists for quasi-coherent log diamonds (via perfectoidisation of `R^+ ⊗_{ℤ[P]} ℤ[P^sat]`) and fibre products exist among saturated quasi-coherent (resp. fs) log diamonds; from now on fibre products are saturated fibre products `×^sat`.

Diamonds and their pro-étale presentations are supplied by DiamondsAndVStacks Layer D4; locally spatial quasi-pro-étale pullbacks and fibre products by DiamondsAndVStacks Layer D5; quasi-pro-étale sites by DiamondEtaleCohomology C0.

(KY, §7.2, Definition 7.3 (p. 72); KY, §7.2, Corollary 7.9 (p. 73).)

*Needs:* §8.62a, DiamondsAndVStacks Layer D4, DiamondEtaleCohomology Layer C0, [PrismaticCohomology §2.31](../PrismaticCohomology/README.md#s2-31), CrystallineCohomology Layer CR.5:log-algebra, §8.60, DiamondsAndVStacks Layer D5.

- A diamond `Y → Spd ℚ_p` with a log structure `M_Y → Ô_Y` on `Y_qproét`.
- Charts `P → Γ(Y_qproét, M_Y)` factoring through `Ô^+_Y`, with integral/saturated/fine/fs variants.
- Existence of charts quasi-pro-étale locally (with integral, saturated, fine, fs variants).
- A quasi-coherent log diamond admits a saturation map `(Y^sat, M_Y^sat) → (Y, M_Y)`, terminal among maps from saturated quasi-coherent log diamonds to `(Y, M_Y)`.
- Saturated fibre products exist among saturated quasi-coherent (resp. fs) log diamonds.
- An fs log adic space (DLLZ, from §8.60), locally noetherian or perfectoid, gives an fs log diamond `(X, M_X)^♦`.

**Checks.**

- `Y` with `M_Y = Ô_Y^×` is a saturated quasi-coherent log diamond and its saturation is itself.
- `(Spd(ℚ_p⟨T⟩, ℤ_p⟨T⟩), T^N)^a` is an fs log diamond with chart `N → Ô^+, 1 ↦ T`.
- For an fs log adic space from §8.60, the associated log diamond has the log structure induced by `ν^{-1}` of the étale log structure (KY Example 7.6).
- For `n > 1`, take the log n-th-root cover of the disc over an algebraically closed complete `C`. Its ordinary diamond self-product has branches meeting over `T = 0`; its saturated log self-product is the disjoint union of `n` copies of the root disc after choosing `μ_n(C)`. Over `ℚ_p` this splitting is asserted only after this geometric base change.

**Proof route.** Define the structure sheaves (Mann–Werner) and log structures on `Y_qproét`. Lemma 7.7: for affinoid perfectoid `X` with chart `P → Γ(Ô^+)`, the saturation is `Spa` of the perfectoidisation of `R^+ ⊗_{ℤ_p[P]} ℤ_p[P^sat]` (BS22 Theorem 1.17(1), p.9; integral perfectoidization is PrismaticCohomology §2.31).

### 8.64 The log diamond generic fibre

For a pre-log Huber pair `(R, R^+)` over `(ℚ_p, ℤ_p)` with a monoid map `P → R^+, (Spd(R, R^+), P)^a` denotes the associated log diamond (log structure associated with `P → Ô^+`). For an fs log p-adic formal scheme `(X, M_X)` over `ℤ_p`, its diamond generic fibre `X^♦_η → Spd ℚ_p` carries the fs log structure induced by `M_X`, giving the log diamond `(X, M_X)^♦_η`, functorial in `(X, M_X)`; for p-complete `(R, P)` with bounded `p^∞`-torsion it is `(Spd(R[1/p], R^+), P)^a` with `R^+` the integral closure of `R`. The underlying pre-adic space `Spa(R[1/p], R^+)` need not be sheafy; the log diamond always exists.

Fs log p-adic formal schemes; diamonds of Huber pairs via DiamondsAndVStacks D6.

(KY, §7.2, Example 7.6 (p. 72); KY, §1, footnote 5 (p. 3).)

*Needs:* §8.63, DiamondsAndVStacks Layer D6, CrystallineCohomology Layer CR.5:log-algebra.

- `(X, M_X) ↦ (X, M_X)^♦_η` for fs log p-adic formal schemes.
- `(Spd(R, R^+), P)^a` for a pre-log Huber pair.
- Functoriality in maps of fs log p-adic formal schemes, compatible with composition.
- For trivial `M_X`, the underlying diamond is `X^♦_η` with trivial log structure.
- For `X = Spf(R)` with fs chart `P, (X, M_X)^♦_η ≅ (Spd(R[1/p], R^+), P)^a`.

**Checks.**

- For (`Spf ℤ_p`, trivial) the generic fibre is `Spd ℚ_p` with trivial log structure.
- For `(Spf ℤ_p⟨T⟩, T^N)^a` the generic fibre is `(Spd(ℚ_p⟨T⟩, ℤ_p⟨T⟩), T^N)^a`.
- For p-complete `R` with bounded `p^∞`-torsion whose `Spa(R[1/p], R^+)` is not sheafy, `(Spd(R[1/p], R^+), P)^a` still exists as a log diamond.
- The log diamond generic fibre of `(Spf ℤ_p⟨T⟩, T^N)` is not the punctured disc: its underlying diamond contains `T = 0`; only its Kummer-étale cohomology sees the puncture.

**Proof route.** Use `Spd` of Huber pairs (DiamondsAndVStacks Layer D6) and the induced log structure on the quasi-pro-étale site. Functoriality: maps of charts induce maps of log diamonds (Convention 7.5); glue over affine covers.

### 8.65 Strictly totally disconnected log perfectoid spaces

A strictly totally disconnected log perfectoid space is a strictly totally disconnected perfectoid space `X` (qcqs, every étale cover splits) with a saturated quasi-coherent log structure `M_X` such that `M_X/M_X^×` is uniquely divisible; then `X` is affinoid perfectoid and `Γ(X, M_X)` is saturated and divisible. For such `X, H¹(X, Ô_X^×) = 0` for the pro-étale topology, so `Γ(X, M_X) → Γ(X, M_X/M_X^×)` is surjective for any integral quasi-coherent `M_X`; it suffices that `M_X` be divisible, and `(X, P)^a` is such a space for any divisible saturated `P → Γ(X, Ô^+_X)`.

Strictly totally disconnected perfectoid spaces as in DiamondsAndVStacks D1.

(KY, §7.3, Definition 7.12 (p. 74); KY, §7.3, Lemma 7.11 (p. 73).)

*Needs:* DiamondsAndVStacks Layer D1, §8.63.

- The defining condition: `X` strictly totally disconnected, `M_X` saturated quasi-coherent, `M_X/M_X^×` uniquely divisible.
- `H¹_proét(X, Ô_X^×) = 0` for `X` strictly totally disconnected.
- `Γ(X, M_X) → Γ(X, M_X/M_X^×)` is surjective.
- `(X, P)^a` for `P` divisible saturated with `P → Γ(X, Ô^+_X)`.
- It suffices that `M_X` be divisible (Remark 7.13).

**Checks.**

- Any strictly totally disconnected perfectoid space with trivial log structure is a strictly totally disconnected log perfectoid space.
- For `C` algebraically closed, the chart `Q_{≥0} → O_C` sending 0 `↦ 1` and every `a > 0` to 0 on `Spa(C,O_C)` gives a strictly totally disconnected log perfectoid space: its characteristic monoid is `Q_{≥0}`, which is uniquely divisible.
- On `Spa(C,O_C)`, the chart `N → O_C` with 0 `↦ 1` and every `n > 0` mapping to 0 gives characteristic monoid `N`, so the log perfectoid space is not strictly totally disconnected as a log space. In contrast, 1 `↦ p` gives trivial associated log structure on Ô `= C`, hence is not this non-example.
- The underlying perfectoid space is strictly totally disconnected in the sense of DiamondsAndVStacks D1.

**Proof route.** Lemma 7.11: pro-étale (even v-) vector bundles on perfectoid spaces descend to étale ones (Kedlaya–Liu, Scholze–Weinstein 17.1.8), and line bundles on strictly totally disconnected spaces are trivial; lifts of sections of `M/M^×` form an `Ô^×-torsor`.

### 8.66–8.68 Quasi-pro-Kummer-étale descent

**§8.66 The quasi-pro-Kummer-étale site.**

A locally separated map `f: (Y′, M_{Y′}) → (Y, M_Y)` of saturated quasi-coherent log diamonds is quasi-pro-Kummer-étale (resp. Kummer-étale, finite Kummer-étale) if for every map `(X, M_X) → (Y, M_Y)` from a strictly totally disconnected log perfectoid space, `Y′ ×^sat_Y X` is a perfectoid space and `(Y′ ×_Y X, M) → (X, M_X)` is strict and pro-étale (resp. étale, finite étale); it is surjective if each such pullback is surjective. The quasi-pro-Kummer-étale site `(Y, M_Y)_qpkét` consists of quasi-pro-Kummer-étale maps to `(Y, M_Y)` with jointly surjective coverings. Strict maps are quasi-pro-Kummer-étale iff the underlying map is quasi-pro-étale; the classes are stable under pullback and composition and satisfy cancellation in the following direction: if `g` and g∘f belong to the class, then `f` belongs to the class (no unrestricted two-out-of-three assertion); maps of log diamonds induce morphisms of sites.

Saturated quasi-coherent log diamonds; locally separated maps (as in Scholze).

(KY, §7.3, Definition 7.14 (p. 74); KY, §7.3, Definition 7.18 (p. 75); KY, §7.1, Definition 7.1 (p. 71); §7.3, Proposition 7.16(1) (p. 74).)

- The quasi-pro-Kummer-étale condition on a map, with Kummer-étale and finite Kummer-étale variants.
- The site `(Y, M_Y)_qpkét`.
- A strict map is quasi-pro-Kummer-étale iff its underlying map of diamonds is pro-étale in the quasi sense.
- Stability under composition and saturated pullback. Cancellation in KY Proposition 7.16(4): if `g` and g∘f are quasi-pro-Kummer-étale (respectively Kummer-étale or finite Kummer-étale), then `f` is too.
- A map of saturated quasi-coherent log diamonds induces a morphism of sites.
- For trivial log structures `(Y, M_Y)_qpkét ≃ Y_qproét` (DiamondEtaleCohomology C0).
- `RΓ_qpkét((Y, M_Y), Λ)` for a condensed (discrete or profinite) coefficient ring.

**Checks.**

- `(Spd(ℚ_p⟨T^{1/n}⟩, ℤ_p⟨T^{1/n}⟩), T^{N/n}) → (Spd(ℚ_p⟨T⟩, ℤ_p⟨T⟩), T^N)` is surjective finite Kummer-étale; over a strictly totally disconnected log perfectoid space its saturated pullback is `n` copies indexed by `ℤ/n`.
- With trivial log structures quasi-pro-Kummer-étale maps are quasi-pro-étale maps.
- Identity maps are quasi-pro-Kummer-étale coverings.
- For `n > 1`, the Kummer map `T ↦ T^n` of log discs is Kummer-étale but its underlying map of diamonds is not étale at `T = 0`.

*Needs:* §§8.63, 8.65; DiamondEtaleCohomology Layer C0; DiamondsAndVStacks Layers D4–D5 (quasi-pro-étale sites and pullbacks).

**§8.67 Kummer towers and the comparison of sites.**

Prove the Kummer-tower covering statements (1)–(2) and the site morphisms (3)–(4). For the power-tower assertions (1)–(2), let `P` be an fs monoid with torsion-free group completion (in particular, a sharp fs monoid), `P^{1/n}` the monoid `P` with structure map `a ↦ a^n`, and `P_{Q≥0} := colim_n P^{1/n}`. (1) For `n ≥ 1` and a saturated `Q` with `P ⊂ Q ⊂ P^{1/n}, (Spd(ℚ_p⟨Q⟩, ℤ_p⟨Q⟩), Q) → (Spd(ℚ_p⟨P⟩, ℤ_p⟨P⟩), P)` is surjective finite Kummer-étale. (2) `(Spd(ℚ_p⟨P_{Q≥0}⟩, ℤ_p⟨P_{Q≥0}⟩), P_{Q≥0}) → (Spd(ℚ_p⟨P⟩, ℤ_p⟨P⟩), P)` is surjective quasi-pro-Kummer-étale. (3) For any fs chart `P` and a Huber pair `(R, R^+)` over `(ℚ_p, ℤ_p)` with `P → R^+`, the associated log diamond gives a morphism of sites `(Spd(R, R^+), P)^a_qpkét → (Spec R, P)^a_két`; separately, for any divisible saturated chart `P, (Spd(R, R^+), P)^a_qpkét ≅ Spd(R, R^+)_qproét` and there is a morphism of sites to `(Spec R)_ét`. (4) For `P` fs and `P_∞` divisible saturated over `P`, base change gives `(Spec S)_ét → (Spec R, P)_két` for the saturated base change `(S, P_∞)`.

For (1)–(2), `P` is fs and `P^gp` is torsion free. Without this hypothesis the power construction can fail surjectivity, as the torsion-unit example below shows. For (3)–(4), fs charts and Huber pairs over `(ℚ_p,ℤ_p)`; work locally with sharp charts and treat unit charts separately.

(KY, §7.3, Proposition 7.22 (p. 75); KY, §7.3, Corollary 7.23 (p. 76).)

*Needs:* §§8.66, 8.63, 8.65, 8.59; DiamondsAndVStacks Layers D4–D5; DiamondEtaleCohomology Layer C0 (site morphisms and root-tower descent).

**§8.68 Kummer-étale cohomology of log schemes via log diamonds.**

Prove the comparison with the log scheme. Let `Λ` be a torsion abelian group, `R` a p-complete ring with bounded `p^∞`-torsion, `(R[1/p], R^+)` the associated Huber pair and `P → R` a map from an fs monoid. The comparison map is an isomorphism `RΓ_két((Spec R[1/p], P)^a, Λ) ≅ RΓ_qpkét((Spd(R[1/p], R^+), P)^a, Λ)`. Consequently, for a perfect prism `(A, (d)), R p`-complete over `A/I` with bounded `p^∞`-torsion and `P → R` fs, `RΓ_qpkét((Spd(R[1/p], R^+), P)^a, ℤ/p^n) ≅ (Δ_{(R,P)/A}[1/d]/p^n)^{φ=1}` functorially (and for saturated `P` after defining the left side as a filtered colimit of fs cases).

`Λ` torsion; `R p`-complete with bounded `p^∞`-torsion; `P` fs (saturated via colimit).

(KY, §7.3, Theorem 7.25 (p. 77); KY, §7.3, Corollary 7.27 (p. 77); KY, §7.3, proof of Theorem 7.25 (p. 77).)

**Proof route.** Take `N^J → P` and `P → P_∞` divisible as in Proposition 6.13; `(S, P_∞)` the completed saturated base change. Kummer-étale descent holds for `(Spec S[1/p], P_∞)^a → (Spec R[1/p], P)^a` (Proposition 6.13) and quasi-pro-Kummer-étale descent for the log diamonds.

*Needs:* §§8.67, 8.62, 8.61, 8.59; DiamondEtaleCohomology Layer C0 (quasi-pro-étale descent).

### 8.69 The Kummer-étale comparison

Prove the Kummer-étale comparison. Let `(A, I = (d), M_0)` be a bounded pre-log prism with `(A, I)` perfect and `M_0` an fs monoid; `(X_0, M_{X_0})` a smooth fs log p-adic formal scheme over `(A/I, M_0)` with `X_0` qcqs and mod `p` fibre of `(X_0, M_{X_0}) → (Spf A/I, M_0)^a` of Cartier type (equivalently, saturated in Tsuji's sense); `(A, I, M_A)` a saturated pre-log prism whose associated log prism is perfect, with `(A, M_0) → (A, Γ(Spf A, M_{Spf A}))`; and `(X, M_X)` the base change of `(X_0, M_{X_0})` to `(A/I, M_A)` (also `(X_i, M_{X_i})` to fs submonoids `M_i ⊂ M_A` for which `Γ(Spf A,M_i^a)` contains the image of `M_0` in `Γ(Spf A,M_A^a)`; take the finite-stage base changes through these associated log structures, retaining unit-valued base-chart maps; underlying formal schemes unchanged). Define `RΓ_qpkét((X, M_X)^♦_η, ℤ/p^m) := colim_i RΓ((X_i, M_{X_i})^♦_{η,qpkét}, ℤ/p^m)`. Then there are functorial isomorphisms `RΓ_qpkét((X, M_X)^♦_η, ℤ/p^m) ≅ (RΓ_Δ((X, M_X)/(A, M_A))[1/d]/p^m)^{φ=1} ≅ (RΓ_Δ((X_0, M_{X_0})/(A, M_0))[1/d]/p^m)^{φ=1}`. If moreover `A/I = O_C` (C algebraically closed, `A = A_inf`) and `X` is proper, `RΓ_qpkét((X, M_X)^♦_η, ℤ_p) := lim_m RΓ_qpkét(−, ℤ/p^m)` is a perfect `ℤ_p`-complex with `RΓ_qpkét ⊗^L_{ℤ_p} W(C♭) ≅ RΓ_Δ((X, M_X)/(A, M_A)) ⊗^L_{A_inf} W(C♭)`, and similarly mod `p^m`. Kummer-étale cohomology is not replaced by étale cohomology of the generic fibre unless the log structure is trivial there.

Exactly the setup of KY §7.4 (perfect log prism, fs `M_0`, Cartier-type mod `p` fibre, qcqs `X_0`); properness and `A/I = O_C` for the second part.

(KY, §7.4, Theorem 7.30 (p. 78); KY, §7.4, Corollary 7.31 (p. 80); KY, §1, Theorem 2(5) (p. 3).)

*Needs:* §8.68, §8.62, §8.49, §8.29, §8.15, §8.64, §8.28, PrismaticCohomologyPartIII Layer 6, CrystallineCohomology Layer CR.5:log-algebra.

**Proof route.** Show the presheaves `U ↦ RΓ_qpkét((U, M)^♦_η, ℤ/p^m)` and `U ↦ (Δ(U)[1/d]/p^m)^{φ=1}` are étale sheaves on `X` and compare them on affine `U` with fs charts using Kummer-étale cohomology of log schemes via log diamonds and Derived and site-theoretic log prismatic cohomology agree for smooth log formal schemes.

### 8.70 Kummer-étale local systems

Let `(X, M_X)` be an fs log diamond and pr: `(X, M_X)_qpkét → X_qproét → ∗_proét`. For a condensed ring `Λ` (here `ℤ/p^n` discrete or `ℤ_p` profinite), a sheaf of `pr^{-1}Λ`-modules `F` on `(X, M_X)_qpkét` is constant if `F ≅ pr^{-1}Λ^r` for one finite rank `r`, and locally constant (a `Λ`-local system) if it is constant quasi-pro-Kummer-étale locally. Ranks may vary locally. On a quasicompact strictly totally disconnected underlying perfectoid space, piecewise constant means constant on each member of a finite clopen partition, with a separate rank on each piece. `Loc_Λ(X, M_X)` is the category of `Λ`-local systems; `D^(b)((X, M_X)^♦_η, ℤ_p)` denotes the corresponding category of complexes locally constant with perfect fibres (hypercomplete when `X^♦_η` is quasicompact). Perfect fibres and finite Tor amplitude are local conditions; a disconnected input may carry different perfect fibres and amplitudes on its pieces. The ordinary quasi-pro-étale locally perfect pullback condition in §8.71 retains this convention and imposes no single constant complex on the whole test space.

Condensed coefficient rings `ℤ/p^n` and `ℤ_p`; following Mann–Werner §3.

(KY, §7.5, Definition 7.32 (p. 80).)

*Needs:* §8.62a, §8.66, DiamondEtaleCohomology Layer C0.

- `Loc_Λ(X, M_X)`: locally constant sheaves of `pr^{-1}Λ`-modules on `(X, M_X)_qpkét`.
- The constant local system `pr^{-1}Λ^r`.
- Pullback along maps of fs log diamonds.
- Tensor products and duals of local systems.
- For trivial log structure, `Loc_{ℤ_p}` agrees with quasi-pro-étale `ℤ_p`-local systems (Mann–Werner).

**Checks.**

- `pr^{-1}ℤ_p^r` is a `ℤ_p`-local system of rank `r`.
- The zero sheaf is the local system of rank 0.
- Over an algebraically closed complete `C` and for `n > 1`, let `π` be the finite Kummer-étale n-th-root cover of the log disc. The linear local system `π_*ℤ_p` has rank `n` and nontrivial permutation inertia at `T = 0`, so it does not descend to a local system on the underlying diamond near `T = 0`. The root torsor itself is a torsor under `ℤ_p(1)` in the inverse p-power tower, not a rank-one `ℤ_p`-module local system.
- With trivial log structure these are the quasi-pro-étale `ℤ_p`-local systems of Mann–Werner.
- On `Spd(C) ⊔ Spd(C)` with trivial logs, ranks one and two on the two components give an ordinary local system that is piecewise constant and has no single constant rank. For complexes, `ℤ_p[0]` on the first component and `ℤ_p[1]` on the second give different perfect fibres in the same locally perfect category.

**Proof route.** Define pr and constant sheaves via condensed sets. Local constancy quasi-pro-Kummer-étale locally; morphisms are sheaf maps.

### 8.71–8.72 p-Kummer essential image

**§8.71 p-Kummer local systems.**

Fix a prime `p` and an fs log diamond `(X,M_X)`. A quasi-pro-Kummer-étale `ℤ_p`-local system `L` is p-Kummer if, for every map `(Y,M_Y)→(X,M_X)` admitting compatible charts quasi-pro-étale locally, with `(Y,M_Y)` saturated and characteristic `M_Y/M_Y^× p`-divisible, its pullback is an ordinary quasi-pro-étale `ℤ_p`-local system. Equivalently, after every such pullback whose underlying perfectoid space `Y` is strictly totally disconnected, it is constant on a finite clopen partition of `Y`, with ranks allowed to differ; equivalently, strict quasi-pro-étale locally on `X` with fs chart `P`, pullback to the saturated p-root extension `U_∞=U×_{D⟨P⟩^♦}D⟨P[1/p]⟩^♦` is ordinary quasi-pro-étale locally constant. Strict total disconnectedness here is a condition on the underlying `Y`, with only p-divisibility of the characteristic; it does not require the strictly totally disconnected log perfectoid condition of §8.65. `Loc_Zp^{pKum}` is the full subcategory of these objects. For locally perfect complexes, use the universal ordinary quasi-pro-étale locally perfect pullback condition, equivalently the p-root-chart criterion, to define `D_lisse^{(b),pKum}`; perfect fibres and amplitudes vary locally as in §8.70.

`X` is an fs log diamond; all chart extensions and fibre products are saturated. `ℤ_p` is the profinite condensed coefficient ring. The equivalence of the three tests is KYcorr Lemma 1, not a definition of all Kummer local systems.

(KYcorr, Lemma 1 and Definition 2, pp. 1–2; Example 3, `p`. 2.)

- The full subcategory `Loc_Zp^{pKum}` of Kummer local systems satisfying the universal p-divisible-chart pullback condition.
- P-Kummer iff strict quasi-pro-étale locally the pullback to a saturated `P[1/p]` chart is an ordinary quasi-pro-étale local system.
- P-Kummer iff pullback along every compatible-chart map from a saturated log diamond `(Y,M_Y)` with underlying strictly totally disconnected perfectoid `Y` and p-divisible characteristic `M_Y/M_Y^×` is constant on a finite clopen partition, with a separate finite rank on each piece. No all-integer divisibility hypothesis on the log structure is imposed.
- The constant finite free `ℤ_p`-local system is p-Kummer.
- Pullback along maps of fs log diamonds preserves p-Kummer objects; use compatible fs charts locally and the p-root criterion.
- The p-Kummer subcategory is closed under tensor products and duals, since the chart-local ordinary local systems are.
- For trivial log structure, all ordinary quasi-pro-étale `ℤ_p`-local systems are p-Kummer.

**Checks.**

- Constant `ℤ_p^r` is p-Kummer and has rank `r`, including `r=0`.
- On the geometric log disc over an algebraically closed complete `C/ℚ_p`, the pushforward of `ℤ_p` under the `p^a`-root cover, `a≥1`, is a p-Kummer local system of rank `p^a`: its permutation inertia has p-power order.
- For the `n`-root cover of that log disc, `n>1` and coprime to `p, π_*ℤ_p` is a Kummer local system of rank `n` but not p-Kummer; its inertia image is cyclic of order `n`.
- For a diamond with trivial log structure, the p-Kummer full subcategory is the whole ordinary quasi-pro-étale `ℤ_p`-local-system category.
- For the prime-to-p root cover above, every §8.65 test with all-integer divisible characteristic splits the cover, so those tests alone would accept its permutation local system. In contrast, over the geometric boundary point take the chart `N[1/p]→C` sending every positive element to zero. Its underlying perfectoid is strictly totally disconnected and its characteristic is p-divisible but not n-divisible. The saturated pullback retains the cyclic order-n inertia and fails the strictly-totally-disconnected criterion.
- The identity map on the trivially logged `Spd(C) ⊔ Spd(C)` with ranks one and two satisfies the test using the two clopen components. A single-rank constancy requirement would reject this p-Kummer object.

*Needs:* §§8.70, 8.67, 8.65; DiamondsAndVStacks Layer D1 (strictly totally disconnected underlying perfectoid spaces); Mathlib `CategoryTheory.ObjectProperty.FullSubcategory`.

**§8.72 p-Kummer local inertia criterion.**

Prove the inertia criterion. Let `(X,M_X)` be a locally noetherian fs log adic space over `Spa(ℚ_p,ℤ_p)` and `L` a Kummer-étale `ℤ_p`-local system, meaning a compatible inverse system `L_n` of finite free `ℤ/p^n`-local systems. `L` is p-Kummer on the log adic space iff every local log inertia representation at every geometric `ξ` has pro-p image in `GL(L_ξ)`. This condition is equivalent to the p-Kummer chart condition for its associated local system on `(X,M_X)^♦`. Equivalently, the image in `GL(L_ξ/p^n)` is a p-group for every `n≥1`. In particular, on a smooth characteristic-zero adic space with normal-crossings log boundary, unipotent geometric boundary monodromy on `L⊗ℚ_p` implies this condition.

Locally noetherian fs log adic space over `ℚ_p`; geometric log points and finite free integral coefficient fibres. The unipotent sufficient criterion additionally assumes smooth characteristic-zero space with normal-crossings boundary; it does not claim an equivalence.

(KYcorr, Definition 4, `p`. 3; Proposition 5 and proof, pp. 3–4; Remark 6, `p`. 4; Inoue, Definition B.2, `p`. 66; Lemma B.3 and Proposition B.4 with proof, pp. 66–68.)

**Proof route.** Use §8.60 and Inoue Proposition B.4 (pp. 67–68) to compare all finite-level adic Kummer local systems with their diamond counterparts; form the compatible positive-level system.

*Needs:* §§8.71, 8.60–8.61; Tau Ceti `TauCeti.IsProP`; Mathlib `PadicInt.toZModPow`, `Matrix.GeneralLinearGroup.map`, `IsPGroup`.

### 8.73–8.75 Laurent realizations and proper pushforward

**§8.73 Laurent F-crystals on the absolute saturated log prismatic site.**

Let `(X, M_X)` be a bounded fs log p-adic formal scheme and `(X, M_X)_Δ` its absolute saturated log prismatic site. A Laurent F-crystal is a crystal of vector bundles `E` over `(O_Δ[1/I])^∧_p` on `(X, M_X)_Δ` (a compatible family of finite projective `A[1/I]^∧_p`-modules on objects `(A, I, M_A)^a` with isomorphisms along maps) together with an isomorphism `φ_E: φ^*E ≅ E`. `Vect((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1}` is the category of Laurent F-crystals; `D_perf((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1}` the analogous category of perfect complexes.

Bounded fs log p-adic formal schemes; absolute saturated site with the strict flat topology.

(KY, §7.5, Definition 7.35 (p. 81).)

- The category `Vect((X, M_X)_Δ, O_Δ[1/I]^∧_p)^{φ=1}`.
- The unit object `O_Δ[1/I]^∧_p` with its Frobenius.
- Tensor products and duals.
- Pullback along maps of bounded fs log p-adic formal schemes.
- `Vect(…)^{φ=1} ≃ lim_{(A,I,M_A)} Vect(A[1/I]^∧_p)^{φ_A=1}` over the absolute saturated site (Drinfeld–Mathew).
- The étale realization takes values in `Loc_Zp^{pKum}((X,M_X)^♦_η)`, the full subcategory defined by the p-root-chart condition (KYcorr Theorem 7, `p`. 4).

**Checks.**

- The étale realisation of the unit `O_Δ[1/I]^∧_p` is the constant local system `ℤ_p`.
- For trivial log structure the category agrees with PrismaticCohomologyPartIII Layer 7's Laurent F-crystals (BS F-crystals Definition 3.2).
- The zero crystal is a Laurent F-crystal of rank 0.
- Laurent coefficients are obtained by inverting the `p`rism ideal before `p`-com`p`letion. The elementary inversion test at `I=(p)` over `ℤ_p` makes `p` a unit, whereas `p` is not a unit in `ℤ_p`. This is a test of the inversion ste`p` only: its subsequent `p`-com`p`letion is zero. Integral F-crystals and Laurent F-crystals have different coefficient definitions; no claim that every integral F-crystal fails to induce a Laurent object is made.

*Needs:* §8.20; PrismaticCohomologyPartIII Layer 7 (crystal descent and Laurent coefficients).

**§8.74 Laurent F-crystals and p-Kummer local systems.**

Prove the Laurent equivalence. For a bounded fs log p-adic formal scheme `(X,M_X)`, there are natural equivalences `Vect((X,M_X)_Δ,O_Δ[1/I]^∧_p)^{φ=1} ≃ Loc_Zp^{pKum}((X,M_X)^♦_η)` and `D_perf((X,M_X)_Δ,O_Δ[1/I]^∧_p)^{φ=1} ≃ D_lisse^{(b),pKum}((X,M_X)^♦_η,ℤ_p)`. On the left use the absolute saturated log prismatic site and Laurent coefficients; on the right use the quasi-pro-Kummer-étale site and the p-Kummer restriction. The unit realizes to constant `ℤ_p`.

Bounded fs log p-adic formal scheme, with its log diamond generic fibre. The realization target is the p-Kummer full subcategory of local systems or locally perfect complexes, as in KYcorr Lemma 1 and Definition 2.

(KYcorr, Theorem 7 and proof, `p`. 4; Lemma 1/Definition 2, pp. 1–2; KY, §7.5, original Theorems 7.36–7.37 and proofs, pp. 81–82.)

*Needs:* §§8.73, 8.71, 8.70, 8.17, 8.67, 8.64; PrismaticCohomologyPartIII §7.8 (ordinary Laurent realization).

**§8.75 Smooth proper pushforward of Kummer-étale local systems.**

Prove proper smooth saturated pushforward. Let `f: (X, M_X) → (Y, M_Y)` be a proper smooth saturated morphism of bounded fs log p-adic formal schemes, with smoothness as in §8.0b and mod-p fibre of Cartier type. Retain this Cartier-type hypothesis after the base changes used in §8.69. Then `Rf_*O_Δ` is an F-crystal of perfect complexes on `(Y, M_Y)_Δ` and there is a natural isomorphism `(Rf_*O_Δ)_ét ≅ Rf_{η*}ℤ_p` for `f_η: (X, M_X)^♦_η → (Y, M_Y)^♦_η`; in particular `Rf_{η*}ℤ_p` is locally constant with perfect fibres and commutes with base change `(Z, M_Z) → (Y, M_Y)`. Via the corrected Laurent realization, the resulting locally perfect complex is p-Kummer.

`f` proper, smooth and saturated with Cartier-type mod-p fibre; bounded fs. These hypotheses are carried into each application of §8.69.

(KY, §7.5, Proposition 7.38 and Remark 7.39, pp. 82–84 (published Proposition 7.37); KYcorr, Introduction `p`. 1 and Theorem 7 `p`. 4.)

**Proof route.** Proper Hodge–Tate finiteness and §8.29 give a perfect prismatic crystal. Use §8.57 for its Laurent Frobenius isomorphism, retaining Cartier type on the mod-p fibres. Apply §8.69 after the saturated perfect-log-prism base changes in the proof of KY Proposition 7.38; then §8.74 identifies the realization with `Rf_{η*}ℤ_p` and makes it p-Kummer. Saturation excludes prime-to-p root maps, which meet §8.0b but have forbidden tame inertia.

*Needs:* §§8.74, 8.69, 8.28–8.29, 8.57, 8.20; PrismaticCohomologyPartIII §7.2 (perfect crystal descent).

### 8.76 Étale comparison over `A_inf[1/φ^{-1}(μ)]`

Prove the étale comparison over `A_inf[1/φ^{-1}(μ)]`. Let `C` be algebraically closed with `A_inf = W(O_C♭), ξ = μ/φ^{-1}(μ), μ = [ε] − 1`; `(X_0, M_{X_0})` an fs log p-adic formal scheme smooth and proper over `(Spf O_C, M_0)^a` with mod `p` fibre of Cartier type, base changed to `(X, M_X)` over a perfect log prism `(A_inf, (ξ), M_A)` receiving `M_0`; `M := RΓ_Δ((X_0, M_{X_0})/(A_inf, M_0)) ≅ RΓ_Δ((X, M_X)/(A_inf, M_A)), H^i_Δ := H^i(M), T := RΓ_qpkét((X, M_X)^♦_η, ℤ_p)`. Then for every `i, H^i_Δ ⊗_{A_inf} A_inf[1/φ^{-1}(μ)] ≅ H^i_qpkét((X, M_X)^♦_η, ℤ_p) ⊗_{ℤ_p} A_inf[1/φ^{-1}(μ)]`.

As in KY §8 setup; `C` algebraically closed; properness; Cartier type.

(KY, §8, Proposition 8.3 (p. 86); KY, §8.1 (p. 86).)

*Needs:* §8.69, §8.57, §8.52, AInfCohomology Layer AI.0.

**Proof route.** Lemma 8.5: construct a `φ`-equivariant map `M → T ⊗^L_{ℤ_p} A_inf` compatible with the étale comparison, using the characteristic-p Riemann–Hilbert correspondence of Bhatt–Lurie on the p-completed perfection `(M_perf)^∧_p`.

### 8.76a Log PD deformation and Frobenius rigidity

Fix a perfect field `k` of characteristic `p` and a sharp fs monoid `P`. Construct the log PD deformation base: in `W(k)[P][1/p]`, take the `W(k)`-subalgebra `D₀` generated by `γ_r([m])=[rm]/r!` for `m∈P∖{0}` and `r≥1`, and then take its p-adic completion `D`. The augmentation sends every positive monomial to zero and splits `D→W(k)`; write `J` for its kernel. Use the compatible divided powers on `(p,J)`, and the log chart `P→D, m↦[m]`. Frobenius is Witt Frobenius on `W(k)` and `[m]↦[pm]`. This is the p-torsion-free log PD deformation of the hollow chart; it is not a map from the hollow Witt chart to a nonzero parameter. If the original fs chart has units, localise at the face mapping to units and split off its unit group before taking its sharp monoid `P`. The associated log structure is unchanged, with the unit factors recorded in the chart isomorphism.

A positive integral height on sharp fs `P` bounds all divided-power denominators in each monoid degree; each homogeneous component is a rank-one free `W(k)`-lattice. Thus `D` and `J` are p-regular and the augmentation stays split. The PD sum/product formulas and continuity give the compatible PD structure and its universal property for p-regular p-complete PD targets. This is the p-torsion-free quotient of the compatible PD envelope, not an assertion that arbitrary universal PD envelopes are p-regular. Ordinary PD envelopes and exactification are supplied by DerivedDeRhamCohomology §PD.6 and CrystallineCohomology §CR.5.2; the augmented monoid base and estimates are new.

The required maps and laws are:

- The continuous PD augmentation `D→W(k)` has kernel `J` and its specified `W(k)`-section.
- For a p-torsion-free p-complete PD algebra `B` over `W(k)`, a chart `P→B` sending positive elements into its PD ideal induces a unique continuous PD map `D→B`. This is a map of log bases with the specified chart map.
- Frobenius commutes with the augmentation and with evaluations at rank-one charts, where `φ(α(m))=α(m)^p`.
- For `n≥0, φ^n(J)⊂p^e(n)J`, with `e(n)=(p^n−1)/(p−1)`. On a generator `γ_r([m])`, the coefficient is `(rp^n)!/r!`, whose p-adic valuation is `r e(n)` by Mathlib's `Nat.Prime.multiplicity_factorial_pow` and `Nat.Prime.emultiplicity_factorial_mul`. Products, sums and p-adic limits preserve the bound.

Prove Frobenius rigidity in the derived p-complete category. Let `C` be a derived p-complete `D`-complex with an integral semilinear Frobenius whose linearisation admits an inverse up to one fixed power `p^c`. Put `C₀=C⊗̂ᴸ_D W(k)`, and assume `C₀` is perfect over `W(k)`. Then `C[1/p]→C₀[1/p]` admits a unique `W(k)[1/p]`-linear Frobenius-equivariant section, and its `D[1/p]`-linear extension is an isomorphism

```text
D[1/p]⊗ᴸ_{W(k)[1/p]} C₀[1/p] ≃ C[1/p].
```

Here uniqueness is for this fixed augmented Frobenius base. It is not a claim that changing a logarithmic chart or a period parameter leaves every comparison map unchanged. The section is compatible with morphisms of augmented PD bases preserving the Frobenius and the charts, and with further Frobenius iterates.

**Argument.** Let `K=J⊗̂ᴸ_D C` be the fibre of `C→C₀`. Uniform factorial divisibility gives `φ^n(K)⊂p^e(n)K` in the semilinear derived sense. On the `W(k)`-mapping complex from `C₀` to `K`, compose target Frobenius with inverse source Frobenius; its nth iterate has denominator bound `p^(cn−e(n))`. Since `e(n)−cn→∞`, the geometric series for `1−φ` converges in a fixed p-power multiple of the p-complete mapping complex. Thus its rational Frobenius-equivariant mapping complex is zero, including higher homotopies, and the fibre sequence gives the unique section. This adapts the contraction of CN21 Lemma 2.4 and Theorem 2.6, pp.11–13, to the explicit monoid PD augmentation.

For effectivity clear one denominator `p^a` from the `D`-linearized section and its equivariance homotopy, possible because `D⊗ᴸ_W(k)C₀` is perfect. Enlarge a so its reduction is homotopic to `p^a·id` on `C₀`. The integral `cone E` then reduces to `cone(p^a:C₀→C₀)`, killed by `p^a`; hence `p^a·id_E` factors through `J⊗̂ᴸ_D E`. Its Frobenius is an isogeny with a fixed denominator bound `c′`, by the triangle. Applying `φ^n` and its bounded inverse to the factorization gives `p^(a+c′n)·id_E=p^e(n)u_n`. Choose `n` with `e(n)>a+c′n`; derived p-completeness makes `1−p^(e(n)−a−c′n)u_n` invertible, so `p^(a+c′n)` kills `E`. Therefore `E[1/p]=0`. Naturality follows from uniqueness.

Construct the proper Cartier-type log crystalline complex for a proper fine log smooth integral Cartier-type `Y` over the hollow log point `(k,P)^a`: take `C_D(Y)=RΓ_logcrys(Y/(D,P)^a)` using the completed log PD embeddings of §8.0d. It reduces by derived PD base change to `C_W(Y)=RΓ_logcrys(Y/(W(k),P→0)^a)`, and base changes to every p-torsion-free p-complete PD evaluation of `D`. The latter assertion uses completed derived tensor; it is not an ordinary tensor assertion in the presence of torsion. Log smooth integral local lifts give p-completely flat PD de Rham models. The log Cartier argument supplies a uniform `p^r` inverse to linearised Frobenius, where `r` bounds the rank of `Ω¹_{Y/(k,P)}`. Reduction of `C_W(Y)` modulo `p` is the bounded log de Rham complex of `Y`. Proper coherent cohomology makes its cohomology finite over `k`, so derived completeness lifts it to a perfect `W(k)`-complex. These verify rigidity’s hypotheses for arbitrary sharp fs `P`.

The comparison inputs are Kato, *Logarithmic structures of Fontaine–Illusie*, Theorems 6.4 and 6.10, pp.219,222; Hyodo–Kato, *Semi-stable reduction and crystalline cohomology with logarithmic poles*, Lemma 2.22, Proposition 2.23 and Proposition 2.24, pp.238–242. Kato's derived base change applies to log smooth integral morphisms and flat crystals; properness is used here for the special-fibre finiteness. The `p^r` inverse in Hyodo–Kato Proposition 2.24 is uniform on the finite-level system and therefore remains an inverse up to `p^r` after derived inverse limit and global sections. Colmez–Nizioł's cited one-parameter theorem motivates the rigidity argument; the fs-monoid base, its universal property and the effectivity proof above are additional constructions in this subsection.

The required maps and laws are:

- `C_D(Y)⊗̂ᴸ_D W(k)≃C_W(Y)`, with all base charts retained.
- Evaluation at a positive chart in the PD ideal gives the log crystalline complex of the corresponding base change of `Y`.
- A finite bound on the log differential rank supplies the uniform p-power inverse; integral Frobenius need not be invertible.
- `C_W(Y)` is perfect over `W(k)`; its rational cohomology is finite dimensional.
- Rigidity supplies the rational comparison with the Witt fibre, natural for the specified augmented chart and for Frobenius iterates.

**Checks.**

- For `P=0, D=W(k), J=0`, and rigidity is the identity. This is the trivial-log case.
- For `P=N` and `p=2, φ(t)=t²=2γ₂(t)`, while `φ²(t)=t⁴=24γ₄(t)`, with valuations 1 and 3. The contraction exponent is `(2^n−1)`, not `n`.
- For `P=N²`, the two positive chart generators deform independently. Evaluation sends them to two specified PD elements; no common uniformizer or rational dependence of their valuations is assumed.
- For `P` generated by `(1,0),(1,1),(1,2)` in `ℤ²`, the relation `[1,1]²=[1,0][1,2]` remains in `D` and in every evaluation. The construction does not replace an fs monoid by a free monoid without imposing its relations.
- `C=0` gives the unique zero section and zero scalar extension. For `C=D`, the section is the `W(k)`-structure map and its linearisation is the identity.
- On a two-term bounded free model the `cone` argument uses one common exponent `c'` in both degrees. A collection of unrelated degreewise isogenies without a bound is insufficient for the geometric series.
- Evaluation `t↦[π^♭]^(p^n)` is allowed once `π^(p^n)∈pO_C`, since the parameter then lies in `ker(A_crys→O_C/p)`. Its image under `θ` can still be nonzero. No map from the zero chart over `W(k)` is being inserted.

*Needs:* §8.0d, §8.57, DerivedDeRhamCohomology §§PD.6–PD.7, CrystallineCohomology Layer CR.5, DerivedModuleAlgebra §§1.1–1.9, EnhancedDerivedSheaves Layer E1, EnhancedDerivedSheaves Layer E2, SchemeAndStackFoundations §§2.6, 2.18 (proper coherent cohomology and perfect complexes).

### 8.77 Hyodo–Kato isomorphism for log prismatic cohomology over `A_crys`

Keep the precise §8 setup of KY: `C` is an algebraically closed complete extension of `ℚ_p`; `M₀` is an fs monoid mapping to the global log structure of a saturated perfect log prism over `(A_inf,(ξ))`; and `X₀` is an fs log p-adic formal scheme, smooth and proper over `(O_C,M₀)^a`, with mod-p fibre of Cartier type. Let `(A_crys,(p),M_crys)^a` be the associated log prism, with chart induced from `M₀→A_inf→A_crys`. Write `X₁` for the base change of `X₀` to `(O_C/p,M_crys)^a`. Prove the prismatic–crystalline identification:

```text
φ*RΓ_Δ(X₀/(A_inf,M₀)) ⊗ᴸ_{A_inf} A_crys
  ≃ RΓ_logcrys(X₁/(A_crys,M_crys)),
```

Frobenius-equivariantly, with linearised Frobenius an isomorphism after inverting `p`. Let `k` be the residue field of `C, N` the associated hollow log structure of `(k,M₀)`, and `Y` the special log fibre. For a fixed section `k→O_C/p`, prove the Hyodo–Kato scalar comparison: there is a Frobenius-compatible isomorphism

```text
RΓ_logcrys(Y/(W(k),N)) ⊗ᴸ_{W(k)} A_crys[1/p]
  ≃ RΓ_logcrys(X₁/(A_crys,M_crys))[1/p].
```

Consequently every `H^i(RΓ_Δ(X₀/(A_inf,M₀))⊗ᴸ_{A_inf,φ}A_crys[1/p])` is finite free over `A_crys[1/p]`. The proof of KY Proposition 8.9 composes `(W(k),N)→(A_crys,N)` with `φ^n` into `(A_crys,M_crys)`; when positive elements of `M₀` have nonzero image in `A_inf` this composite is not a map of prelog rings, and the log PD deformation of §8.76a replaces that step. The hollow Witt log structure sends every positive characteristic element to zero and lifts units by Teichmüller representatives. The scalar comparison is an existence assertion with the choices below; no unspecified chart-independent period map is asserted.

(KY, §8 setup, p.85, Propositions 8.8–8.9, pp.89–90; the log PD rigidity used to justify the nonzero-parameter case is §8.76a, with Kato Theorem 6.10, p.222, Hyodo–Kato Proposition 2.24, pp.240–242, and Colmez–Nizioł, Lemma 2.4 and Theorem 2.6, pp.11–13.)

*Needs:* §8.35, §8.29, §8.57, §8.76a, §8.15, CrystallineCohomology Layer CR.5, AInfCohomology Layer AI.0.

**Argument.** Apply log crystalline comparison and completed base change; proper log Hodge–Tate perfectness removes the extra completion in the `A_inf` tensor, and Cartier type supplies its Frobenius isogeny. For scalar comparison choose a rank-one chart using KY Proposition 2.39, p.21: rank one here means `δ_log=0`. Localise at the unit face, split the free groupification of the sharp fs characteristic `P`, and lift its basis to the chart groupification. Positive lifts differ from chart elements only by units, so transport these recorded unit factors to obtain the same associated log base, with `α(m)∈A_inf` satisfying `φ(α(m))=α(m)^p`. This retains nonfree `P`; it does not replace it by `N`.

Descend the finite defining, gluing and chart data of `X₁` over `O_C/p` to the `k`-subalgebra generated by their finitely many coefficients. Their differences from the residues defining `Y` are nilpotent; one common p-power kills this finite collection and its finite descent relations. Enlarge the iterate so `α(m)^(p^n)=0` modulo `p` for every positive chart generator. Cartier-type saturated base change retains the underlying schemes. The uniform crystalline Frobenius isogeny then identifies the rational complex with that of the resulting base change of `Y` (KY Proposition 8.9, pp.89–90). This finite-presentation step is not a map from a zero Witt parameter to a nonzero `A_crys` parameter.

The chosen section `k→O_C/p` lifts perfectly to `O_C^♭`, yielding `W(k)→A_inf→A_crys` compatible with Frobenius. The common augmented PD base `D(P)` of §8.76a has the genuine PD evaluation `m↦α(m)^(p^n)` in `ker(A_crys→O_C/p)`. PD base change evaluates `C_D(Y)`, while rigidity identifies it rationally with `D⊗ᴸ_W(k)C_W(Y)`. Evaluate that isomorphism and use the rational Frobenius of `C_W(Y)` to remove the iterate. Increasing `n` or comparing two augmented PD presentations with the same chosen chart agrees by Frobenius compatibility and uniqueness of the rigid section. Changes of chart retain their unit factors; no equality for unrelated period choices is claimed. Finally `C_W(Y)` is perfect over `W(k)`, so its rational finite-dimensional cohomology tensors to finite free `A_crys[1/p]`-modules. The argument uses arbitrary sharp fs charts, not a semistable-DVR restriction.

**Checks.**

- For `P=0` the common base is `W(k)`, and the argument recovers the trivial-log comparison of BMS1 Proposition 13.21, p.116.
- For `1↦[π^♭]`, there is no direct map `(W(k),N→0)→(A_crys,N→[π^♭]^(p^n))` with the indicated chart map: `θ` sends the target parameter to `π^(p^n)≠0`. The evaluation from `D` is nevertheless defined once `π^(p^n)∈pO_C`, because its positive parameter is in the PD ideal modulo `p`.
- For a positive chart monomial `t=[m]`, `m∈P∖{0}`, in the PD augmentation, `φ^n(t)=(p^n)!γ_(p^n)(t)`, with valuation `(p^n−1)/(p−1)`. At `p=2` the first two valuations are 1 and 3. The monomial estimate extends to the ideal-wide divisibility of §8.76a, exceeding every fixed linear Frobenius-isogeny denominator. The equality itself does not extend to arbitrary elements: at `p=2`, `φ(2T)=2T²` but `2!γ₂(2T)=4T²` in the p-torsion-free PD algebra for `P=N`.
- For `X₀=Spf O_C` with the base log structure pulled back unchanged, both relative complexes consist of their base ring in degree zero. The scalar comparison sends 1 to 1, and there are no relative logarithmic forms.
- The relation `2(1,1)=(1,0)+(1,2)` in the saturated `cone` of §8.76a is respected by the PD evaluation. A proof using independent coordinates without that relation would not give this comparison.

### 8.78 Log prismatic cohomology groups are Breuil–Kisin–Fargues modules

Prove the Breuil–Kisin–Fargues property. In the setting of the étale comparison over `A_inf` (`X` proper over `O_C`, mod `p` fibre of Cartier type, perfect log prism base over `A_inf`), for every `i` the Frobenius-twisted cohomology `φ^*H^i_Δ = H^i_Δ ⊗_{A_inf,φ} A_inf` with its Frobenius is a Breuil–Kisin–Fargues module: a finitely presented `A_inf`-module `N`, free after inverting `p`, with a `φ`-linear `φ_N` inducing `N[1/ξ] ≅ N[1/φ(ξ)]`. Moreover `H^i_Δ ⊗ A_inf[1/φ^{-1}(μ)] ≅ H^i_qpkét((X, M_X)^♦_η, ℤ_p) ⊗ A_inf[1/φ^{-1}(μ)]`.

As in KY §8: `X` proper; Cartier type; `C` algebraically closed.

(KY, §8, Theorem 8.2 (p. 85); KY, §8, Definition 8.1 (p. 85).)

*Needs:* §8.76, §8.77, §8.15, AInfCohomology §AI.2.2, AInfCohomology §AI.5.1, AInfCohomology §AI.5.2.

**Proof route.** Apply the perfect-complex criterion `AInf.cohomology_finiteness_from_periods`, supplied by AInfCohomology §AI.5.2 (BMS1 Corollary 4.20), to the Frobenius twist of the perfect complex `M = RΓ_Δ`; use §AI.2.2 for the BKF definition. For every degree retain both freeness hypotheses, after inverting `pμ` and after scalar extension to `B_crys^+`. Its two inputs are Étale comparison over `A_inf[1/φ^{-1}(μ)]` (Proposition 8.3) and the finite freeness of `H^i(M ⊗_{A_inf,φ} A_crys[1/p])` (Hyodo–Kato isomorphism for log prismatic cohomology over `A_crys`, KY Propositions 8.8–8.9 with the log PD argument of §8.76a). After obtaining finite presentation and freeness after p-inversion, use §8.57 to invert the prism ideal in the linearized Frobenius and obtain the BKF Frobenius localization isomorphism.

### 8.79 Log prismatic cohomology of the standard semistable chart

Prove the following for the standard semistable chart. Let `O_K` be totally ramified over `W(k)` with uniformiser `π` and `R = O_K⟨x_1, …, x_d⟩/(x_1⋯x_r − π) (1 ≤ r ≤ d)` with the canonical log structure given by the chart `P = N^r → R, e_j ↦ x_j (j ≤ r)`, over `(O_K, N → O_K, 1 ↦ π)` via the diagonal 1 `↦ e_1 + ⋯ + e_r` (the standard semistable chart of CrystallineCohomology §CR.5:log-algebra.6, with its actual monoid map recording `π`). Then: (1) `(Spf R, P)^a` is smooth of Cartier type over `(O_K, N)` in Koshikawa's sense, hence over the Breuil–Kisin prelog prism `(W(k)[[u]], (E), N → u)` via `O_K = W(k)[[u]]/(E)`; (2) `H^i(Δ̄_{(R,P)/(W(k)[[u]],N)}){i} ≅ Ω^i_{(R,P)/(O_K,N)}`, a free `R`-module of rank (`d − 1` choose `i`) with basis the wedge products of `dlog x_2, …, dlog x_r, dx_{r+1}, …, dx_d (dlog x_1 = −Σ_{j=2}^r dlog x_j)`; (3) the crystalline comparison over `(W(k), (p), N → 0)`, after `u ↦ 0`, computes the Hyodo–Kato log crystalline cohomology of the special fibre `(Spec k[x_1, …, x_d]/(x_1⋯x_r), N^r)^a`; (4) the de Rham comparison gives `Ω^•_{(R,P)/(O_K,N)}`; (5) base change along `u ↦ [π♭]` gives the `A_inf` log prismatic cohomology of `R_{O_C}`, whose Frobenius twist is ČK's `AΩ` (Comparison with semistable `AΩ`, on the overlap with AInfCohomology Layer AI.6); (6) the Kummer-étale comparison over a perfect log prism computes the Kummer-étale cohomology of the generic fibre, which is étale cohomology because `x_1, …, x_r` are units on `R[1/p]`, so the log structure is trivial there.

1 `≤ r ≤ d`; `k` perfect; the free coordinates `x_{r+1}, …, x_d` carry no log structure.

(K1, Appendix A.1, Example (2) (p. 50); K1, §8, Theorem 8.1 (p. 45).)

*Needs:* §8.28, §8.35, §8.56, §8.58, §8.41, §8.69, CrystallineCohomology Layer CR.5, CrystallineCohomology Layer CR.6, AInfCohomology Layer AI.6.

**Proof route.** Smoothness: `P^gp/N^gp ≅ ℤ^{r−1}` is free; `ℤ[t] → ℤ[x_1, …, x_r], t ↦ x_1⋯x_r` is flat, so `N → P` is integral (Kato 4.1); Zariski locally (on `D(x_j)` or `D(x_j − 1)`) each free coordinate is a unit coordinate, and `R` is étale over `O_K⟨P ⊕ ℤ^{d−r}⟩ ⊗_{O_K⟨N⟩} O_K`; Cartier type since the special fibre is reduced (K1 Appendix A, Example (2); Tsuji).

### Examples

For the semistable node `xy=π`, the relative log differential module has rank one, generated by `dlog x` with `dlog y=−dlog x`. The diagonal chart, rather than two independent base generators, forces that relation. With the trivial monoid the logarithmic targets recover the ordinary ones; the identity section has `δ_log=0` and factor 1. A chart element mapping to zero does not permit cancellation of `α(m)^p`, and its logarithmic delta is not forced to vanish by the compatibility axiom alone. At `p=3` a boundary inertia character of order two acts by −1 on `Z₃`; p-power root covers do not remove it, so it is Kummer but not p-Kummer. At `p=2`, the integer matrix `a=!![0,−1;1,−1]` has determinant one, `a³=1` and `a≠1`. Scalar extension gives an integral order-three action on `ℤ₂²`; its reduction modulo 2 still has order three. At `p=3`, `−1` modulo 3 has order two. Thus these obstructions already occur in the finite-level inertia images. These examples distinguish the corrected Laurent essential image from all Kummer local systems.

**§8.3.** For p-divisible `M, ((ℤ_p{M}_δlog)^∧,M)≅(ℤ_p⟨M⟩,M)` with rank-one chart sections (K1 Example 2.10, p.9).

**§8.4.** The p-adic completion of `(ℤ_(p)[x], x^N)` with `δ_log = 0` is `(ℤ_p⟨x⟩, x^N)` of rank 1. Completion of `(ℤ_p[x],x^N)` at `(p,x)` gives `(ℤ_p[[x]],x^N)`, whereas its p-adic completion is `(ℤ_p⟨x⟩,x^N)`: `Σx^n` lies only in the former. The completely étale map `ℤ_p→W(𝔽_(p²))` extends the zero rank-one `N` chart with Witt Frobenius. The ideal in the completion theorem is finitely generated.

**§8.5.** For a log ring `(A, M)` the construction returns `(A, M)` itself. For `(ℤ_p[[u]], N → u^n)`, the associated log structure is generated by `u` and units, with `δ_log(u·v) = δ_log(v)` for `v` a unit, `δ_log(u) = 0`. For the rank-one zero chart `N→ℤ_p`, logification is `N⊕ℤ_p^×`, with `δ_log(n,v)=δ(v)/v^p`. Unit directions need not have zero logarithmic delta.

**§8.6.** For `(A, M) = (ℤ_p⟨x⟩, x^N)` of rank 1 and `N = x^Z`, the result is `(ℤ_p⟨x⟩[1/x], x^Z)` with `δ_log(x^{-1}) = 0`. Its separate p-completion is `(ℤ_p⟨x^{±1}⟩, x^Z)`. The algebraic localisation itself is not complete: `Σ_{n≥0}p^n x^{-n}` belongs to the completed Laurent ring but not to `ℤ_p⟨x⟩[1/x]`, whose negative exponents are bounded. For `M = N^2` with generators `x, y` and `N` generated by `M` and `t = x/y, A ⊗_{ℤ_(p)[x,y]} ℤ_(p)[y, t] = A[t]/(ty − x)`, with `δ(t) = t^p·δ_log(t)` and `δ_log(t) = (δ_log(x) − δ_log(y))/(1 + p·δ_log(y))`.

For the p-completed free chart with `δ_log(x)=y₀`, extension to `x^Z` gives `δ_log(x⁻¹)=−y₀/(1+py₀)`, which is not `−y₀`.

**§8.11.** For an exact surjection with `J` generated by `I` and a `(p, I)`-completely regular sequence relative to `A`, the envelope is the PrismaticCohomology Layer 0 prismatic envelope with monoid unchanged. Universality is used only for maps to bounded prisms (K1 footnote 8).

**§8.12.** Uniqueness of the factorisation holds since the chart `Γ(Spf(C), M) ×_{N^a} N` is canonical. For trivial log structures the theorem is the universal property of BS22 prismatic envelopes among bounded prisms.

**§8.13.** For the log affine line `(A/I⟨N⟩, M_A ⊕ N)` with lift `(A⟨N⟩, M_A ⊕ N)`, the envelope of the self-product is `(p, I)`-completely flat (used in K1 §5.4). For trivial log structures (2) is BS22 Proposition 3.13 for smooth algebras.

**§8.16.** `(O_C, O_C∖{0}): L̂_{(O_C, O_C∖{0})/ℤ_p}[−1] ≅ O_C{1}` as for the trivial log structure. `(R, N → R, 1 ↦ 0)` is not perfectoid and `L_{(R,N)/R}` lives in degrees `[−1, 0]` (KY Example 2.30): a non-example.

**§8.17.** `(R, M) = (O_C, O_C∖{0})` corresponds to `(A_inf, (ξ), O_C♭∖{0})`. `(R, M) = (O_C, O_C^×)` (trivial log) corresponds to the perfect prism `(A_inf, (ξ))` with trivial log structure.

**§8.21.** For `R=A/I⟨P⟩` one can choose `B₀=A⟨N^P⟩`; this chosen-presentation complex commutes with completed base change of `(A,I)` while `M_A` stays fixed (K1 Remark 4.10, p.22).

**§8.22.** For the trivial base change the statement is tautological. Corollary 5.5 removes the Tor-amplitude hypothesis using Hodge–Tate.

**§8.23.** For `S = R × R` the statement is additivity. For trivial log structures this is BS22 Lemma 4.21.

**§8.24.** For trivial log structures this recovers the statement that the envelope of a smooth lift covers the final object of the relative prismatic site. Lemma 4.14 is the log analogue of BS F-crystals Example 2.6(1).

**§8.25.** For `G′ = G = X_0^Z, C^n` has `X_i/X_0 − 1 = 0` and `H¹ ≅ A/I` generated by `dlog X_0`. For `G = 0` the statement is `H⁰ = A/I` and `H^i = 0` for `i > 0`.

**§8.26.** `η⁰` identifies `H⁰(Δ̄)` with `R`. The class `η¹(dlog X_0)` freely generates `H¹(Δ̄){1}`; after inverting `X_0` it becomes the ordinary class of `dX_0/X_0`. All `H^i(Δ̄)` for `i ≥ 2` vanish, so both the square and the Bockstein of this degree-one generator vanish.

**§8.28.** Log affine line: `H¹(Δ̄){1} ≅ R·dlog X_0`. Semistable chart `O_C⟨t_0, …, t_r, t_{r+1}^{±1}, …, t_d^{±1}⟩/(t_0⋯t_r − π)` over `(A_inf, (ξ), O_C♭∖{0})` (via `π ↦ π♭` and Teichmüller lifts): `H^i(Δ̄){i} ≅ Ω^i_log` is free of rank (`d` choose `i`) with basis the wedge products of `dlog t_1, …, dlog t_d`, since `dlog t_0 = −(dlog t_1 + ⋯ + dlog t_r)`. Trivial log structures recover BS22 Theorem 4.11 (PrismaticCohomology Layer 1).

**§8.29.** Base change along the Breuil–Kisin `→ A_inf` map gives K1 Example 1.6's descent of `A_inf-cohomology`. For proper `X` the Hodge–Tate comparison makes `RΓ_Δ` perfect and the completion is unnecessary.

**§8.31.** For trivial log structures this recovers the comparison used in BS22 Theorem 5.2. For `(A, M_A) = (W(k), N → 0)` it computes Hyodo–Kato log crystalline cohomology of the special fibre.

**§8.32.** For `M = Q` (no new monoid) the statement is trivial. For `M = N → Q = N ⊕ N` by inclusion of the first summand, relative Frobenius is exact and injective and `G ≅ Z`; this is a smooth log affine line over the log base, in the range of the log Cartier computation.

**§8.34.** Trivial log structures: BS22 Theorem 5.2 locally. Log affine line over `(W(k), (p), N → 0)` with `P = N ⊕ N^T`: both sides are the log de Rham complex of `W(k)⟨N^T⟩` with Frobenius twist.

**§8.35.** Let `k` be a perfect field of characteristic `p`. For the crystalline prelog prism `(W(k), (p), N → 0)` and a qcqs smooth Cartier-type log scheme `(X, M_X)` over `(k, N → 0)`, one has `(φ^*_{W(k)}RΓ_Δ((X, M_X)/(W(k), N)))^∧_p ≅ RΓ_logcrys((X, M_X)/(W(k), N))`. For a semistable special fibre this is its Hyodo–Kato log crystalline complex (K1 Theorem 6.3). Trivial log structures recover BS22 Theorem 1.8(1) (PrismaticCohomology Layer 1). The mixed-characteristic lift `Spf W(k)` with the hollow `N` chart is not an input over `A/(p)=k`: `p` is nonzero on that lift.

**§8.37.** Trivial log structures: close to BS22 Remark 16.15(2) (PrismaticCohomologyPartII Layer 5). `q = 1`: the `δ_log`-crystalline site of The `δ_log`-crystalline site.

**§8.38.** Trivial log: the `q = 1` specialisation of q-crystalline cohomology in BS22 §16. Log affine line: the q-de Rham complex reduces to the log de Rham complex.

**§8.39.** Over `(A_inf, (ξ), O_C♭∖{0})` and `X` semistable: `qΩ ≅` the `(p, μ)`-completed base change of `Δ` along `φ` (K1 Remark 8.3). Trivial log structures: BS22 Theorem 16.18 (PrismaticCohomologyPartII Layer 5).

**§8.41.** For `X = Spf(O_C⟨t^{±1}⟩)` (trivial boundary) this is the torus case of BS22 Theorem 17.2 (PrismaticCohomologyPartII Layer 5). For the semistable curve `O_C⟨t_0, t_1⟩/(t_0t_1 − p)` both sides are computed by the same Koszul complexes.

**§8.42.** The diagram is the input to the semistable conjecture `C_st` without ČK19 5.4. For good reduction (`r = 0` everywhere) it specialises to the crystalline diagram of BMS1 §13.

**§8.43.** p-completions of smooth `ℤ_p-` or `O_C`-algebras with trivial pre-log structure are quasisyntomic. If `(R, M)` is a p-completely smooth log algebra over `ℤ_p` (in Koshikawa's sense), or the p-completion of a p-torsion free log complete intersection, then `R ∈ QSyn^prelog` (KY Example 3.4(2)).

**§8.44.** `(R, M)` with `R ∈` QRSPerfd and `M` uniquely p-divisible is in `QRSPerfd^prelog` (KY Example 3.15(1)). `(O_C⟨X^{1/p^∞}, Y^{1/p^∞}⟩/(X − Y), N[1/p] ⊕_N N[1/p])` is log quasiregular semiperfectoid (KY Example 3.15(2)).

**§8.45.** For trivial log structures this is BMS2 Proposition 4.31 (DerivedDeRhamCohomology §§5.1–5.7). The log affine line `(ℤ_p⟨T⟩, T^N)` is covered by `(O_C⟨T^{1/p^∞}⟩, T^{N[1/p]})`.

**§8.47.** For smooth `(R, P)` with a smooth chart the filtration is the canonical filtration `τ_{≤i}`. For trivial log structures this is the derived Hodge–Tate comparison of BS22 §7 (PrismaticCohomology Layer 2).

**§8.48.** For the Breuil–Kisin `→ A_inf` map (3) recovers K1 Example 1.6. (1) shows that strict smooth log schemes have the same prismatic cohomology as their underlying schemes.

**§8.49.** For the log affine line, both sides are computed by the Čech–Alexander complex of K1 §5.4. For trivial log structures this is the agreement of BS22 Construction 7.6 with site-theoretic prismatic cohomology for smooth algebras (PrismaticCohomology Layer 2).

**§8.50.** For trivial log structures this is BMS2/BS22 quasisyntomic descent of derived prismatic cohomology (PrismaticCohomology Layer 2). The descent is not an ordinary flat descent on underlying rings: homologically log flat covers are required (Remark 2.46).

**§8.51.** `S = O_C/p` with trivial monoid: `Δ^init = A_crys`-type envelope; trivial-log case is BS22 §7. For `S=O_C` with trivial log structure, the initial prism is `A_inf`. For `(O_C,N[1/p]→0)`, it is the associated Fontaine log prism with zero `N[1/p]` chart; its characteristic monoid is `N[1/p]`, whereas the trivial-log case has zero characteristic. (4) is the key input of the Kummer-étale comparison: the `φ-fixed` points do not see p-saturation.

**§8.53.** `i = 0: gr^0_N ≅ Fil_0 Δ̄ = R`. Trivial log structures: BS22 Theorem 15.2 (PrismaticCohomologyPartII Layer 3).

**§8.54.** `i = 0: Fil^0` gives `Δ^(1) → LΩ̂`, the de Rham specialisation. Trivial log: BL Proposition 5.2.8 (PrismaticCohomologyPartII Layer 4).

**§8.56.** `(A, I) = (W(k)[[u]], (E))`: base change to the PD envelope `S` and specialisation recovers K1 footnote 7's route. Trivial log: BS22 Theorem 1.8(3) (PrismaticCohomology Layer 1).

**§8.57.** Over `(ℤ_p[[q − 1]], ([p]_q))` this recovers K1 Remark 7.18's inverse up to `[p]_q^r`. Trivial log: BS22 Corollary 15.5 (PrismaticCohomologyPartII Layer 3).

**§8.58.** For good reduction `X (r = 0) RΓ_BK` is BMS2's Breuil–Kisin cohomology (via PrismaticCohomology Layer 1 base change). Specialising along `u ↦ 0` gives the Hyodo–Kato log crystalline cohomology of the special fibre after Frobenius twist (The log crystalline comparison).

**§8.60.** The `n`-root log disc cover, `n>1`, is Kummer-étale; its underlying adic map is ramified at the boundary. At a geometric rank-one log point, `H¹(ℤ/n)=ℤ/n(−1)` and exterior degrees above one vanish.

**§8.61.** For `P` trivial this is Huber's comparison of étale cohomology of `Spec(R[1/p])` and its adic analytification. For `(ℤ_p⟨T⟩, T^N)` both sides compute the Kummer étale cohomology of the closed log disc, retaining its boundary `T = 0`.

**§8.62.** For `P` trivial this is BS22's étale comparison Theorem 9.1 for perfect prisms (PrismaticCohomologyPartIII Layer 6). For `R=O_C⟨X⟩` with `N→R, 1↦X`, the comparison applies to the log affine line (KY Proposition 6.16, p.66). In the associated log adic disc, at the geometric boundary point `X=0`, the logarithmic higher-direct-image stalk `R¹ε_*(ℤ/p^n)` is `ℤ/p^n(−1)`, where `ε` forgets the log structure; this is the boundary-inertia contribution, not a calculation of all global `H¹` (DLLZ Lemmas 4.4.27 and 4.4.29, pp.64–65). As a negative control, `y^p=1+pX` is an ordinary finite étale cover of `Spec(C⟨X⟩): 1+pX` is a unit and `py^(p−1)` is invertible. It has no section, since any root with constant term 1 has formal coefficients `binomial(1/p,m)p^m` of valuation `−v_p(m!)`, which do not tend to `+∞`. Its Kummer class restricts trivially to boundary inertia, whereas the class of `X` has nonzero boundary inertia. Global log `H¹` therefore contains ordinary étale classes as well as the boundary class.

**§8.62a.** The log chart `P→Γ(Y_qproét,Ô⁺_Y)` uses this integral untilt sheaf, and its associated log structure is formed over `Ô_Y`. Its `ℤ_p`-local systems use the continuous constant coefficient sheaf, while every finite level can be computed on the étale site when the log structure is trivial.

**§8.67.** `P = N: T^{1/n}` covers (Lemma 7.21). `P` trivial: the statements reduce to quasi-pro-étale covers. Excluded generality: for `P = ℤ/2Z` and `n = 2, ℚ_p⟨P⟩ = ℚ_p[t]/(t^2−1) ≅ ℚ_p × ℚ_p`. The power-map ring endomorphism `t ↦ t^2 = 1` misses the `t = −1` component on `Spd`, so it is not a surjective Log diamonds cover; the associated log structures are trivial because `P` is a group.

**§8.69.** For `M_A={1}` and `M_0=N→A_inf, 1↦[a]≠1` a unit, the finite stage `M_i={1}` is allowed because its associated log structure contains `[a]`. For `X₀=Spf O_C`, the comparison has `H⁰=ℤ/p^m`. Requiring the unit to lie in the raw monoid would leave no indexing stages. For trivial log structures and smooth `X` this is BS22 Theorem 1.8(4) (PrismaticCohomologyPartIII Layer 6). For a proper semistable formal scheme over `O_C` with canonical log structure, `H^i_qpkét` of the generic fibre (Kummer-étale `=` étale cohomology of the smooth rigid generic fibre since the log structure is trivial there) is computed by the `A_inf` log prismatic cohomology after `⊗ W(C♭)`.

**§8.72.** The `p^a`-root permutation representation has p-group inertia image, while the nontrivial prime-to-p `n`-root permutation representation has image cyclic of order `n` and fails. At each finite coefficient level the trivial representation has trivial (hence p-group) image. A nontrivial arithmetic unramified action with trivial local boundary inertia is allowed: only local log inertia is tested.

**§8.74.** Trivial generic log structure: every ordinary `ℤ_p`-local system is p-Kummer, recovering the ordinary PrismaticCohomologyPartIII Layer 7 equivalences. The permutation local system `π_*ℤ_p` for a `p^a`-root cover of a geometric log disc `(a≥1)` has rank `p^a` and is p-Kummer, so it lies in the essential image. For an `n`-root cover with `n>1` and `gcd(n,p)=1`, the rank-n permutation local system has nontrivial prime-to-p inertia and is not p-Kummer. It is outside the essential image; the unrestricted preprint theorem would incorrectly include it.

**§8.75.** The finite prime-to-p root map of formal log discs, `T↦U^n` with `n>1` and `(n,p)=1`, is proper, integral and log étale, but is not saturated: its characteristic chart is `N→N, 1↦n`. Its rank-n permutation pushforward has prime-to-p inertia and fails the p-Kummer criterion. For `f` the identity, `(O_Δ)_ét = ℤ_p`. Trivial log structures: the relative form of BS F-crystals Corollary 3.8 with smooth proper pushforward (PrismaticCohomologyPartIII Layer 7).

**§8.76.** Trivial log structures: the analogous statement of BMS1 Theorem 1.8(iii) via BS22 Theorem 17.2 (PrismaticCohomologyPartII Layer 5 and AInfCohomology Layer AI.5). For `X = Spf O_C`: both sides are `A_inf[1/φ^{-1}(μ)]` in degree 0.

**§8.78.** Trivial log structures: BMS1 Theorem 14.5 / BS22 Theorem 1.8 with the `A_inf` comparison (AInfCohomology Layer AI.5). `X = Spf O_C: φ^*H⁰ = A_inf`, the unit BKF module.

**§8.79.** `d = r = 1: R = O_K` and all cohomology is concentrated in degree 0. `d = r = 2`: the semistable target `O_K⟨x, y⟩/(xy − π)`; `H¹(Δ̄){1}` is free of rank 1 on `dlog y = −dlog x`.

### Dependencies

PrismaticCohomology Layers 0–2 (including §2.31), PrismaticCohomologyPartII Layers 3–5 and PrismaticCohomologyPartIII Layers 6–7; AdicSpaces Layers 0–3; AdicEtaleGeometry Layer A1; SchemeAndStackFoundations Layers 2 and 4; EnhancedDerivedSheaves Layers E1–E3 and E5; DerivedModuleAlgebra §§0.13, 1.1–1.9; DerivedDeRhamCohomology §§PD.6–PD.7, 5.1–5.7 and 6.20; CrystallineCohomology Layers CR.5:log-algebra, CR.5 and CR.6 and §§CR.DDR.6.3–CR.DDR.6.18; AInfCohomology Layers AI.0–AI.2 and AI.5–AI.6; ClassicalAdicEtaleCohomology §§1.2–1.4 and 2.5; DiamondsAndVStacks Layers D1–D2 and D4–D6; DiamondEtaleCohomology Layers C0 and C2; PerfectoidSpaces Layer P1; PadicHodgeTheory §§0.2–0.5. The exact inputs are in the supplier contracts; internal construction dependencies are linked in each subsection.

## Downstream consumers

CohomologyComparisons §4.6 consumes §§8.1–8.29, 8.35, 8.41–8.42, 8.56 and 8.69 for its generic log-prismatic constructions and comparisons, retaining their boundedness, integrality, perfect-log-base and Cartier-type hypotheses where used. Its additional period and Hyodo–Kato compatibility diagrams and specializations are applications of these supplied maps. CohomologyComparisons §6.1 consumes the shared log adic structures, logification, pullback, integral fs charts, Kummer-étale site and finite-free local systems of §8.60; its pro-Kummer-étale tower and logarithmic period-sheaf adapters are its own constructions. Part IV precedes both applications in the dependency order. Semistable applications also consume the p-Kummer realization of §§8.71–8.75.

## References

- **BLRH**: Bhargav Bhatt and Jacob Lurie. [A Riemann–Hilbert correspondence in positive characteristic](https://www.math.ias.edu/~lurie/papers/ModpRH.pdf). arXiv:1711.04148; the cited numbered statements use the 132-page author version.

- **BdJ11**: Bhargav Bhatt and Aise Johan de Jong. [Crystalline cohomology and de Rham cohomology](https://arxiv.org/abs/1110.5001v1). arXiv:1110.5001v1; the cosimplicial contraction in §2 is used.

- **BMS2**: Bhargav Bhatt, Matthew Morrow and Peter Scholze. [Topological Hochschild homology and integral p-adic Hodge theory](https://arxiv.org/abs/1802.03261v2). arXiv:1802.03261v2, 9 April 2019.

- **BMS1**: Bhargav Bhatt, Matthew Morrow and Peter Scholze. [Integral p-adic Hodge theory](https://arxiv.org/abs/1602.03148v3). arXiv:1602.03148v3, 16 January 2019.

- **K1**: Teruhisa Koshikawa. [Logarithmic prismatic cohomology `I`](https://arxiv.org/pdf/2007.14037v3). arXiv:2007.14037v3, 15 September 2022 (64 pp.).

- **KY**: Teruhisa Koshikawa and Zijian Yao. [Logarithmic prismatic cohomology II](https://arxiv.org/pdf/2306.00364v1). arXiv:2306.00364v1, 1 June 2023 (98 pp.).

- **KatoII**: Kazuya Kato. [Logarithmic structures of Fontaine–Illusie. II — Logarithmic flat topology](https://arxiv.org/abs/1905.10678). arXiv:1905.10678 (PDF of 1 October 2019); published in Tokyo `J`. Math. 44 (2021) 125–155.

- **OgusDraft**: Arthur Ogus. *Lectures on logarithmic algebraic geometry* (2006 draft), I, Proposition 4.3.17(1), pp. 92–93; numbering differs from the 2018 book.

- **CK**: Kęstutis Česnavičius and Teruhisa Koshikawa. [The `A_inf-cohomology` in the semistable case](https://arxiv.org/abs/1710.06145). arXiv:1710.06145v3, 4 October 2018; pp. 65–66 for the correcting diagram.

- **KYcorr**: Kentaro Inoue, Teruhisa Koshikawa and Zijian Yao. [Corrigendum to Logarithmic prismatic cohomology II](https://researchmap.jp/7000017226/misc/53305261/attachment_file.pdf). Public author copy, 5 pages; corrigendum published in Advances in Mathematics 503 (2026), 111223.

- **DLLZ**: Hansheng Diao, Kai-Wen Lan, Ruochuan Liu and Xinwen Zhu. [Logarithmic adic spaces: some foundational results](https://www.kwlan.org/articles/log-adic.pdf). Author version; citations use printed page numbers.

- **Inoue**: Kentaro Inoue. [Log prismatic F-crystals and realization functors](https://arxiv.org/pdf/2505.01084v2). Author version; citations use printed page numbers.

- **BS22**: Bhargav Bhatt and Peter Scholze. [Prisms and prismatic cohomology](https://arxiv.org/pdf/1905.08229v4). arXiv:1905.08229v4, 12 January 2022, 125 pages; author version.

- **Mathew**: Akhil Mathew. [Faithfully flat descent of almost perfect complexes in rigid geometry](https://arxiv.org/abs/1912.10968). Theorem 7.8, p.28, Definition 7.1 and Propositions 7.3–7.7, pp.27–28; Theorem 5.8, p.18, treats universal descent.

- **MW20**: Lucas Mann and Annette Werner. [Local systems on diamonds and p-adic vector bundles](https://arxiv.org/pdf/2005.06855v1). arXiv:2005.06855v1, 14 May 2020; Definitions 2.1, 3.1–3.3, Lemmas 2.7, 2.9, 3.4, Proposition 3.5 and Corollary 3.15, pp.9–24.

- **SSV**: Steffen Sagave, Timo Schürg and Gabriele Vezzosi. [Derived logarithmic geometry `I`](https://arxiv.org/pdf/1307.4246v3). arXiv:1307.4246v3; page numbers refer to this 33-page version.

- **CN21**: Pierre Colmez and Wiesława Nizioł, [On the cohomology of p-adic analytic spaces, `I`: The basic comparison theorem](https://webusers.imj-prg.fr/~pierre.colmez/CN4.3.pdf), author version of 23 April 2021. Lemma 2.4 and Theorem 2.6, pp.11–13.

- **Kato89**: Kazuya Kato. Logarithmic structures of Fontaine–Illusie. In *Algebraic Analysis, Geometry, and Number Theory* (Baltimore, 1988), Johns Hopkins University Press, 1989, pp. 191–224. Cited as "Kato" with its numbered statements (4.1, 4.8, Theorems 6.4 and 6.10).

- **HK94**: Osamu Hyodo and Kazuya Kato. Semi-stable reduction and crystalline cohomology with logarithmic poles. *Astérisque* 223 (1994), 221–268. Cited as "Hyodo–Kato".

- **Nakayama**: Chikara Nakayama. Logarithmic étale cohomology. *Math. Ann.* 308 (1997), 365–404; and Logarithmic étale cohomology, II. *Adv. Math.* 314 (2017), 663–725 (cited as "Nakayama II").

- **Huber**: Roland Huber. *Étale Cohomology of Rigid Analytic Varieties and Adic Spaces*. Aspects of Mathematics E30, Vieweg, 1996.

- **SW**: Peter Scholze and Jared Weinstein. *Berkeley Lectures on p-adic Geometry*. Annals of Mathematics Studies 207, Princeton University Press, 2020. Cited as "Scholze–Weinstein".

- **KL**: Kiran `S`. Kedlaya and Ruochuan Liu. [Relative p-adic Hodge theory, II: Imperfect period rings](https://arxiv.org/abs/1602.06899). arXiv:1602.06899. Cited as "Kedlaya–Liu".

- **Tsuji**: Takeshi Tsuji. Saturated morphisms of logarithmic schemes. *Tunisian `J`. Math.* 1 (2019), 185–220.
