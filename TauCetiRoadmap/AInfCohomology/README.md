# Roadmap: integral `A_inf` cohomology and Breuil–Kisin–Fargues structures

**Summary.** This roadmap builds the integral p-adic cohomology theory of Bhatt, Morrow and
Scholze for smooth and semistable formal schemes over the ring of integers `O_C` of a complete
algebraically closed extension `C` of `ℚ_p`, together with the Breuil–Kisin descent of
Bhatt–Morrow–Scholze over a discretely valued base. It starts from Mathlib's Witt vectors,
`PreTilt` and Fontaine's map `WittVector.fontaineTheta`, and from the roadmaps that supply
perfectoid rings, derived completion, enhanced derived categories of sheaves, the pro-étale site
of an adic space and crystalline and logarithmic crystalline cohomology. It constructs the
cyclotomic period elements `μ = [ε] − 1`, `ξ` and `ξ̃ = φ(ξ)` of `A_inf = W(O_C^♭)`, the shifted finite
Witt coefficient maps `θ̃_r` from the supplied `θ_r` and their kernels, coherence of `W_r(O_C)` and the
intrinsic Breuil–Kisin twist `A_inf{1}`; the décalage operator `Lη_f` on complexes and on the
derived category of a ringed topos, with its cohomology, multiplicativity, Bockstein
description, behaviour under completion and base change, and its value on Koszul complexes; the
structure theory of finitely presented `A_inf`-modules, Breuil–Kisin–Fargues modules and
Fargues' classification of finite free ones by pairs `(T, Ξ)`; the integral pro-étale sheaf
`𝔸_inf,X`, the complex `AΩ_𝔛 = Lη_μ Rν_* 𝔸_inf,X` and its toric and `q`-de Rham computation;
the Hodge–Tate, de Rham, de Rham–Witt, crystalline and étale specializations of `AΩ`; the proper
theory, with perfectness, the Breuil–Kisin–Fargues structure on each cohomology group and the
torsion and freeness comparisons between étale, crystalline and de Rham cohomology; the
semistable theory of Česnavičius and Koshikawa, with charts, root towers, log crystalline and
log de Rham specializations, the canonical `B_dR⁺`-deformation of the generic fibre and the
model-independent de Rham lattice; and finally the relative topological Hochschild homology of
`O_K`-algebras over the sphere polynomial ring, the Breuil–Kisin cohomology `RΓ_𝔖(𝔛)` and its
base change to `A_inf`, to de Rham and to crystalline cohomology. The end theorems are the
properties of `RΓ_{A_inf}(𝔛)` for a proper smooth formal scheme over `O_C` (BMS1, Theorem 1.8,
arXiv v3 p.5), their semistable version (ČK, (1.2.1), p.2, and Theorem 7.4, p.69), the torsion
inequalities between étale and de Rham or crystalline cohomology (BMS1, Theorem 1.1, p.2; ČK,
Theorems 7.9 and 7.12, pp.70–71), the functorial de Rham lattice of a semistable model (ČK,
Theorem 8.7, p.74), and Breuil–Kisin descent (BMS2, Theorem 1.2, arXiv p.3).

The layers are:

| Layer | Title | Headline targets |
| --- | --- | --- |
| AI.0 | Cyclotomic periods and finite Witt coefficients | `μ`, `ξ`, `ξ̃`, `θ̃ = θ ∘ φ⁻¹`, the maps `θ_r`, `θ̃_r` and their kernels `(ξ_r)`, `(ξ̃_r)`, regularity of `(p, μ)`, coherence of `W_r(O_C)` |
| AI.0:integral | Integral coefficient interfaces and the Breuil–Kisin twist | the residue map `A_inf → W(k)`, the Breuil–Kisin line `A_inf{1}`, Fontaine's `dlog`, `L̂_{O_C/ℤ_p} ≅ O_C{1}[1]`, `A_cris` as a coefficient ring |
| AI.0:period-comparison | Comparison with the rational period rings | `A_inf → A_cris → B_cris⁺ → B_dR⁺`, flatness of `A_inf → B_dR⁺`, finite `ξ`-quotients |
| AI.1 | The décalage operator `Lη` | `η_f` on complexes, `Lη_I` on `D(T, O)`, cohomology, monoidality, the Bockstein complex, completion, base change, Koszul complexes |
| AI.2 | Breuil–Kisin–Fargues modules, lattices and modifications | the structure theorem for finitely presented `A_inf`-modules, BKF modules, lattice pairs `(T, Ξ)`, Fargues' classification, minuscule modules |
| AI.3 | Integral pro-étale period sheaves and `AΩ` | `Ô⁺_X`, `Ô⁺♭_X`, `𝔸_inf,X`, `AΩ_𝔛`, the toric computation, the `q`-de Rham model, framing independence, Frobenius |
| AI.4 | Local specializations of `AΩ` | Hodge–Tate, de Rham–Witt, de Rham, `A_cris` and `μ`-inverted étale specializations |
| AI.5 | Proper `A_inf` cohomology and torsion control | perfectness, proper specializations, adjacent-degree freeness, the BKF structure on `H^i_{A_inf}(𝔛)` |
| AI.6 | Semistable `AΩ` and logarithmic specializations | charts, root towers, semistable `AΩ`, log Hodge–Tate, log de Rham, log crystalline, the canonical `B_dR⁺`-deformation, the de Rham lattice |
| AI.7 | Breuil–Kisin cohomology and relative traces | Breuil–Kisin coefficient maps, relative `THH` over `𝕊[z]`, `RΓ_𝔖(𝔛)`, base change to `A_inf`, de Rham and crystalline specializations |

The layer labels are the labels other roadmaps cite. They are built in the order of the table; see
*How to read the build*.

## Scope and ownership

**Owned here.**

- *Cyclotomic and Witt coefficients (AI.0).* The elements `μ`, `ξ`, `ξ̃`, `ξ_r`, `ξ̃_r` of
  `A_inf(S) = W(S^♭)` for an integral perfectoid ring `S` with a compatible system of primitive
  `p`-power roots of unity; the shifted maps `θ̃ = θ ∘ φ⁻¹` and `θ̃_r=θ_r∘φ^(−r)`
  from the finite Fontaine maps `θ_r` supplied by PerfectoidQuotients §0.2; their additional
  Verschiebung compatibility and cyclotomic formulas for the kernels imported from
  CrystallineCohomology §CR.4.4; the identification `A_inf = lim_F W_r(O_C)` and
  the kernel of `A_inf → W(O_C)`;
  regularity of `(p, μ)` and `(p, ξ)`; flatness of the cyclotomic
  power-series maps `ℤ_p[[T]] → A_inf`; cyclotomic specializations of the supplied finite-Witt
  Tor-independence theorem; coherence of `W_r(O_C)` and `W_r(O_C^♭)` for finite `r`.
- *Integral twists (AI.0:integral).* The residue map `A_inf → W(k)`; the Breuil–Kisin line
  `A_inf{1}` and its specializations `O_C{1}` and `ℤ_p(1)`; Fontaine's `dlog` theorem; the
  description of `O_C{1}` by the completed cotangent complex; the integral crystalline
  coefficient ring `A_cris` as an `A_inf`-algebra; regularity of the coefficients of an affinoid
  perfectoid.
- *Rational periods (AI.0:period-comparison).* The commuting maps
  `A_inf → A_cris → B_cris⁺ → B_dR⁺`, flatness of `A_inf → B_dR⁺` and the finite `ξ`-quotients
  of `B_dR⁺` with their Tate topologies.
- *Décalage (AI.1).* The extension of the principal-`p` module core of CrystallineCohomology CR.4
  to arbitrary regular `f` and ringed topoi: the operator `η_f` on cochain complexes with
  `f`-torsion-free terms, its
  extension `η_I` to an invertible ideal sheaf of a ringed topos and the derived functor `Lη_I`,
  with its cohomology `H^i(Lη_I K) ≅ (H^i(K)/H^i(K)[I]) ⊗ I^{⊗i}`, filtered colimits,
  truncations, lax symmetric monoidal structure, Bockstein description, completion,
  composition, base change and its value on Koszul complexes of commuting operators.
- *Modules (AI.2).* The structure theorem for finitely presented `A_inf`-modules that are free
  after inverting `p`; Breuil–Kisin–Fargues modules; lattice pairs `(T, Ξ)` with `T` a finite
  free `ℤ_p`-module and `Ξ` a `B_dR⁺`-lattice; the étale realization, full faithfulness and
  essential surjectivity of Fargues' functor; continuous Galois descent; minuscule BKF linear
  algebra. PrismaticCohomology owns the Dieudonné dictionary and its crystalline determination application.
- *`AΩ` (AI.3–AI.5).* The pro-étale sheaves `Ô⁺_X`, `Ô⁺♭_X` and `𝔸_inf,X` and the complex
  `AΩ_𝔛`; its local computation by `q`-de Rham complexes; its Hodge–Tate, de Rham–Witt, de
  Rham, crystalline and étale specializations; the proper theory with its torsion and freeness
  results.
- *Semistable reduction (AI.6).* Semistable charts with their log structures and perfectoid root
  towers, semistable `AΩ`, its log Hodge–Tate, log de Rham and log crystalline
  specializations, the Hyodo–Kato comparison used with it, the canonical `B_dR⁺`-deformation of
  the generic fibre (from the very small affinoid case to proper smooth rigid spaces), the
  semistable `B_dR⁺` and étale comparisons, and the de Rham lattice `M_dR(T)` attached to a
  `ℤ_p`-lattice in a de Rham representation.
- *Breuil–Kisin descent (AI.7).* The cohomological normalization of the supplied maps
  `𝔖 → A_inf`, the cohomological
  Breuil–Kisin complex `RΓ_𝔖(𝔛)`, relative cyclotomic traces over `𝕊[z]`, the Frobenius-twisted
  trace complex, its Bott-inverted descent, its trace-defined Frobenius and the base change and specialization theorems.
- *Foundational inputs owned here.* Several general statements that the proofs need and that no
  lower roadmap states are targets of this roadmap, in the layer that first uses them: tensor
  powers of an invertible ideal sheaf, the Koszul complex of commuting endomorphisms, continuous
  cochains as an integer-indexed complex, completed extension of scalars along a map of adic
  rings and derived `p`-completion on a site that is not replete (AI.1); finitely presented
  modules over a valuation ring with their Fitting ideals, the boundary neighbourhoods of `Y^an`
  and the gluing of vector bundles on it, and minuscule BKF modules over `A_inf`
  (AI.2); the projection `ν` from the pro-étale site of the generic fibre and the operation `Sq^0`
  on `E∞`-`𝔽_2`-algebras (AI.3); the primitive comparison over `A_inf` and rational Frobenius
  bijectivity over `A_cris` (AI.5); log regularity, the algebraization and root towers of
  semistable charts, formal GAGA and finiteness over rank-one valuation rings, the higher direct
  images of `Ô_X`, extension across codimension two, acyclicity on affine formal schemes, the
  log crystalline base change, finiteness and descent statements, the noetherian approximation,
  connection and deformation statements behind the canonical `B_dR⁺`-deformation, and the log
  differentials of a semistable curve (AI.6); circle actions, circle Tate constructions and the completed circle/finite-Tate comparison,
  Dyer–Lashof operations on the supplied dual Steenrod generators, topological Hochschild homology as a
  cyclotomic spectrum, Bökstedt periodicity, finite freeness of the Breuil–Kisin Frobenius and the
  identification of `π_0 TP` over the sphere polynomial base (AI.7).

**Not here.**

- Witt vectors, truncated Witt vectors, the Frobenius and Verschiebung, Teichmüller lifts,
  `PreTilt`, `PreTilt.untilt`, Fontaine's `θ`, `BDeRhamPlus` and `BDeRham`, `continuousCohomology`,
  `DividedPowers`, the ordinary derived category of an abelian category and Mathlib's
  `PowerSeries` substitution: Mathlib, used as they stand.
- The Huber ring `A_inf` with its `(p, [ϖ])`-adic topology, the open `𝒴 = D(p) ∩ D([ϖ])`, its
  Frobenius windows, the interval rings `B^I` and the Fargues–Fontaine curve as an adic space:
  TauCetiRoadmap AdicSpaces, Layer 6 (in Tau Ceti: `WittVector.isAdicComplete_span_p_teichmuller`,
  `TauCeti.Huber.WittVector.isHuberRing_adicTopology_span_p_teichmuller`, `spaY`, `windowU`,
  `windowV`, `spaX`). Here `A_inf` is the ring `W(O_C^♭)`; its topology is used only through
  that layer.
- The Koszul complex of a finite sequence and its exactness on regular sequences:
  DerivedModuleAlgebra, §0.K.1. This roadmap builds the
  Koszul complex of a family of commuting endomorphisms on top of it (AI.1.7).
- Perfectoid rings, tilting, Fontaine's `θ` with its principal kernel, almost purity and
  affinoid perfectoid spaces: PerfectoidSpaces (P1–P6); the affinoid-perfectoid basis of the
  rigid pro-étale site over a general p-adic base and its root-torus objects: PerfectoidSpaces P7.16.
- The cotangent complex, module derived completion and finite-sequence Koszul complexes:
  DerivedModuleAlgebra §§0.K.1, 0.4–0.13, 1.1–1.9. Filtered completion and the Beilinson
  t-structure: DerivedDeRhamCohomology §§1.14–1.22.
- Enhanced derived categories of sheaves on ringed sites and topoi, K-flat and K-injective
  replacements, derived tensor products, replete topoi, derived limits, derived completeness of
  sheaves and algebra objects: EnhancedDerivedSheaves (E1, E2, E4, E5).
- The pro-étale site of an analytic adic space and the morphism `ν` to the étale or Zariski site
  of a formal model: AdicEtaleGeometry, A1.
- Admissible formal schemes, Raynaud generic fibres, coherent sheaves on adic spaces and Tate
  algebras: AdicSpacesPartII R0 and AdicSpacesPartIII F0, R2–R3.
- Crystalline, logarithmic crystalline and Hyodo–Kato cohomology and de Rham–Witt complexes:
  CrystallineCohomology CR.1–CR.6, including the arbitrary-ring finite Witt étale/base-change
  theorem of CR.4, *Witt localization and étale descent*, and §CR.4.4's generic finite-Witt
  Fontaine kernels, their regularity and perfectoid base change, Tor independence and
  Verschiebung annihilator/image identities. Divided power envelopes and `A_cris` of a `p`-adically
  complete ring: DerivedDeRhamCohomology §§PD.6–PD.7.
- Finite-group Borel norms, Tate functors, coherent products and `can`: BordismFormalGroups
  §F6.5. The actual dual Steenrod Hopf algebra `H_*(H𝔽_p;𝔽_p)`, its generators, coproduct
  and conjugation conventions: TangentialBordism §B4, items 2 and 7. AI.7 transports these
  inputs to (Sp) through EnhancedDerivedSheaves E5:spectra-comparison.
- Breuil–Kisin modules of finite height, the coefficient rings `𝔖`, `𝒪_ℰ`, and Kisin's
  functor: FiniteFlatGroupsAndIntegralPadicHodgeTheory (R07.2, R07.4). Its R07.4.15
  owns `𝔖{1}` and its conormal/Frobenius data; R07.4.16 owns the scalar maps.
- Normalized algebraic Hochschild chains: DGAInfinity Layer 8. AI.7 identifies them with
  the Bökstedt page and owns its spectral structures.
- Arithmetic period rings, their topologies, Galois actions and fixed points:
  PadicPeriodRings §§1.1–1.5, 2–4. The required pro-étale period sheaves and constant-coefficient
  rational comparison are owned by AI.3.1; the integral comparisons are in AI.4–AI.6.
- The further rational `p`-adic comparison theorems of proper smooth rigid spaces and the uniform
  geometric torsion statements over a general base, which use the exports of AI.5 and AI.6:
  CohomologyComparisons.

## Conventions

Fix a prime `p` and a complete algebraically closed nonarchimedean extension `C` of `ℚ_p` with
valuation ring `O_C`, maximal ideal `𝔪` and residue field `k`. The tilt `O_C^♭` is Mathlib's
`PreTilt O_C p`; `A_inf = W(O_C^♭)` with Witt Frobenius `φ = φ_A`. Fix a compatible system
`ε = (1, ζ_p, ζ_{p²}, …) ∈ O_C^♭` of primitive `p`-power roots of unity. Then

```text
μ = [ε] − 1,   ξ = Σ_{j=0}^{p−1} [ε^{1/p}]^j,   ξ̃ = φ(ξ),   μ = ξ · φ⁻¹(μ),   φ(μ) = ξ̃ · μ,
θ = Fontaine's map A_inf → O_C,   θ̃ = θ ∘ φ⁻¹,   ker θ = (ξ),   ker θ̃ = (ξ̃),
ξ_r = ∏_{j=0}^{r−1} φ^{−j}(ξ),   ξ̃_r = ∏_{j=1}^{r} φ^{j}(ξ),   ker θ_r = (ξ_r),   ker θ̃_r = (ξ̃_r).
```

The witness for the two normalizations is the point `Spf O_C`: `θ(μ) = 0` and `θ(ξ̃) = p`, while
`θ̃(μ) = ζ_p − 1` and `θ̃(ξ̃) = 0`. Interchanging `ξ` and `ξ̃` fails these four values.

- **Witt transition maps.** On `W_r` the restriction `R`, the Witt Frobenius `F` and the
  Verschiebung `V` are separate maps; `F V = p`, but `V F` is multiplication by `V(1)`, which is
  not `p` over a ring of characteristic zero. A lift of `V(1)` under `θ_{r+1}` is chosen
  explicitly and never replaced by `p`.
- **Breuil–Kisin twists.** `A_inf{1}` is the Breuil–Kisin line, `O_C{1} = A_inf{1} ⊗_{A_inf, θ̃} O_C`
  and `ℤ_p(1)` is its étale realization; `dlog` has image `(ζ_p − 1)·O_C{1}`, so `O_C{1}` and
  `O_C(1)` differ. Twists `{n}` are kept in every specialization.
- **Gradings.** Cochain complexes are indexed by all integers with cohomological grading and
  differentials of degree `+1`. Trace invariants (`THH`, `TC⁻`, `TP`) use homological grading:
  the Bott class `b` (or `σ`) has degree `+2` and `v` degree `−2`; the power-series variable `u`
  of `𝔖` has degree `0`.
- **Completions.** "Complete" means derived complete unless a classical completion is named;
  the completed tensor product `⊗̂^L` is the derived completion of `⊗^L` for the stated ideal.
  Derived and classical completions agree only where a theorem says so.
- **Décalage.** For a nonzerodivisor `f` of `R` and a complex `C` of `f`-torsion-free
  `R`-modules, `(η_f C)^i = {x ∈ f^i C^i[1/f] : dx ∈ f^{i+1} C^{i+1}[1/f]}`. The derived functor
  `Lη_f` is not exact: it sends `0 → ℤ/p → ℤ/p² → ℤ/p → 0` (with `f = p`) to a sequence that is
  not a triangle.
- **Breuil–Kisin coefficients.** `K` is a complete discretely valued field of mixed
  characteristic `(0, p)` with perfect residue field `k₀`, uniformizer `π`, monic Eisenstein polynomial
  `E ∈ W(k₀)[u]` and a compatible system `π^♭ = (π, π^{1/p}, …) ∈ O_C^♭`. `𝔖 = W(k₀)[[u]]` with
  `φ_𝔖` the Witt Frobenius on coefficients and `u ↦ u^p`; `𝔖^{(−1)}` is `𝔖` viewed as an
  `𝔖`-algebra along `φ_𝔖`. Relative trace generators retain a unit
  `α∈(𝔖^{(−1)})^×` in `φ(b)=ασ`; the fixed monic `E` is not renormalized. The maps are `g : 𝔖 → A_inf`, `u ↦ [π^♭]`; `f = g ∘ φ_𝔖 = φ_A ∘ g`,
  so `f(u) = [π^♭]^p`; `θ̃_𝔖 : 𝔖 → O_K`, `u ↦ π`, with identity on Witt coefficients;
  `θ_𝔖 = θ̃_𝔖 ∘ φ_𝔖`, `u ↦ π^p`; and the crystalline map `c = φ_W ∘ constantCoeff : 𝔖 → W(k₀)`.
  The spectral base uses a separate variable `z` of `𝕊[z] = 𝕊[ℕ]`.

**Standing hypotheses.** Targets refer to the following blocks by their labels.

- **(C)** `p` is prime, `C` is a complete algebraically closed nonarchimedean extension of
  `ℚ_p` and `O_C` its valuation ring; `A_inf`, `θ`, `φ`, `ξ`, `μ` and `ξ̃` are normalized as
  above. No noetherian hypothesis on `O_C` or `A_inf` is made.
- **(T)** `(T, O)` is a ringed topos and `I ⊂ O` an invertible ideal sheaf, locally generated by
  a nonzerodivisor; negative tensor powers of `I` are powers of its dual `I^{−1}`.
- **(Cx)** `R` is a commutative ring, `f ∈ R`, and `C` is a cochain complex of `R`-modules
  indexed by all integers, with differential of degree `+1`. **(Cx_f)** adds that
  multiplication by `f` is injective on every term of `C`.
- **(SS)** The semistable setting of Česnavičius–Koshikawa: `k̄` is an algebraically closed
  field of characteristic `p` and `C` is the completed algebraic closure of `W(k̄)[1/p]`; an
  embedding `p^ℚ ⊂ C` (compatible `n`-th roots of `p` in `O_C` for all `n`) and the system `ε`
  are fixed, so that `p^q ∈ O_C` and `(p^{1/p^∞})^q ∈ O_C^♭` are defined for `q ∈ ℚ_{≥0}`. `𝔛` is
  a `p`-adic formal `O_C`-scheme that étale locally admits an étale map to `Spf` of a chart ring
  `R□ = O_C{t₀, …, t_r, t_{r+1}^{±1}, …, t_d^{±1}}/(t₀⋯t_r − p^q)` with `q ∈ ℚ_{>0}` (ČK, (1.5.1),
  p. 4). In arithmetic statements `K` is as in the Breuil–Kisin conventions with residue field
  `k₀ ⊂ k̄`, `C` is the completion of `K̄`, and the map `W(k₀) → W(k̄)` is kept. **(SS-prop)**
  adds that `𝔛` is proper over `O_C`.
- **(VS)** `R` is a smooth complete Tate `C`-algebra that is very small: finitely many units
  `T_1, …, T_d` in a finite set `Σ ⊂ (R°)^×` give a surjection `C⟨X_u^{±1} : u ∈ Σ⟩ → R`, and
  the `T_i` give a rational embedding into a torus followed by a finite étale map; `Σ` may be
  enlarged.
- **(dR)** `B_dR⁺` is the complete discrete valuation ring of AI.0:period-comparison, with
  uniformizer `ξ`, residue map `θ` to `C` and the Tate topologies on its finite quotients
  `B_dR⁺/ξ^n`. For `C=K̄^∧` it agrees with PadicPeriodRings, §§1.5, 4.1.
- **(Sp)** Spectra form a symmetric monoidal stable presentable `∞`-category with
  `E_∞`-algebras, geometric realizations, circle actions, homotopy fixed points and Tate
  constructions. EnhancedDerivedSheaves E5:abstract supplies operadic algebras;
  E5:presentability.2 supplies `spectra` and its stable symmetric monoidal structure;
  E5:spectra-comparison supplies `eilenbergMacLane`, `moduleSpectra_equiv_derived` and
  `symmetricSpectra_equiv_spectra`, which transports the finite-group Tate and dual Steenrod
  inputs from their concrete spectral models.
  Constructions written `THH(A)`, `X^{hG}` and `X^{tG}` are uncompleted; `;ℤ_p` explicitly
  denotes p-completion. The Breuil–Kisin trace calculations use the latter. Grading is homological.
- **(BK)** `K`, `π`, `E`, `π^♭`, `𝔖` and `φ_𝔖` are as in the Breuil–Kisin conventions, and derived
  operations use the enhancement of EnhancedDerivedSheaves, E1.
- **(Y)** `Y^an = Spa(A_inf, A_inf)` minus its closed non-analytic point, that is
  `D(p) ∪ D([ϖ^♭])`, with its two boundary points `x_{C^♭}` (radius `0`) and `x_L` (radius `∞`);
  the interior `𝒴 = D(p) ∩ D([ϖ^♭])` is the space of TauCetiRoadmap AdicSpaces, Layer 6.

## Exact supplier contracts

### From Mathlib (pinned at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`)

- **Witt vectors and the tilt.** `WittVector` with its ring structure, `WittVector.teichmuller`
  (the multiplicative Teichmüller lift `R →* 𝕎 R`, so `[ε]`, `[π^♭]` and `[ϖ^♭]` are its values),
  `WittVector.frobenius` and, for a perfect ring of characteristic `p`, the automorphism
  `WittVector.frobeniusEquiv`, which supplies `φ⁻¹` in `θ̃ = θ ∘ φ⁻¹`; `WittVector.map` (Witt
  functoriality, used for `W(k₀) → A_inf` and for the residue map `A_inf → W(k)`),
  `WittVector.map_teichmuller`, `WittVector.map_surjective` and
  `WittVector.frobenius_eq_map_frobenius` (the generic residue-map API);
  `WittVector.isAdicCompleteIdealSpanP` (p-adic completeness of `W` of a perfect ring);
  `TruncatedWittVector` and truncation; `PreTilt O p`, the perfection of `O/p`, and
  `PreTilt.untilt`, the multiplicative map `x ↦ x^♯`.
- **Fontaine's map.** `WittVector.fontaineTheta : 𝕎(PreTilt O p) →+* O` for `O` p-adically complete
  with `p` not a unit, with `WittVector.fontaineTheta_teichmuller` (`θ([x]) = x^♯`) and
  `WittVector.surjective_fontaineTheta`, which assumes that Frobenius is surjective on `O/p`. That `ker θ` is
  principal is not in Mathlib; it is PerfectoidSpaces, P1, and, for `O_C` with its cyclotomic
  generator, Layer AI.0.
- **Rational periods.** `BDeRhamPlus` (the completion of `A_inf[1/p]` along `ker θ`) and `BDeRham`
  (the localization at the images of generators). The discrete valuation, the topology and the
  Galois action are PadicPeriodRings, §§1.5, 4.1.
- **Isocrystals.** `WittVector.Isocrystal` and `WittVector.FractionRing.frobenius`; Mathlib's
  classification is of rank-one isocrystals only, and the analytic classification is Layer AI.2.
- **Power series.** `PowerSeries` with `PowerSeries.coeff`, `PowerSeries.constantCoeff`,
  `PowerSeries.map` (coefficientwise maps), `PowerSeries.substAlgHom` with
  `PowerSeries.HasSubst.X_pow`, `PowerSeries.substAlgHom_X`, `PowerSeries.coeff_subst_X_pow` and
  `PowerSeries.constantCoeff_subst_X_pow` (the substitution `u ↦ u^p` and its coefficient formula),
  and `PowerSeries.expand`.
- **Commutative and homological algebra.** `ModuleCat` with `ModuleCat.of`, `ModuleCat.ofHom` and
  `ModuleCat.Hom.hom`; `CochainComplex` (indexed by `ℤ` here) with `CochainComplex.of`,
  `CochainComplex.ofHom`, `HomologicalComplex.d_comp_d` and `HomologicalComplex.homology`;
  `DerivedCategory` and its localization functor `DerivedCategory.Q` (the ordinary derived
  category; the enhancement, derived tensor products and completions are EnhancedDerivedSheaves);
  `continuousCohomology` (continuous cohomology with topological coefficients, compared with
  integer-indexed complexes in Layer AI.1); `TensorProduct`, `LocalizedModule`, `AdicCompletion`
  with `AdicCompletion.evalₐ`, `AdicCompletion.evalₐ_of`, `AdicCompletion.liftRingHom`,
  `AdicCompletion.isAdicComplete` and `IsAdicComplete.liftRingHom` (classical completion, used
  for chart rings; derived completion is DerivedModuleAlgebra, §§1.1–1.9); `MvPolynomial` with
  `MvPolynomial.pderiv`; `Ideal.Quotient.mk`; `KaehlerDifferential`; `DividedPowers` and
  `DividedPowerAlgebra` (divided power envelopes are DerivedDeRhamCohomology, §§PD.6–PD.7);
  `comonadicExtendScalars` (faithfully flat module descent),
  `Module.FaithfullyFlat.zero_iff_lTensor_zero` and
  `Module.FaithfullyFlat.lTensor_bijective_iff_bijective`; `Module.equiv_free_prod_directSum` and
  `Module.equiv_directSum_of_isTorsion` (finitely generated modules over a principal ideal domain,
  applied to `ℤ_p` and `O_K`); `ValuationRing` (no rank-one or elementary-divisor theory; general cyclic decomposition is
  in §AI.1.3 and the `A_inf` applications are in Layer AI.2); `Finsupp`, `Finset.max'` and its dual `Finset.min'`; `WeierstrassCurve.j`; `ExteriorAlgebra`; `Module.Invertible`.

### From Tau Ceti (pinned at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`)

- **Witt completeness.** `WittVector.isAdicComplete_span_p_teichmuller` and
  `Valuation.Integers.isAdicComplete_span_p_teichmuller`, in
  `TauCeti.RingTheory.WittVector.Complete`, give `(p, [ϖ])`-adic completeness for a perfect
  characteristic-`p` ring complete at `ϖ`, and for the integers of a complete perfect
  nonarchimedean field with `‖ϖ‖ < 1`, respectively. For `O_C^♭`, the nonzero elements
  `ε − 1`, `ξ mod p` and a chosen `ϖ^♭` give cofinal valuation-ideal powers. Witt reduction
  modulo `p` therefore identifies the `(p, μ)`-, `(p, ξ)`- and `(p, [ϖ^♭])`-adic
  completeness inputs.
- **Huber structure.** `WittVector.span_p_teichmuller_eq_top_iff` is in the same completeness
  module. `TauCeti.Huber.WittVector.isHuberRing_adicTopology_span_p_teichmuller` and
  `TauCeti.Huber.WittVector.isTateRing_adicTopology_span_p_teichmuller_iff`, in
  `TauCeti.RingTheory.Huber.WittVector`, supply the Huber structure and the criterion that
  this ring is Tate exactly when `ϖ` is a unit.
- **Frobenius and analytic opens.** `WittVector.frobenius_teichmuller` and
  `WittVector.frobeniusEquiv_symm_teichmuller` are in
  `TauCeti.RingTheory.WittVector.Frobenius`. `TauCeti.FarguesFontaine.spaY` and
  `TauCeti.FarguesFontaine.frobeniusHomeomorph` are in
  `TauCeti.AlgebraicGeometry.AdicSpace.FarguesFontaine.Y`;
  `TauCeti.FarguesFontaine.windowU` and `TauCeti.FarguesFontaine.windowV` are in the
  corresponding `Window` module, and `TauCeti.FarguesFontaine.spaX` is in `Quotient`.
  These are the opens, Frobenius action, windows and quotient of AdicSpaces Layer 6.
- **Fitting ideals.** Use `TauCeti.fittingIdeal R M 0`,
  `TauCeti.fittingIdeal_eq_minorsIdeal_ker` and `TauCeti.fittingIdeal_quotient_zero` from
  `TauCeti.RingTheory.FittingIdeal.Basic`, and `TauCeti.fittingIdeal_baseChange` from
  `TauCeti.RingTheory.FittingIdeal.BaseChange`. They apply to finite modules over a
  commutative ring, using a finite free surjection, and commute with arbitrary base change.
  AI.2 adds diagonal presentations over valuation rings and AI.6 adds normalized valuation
  length; neither defines another Fitting ideal.

### From roadmaps on main

- **AdicSpaces**, Layer 6, §§6.1–6.4: `A_inf = W(O_F)` as a complete Huber ring with pair of
  definition `(A_inf, (p, [ϖ]))`; the open `𝒴 = D(p) ∩ D([ϖ])`, its Frobenius action and
  power comparison; the analytic locus `D(p) ∪ D([ϖ])`; the windows `U_n`, `V_n`; the
  interval rings `B^I` for closed `I ⊂ (0, ∞)`, strongly noetherian and sheafy; and the
  quotient `𝒳 = 𝒴/φ^ℤ` with its window charts. AI.2.3 adds the boundary neighbourhoods of
  `Y^an` at radius `0` and `∞`.
- **SchemeAndStackFoundations**, §0.9 (`noetherian_approximation`,
  `finite_presentation_limits`), §1.1 (`qcoh_fpqc_descent`), §2.18
  (`torIndependent_baseChange`) and §§2.20, 3.3 (`cm_serre_duality`,
  `curve_serre_duality_ext_hom`): noetherian approximation and spreading out, effective
  fpqc descent of quasi-coherent modules, Tor-independent base change for quasi-coherent
  complexes, and Serre duality for coherent sheaves on proper Cohen–Macaulay curves.
- **AdicSpacesPartII**, §§R0.1b, R0.9, R0.17: noetherian completion, polynomial generation
  of maximal ideals of Tate algebras, algebraic models of affinoid étale maps and étale
  toric charts on smooth affinoids. Formal schemes and coherent geometry are the separate
  AdicSpacesPartIII contracts below.

### From other roadmaps

These are mathematical contracts on the supplier's carriers. They do not assert that an
unimplemented carrier is already available for a Lean declaration.

- **DerivedModuleAlgebra**, §0.K.1: the homological Koszul complex of a finite sequence,
  its signed tensor formula, functorial maps, multiplication null-homotopies and the
  resolution of a weakly regular sequence with `H₀ = R/(x₁, …, x_r)`. AI.1.7 builds
  cochain Koszul complexes of commuting endomorphisms and compares multiplication
  operators with the ordered cochain dual of this supplied complex.
  Sections 0.4, 0.6, 0.8–0.13 supply the full cotangent complex, its universal property,
  transitivity, derived base change, localization and regular-quotient models.
  Sections 1.T.1 and 1.1–1.9 supply module derived limits, ideal completeness, the
  completion reflector, Koszul completion towers, regular-quotient comparisons, complete
  flatness and complete faithfully flat module descent. Section 1.3's derived Nakayama
  criterion and DerivedDeRhamCohomology §1.13's perfect-system effectivity control
  perfectness after complete reduction.
- **AdicEtaleGeometry**, A1: the corrected pro-étale site of a locally noetherian analytic
  adic space, finite-étale towers with the corrected covering condition, analytic étale
  sites, their structure sheaves and the projection to the analytic étale site. AI.3.1
  composes that projection with the specialization to the étale site of a formal model.
- **AdicSpacesPartIII**, F0.1–F0.8: formal spectra, formal schemes, coherent formal
  modules, Grothendieck existence and formal GAGA. Sections R2.1–R2.7 and R2.9 supply
  algebras topologically of finite presentation, admissible formal schemes, Raynaud and
  Berthelot generic fibres, specialization, étale-site comparisons, admissible blow-ups,
  flattening, saturated finite submodules and the Raynaud–Gruson projective-module input.
  Sections R3.1–R3.2, R3.5 and R3.7 supply associated coherent sheaves, affinoid acyclicity,
  Kiehl gluing and proper coherent GAGA.
- **PerfectoidSpaces**, P0.2 and P0.5–P0.15: the basic almost setup of a nondiscrete
  valuation ring, almost modules, algebras and their operations. P1.17–P1.18 supply
  Fontaine's map for a perfectoid pair and its primitive nonzerodivisor kernel;
  P1.24–P1.25 supply integral perfectoidness and the integral/Tate dictionary. P2 supplies
  affinoid perfectoid spaces; P3 supplies almost purity; P6 supplies the affinoid
  pro-étale perfectoid interpretation of the perfectoid objects of the rigid pro-étale
  site. P7.16 supplies the general-base affinoid-perfectoid basis
  (`ProEtaleSite.affinoidPerfectoid_basis`) and the root-torus site object
  (`ProEtaleSite.proEtale_rootTorus_exists`), on AdicEtaleGeometry A1’s site.
- **EnhancedDerivedSheaves**, §§0.1–0.3 and E1.3–E1.4: enhanced derived categories of
  ringed sites, derived tensor and direct image, and the comparison with Mathlib's
  derived category. In particular §0.2's `ClassicalDerived.replacements` supplies
  functorial K-injective replacements and K-flat replacements with flat terms. Tensoring
  the injection `I → O` with each flat term makes it `I`-torsion-free for an invertible
  ideal; this is the input for AI.1.2, without another replacement construction here.
  E2 supplies replete-topos derived limits and unbounded hypercover descent. E4.1–E4.5
  supply derived complete sheaves, their colimits, completed tensor, coefficient-system
  reconstruction and equivalences detected modulo the ideal. E4.3 supplies
  `derivedComplete_iff_cohomology` and `derivedCompleteModules_weakSerre`, so completeness
  is detected in every integer cohomological degree and preserved by kernels and
  cokernels of maps of complete modules. E5:abstract supplies operadic algebras;
  E5:presentability.2 supplies `spectra` and the
  stable symmetric monoidal structure; E5:spectra-comparison supplies `eilenbergMacLane`
  and `moduleSpectra_equiv_derived`; its `symmetricSpectra_equiv_spectra` transports the
  concrete spectral constructions, their coherent action diagrams, products and `HR` objects
  to this abstract stabilization.
- **BordismFormalGroups**, §F6.5:
  for every finite group `G`, Borel actions, homotopy orbits and fixed points, the norm and
  its Tate cofibre, restriction and induction, and the coherent lax symmetric monoidal
  Tate functor with `can` and module products. The local name `AInf.Trace.tateFinite` is
  its `G=C_p` specialization transported through EnhancedDerivedSheaves
  E5:spectra-comparison. AI.7 owns the circle extension and Tate-orbit comparison.
- **TangentialBordism**, §B4, items 2 and 7:
  the actual mod-p Eilenberg–Mac Lane homology Hopf algebra, polynomial on `ξ_i` (`i≥1`)
  at `p=2`, and polynomial on `ξ_i` (`i≥1`) tensor exterior on `τ_i` (`i≥0`) at odd `p`,
  with its dual Steenrod coaction, coproduct and conjugation. Use its Milnor generators
  and conjugates after the same concrete-to-abstract spectral comparison; AI.7 owns
  their Dyer–Lashof values, suspension compatibility and Bökstedt differentials.
- **ArithmeticGaloisDuality**, §D7.3, *Continuous cochains in the derived category*:
  continuous cochains and their derived-category realization on its stated compact and
  cofinite coefficient domain. AI.1.7 owns the comparison with Mathlib's continuous
  cochains for inverse systems of arbitrary discrete continuous modules killed by `p^n`.
- **DerivedDeRhamCohomology**, §§1.14–1.22: filtered derived categories, filtered and
  completed tensor products, filtered completion and the Beilinson t-structure with its
  heart identified with complexes. Sections PD.1–PD.2 and PD.4–PD.7 supply divided
  powers, base-compatible PD envelopes and `A_cris` for a `p`-adically complete ring.
  On `O_C`, PD.7 identifies that envelope with PadicPeriodRings §3's principal envelope.
  Layer 2 supplies ordinary and derived de Rham complexes. Sections 5.1–5.5 supply the
  quasisyntomic sites, quasiregular semiperfectoid objects, elementary covers, refinement
  and symmetric monoidal sheaf unfolding; §5.23 supplies proper smooth de Rham
  perfectness. These are the site and finiteness inputs of AI.7.
- **CrystallineCohomology**, CR.1–CR.3: crystalline sites and cohomology, differentials
  of a smooth envelope, the embedding computation and its independence, enhanced
  crystalline direct image and global sections, derived crystalline base change and
  proper smooth perfectness; CR.3:Frobenius-isogeny’s *p-power control for purely
  inseparable pullback* supplies the smooth relative-Frobenius bound without properness.
  Its *Rational crystalline Frobenius isogeny* additionally assumes properness.
  CR.4, *Witt localization and étale descent*, supplies the coefficient theorem
  that for any étale map `A→B` of commutative rings and `r≥1`, `W_r(A)→W_r(B)` is étale
  and `W_r(A′)⊗_{W_r(A)}W_r(B)≅W_r(B⊗_A A′)` for arbitrary `A→A′` (BMS1, Theorem 10.4).
  The local name `AInf.witt_etale_base_change` is an alias of this supplied theorem.
  Section CR.4.4, *Finite Witt base change for integral perfectoid rings*, supplies the
  regular generators of `ker θ_r` and `ker θ̃_r`, their behaviour under perfectoid maps,
  both derived finite-Witt base-change equivalences (restriction and Frobenius), and
  `Ann(V^j(1))=ker F^j`, `V^j(1)W_r(S)=V^jW_{r−j}(S)`. The generic kernel/regularity
  names of `AInf.xiWitt` and `AInf.witt_base_change` are transported aliases; AI.0 owns
  the explicit cyclotomic generators, `q_(r,j)` formulas, coherence and almost ideals.
  CR.4 also supplies relative Frobenius–Verschiebung procomplexes, relative Witt
  forms over perfectoid bases, continuous relative de Rham–Witt, Laurent Witt weights,
  finite and infinite crystalline comparisons, Nygaard/conjugate/Hodge/lift filtrations,
  strict Dieudonné complexes as décalage fixed points, the saturated de Rham–Witt
  complex and Bockstein reduction of principal `p`-décalage. CR.5:log-algebra supplies
  prelog rings, integral morphisms, Kato's chart criterion and log regularity. CR.5
  supplies fine and quasi-coherent log PD envelopes, PD-smooth log thickenings, the log
  PD Poincaré lemma, log de Rham complexes, Cartier type and the semistable chart
  differential formula. CR.6 supplies standard log Witt bases and Hyodo–Kato theory.
- **ClassicalAdicEtaleCohomology**, §1.3: étale–pro-étale comparison, continuous
  cohomology on profinite `G`-sets, Cartan–Leray descent with its coefficient-topology
  hypothesis, and étale acyclicity of vector bundles on strongly sheafy affinoids.
  Section 4.7 supplies local algebraization of semistable formal charts on its finite
  discretely valued base domain. AI.6.1 states the extension needed over `O_C`.
- **FiniteFlatGroupsAndIntegralPadicHodgeTheory**, R07.2 (in particular §R07.2.18,
  *Frobenius-fixed Witt vectors are the p-adic integers*) and R07.4: Dieudonné theory,
  the Breuil–Kisin rings `𝔖`, `O_ℰ`, `𝔖^ur`, `O` and `S`, finite-height modules,
  Fontaine's equivalence for étale Frobenius modules over a Cohen ring, the torsion
  structure theorem, finite-height lattices and Kisin's functor. The relevant named
  targets are §§R07.4.1, R07.4.4, R07.4.12, R07.4.13, R07.4.15 and R07.4.16.
  R07.4.15 supplies the rank-one twist `𝔖{1}`, its conormal inverse system and
  Frobenius; R07.4.16's `kisinPeriodScalarMaps` supplies both embeddings `ι₀`, `ι₁`,
  residues `ε₀`, `ε₁` and their Eisenstein-kernel identities. AI.7 uses transported
  aliases and proves the cohomological specialization and twist comparisons.
- **DGAInfinity**, Layer 8: normalized Hochschild chains of strictly unital DG algebras
  with their bar differential and normalization comparison. AI.7 transports the
  cohomological grading to the homological/internal grading of the Bökstedt page.
- **PadicPeriodRings**, §§1.1–1.5: the finite-`ℚ_p` completion, period DVR, Fontaine map,
  uniformizer, topologies, continuous actions and Tate–Sen calculations. Section 2's
  `PadicFieldCompletion`, `tateSen_H0` and `tateSen_character` apply to every complete
  discretely valued characteristic-zero `K` with perfect residue field of characteristic
  `p`, with `C` the completed algebraic closure. They give `C^{G_K} = K` and
  `C(η)^{G_K} = 0` for continuous `η : G_K → ℤ_p^×` with infinite inertia image;
  intersecting with `O_C` gives `(O_C)^{G_K} = O_K`. Such characters have finite or
  virtually `ℤ_p` image, as required there. Section 3 supplies the principal `A_cris`
  envelope for general `C`. Sections 4.1–4.3 supply the general-base period rings,
  `A_cris → B_dR⁺`, `B_st`, invariant functors, regularity and the fixed embedding of
  `K`. Sections 1.5 and 4.1 identify Mathlib's `BDeRhamPlus` and `BDeRham` carriers.
  For arbitrary `C` in (C), AI.0:period-comparison proves the corresponding completion
  statements; arithmetic fixed-field assertions use `C = K̄^∧`.
- **PerfectoidQuotients**, §0.2 supplies `finiteFontaineTheta`, its level-one, restriction,
  Frobenius and Teichmüller identities, `frobenius_surjectivity_equivalences` and
  `theta_map_preserves_generator`; §0.0 supplies `fontaine_tor_independence`.
  Section 0.3 (`perfectoid_cotangent_mod_p_vanishes`,
  `perfectoid_absolute_cotangent`): relative completed cotangent vanishing for maps of
  integral perfectoid rings and the absolute cotangent/conormal-line comparison.
  Section 0.5 supplies perfectoid completion of `p`-integral closures on its stated
  torsion and completeness domain. Sections 1.3–1.4 supply `bhattRootExtension`, its
  compatible roots, saturation and almost faithful flatness over a perfectoid field.

## How to read the build

Layer AI.0 is commutative algebra over Mathlib's Witt vectors: it fixes the cyclotomic
coefficients, imports the generic finite-Witt package of CrystallineCohomology §CR.4.4
and proves the cyclotomic, coherence and almost-ideal refinements used throughout. Layer AI.0:integral adds
the integral twists and the coefficient rings `W(k)` and `A_cris`; Layer AI.0:period-comparison
relates `A_inf` to the rational period rings. Layer AI.1 is pure homological algebra: décalage on
complexes and on derived categories of ringed topoi, with no `p`-adic geometry. Layer AI.2 is
module theory over `A_inf`; its classification part uses the Fargues–Fontaine geometry of
AdicSpaces, Layer 6. Layer AI.3 brings in the pro-étale site and defines `AΩ`; Layer AI.4 proves
its local specializations and Layer AI.5 the global ones for proper smooth formal schemes,
ending with the Breuil–Kisin–Fargues structure of `H^i_{A_inf}`. Layer AI.6 repeats AI.3–AI.5 for
semistable formal schemes and owns the canonical `B_dR⁺`-deformation and the de Rham lattice.
Layer AI.7 descends `A_inf`-cohomology to `𝔖` through relative topological Hochschild homology
and proves its Frobenius-compatible specializations from relative traces. Within each layer the targets are in
dependency order; a target cites earlier targets by title and section.

## Layer AI.0: Cyclotomic periods and finite Witt coefficients

This layer fixes the cyclotomic coefficients of `A_inf` and develops the finite Witt vector
theory of `O_C` and of perfectoid rings. The restriction `R`, the Frobenius `F` and the
Verschiebung `V` are separate transition maps, and the lift of `V(1)` is never replaced by `p`.
The coherence results are the input for the module theory of AI.2 and for the toric
computations of AI.3.

### AI.0.1 Cyclotomic periods and the shifted Fontaine map

**Cyclotomic period elements** (`AInf.cyclotomic`). For `C` complete algebraically closed over `ℚ_p` and `ε=(1,ζ_p,ζ_{p²},...)` in `O_C^♭`, define `μ=[ε]-1`, `ξ=Σ_{j=0}^{p-1}[ε^(1/p)]^j`, and `ξ̃=φ(ξ)`. Thus `μ=ξ*φ^(-1)(μ)`; division is the proven factorization in `A_inf`, never division in a fraction field.

`Suggested.lean` states the cyclotomic kernel theorem as `ker_fontaineTheta_eq_span_xi`, with the polynomial generator `xi` on Witt vectors and `integers` the valuation subring of `C`.

`C` is a complete algebraically closed nonarchimedean extension of `ℚ_p`. `p` is prime. roots are compatible and primitive.

The API:

- `AInf.cyclotomic_mu`: The first component is `[ε]-1`.
- `AInf.cyclotomic_factorization`: `μ=ξ*φ^(-1)(μ)`.
- `AInf.cyclotomic_frobenius`: `ξ̃=φ(ξ)`.
- `AInf.cyclotomic_kernel`: `ker(θ)=(ξ)`; `ker(θ∘φ^(-1))=(ξ̃)`.

Use the geometric sum identity in Witt vectors. Evaluate `θ(ξ)` using the primitive p-th root and use the primitive-kernel criterion. (BMS1 (arXiv v3), Example 3.16 and Proposition 3.17; printed p.25). *Needs:* Mathlib `WittVector.teichmuller`; Mathlib `WittVector.frobeniusEquiv`; PerfectoidSpaces, P1 (*Fontaine's θ: W(S♭+) → S+ is surjective with kernel generated by a primitive nonzerodivisor (ECD Lemma 3.14)*).

**Checks.**

- `AInf.cyclotomic_test_unit`: `ε=1` makes `μ=0` and does not give an admissible primitive root system.
- `AInf.cyclotomic_test_theta`: `θ(μ)=0` and `θ(ξ̃)=p`.
- `AInf.cyclotomic_test_tildeTheta`: `θ̃(μ)=ζ_p-1`; `θ̃(ξ̃)=0`.

**Frobenius-shifted Fontaine map** (`AInf.tildeTheta`). Define `θ̃=θ∘φ^(-1)`: `A_inf(S)→S` on a perfectoid ring. Its kernel is `φ(ker θ)`; for the cyclotomic `O_C` normalization it is `(ξ̃)`.

`S` is integral perfectoid with p-adic topology and surjective Frobenius mod p.

The API:

- `AInf.tildeTheta_apply`: `θ̃(x)=θ(φ^(-1)x)`.
- `AInf.tildeTheta_surjective`: `θ̃` is surjective.
- `AInf.tildeTheta_ker`: Its kernel is generated by `φ(ξ)`.

Compose the existing ring maps. Transport the principal kernel through the Frobenius equivalence. (BMS1 (arXiv v3), Following Lemma 3.2; Lemma 3.3 and Lemma 3.4; printed pp.19–21). *Needs:* Mathlib `WittVector.fontaineTheta`; Mathlib `WittVector.frobeniusEquiv`; PerfectoidSpaces, P1 (*Fontaine's θ: W(S♭+) → S+ is surjective with kernel generated by a primitive nonzerodivisor (ECD Lemma 3.14)*).

**Checks.**

- `AInf.tildeTheta_test_teich`: `θ̃([a])=(a^(1/p))^♯`.
- `AInf.tildeTheta_test_p`: `θ̃(p)=p`.
- `AInf.tildeTheta_test_mu`: For `O_C`, `θ̃(μ)=ζ_p-1` rather than zero.

### AI.0.2 Finite Witt coefficient maps and their kernels

**Finite Witt coefficient maps** (`AInf.thetaWitt`). Use PerfectoidQuotients §0.2 `finiteFontaineTheta` for `θ_r`, its level-one, restriction, Frobenius and Teichmüller identities, and `frobenius_surjectivity_equivalences` for surjectivity. Define `θ̃_r=θ_r∘φ^(−r)` from these supplied maps. Under `A_inf(S)≅lim_F W_r(S)`, these are the projections, with `θ_1=θ` and `θ̃_1=θ̃`. This target adds the Verschiebung compatibility and cyclotomic normalizations.

`S` is integral perfectoid in the sense of BMS1 Definition 3.5; `r≥1`.

The API:

- `AInf.thetaWitt_level_one`: `θ_1=θ`; `θ̃_1=θ̃`.
- `AInf.thetaWitt_surjective`: Both maps onto `W_r(S)` are surjective.
- `AInf.thetaWitt_F`: `F∘θ̃_(r+1)=θ̃_r`; `F∘θ_(r+1)=θ_r∘φ`.
- `AInf.thetaWitt_R`: `R∘θ_(r+1)=θ_r`; `R∘θ̃_(r+1)=θ̃_r∘φ^(-1)`.
- `AInf.thetaWitt_V`: Choose `λ_(r+1)` with `θ_(r+1)(λ_(r+1))=V(1)`. Then `V θ_r(x)=θ_(r+1)(λ_(r+1)*φ^(-1)(x))`, and `V θ̃_r(x)=θ̃_(r+1)(φ^(r+1)(λ_(r+1))*x)`. In the cyclotomic normalization `ξ` is such a lift; `p` is not a lift over a characteristic-zero untilt.

Use the supplied Frobenius-limit identification and finite Fontaine identities; transport them along `φ^(−r)`. For Verschiebung choose a lift of V(1) under `θ_(r+1)`; transport it by `φ^(r+1)` for `θ̃`. Do not replace this lift by p. (BMS1 (arXiv v3), Lemmas 3.2–3.4, printed pp.19–21; Definition 3.5, p.21; Lemmas 3.12–3.13, pp.23–24; Lemma 3.9(v), printed pp.21–22 (surjectivity)). *Needs:* PerfectoidQuotients, §0.2 (`finiteFontaineTheta`, `frobenius_surjectivity_equivalences`); Mathlib `TruncatedWittVector`; PerfectoidSpaces, P1 (*Fontaine's θ: W(S♭+) → S+ is surjective with kernel generated by a primitive nonzerodivisor (ECD Lemma 3.14)*); *Frobenius-shifted Fontaine map* (§AI.0.1).

**Checks.**

- `AInf.thetaWitt_test_level_one`: For `r=1` recover the existing Fontaine map, not an independent `θ`.
- `AInf.thetaWitt_test_teich`: `θ̃_r([a])=[(a^(1/p^r))^♯]` and `θ_r([a])=[a^♯]`.
- `AInf.thetaWitt_test_FnotR`: For a non-Frobenius-fixed Teichmüller input, `F` and `R` compatibility differ by `φ`.
- `AInf.thetaWitt_test_VnotP`: Over a characteristic-zero untilt, V(1) in `W_2` has first Witt coordinate zero, whereas the first coordinate of `p` is `p≠0`; `θ_2(p)` cannot be used as V(1).

**Finite Witt kernel generators** (`AInf.xiWitt`). Import the generic regular-kernel and
perfectoid-base-change theorem from CrystallineCohomology §CR.4.4. In the cyclotomic
normalization set `ξ_r=product_{i=0}^{r-1}φ^(-i)(ξ)`, and `ξ̃_r=φ^r(ξ_r)=product_{i=1}^{r}φ^i(ξ)`. Then `ker(θ_r)=(ξ_r)`, `ker(θ̃_r)=(ξ̃_r)`. For general integral perfectoid `S` these products and their regularity are the supplied
kernel theorem, transported along `θ̃_r=θ_r∘φ^(−r)`; only their explicit cyclotomic formulas
and recursions are additional targets here.

`S` and `r` as in *Finite Witt coefficient maps* (§AI.0.2); `ξ` generates `ker(θ)`.

The API:

- `AInf.xiWitt_recursion`: `ξ_(r+1)=ξ_r*φ^(-r)(ξ)`.
- `AInf.xiWitt_tilde_recursion`: `ξ̃_(r+1)=ξ̃_r*φ^(r+1)(ξ)`.
- `AInf.xiWitt_ker_theta`: `θ_r` induces `A_inf/(ξ_r)≅W_r(S)`.
- `AInf.xiWitt_ker_tilde`: `θ̃_r` induces `A_inf/(ξ̃_r)≅W_r(S)`.
- `AInf.xiWitt_regular`: `ξ_r` and `ξ̃_r` are nonzerodivisors for integral perfectoid `S`, as are the distinguished generators after perfectoid base change.

Use the supplied kernel generators and their regularity, with the local kernel and regularity API as aliases. Expand the cyclotomic finite products to prove the recursions and identify their positive and negative Frobenius orientations. (BMS1 (arXiv v3), Lemmas 3.12–3.13; printed pp.23–24). *Needs:* CrystallineCohomology, §CR.4.4 (*Finite Witt base change for integral perfectoid rings*); *Finite Witt coefficient maps* (§AI.0.2); PerfectoidSpaces, P1 (*Fontaine's θ: W(S♭+) → S+ is surjective with kernel generated by a primitive nonzerodivisor (ECD Lemma 3.14)*).

**Checks.**

- `AInf.xiWitt_test_one`: `ξ_1=ξ`; `ξ̃_1=ξ̃`.
- `AInf.xiWitt_test_two`: `ξ_2=ξ*φ^(-1)(ξ)`, `ξ̃_2=ξ̃*φ(ξ̃)`.
- `AInf.xiWitt_test_orientation`: The shifted `r=2` product uses positive Frobenius powers, not `ξ*φ^(-1)(ξ)`.

**Infinite Witt specialization kernel** (`AInf.witt_limit_and_mu_kernel`). For `O_C`, `θ_infinity:A_inf→lim_R W_r(O_C)=W(O_C)` has kernel `(μ)`, equivalently the intersection over `r≥1` of `(ξ_r)=(μ/φ^(-r)(μ))` is `(μ)`. Its cokernel is killed by `W(m_C^♭)`; if `C` is spherically complete, it induces `A_inf/(μ)≅W(O_C)`. The ideal `(μ)` is independent of the compatible primitive roots. Ordinary completeness alone does not imply surjectivity.

`Suggested.lean` states the kernel intersection as `iInf_span_xiLevel_eq_span_mu`, using `mu` for the cyclotomic period and `xiLevel` for the finite Frobenius products.

Cyclotomic coefficients; p-adic and weak topologies as in §3.

Compute `ξ_r=μ/φ^(-r)(μ)`, and reduce the intersection modulo `p` using regularity of `(p,ξ_r)`. Identify the intersection of the resulting valuation ideals in `O_C^♭`. Pass the finite-level short exact sequences to the R-inverse limit, identifying the cokernel with `lim^1_r ξ_r A_inf`. Reduce modulo `p^s` and use factorization of multiplication by any `m∈m_C^♭` through the constant `μ` system to kill `lim^1`; spherical completeness makes this `lim^1` vanish. (BMS1 (arXiv v3), Lemma 3.23; printed p.27). *Needs:* *Finite Witt kernel generators* (§AI.0.2); *Cyclotomic period elements* (§AI.0.1).

**Regularity of integral periods** (`AInf.period_regularity`). The elements `p,μ,ξ,ξ̃` and their finite Frobenius products are nonzerodivisors in `A_inf(O_C)`. `A_inf/(ξ)=O_C` is p-torsion-free. Prove the regular pairs `(p,μ)`, `(p,ξ)` and `(p,ξ̃)` needed for finite derived reductions.

`C` as above; do not assert `O_C` is noetherian.

Reduce the Witt statements modulo `p` to the valuation domain `O_C^♭`. Use regular-sequence induction to obtain the stated regular pairs; the adic completeness inputs are those in Scope and ownership. (BMS1 (arXiv v3), Lemma 3.10, Proposition 3.17; Lemma 3.23 (regular-sequence argument); printed pp.22–27). *Needs:* PerfectoidSpaces, P1 (*Fontaine's θ: W(S♭+) → S+ is surjective with kernel generated by a primitive nonzerodivisor (ECD Lemma 3.14)*); *Cyclotomic period elements* (§AI.0.1); Mathlib `WittVector.isAdicCompleteIdealSpanP`.

**Flat cyclotomic power-series specialization**. For `j≥0`, the continuous map `ℤ_p[[T]]→A_inf`, `T↦[ε^(1/p^j)]−1`, is faithfully flat. The criterion used is BMS1 Remark 4.31: a map `A→B` of p-adically complete p-torsion-free rings is flat when A is noetherian and `A/p→B/p` is flat. The statement concerns only the displayed cyclotomic maps; this is not a claim that all maps of perfectoid rings are flat.

Standing hypotheses (C). A compatible primitive system `ε` is fixed. Completeness on `A_inf` is for `(p,[ε^(1/p^j)]−1)`.

Modulo `p`, use the injective map `𝔽_p[[T]]→O_C^♭` and torsion-freeness over the DVR `𝔽_p[[T]]`. The image of `T` is a nonzero nonunit. `ℤ_p[[T]]` is noetherian, and it and `A_inf` are p-adically complete and p-torsion-free. Apply BMS1 Remark 4.31 to the flat map modulo p. The map is local, so flatness is faithful. (BMS1 (arXiv v3), Remark 4.31 and proof of Lemma 4.30, printed pp.43–44; ČK (arXiv v3), Propositions 3.29 and 3.33 proofs, printed pp.21–24). *Needs:* *Regularity of integral periods* (§AI.0.2); Mathlib `PowerSeries`; Mathlib `Module.FaithfullyFlat.lTensor_bijective_iff_bijective`.

**Checks.**

- For `j=0` the map sends `T` to `μ`, and p,T remain a regular sequence.
- Use faithful flatness for descent of an isomorphism, not for replacing derived scalar extension by an arbitrary degreewise tensor.

### AI.0.3 Base change and coherence of finite Witt vectors

**Tor independence for finite Witt vectors** (`AInf.witt_base_change`). This is an alias
of CrystallineCohomology §CR.4.4, *Finite Witt base change for integral perfectoid rings*. For a map `S→S′` of integral perfectoid rings and `1≤j≤r`, the canonical maps `W_j(S) ⊗^L_(A_inf(S)) A_inf(S′)→W_j(S′)` and `W_j(S) ⊗^L_(W_r(S)) W_r(S′)→W_j(S′)` are quasi-isomorphisms. In the second map `W_j(S)` is a `W_r(S)`-module along either iterated Frobenius or restriction. This is Tor independence for the specified quotients, not flatness of every Witt map.

Integral perfectoid rings S,S′; finite lengths `1≤j≤r`; use the same Frobenius or restriction convention on both sides.

Transport the supplied equivalences through the coefficient identifications of §AI.0.2, preserving the chosen restriction or Frobenius module structure. The generic regular-resolution and derived-tensor argument is part of the supplier theorem. (BMS1 (arXiv v3), Lemma 3.13; printed p.24). *Needs:* CrystallineCohomology, §CR.4.4 (*Finite Witt base change for integral perfectoid rings*); *Finite Witt coefficient maps* (§AI.0.2); *Finite Witt kernel generators* (§AI.0.2).

**Checks.**

- For `j=r=1`, this is the supplied Fontaine quotient Tor-independence theorem.
- For a perfect `𝔽_p`-algebra, the imported generators are `p^j` and `W_j=W/p^j`; no characteristic-zero or roots-of-unity hypothesis is imposed.
- For `S=S′` and every `j≤r`, each comparison reduces to the identity on `W_j(S)`.
- For `j=1,r=2`, use either `F` on both sides or `R` on both sides; mixing the maps changes Teichmüller inputs by a p-th power.


**Finite Witt polynomial decomposition** (`AInf.witt_polynomial_calculation`). For any commutative ring `S` and finite Witt length `r≥1`, there are natural inclusions `W_r(S[T_1^(p^r),…,T_d^(p^r)])⊂W_r(S)[U_1,…,U_d]⊂W_r(S[T_1,…,T_d])`, where `U_i=[T_i]`, and likewise for Laurent variables. Taking the union over all p-power roots gives `W_r(S[T_i^(1/p^infinity)])=W_r(S)[U_i^(1/p^infinity)]` and the Laurent version. The p-adic completed versions used in Layer AI.3 follow by completion; this does not identify `W_r(S[T])` with `W_r(S)[T]`.

`S` any commutative ring; `p` prime; finite Witt length `r≥1` and finitely many variables. For the completed variants use the p-adic completion comparison, not an unrestricted monomial product.

Use Witt polynomial coordinates and the Teichmüller multiplicative lift to establish the two inclusions. Localize to obtain the Laurent statement. Pass to the filtered union of all p-power root variables, then to the specified p-adic completion. (BMS1 (arXiv v3), Lemma 9.8; printed p.74). *Needs:* *Finite Witt coefficient maps* (§AI.0.2); Mathlib `TruncatedWittVector`.

**The Witt almost ideal** (`AInf.witt_almost_ideal`). For the maximal ideal `m⊂O_C`, `W_r(m)=ker(W_r(O_C)→W_r(k))` is generated by Teichmüller elements [a], `a∈m`; it is idempotent and flat over `W_r(O_C)`, by Lemma 10.1 and Corollary 10.2. Separately, for `0≤j≤r`, `Ann(V^j(1))=ker(F^j:W_r(O_C)→W_(r-j)(O_C))=(q_(r,j))`, where `q_(r,j)=([ζ_(p^j)]−1)/([ζ_(p^r)]−1)` is the polynomial quotient supplied by cyclotomic divisibility, and `Ann(q_(r,j))=(V^j(1))=V^j W_(r-j)(O_C)`, by Corollary 3.18. The generic annihilator/kernel and V-image equalities are imported from CrystallineCohomology §CR.4.4 (BMS1 Remark 3.19); this target adds their explicit cyclotomic `q_(r,j)` generators and the almost-ideal assertions.

Finite `r≥1`; `O_C` valuation ring with divisible value group and the fixed compatible primitive p-power roots. For the cyclotomic annihilator formulas, `O_C` is p-torsion-free; `W_0=0`.

Use Lemma 10.1 to compare powers of Witt ideals with ideals of Teichmüller lifts; apply Corollary 10.2 to the idempotent increasing union of principal ideals `m`. Deduce flatness from the filtered union of principal ideals generated by nonzerodivisors. For the separate Corollary 3.18 formulas, use the supplied annihilator/kernel and V-image identities and compute the cyclotomic generator of `ker(F^j)` through the shifted `θ` kernels. Use nonzerodivisibility of `[ζ_(p^r)]−1` and the restriction map to identify `Ann(q_(r,j))` with `V^j W_(r-j)`. (BMS1 (arXiv v3), Lemma 10.1 and Corollary 10.2; printed p.80; BMS1 (arXiv v3), Corollary 3.18 and Remark 3.19; printed pp.25–26). *Needs:* CrystallineCohomology, §CR.4.4 (*Finite Witt base change for integral perfectoid rings*); *Finite Witt coefficient maps* (§AI.0.2); *Finite Witt kernel generators* (§AI.0.2); *Regularity of integral periods* (§AI.0.2); Mathlib `WittVector.map`; Mathlib `TruncatedWittVector`.

**Checks.**

- At `r=1`, `W₁(m)=m` is nonzero and proper; the length-one coefficient map is bijective, `p` gives a nonzero element of this ideal and `1` lies outside it.
- At `r=2,j=0`, `V⁰(1)=1` and `q_(2,0)=0`; their annihilators are zero and the whole ring, respectively.
- At `p=2,r=2,j=1`, `q=1+[ζ₄]` has nonzero zeroth coordinate `1+ζ₄`, while `V(1)` has zeroth coordinate zero; the annihilator generators cannot be interchanged.


**Finite-presentation devissage over Witt rings** (`AInf.witt_finite_presentation_devissage`). If `I⊂R` is finitely generated and `M` is an R/I-module, `M` is finitely presented over R/I iff it is finitely presented over `R`.

Commutative ring `R`; finitely generated ideal I; `M` annihilated by I.

Lift a finite presentation over R/I to `R`, adding the finitely many generators of I for each free generator. Reduce a finite `R` presentation modulo I for the converse. (BMS1 (arXiv v3), Lemma 3.25(i); printed p.28). *Needs:* Mathlib `ModuleCat`.

**Coherence of a square-zero extension** (`AInf.coherent_square_zero_extension`). If `S→R` is surjective with square-zero kernel I, `R` coherent and I finitely presented as an R-module, then `S` is coherent.

`I²=0`; `R` coherent; I finitely presented over `R`.

For a finitely generated `J⊂S`, present its image in `R` and then `J∩I` as a submodule of a finitely presented coherent module. Use the short exact sequence to present `J`. (BMS1 (arXiv v3), Lemma 3.26; printed p.29). *Needs:* *Finite-presentation devissage over Witt rings* (§AI.0.3).

**Coherence of a finitely generated quotient** (`AInf.coherent_quotient`). If `R` is coherent and `I⊂R` finitely generated, then R/I is coherent.

Coherent commutative `R`; finitely generated I.

Lift a finitely generated ideal to `R` and use its finite presentation plus `I/I²` to present the quotient ideal. (BMS1 (arXiv v3), Lemma 3.25(ii); printed p.28). *Needs:* *Finite-presentation devissage over Witt rings* (§AI.0.3).

**Coherence from Artin–Rees and two charts** (`AInf.coherence_artin_rees`). If `f` is regular in `R`, (R,f) has the Artin–Rees property on every inclusion of finitely generated modules, and R[1/f] and R/f are coherent, then `R` is coherent.

Artin–Rees means the induced f-adic topology equals the intrinsic topology for every finitely generated module inclusion.

Reduce the finite-generation of a relation kernel to a mod-f statement with uniformly bounded f-torsion. Use Artin–Rees again to present I/fI inside a coherent finite quotient. (BMS1 (arXiv v3), Lemma 3.27; printed p.29). *Needs:* *Coherence of a finitely generated quotient* (§AI.0.3); *Coherence of a square-zero extension* (§AI.0.3).

**Artin–Rees under a bounded isogeny** (`AInf.artin_rees_bounded_isogeny`). For an injection `R→S` with both f-torsion-free and cokernel killed by `f^n`, (R,f) has the Artin–Rees property iff (S,f) does.

`f∈R` regular on R,S; one fixed bound `n` on the cokernel.

Compare scalar extension and restriction modulo bounded f-torsion. Translate equality of induced and intrinsic topologies across these functors. (BMS1 (arXiv v3), Lemma 3.28; printed p.30). *Needs:* *Coherence from Artin–Rees and two charts* (§AI.0.3).

**Coherence of Witt vectors of perfectoid integers** (`AInf.witt_coherence`). `W_r(O_C)` and `W_r(O_C^♭)` are coherent for every finite `r`. Kernels of maps between finite free modules are finitely generated; hence finitely presented modules form an abelian category at these finite Witt levels.

`Suggested.lean` states `finite_witt_coherence` as finite generation of kernels of arbitrary maps between finite free modules over both coefficient rings.

Finite `r≥1`; the base is the valuation ring `O_C` or its tilt, not every perfectoid ring.

Use the valuation-ring kernel estimates, finite Witt truncation and induction on `r`. Do not infer coherence of the infinite ring `A_inf` from this theorem. (BMS1 (arXiv v3), Proposition 3.24; printed p.28). *Needs:* Mathlib `TruncatedWittVector`; *Coherence of a square-zero extension* (§AI.0.3); *Coherence from Artin–Rees and two charts* (§AI.0.3); *Artin–Rees under a bounded isogeny* (§AI.0.3).

**Checks.**

- At `r=1`, the two statements recover coherence of the valuation rings `O_C` and `O_C^♭`.
- A zero map between finite free modules has its entire finite free source as kernel, including rank zero.
- Finite Witt length is essential; coherence of `A_inf` does not follow from coherence of every `W_r(O_C^♭)`.

**Absence of almost-zero finite Witt sections** (`AInf.no_almost_zero_witt_sections`). Every finitely presented `W_r(O_C)-module M` has no nonzero element killed by `W_r(m)`, for finite `r≥1`. In particular this applies to the finitely presented toric cohomology modules; it is stronger than just the free-module case.

`M` finitely presented over finite `W_r(O_C)`; `m` the non-finitely-generated maximal ideal of the nondiscrete valuation ring.

A cyclic submodule generated by an almost-zero element is finitely presented by coherence. Its quotient of `W_r(k)` would force the residue kernel and then `m` to be finitely generated, a contradiction. (BMS1 (arXiv v3), Corollary 3.29; printed p.30). *Needs:* *Coherence of Witt vectors of perfectoid integers* (§AI.0.3); *The Witt almost ideal* (§AI.0.3).

**Étale base change of Witt vectors** (`AInf.witt_etale_base_change`). This is the local alias of the coefficient theorem supplied by CrystallineCohomology CR.4, *Witt localization and étale descent*. For any étale map `A→B` of commutative rings, `W_r(A)→W_r(B)` is étale. For any map `A→A′` with `B′=B⊗_A A′`, the natural map `W_r(A′)⊗_{W_r(A)}W_r(B)→W_r(B′)` is an isomorphism.

Commutative rings; `p` prime; finite Witt length `r≥1`; `A→B` étale; `A′` arbitrary.

Use the supplied arbitrary-ring coefficient theorem before the local de Rham–Witt comparisons. (BMS1 (arXiv v3), Theorem 10.4; printed p.81). *Needs:* CrystallineCohomology, CR.4 (*Witt localization and étale descent*, coefficient theorem); Mathlib `TruncatedWittVector`.

**Checks.**

- At `r=1`, `W_1(A)=A`, and the base-change map is the defining identification `A′⊗_A B=B′`.
- For `B=A[1/s]`, the supplied isomorphism is `W_r(A)[[s]⁻¹]≅W_r(A[1/s])`, compatibly with every base change `A→A′`.
- For an étale map of `ℚ`-algebras the ghost map identifies `W_r(A)→W_r(B)` with `A^r→B^r`; the tensor identity holds componentwise. The theorem therefore includes rings where `p` is invertible.

### Examples

For `ε = 1` the formulas give `μ = 0` and `ξ = p`, which is why `ε` must be a compatible system of
*primitive* roots. At length two
`ξ_2 = ξ · φ⁻¹(ξ)` while `ξ̃_2 = ξ̃ · φ(ξ̃)`: the two orientations already differ for `r = 2`.

### Dependencies

Other roadmaps: PerfectoidQuotients §§0.0, 0.2 (finite Fontaine maps, their identities and surjectivity, and length-one Tor independence), PerfectoidSpaces P1, CrystallineCohomology CR.4 (*Witt localization and étale descent*, arbitrary-ring coefficient theorem). Mathlib: `Module.FaithfullyFlat.lTensor_bijective_iff_bijective`, `ModuleCat`, `PowerSeries`, `TruncatedWittVector`, `WittVector.fontaineTheta`, `WittVector.frobeniusEquiv`, `WittVector.isAdicCompleteIdealSpanP`, `WittVector.map`, `WittVector.teichmuller`.

## Layer AI.0:integral: Integral coefficient interfaces and the Breuil–Kisin twist

This layer builds the integral coefficient maps and twists that the specializations of `AΩ` use:
the residue map to `W(k)`, the Breuil–Kisin line `A_inf{1}` with its étale realization `ℤ_p(1)`
and its specialization `O_C{1}`, Fontaine's `dlog`, the cotangent description of `O_C{1}`, and
`A_cris` as an `A_inf`-algebra.

### AI.0:integral.1 The residue map and the Breuil–Kisin line

**Witt residue specialization** (`AInf.residue`). Specialize Mathlib’s Witt functor to `O_C^♭→k` and calculate its cyclotomic periods: `μ` maps to 0 and `ξ,ξ̃` to p. This is the coefficient map for the crystalline special fiber.

`k` is the perfect residue field of `O_C`; `C` as above.

The API:

- `AInf.residue_periods`: `μ↦0` and `ξ,ξ̃↦p`.

Use functoriality of Witt vectors on the residue homomorphism. Evaluate `ε` and its roots at 1 in `k`. (BMS1 (arXiv v3), Introduction, printed p.4, and §4.2, pp.34–44; the remaining period values follow from the displayed cyclotomic formulas). *Needs:* Mathlib `WittVector.map`; *Cyclotomic period elements* (§AI.0.1).

**Checks.**

- `AInf.residue_test_teichmuller`: on [a], the zeroth Witt coordinate is the residue of a. Choosing a residue `r` with `r^p≠r` distinguishes this map from its composite with Witt Frobenius; this is the specialization of Mathlib’s `WittVector.map_teichmuller`.
- `AInf.residue_test_mu`: `μ` maps to 0, making `μ`-inverted residue specialization impossible.
- `AInf.residue_test_xi`: `ξ` maps to `p`, not 0 in W(k).

**Intrinsic Breuil–Kisin twist** (`AInf.bkTwist`). Define `A_inf{1}=lim_r` (ker `θ̃_r/(ker θ̃_r)^2`) with the divided transition maps normalized by `p`; set `A_inf{n}` to its tensor powers for `n≥0` and dual powers for `n<0`. The cyclotomic trivialization gives `A_inf{1}=(1/μ) A_inf(1)`; the linearized Frobenius on the intrinsic line has factor `1/ξ̃`. Distinguish this rank-one `A_inf` module from `ℤ_p(1)` and `O_C{1}`.

`C` as above; compatible roots only for a displayed trivialization, not for the intrinsic line.

The API:

- `AInf.bkTwist_zero`: `A_inf{0}` is the unit line.
- `AInf.bkTwist_add`: `A_inf{a}⊗A_inf{b}≅A_inf{a+b}`, coherently.
- `AInf.bkTwist_dual`: Dual of `A_inf{a}` is `A_inf{-a}`.
- `AInf.bkTwist_frobenius`: The linearized `φ` on the chosen basis of `A_inf{1}` is multiplication by `1/ξ̃`.
- `AInf.bkTwist_epsilon_change`: Changing `ε` transports the generator by the ratio dictated by `dlog(ε)/μ`; the intrinsic line is unchanged.
- `AInf.bkTwist_etale`: Étale realization of the line is `ℤ_p(1)`; `θ̃` reduction is `O_C{1}`.

Construct the conormal transition maps and divide their `p` factors, proving integrality. Compare a compatible system of conormal generators with `dlog(ε)/μ`. Use tensor-dual evaluation to extend to all integer powers. (BMS1 (arXiv v3), Example 4.24 (intrinsic conormal-limit construction); printed p.41; BMS2 (arXiv), Proposition 6.5 and Remark 6.6 (agreement of the intrinsic twists); printed pp.40–41; this determines the divided maps in the p-torsion-free perfectoid setting). *Needs:* *Finite Witt kernel generators* (§AI.0.2); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*).

**Checks.**

- `AInf.bkTwist_test_zero`: The zero tensor power is `A_inf`, with identity `φ`.
- `AInf.bkTwist_test_one`: `dlog(ε)` spans `μ*A_inf{1}`; after `θ̃` its image is `(ζ_p-1)O_C{1}`.
- `AInf.bkTwist_test_negative`: `A_inf{1}⊗A_inf{-1}≅A_inf`, whereas a rule omitting duals fails for negative powers.

**Completed cotangent description of the twist** (`AInf.completed_cotangent_twist`). The derived p-completed cotangent complex of `O_C/ℤ_p` is `O_C{1}[1]`, and for an integral perfectoid `O_C-algebra S` the derived p-completed relative cotangent complex of `S/O_C` vanishes. These use cohomological degree −1, so the twist is the shift by −1 of the completed complex.

Integral perfectoid `S` over `O_C`, with p-adic completion; do not replace the derived completion by ordinary differentials.

Use the perfectoid cotangent theorem of PerfectoidQuotients §0.3 together with DerivedModuleAlgebra §0.8 transitivity. Identify the surviving degree with the Tate module of differentials. (Zav (arXiv v3), §1 twist conventions, printed pp.9–10; Theorem 3.3.3 proof, pp.35–36). *Needs:* *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); DerivedModuleAlgebra, §0.8 (*The cotangent transitivity triangle*); DerivedModuleAlgebra, §1.3 (*The derived completion reflector*); PerfectoidQuotients, §0.3 (`perfectoid_cotangent_mod_p_vanishes`, `perfectoid_absolute_cotangent`).

**Checks.**

- For `S=O_C`, the relative completed cotangent complex is zero.
- The absolute completed cotangent complex has its single nonzero cohomology `O_C{1}` in degree −1.
- For `S=O_C⟨T^{±1/p^∞}⟩`, the relative completed cotangent complex vanishes despite the presence of torus coordinates.

**Fontaine dlog theorem** (`AInf.fontaine_dlog`). `O_C{1}=T_p(Ω^1_(O_C/ℤ_p))` is free of rank one; `dlog:O_C(1)→O_C{1}` is injective with image `(ζ_p−1)O_C{1}`. There is no canonical trivialization of the Galois Tate line.

`C` complete algebraically closed over `ℚ_p`; `ζ_p` primitive; continuous Galois action when `C` is a completed algebraic closure.

Use the completed cotangent calculation and the exact sequence of roots of unity. For general `C` reduce from `C_p` via the vanishing of the relative completed cotangent complex. (Zav (arXiv v3), Theorem 3.3.3 and proof, printed pp.35–36; twist conventions in §1, pp.9–10; dlog is not an integral unit isomorphism). *Needs:* *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); DerivedModuleAlgebra, §0.4 (*The full cotangent complex*).

**Checks.**

- At `p=2`, `ζ₂−1=−2`, so the dlog image is `2O_C{1}`.
- For odd `p`, the cokernel is a rank-one module over `O_C/(ζ_p−1)` and is nonzero.
- After tensoring with `C`, dlog is an isomorphism of the two lines.

### AI.0:integral.2 Integral crystalline coefficients and perfectoid regularity

**Integral crystalline coefficient interface** (`AInf.integral_crystalline_ring_interface`). Use the p-completed PD envelope `A_crys` of `(A_inf,ker θ)` from DerivedDeRhamCohomology §PD.7, with its `θ` augmentation and Witt residue map. Show the common coefficient maps commute and the Frobenius extends; no rational period-ring comparison is needed to construct this integral prefix.

PD structure extends the canonical structure on `p` where required; `C` as above.

Invoke the PD envelope universal property for the coefficient maps. Check Frobenius on `ξ` and the divided powers before p-completion. (BMS1 (arXiv v3), Definition 3.22(i), printed p.27; §12.1, pp.96–97; DerivedDeRhamCohomology, §PD.7 (*The crystalline period ring A_cris of a p-adically complete ring*) (principal regular case and coefficient maps)). *Needs:* DerivedDeRhamCohomology, §PD.7 (*The crystalline period ring A_cris of a p-adically complete ring*); *Witt residue specialization* (§AI.0:integral.1); *Regularity of integral periods* (§AI.0.2).

**Regularity of affinoid perfectoid coefficients** (`AInf.affinoid_perfectoid_regularity`). For an affinoid perfectoid Spa(S[1/p],S) over `Spa(C,O_C)`, `A_inf(S)=W(S^♭)` is `(p,μ)`-adically complete, `A_inf(S)/μ` is p-adically complete, and `(p^n,μ^m)` is a regular sequence for every `n,m>0`. Its quotient by this sequence is flat over `A_inf/(p^n,μ^m)`. `θ` is surjective with kernel generated by the image of `ξ`. The coefficient ring is `ξ`-adically separated. These assertions apply to the chart and all-coordinate towers; they are not asserted for an arbitrary p-complete algebra.

Standing hypotheses (C). `S` is the integral ring in the stated affinoid perfectoid pair; `S^♭` has no nonzero `O_C^♭`-torsion.

Use torsion-freeness of `S^♭` over the valuation ring `O_C^♭`, the Witt reduction modulo `p`, and regular-sequence dévissage to get regularity and finite-quotient flatness. The Witt coordinate topology proves `(p,μ)-completeness`; the finite Witt `θ` sequences prove p-completeness after mod `μ`. Apply the ideal-completeness/separatedness criterion to `ξ` in the radical of `(p,μ)`. (ČK (arXiv v3), Lemma 3.13 and §3.14, printed pp.14–15; §5.35, p.51; `ξ-separatedness` used in the PD injection). *Needs:* *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); PerfectoidSpaces, P1 (*Fontaine's θ: W(S♭+) → S+ is surjective with kernel generated by a primitive nonzerodivisor (ECD Lemma 3.14)*); PerfectoidSpaces, P2 (*Affinoid perfectoid spaces: adic spectra of perfectoid Huber pairs*); EnhancedDerivedSheaves, E4.

**Checks.**

- At `S=O_C` this specializes to the coefficient-ring regularity target.
- Flatness is stated for the finite quotients; no unrestricted completed-tensor exactness follows.

### Examples

The residue map `A_inf → W(k)` sends `μ` to `0` and `ξ`, `ξ̃` to `p`, so `μ` cannot be inverted
after crystalline specialization. The element
`dlog(ε)` generates `ℤ_p(1)`, and its image in `O_C{1}` is `(ζ_p − 1)` times a generator.

### Dependencies

Earlier layers: AI.0. Other roadmaps: DerivedDeRhamCohomology §§PD.6–PD.7, DerivedModuleAlgebra §§0.4, 0.6, 0.8, DerivedModuleAlgebra §§1.1–1.9, DerivedDeRhamCohomology §§1.14–1.22, EnhancedDerivedSheaves E1, EnhancedDerivedSheaves E4, PerfectoidQuotients §§0.3, 0.5, PerfectoidSpaces P1, PerfectoidSpaces P2. Mathlib: `WittVector.map`.

## Layer AI.0:period-comparison: Comparison with the rational period rings

This layer relates `A_inf` to Mathlib's `BDeRhamPlus` and to the rational period rings of
PadicPeriodRings, §§1.5, 4.1. The integral constructions of AI.0 do not depend on it.

### AI.0:period-comparison.1 Rational period maps and finite de Rham quotients

**Comparison with rational period rings** (`AInf.common_rational_period_maps`). Extend the common integral `A_inf` and `A_crys` maps to the rational rings supplied by PadicPeriodRings §§1.5, 4.1. Identify `B_dR⁺` with completion of `A_inf[1/p]` at `ker(θ[1/p])`, `B_dR=B_dR⁺[1/ξ]`, and the compatible `A_crys→B_dR⁺` and `B_crys` maps. Establish the Frobenius-twisted scalar-extension identities, not a second set of unrelated period constants.

Standing hypotheses (C). On `C=K̄^∧`, use PadicPeriodRings §1.5 for finite `K/ℚ_p` and §§3–4 for arbitrary perfect residue field. For general `C`, the following argument supplies the same contract without an arithmetic fixed-field assertion.

Starting with the primitive nonzerodivisor `ξ` and `A_inf/ξ=O_C`, localize at `p` and complete at `ξ` on Mathlib's existing carrier. Its quotient by `ξ` is `C`. Regularity of `ξ` persists in the completion, by the exact inverse systems of its finite quotients. A nonzero element has a finite `ξ-order` by separatedness; after dividing by that power its residue is nonzero in `C`, and a geometric-series inverse lifts the inverse residue. Hence the completion is a complete DVR with uniformizer `ξ`. Its finite quotients have the complete p-adic Tate topologies of `(A_inf/ξ^n)[1/p]`, and the inverse-limit topology is the same contract as PadicPeriodRings, not the `ξ`-adic topology with discrete `C` quotients. Section 3's principal PD presentation supplies the compatible `A_cris` map: on each finite `ξ-quotient` the divided generators `ξ^j/j!` vanish for `j≥n`, so the finite remaining coefficients give a continuous map from the p-completed envelope. The compatible quotient maps give `A_cris→B_dR⁺`; the separated PD presentation identifies it with the usual injection. Galois actions are used only when an action on `C` has been specified and then extend through these functorial constructions. This extends the primitive-kernel proof of PadicPeriodRings to all of (C), as in BMS1 Definition 3.22 and SW20 Definition 12.4.3 (including its Cartier-divisor proof, p.105).

Compare Mathlib's completion and localization carriers with the universal properties of the rational period rings of PadicPeriodRings, §§1.5, 4.1. Extend maps only after their continuity and denominator conditions are checked. Transport `ξ` and `ξ̃` along `φ` when changing scalar maps. (BMS1 (arXiv v3), Definition 3.22(ii–iii), printed p.27; §4.3, printed pp.41–43; PadicPeriodRings §§1.5, 4.1 supply the arithmetic case and the preceding argument supplies general `C`; SW20, Definition 12.4.3 and Remark 12.4.4, printed pp.105–106 (PDF pp.115–116)). *Needs:* *Integral crystalline coefficient interface* (§AI.0:integral.2); Mathlib `BDeRhamPlus`; Mathlib `BDeRham`; PadicPeriodRings, §§1.5, 4.1 (*generalBasePeriodRings*: period topologies and continuous actions); PadicPeriodRings, §§1.5, 4.1 (primitive-kernel completion and separatedness); PadicPeriodRings, §§1.5, 4.1 (*generalBasePeriodRings*: de Rham DVR and residue); PadicPeriodRings, §§1.5, 4.1 (identification of the Mathlib completion carriers).

**Finite de Rham coefficient quotients and flatness**. The common map `A_inf→B_dR⁺` is flat. For `n≥1`, `B_dR⁺/ξ^n` identifies with `(A_inf/ξ^n)[1/p]`, as a complete Tate `ℚ_p`-algebra, with `A_inf/ξ^n` an open p-adic ring of definition. A finite extension of W(k)[1/p] embedded in `C` has its unique continuous lift into `B_dR⁺`. The same quotient topology is used in all infinitesimal-envelope completions. These are properties of the existing BDeRhamPlus carrier, not a new period ring.

`Suggested.lean` states the flatness theorem as `ainf_deRhamPlus_flat` for the canonical localization/completion homomorphism `deRhamMap` into Mathlib's `BDeRhamPlus`.

Standing hypotheses (C); `n>0`. The complete-DVR assertion is the preceding target, on all of (C); the algebraic constants lift by the finite étale/Henselian argument below. For `C=K̄^∧` these are the supplied PadicPeriodRings §§1.5, 4.1, 4.3 maps.

Identify the finite `ξ-quotients` before passing to the inverse limit; carry the p-adic ring-of-definition topology through localization. Flatness uses the valuation-ring flatness input cited in CK §6.1 and the period-ring presentation; its non-noetherian hypotheses are kept. For a finite extension of W(k)[1/p], lift its residue-field embedding through the nilpotent thickenings `B_dR⁺/ξ^n` using formal étaleness in characteristic zero, and pass to the inverse limit; the chosen coefficient-field embedding and continuity are retained. Uniqueness is the same finite étale lifting property. (ČK (arXiv v3), §6.1, printed p.60; §6.2, pp.60–61; BMS1 (arXiv v3), §13.1 before Lemma 13.4, printed p.105). *Needs:* *Comparison with rational period rings* (§AI.0:period-comparison.1); PadicPeriodRings, §§1.5, 4.1 (*generalBasePeriodRings*: de Rham DVR and residue); PadicPeriodRings, §§1.5, 4.3 (canonical algebraic constants and the fixed embedding `K→B_dR⁺`); Mathlib `BDeRhamPlus`; PadicPeriodRings, §§1.5, 4.1 (*generalBasePeriodRings*: period topologies and continuous actions).

**Checks.**

- At `n=1` the quotient is `C`, while the `ξ`-adic inverse limit is `B_dR⁺`.
- Completing first for `(p,ξ)` and then inverting `p` is not silently substituted for the `ξ`-adic topology after p-inversion.

### Examples

`θ` extends to `B_dR⁺ → C` with kernel `(ξ)`; since `θ(ξ̃) = p ≠ 0`, the element `ξ̃` becomes a unit
of `B_dR⁺`, so the Frobenius-twisted kernel plays no role in the rational period ring.

### Dependencies

Earlier layers: AI.0:integral. Other roadmaps: PadicPeriodRings §§1.5, 2–4. Mathlib: `BDeRham`, `BDeRhamPlus`.

## Layer AI.1: The décalage operator `Lη`

This layer is homological algebra. It starts with the décalage `η_f` of a complex of
`f`-torsion-free modules in all integer degrees, passes to an invertible ideal sheaf of a ringed
topos and to the derived functor `Lη_I`, and proves the properties used in Layers AI.3–AI.7: the
cohomology formula, compatibility with filtered colimits and truncations, the lax symmetric
monoidal structure, the Bockstein description of `Lη_f K ⊗^L R/f`, behaviour under derived
completion and base change, and the computation on Koszul complexes. `Lη` is not a triangulated
functor.

The principal-`p` module construction, its derived localization, Bockstein reduction and
completion theorem have one owner: CrystallineCohomology CR.4. On termwise `p`-torsion-free
complexes of abelian groups, `R=ℤ`, `f=p`, the names `Decalage.etaTerm`, `Decalage.etaComplex`, `Decalage.etaMap`,
`Decalage.derivedEta` and `Decalage.bockstein` below are aliases of that core;
their cohomology and completion assertions are inherited from
`Crystalline.pDecalage_degree`, `Crystalline.pDecalage_d`, `Crystalline.pDecalage_map`,
`Crystalline.pDecalage_cohomology`, `Crystalline.pBockstein_decalage`,
`Crystalline.derivedPDecalage_model` and `Crystalline.derivedPDecalage_completion`.
For an arbitrary commutative `R` with `p` regular, on termwise `p`-torsion-free complexes its
`p`-instance is the same normalized abelian-group construction with the inherited `R`-action: `d(rx)/p=r(dx/p)` by uniqueness.
There is no additional principal-`p` localization or proof of the core theorems here.
The targets below extend this construction to general `f` and invertible ideal sheaves,
with the same normalized model on that specialization. DerivedModuleAlgebra supplies the
ambient module algebra and completion, rather than a second principal-`p` functor.

### AI.1.1 Principal décalage of a complex

**Divisibility submodule** (`Decalage.etaTerm`). `E_f(C)^i` is the R-submodule of `C^i` consisting of `x` for which there exists `y` in `C^(i+1)` with `f y=d x`. No torsion-freeness is needed to define this submodule.

The Check on degree-zero exclusion for `[ℤ --1→ℤ]` at `f=2` distinguishes divisibility from mere membership in the ambient module.

Standing hypotheses (Cx).

The API:

- `Decalage.etaTerm_mk`: If `f y=d x` then `x` belongs to `E_f(C)^i`.
- `Decalage.etaTerm_coe`: The inclusion `E_f(C)^i→C^i` is R-linear and injective.
- `Decalage.etaTerm_ext`: Two elements of `E_f(C)^i` agree exactly when their images in `C^i` agree.

Use the preimage under `d` of the image of scalar multiplication by `f`. For sums add the witnesses; for scalar multiples multiply the witness by that scalar. Commutativity of `R` supplies scalar linearity. (BMS1 (arXiv v3), Definition 6.2 and Remark 6.3, printed p.49). *Needs:* Mathlib `ModuleCat`; Mathlib `CochainComplex`.

**Checks.**

- `term_unit`: For `f=1`, `E_f(C)^i=C^i`.
- `term_zero`: For `f=0`, `E_f(C)^i=ker(d_i)`.
- `term_nondivisible`: For `C=[Z --1→ Z]` in degrees 0,1 and `f=2`, the element 1 does not belong to `E_f(C)^0`.
- The ambient carrier is the existing module `C^i`, not a replacement module type.
- The zero-divisor case is admitted for this definition only.

**Divided differential** (`Decalage.etaDifferential`). For `x` in `E_f(C)^i`, define `δ_i(x)` to be the unique `y` satisfying `f y=d_i x`, regarded as an element of `E_f(C)^(i+1)`. This is an R-linear map.

Standing hypotheses (Cx). Multiplication by `f` is injective on every term of `C` `(Cx_f)`.

The API:

- `Decalage.etaDifferential_spec`: The underlying value satisfies `f δ_i(x)=d_i x`; promoted as *Divisibility equation* (§AI.1.1).
- `Decalage.etaDifferential_unique`: Any `y` in the next term satisfying `f y=d_i x` equals `δ_i(x)`.
- `Decalage.etaDifferential_add`: `δ_i(x+x′)=δ_i(x)+δ_i(x′)`.

Existence is the defining divisibility condition; uniqueness uses injectivity on `C^(i+1)`. Apply `d` to `f y=d x`. Injectivity on `C^(i+2)` gives `d y=0`, so `y` belongs to the next divisibility submodule. Uniqueness applied to sums and scalar multiples proves linearity. (BMS1 (arXiv v3), Definition 6.2, differential diagram, printed p.49; division is by injective scalar multiplication, not by a field inverse). *Needs:* *Divisibility submodule* (§AI.1.1); Mathlib `HomologicalComplex.d_comp_d`.

**Checks.**

- `divided_unit`: For `f=1` the underlying differential is `d`.
- `divided_cycle`: For a genuine cocycle `x`, `δ_i(x)=0`.
- `divided_once`: For `[Z --4→Z]` and `f=2`, `δ_0(1)=2`, not 0 or 1.
- Do not select arbitrary preimages without proving uniqueness.
- The derivative of the selected preimage vanishes before it is re-bundled.

**Divisibility equation** (`Decalage.etaDifferential_spec`). For every `i` and `x` in `E_f(C)^i`, `f δ_i(x)=d_i x` in `C^(i+1)`.

Standing hypotheses (Cx). Multiplication by `f` is injective on every term of `C` `(Cx_f)`.

Unpack the unique preimage used to define `δ_i`. (BMS1 (arXiv v3), Definition 6.2, printed p.49). *Needs:* *Divided differential* (§AI.1.1).

**Checks.**

- Use the equation after applying any R-linear map.

**Square-zero divided differential** (`Decalage.etaDifferential_square`). `δ_(i+1)` composed with `δ_i` is zero for every integer `i`.

Standing hypotheses (Cx). Multiplication by `f` is injective on every term of `C` `(Cx_f)`.

The equation `f δ_i(x)=d x` and `d²=0` give `d δ_i(x)=0` by f-injectivity. Apply the divisibility equation once more: `f δ_(i+1)δ_i(x)=0`. Injectivity implies the value is zero. (BMS1 (arXiv v3), Definition 6.2, printed p.49). *Needs:* *Divisibility equation* (§AI.1.1); Mathlib `HomologicalComplex.d_comp_d`.

**Checks.**

- Retain injectivity on both required target terms.

**Principal décalage complex** (`Decalage.etaComplex`). Define the normalized principal complex `E_f(C)` with terms `E_f(C)^i` and differential `δ_i`. For a nonzerodivisor `f` in `R` it identifies with `η_f C` inside C[1/f] by `x↦f^i x` in degree `i`, using inverse powers for `i<0`.

Standing hypotheses (Cx). Multiplication by `f` is injective on every term of `C` `(Cx_f)`.

The API:

- `Decalage.etaComplex_term`: The ith term is the existing ModuleCat object associated to `E_f(C)^i`.
- `Decalage.etaComplex_d`: Its adjacent differential is `δ_i`.
- `Decalage.etaComplex_torsionFree`: Multiplication by `f` is injective on every term.

Apply CochainComplex.of to the existing module objects and adjacent maps. A submodule of an f-torsion-free module is f-torsion-free. For the localized comparison, injectivity of `C^i→C^i[1/f]` follows from termwise f-injectivity. The map `x↦f^i x` has the required image and intertwines `δ` with `d`. (BMS1 (arXiv v3), Remark 6.3, printed p.49; the omitted twist is restored by the stated localization isomorphism). *Needs:* *Divisibility submodule* (§AI.1.1); *Square-zero divided differential* (§AI.1.1); Mathlib `CochainComplex.of`.

**Checks.**

- `complex_two_term`: For regular `f`, normalized décalage of `[R --f²→R]` is `[R --f→R]` in the same two degrees.
- `complex_negative_degree`: The same calculation holds in degrees -3,-2; no nonnegative-degree hypothesis is introduced.
- `complex_zero`: The zero complex has zero décalage.
- The construction is indexed by `Z`, including negative degrees.
- The normalized model alone is not the generator-independent global ideal construction.

**Restriction of chain maps** (`Decalage.etaMap`). For an R-linear chain map `u:C→D` between termwise f-torsion-free complexes, define `E_f(u):E_f(C)→E_f(D)` by restricting `u_i` in every degree.

Standing hypotheses (Cx). Multiplication by `f` is injective on every term of `C` `(Cx_f)`. `D` is also termwise f-torsion-free; `u` is a chain map.

The API:

- `Decalage.etaMap_component`: The underlying component is `u_i`; promoted as *Restricted component equation* (§AI.1.1).
- `Decalage.etaMap_id`: Restriction of an identity chain map is the identity.
- `Decalage.etaMap_comp`: Restriction preserves composition.

If `f y=d x`, then `f u(y)=d` u(x), so restriction lands in the target submodule. The chain-map square for divided differentials follows after multiplying both sides by `f` and using injectivity in the target. Bundle the components with CochainComplex.ofHom. (BMS1 (arXiv v3), Lemma 6.4 and Corollary 6.5, printed p.50; the restriction and its square are made explicit here). *Needs:* *Principal décalage complex* (§AI.1.1); *Divisibility equation* (§AI.1.1); Mathlib `CochainComplex.ofHom`.

**Checks.**

- `map_identity`: The identity on `[Z --4→Z]` restricts to the identity on its `f=2` décalage.
- `map_zero`: The zero chain map restricts to zero.
- `map_composition`: A composite of two chain maps restricts to the composite, also in negative degrees.
- This construction is on the category of complexes, prior to localization.

**Restricted component equation** (`Decalage.etaMap_component`). The image in `D^i` of `E_f(u)_i(x)` equals `u_i` applied to the image of `x` in `C^i`.

Standing hypotheses (Cx). Multiplication by `f` is injective on every term of `C` `(Cx_f)`. `u:C→D` is an R-linear chain map and `D` is termwise f-torsion-free.

The component is the restriction of `u_i`; forget its membership witness. (BMS1 (arXiv v3), Lemma 6.4, printed p.50). *Needs:* *Restriction of chain maps* (§AI.1.1).

**Checks.**

- Use this equality to establish naturality on cycles and quotients.

**Cycles of principal décalage** (`Decalage.etaCycles`). Under `E_f(C)^i→C^i`, the cycles of `E_f(C)` identify with `Z^i(C)`.

Standing hypotheses (Cx). Multiplication by `f` is injective on every term of `C` `(Cx_f)`.

If `δx=0`, the divisibility equation gives `d x=0`. If `d x=0`, use the zero witness to see `x` belongs to `E_f(C)^i`; uniqueness of division gives `δx=0`. (BMS1 (arXiv v3), Lemma 6.4, proof, printed p.50; tensor twists are reinstated globally). *Needs:* *Divisibility equation* (§AI.1.1).

**Checks.**

- The identification is on actual submodules, before passing to cohomology.

**Boundaries after division** (`Decalage.etaBoundaries`). Within `Z^i(C)`, the boundaries of `E_f(C)` are exactly the `z` such that `f z` belongs to `B^i(C)`.

Standing hypotheses (Cx). Multiplication by `f` is injective on every term of `C` `(Cx_f)`.

If `z=δy`, then `f z=d y` is a boundary of `C`. If `f z=d y`, then `y` lies in `E_f(C)^(i-1)` by definition, and division uniqueness gives `δy=z`. (BMS1 (arXiv v3), Lemma 6.4, proof, printed p.50). *Needs:* *Divisibility equation* (§AI.1.1); *Cycles of principal décalage* (§AI.1.1).

**Checks.**

- Only f-annihilated cohomology is removed; this is not removal of all f-power torsion.

**Principal cohomology quotient** (`Decalage.etaCohomologyIso`). There is a natural R-linear isomorphism `H^i(E_f(C))≅H^i(C)/H^i(C)[f]`, where `H^i(C)[f]=ker(f:H^i(C)→H^i(C))`.

Standing hypotheses (Cx). Multiplication by `f` is injective on every term of `C` `(Cx_f)`.

Identify the cycle modules by *Cycles of principal décalage* (§AI.1.1). The new boundary submodule is the inverse image of `H^i(C)[f]` under `Z^i(C)→H^i(C)`, by *Boundaries after division* (§AI.1.1). Apply the module quotient isomorphism theorem. Naturality follows from the component equation. (BMS1 (arXiv v3), Lemma 6.4, printed pp.49–50; the annihilator has exponent one). *Needs:* *Cycles of principal décalage* (§AI.1.1); *Boundaries after division* (§AI.1.1); *Restricted component equation* (§AI.1.1).

**Checks.**

- For `[Z --4→Z]`, `f=2`, `H^1` becomes Z/2 rather than zero.

### AI.1.2 Décalage along an invertible ideal and its derived functor

**Tensor powers of an invertible ideal sheaf** (`Decalage.idealPow`). For an invertible ideal sheaf I of a ringed topos `(T, O)`, define `I^{⊗n}` for every `n ∈ ℤ`, with `I^{⊗0} = O` and `I^{⊗(−1)} = Hom_O(I, O)`, and the multiplication isomorphisms `I^{⊗m} ⊗_O I^{⊗n} ≅ I^{⊗(m+n)}`. For an O-module `M` on which I is torsion-free, the map `I^{⊗n} ⊗_O M → M ⊗_O` O[1/I] is injective; its image is the subsheaf `I^n M ⊂` M[1/I], which is `f^n M` wherever I `=` fO with `f` a nonzerodivisor, for every `n ∈ ℤ`. The décalage terms `(η_I C)^i =` {x `∈ C^i` : dx `∈ I·C^{i+1}} ⊗_O I^{⊗i}` are formed with these powers.

Standing hypotheses (T). `M` is an O-module on which local generators of I act injectively.

The API:

- `Decalage.idealPow`: the invertible O-module `I^{⊗n}` for `n ∈ ℤ`, with `I^{⊗0} = O`.
- `Decalage.idealPow_mul`: `I^{⊗m} ⊗_O I^{⊗n} ≅ I^{⊗(m+n)}`, associative and unital.
- `Decalage.idealPow_embed`: for I-torsion-free `M`, `I^{⊗n} ⊗ M →` M[1/I] is injective with image `I^n M`.
- `Decalage.idealPow_local`: where I `=` fO, the image of `I^{⊗n} ⊗ M` is `f^n M`, for every `n ∈ ℤ`.

Locally I `=` fO with `f` a nonzerodivisor, so I is an invertible O-module; define negative powers by duals and check the multiplication maps locally, where they are multiplication of powers of `f`. Injectivity into M[1/I] is local and reduces to injectivity of multiplication by `f^n` on `M`. Gluing the local identifications `I^{⊗n} ⊗ M ≅ f^n M ⊂` M[1/f] is independent of the generator, because two generators differ by a unit. (BMS1 (arXiv v3), Definition 6.2 and the paragraph before it, printed p.49). *Needs:* EnhancedDerivedSheaves, §0.2 (*K-injective and K-flat replacements*); EnhancedDerivedSheaves, E1 (*The enhanced derived category*); Mathlib `Module.Invertible`.

**Checks.**

- `idealPow_unit`: For I `= O`, every `I^{⊗n}` is `O` and the embedding is the identity of `M`.
- `idealPow_integers`: For `T` a point, `O = ℤ` and I `= (p)`: `I^{⊗(−1)} ⊗ ℤ` maps onto `p^{−1}ℤ ⊂ ℚ`.
- `idealPow_not_invertible`: For `O =` k[x, `y`] on a point and I `= (x, y)`, I is not invertible, I `⊗ I^∨ → O` is not an isomorphism, and the construction does not apply.

**Ideal décalage** (`Decalage.idealEta`). For a termwise I-torsion-free O-complex `C`, define `η_I C` in degree `i` as {x in `C^i` : `d x` belongs to I `C^(i+1)}` tensor `I^⊗i`, with the differential obtained by factoring `d` through I `C^(i+1)`. This construction is functorial in `C` and independent of local generators.

Standing hypotheses (T). The map I tensor `C^i→C^i` is monic in every degree.

The API:

- `Decalage.idealEta_term`: The degree-i term is the intrinsic divisibility subobject tensor `I^⊗i`.
- `Decalage.idealEta_changeGenerator`: In normalized coordinates `f′=u f` gives the degree-i factor `u^(-i)`.
- `Decalage.idealEta_map`: A chain map restricts on the divisibility subobjects and tensors with the identity of `I^⊗i`.

Form the divisibility subobject intrinsically as a kernel/preimage in O-modules and tensor it with the invertible sheaf `I^⊗i`. Locally trivialize `I=(f)`. The preceding normalized complex gives the differential and its square-zero identity. If `f′=u f`, the comparison of normalized coordinates in degree `i` multiplies by `u^(-i)`. These factors intertwine differentials and satisfy the cocycle identity. Use the tensor powers of *Tensor powers of an invertible ideal sheaf* (§AI.1.2) and descent of sheaves of modules (EnhancedDerivedSheaves, E1). (BMS1 (arXiv v3), Definition 6.2 and Remark 6.3, printed p.49). *Needs:* *Principal décalage complex* (§AI.1.1); *Restriction of chain maps* (§AI.1.1); EnhancedDerivedSheaves, E1; *Tensor powers of an invertible ideal sheaf* (§AI.1.2).

**Checks.**

- `ideal_unit`: For `I=O`, `η_I C` is canonically `C`.
- `ideal_overlap`: Changes by units `u` and `v` compose to the change by uv, including in degree -1.
- `ideal_two_term`: On a principal chart, `[R --f²→R]` gives `[R --f→R]` after trivializing the two line factors.
- Shifting `[R --f²→R]` to degrees `−1,0` gives degree-`−1` term `f^(−1)R` and degree-zero term `R`, with the restricted differential `f²` (normalized differential `f`).
- Over `ℤ`, changing `f=2` to `f′=−2` gives multiplication by `−1` on degree-one coordinates.

**Cohomology of ideal décalage** (`AInf.decalage_cohomology`). `H^i(η_I C)≅(H^i(C)/H^i(C)[I])` tensor `I^⊗i`, naturally in a termwise I-torsion-free `C`. Here H[I] is the kernel of `H→H` tensor `I^(-1)` induced by `I→O`.

Standing hypotheses (T). `C` is termwise I-torsion-free.

Use the *Principal cohomology quotient* (§AI.1.1) isomorphism on each trivializing chart. Flatness of the invertible line allows it to commute with cycles, boundaries and quotients. Naturality and the `u^(-i)` transition law glue the local quotient maps. (BMS1 (arXiv v3), Lemma 6.4, printed pp.49–50). *Needs:* *Ideal décalage* (§AI.1.2); *Principal cohomology quotient* (§AI.1.1); EnhancedDerivedSheaves, E1.

**Checks.**

- Keep the tensor factor even when a principal computation suppresses it.

**Preservation of quasi-isomorphisms** (`Decalage.eta_preservesQuasiIso`). If `u:C→D` is a quasi-isomorphism between termwise I-torsion-free O-complexes, `η_I u` is a quasi-isomorphism.

Standing hypotheses (T). `C` and `D` are termwise I-torsion-free; `u` is a quasi-isomorphism.

Each `H^i(u)` is an isomorphism and identifies the I-annihilator submodules. Pass to the quotient, tensor with the invertible line, and use the natural cohomology formula. (BMS1 (arXiv v3), Lemma 6.4, final assertion, printed p.50). *Needs:* *Cohomology of ideal décalage* (§AI.1.2); *Restricted component equation* (§AI.1.1).

**Checks.**

- No assertion about arbitrary maps with merely almost-isomorphic cohomology.

**Derived décalage** (`Decalage.derivedEta`). Construct `Lη_I:D(O)→D(O)` by applying `η_I` to termwise-flat K-flat representatives and inverting quasi-isomorphisms. On any I-torsion-free representative `C`, its value is represented by `η_I C`.

Standing hypotheses (T).

The API:

- `Decalage.derivedEta_objIso`: For an I-torsion-free representative `C`, `Lη_I(Q C)≅Q(η_I C)`.
- `Decalage.derivedEta_naturality`: The representative comparison commutes with the image of a chain map.
- `Decalage.derivedEta_identityIdeal`: For `I=O` the derived functor is naturally isomorphic to the identity.

Use E1 to choose strongly K-flat replacements and comparison roofs; their termwise flatness implies I-torsion-freeness. Use *Preservation of quasi-isomorphisms* (§AI.1.2) and the localization universal property to descend the complex-level construction. Compare an arbitrary I-torsion-free representative with a strongly K-flat one and use the same invariance. Do not give this functor an exact-functor instance: the short exact sequence `0→ℤ/p→ℤ/p²→ℤ/p→0` is a countertest. (BMS1 (arXiv v3), Lemma 6.1, Corollary 6.5 and Remark 6.6, printed pp.49–50). *Needs:* *Preservation of quasi-isomorphisms* (§AI.1.2); Mathlib `DerivedCategory`; Mathlib `DerivedCategory.Q`; EnhancedDerivedSheaves, §0.2 (*K-injective and K-flat replacements*); EnhancedDerivedSheaves, E1 (*The enhanced derived category*).

**Checks.**

- `derived_kills_once`: For a prime `p`, `Lη_p((ℤ/p)[0])=0`.
- `derived_retains_power_torsion`: `Lη_p((ℤ/p²)[0])≅(ℤ/p)[0]`, so it is not zero.
- `derived_nonexact`: The exact sequence with end terms `ℤ/p` and middle term `ℤ/p²` is not sent to a distinguished triangle.
- The existing Mathlib derived category and Q are used, not redefined.
- K-flat replacements and their compatibility with restriction and localization are those of EnhancedDerivedSheaves, E1.

**Filtered colimits of décalage** (`AInf.decalage_filtered_colimits`). `Lη_I` commutes with filtered colimits in D(O).

Standing hypotheses (T).

At the module level a filtered colimit is exact, hence preserves the kernel defining the divisibility subobject and tensoring by `I^⊗i`. Apply the filtered K-flat replacement/coherent-colimit comparison supplied by E1. Identify the resulting comparison on cohomology using exactness of filtered colimits and the annihilator quotient formula. (BMS1 (arXiv v3), Corollary 6.5, printed p.50). *Needs:* *Derived décalage* (§AI.1.2); EnhancedDerivedSheaves, E1.

**Checks.**

- This is not a claim that every limit or totalization is preserved.

**Canonical truncations** (`AInf.decalage_truncations`). For `a≤b` in `Z` together with infinite endpoints, `Lη_I(τ^[a,b] C)≅τ^`[a,b](Lη_I C), naturally in `C`.

Standing hypotheses (T).

Use the good-truncation construction on torsion-free models, replacing the boundary quotient term when necessary rather than assuming it is I-torsion-free. The maps induced by lower and upper good truncation give the comparison through the localization model. In the retained degrees the cohomology quotient formula is unchanged; outside them it vanishes. E1 supplies the t-structure comparison that identifies the resulting maps. (BMS1 (arXiv v3), Corollary 6.5, printed p.50). *Needs:* *Derived décalage* (§AI.1.2); *Cohomology of ideal décalage* (§AI.1.2); EnhancedDerivedSheaves, E1.

**Checks.**

- Stupid truncation is not substituted for canonical truncation.
- For `C=[ℤ --f→ℤ]` in degrees 0,1, `τ^{≤0}C` is ker(f)[0], whereas stupid truncation is `ℤ[0]`. With `f=2` the former is zero and the latter is not.

**Truncation bounds for décalage** (`AInf.truncation_comparison_maps`). There is a natural `I^m⊗τ≤m C→τ≤m Lη_I C`, and, if `H^n(C)` is I-torsion-free, `τ≥n Lη_I C→I^n⊗τ≥n C`. On [n,m] the two composites are multiplication by `I^(m−n)` under the line identifications.

Invertible ideal I; integers `n≤m`; `H^n(C)[I]=0` for the second map.

Use the explicit upper-truncated termwise-flat complex for the first map. For the lower map descend to the good-truncation boundary quotient: `f[z]=0` implies `[z]=0`, not containment of every degree n−1 term. Check the composite on an interval in a local generator, then glue line factors. (BMS1 (arXiv v3), Lemma 6.9, with repair of its printed intermediate quotient identity; printed p.51). *Needs:* *Ideal décalage* (§AI.1.2); *Cohomology of ideal décalage* (§AI.1.2); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*).

**Connective comparison and localization** (`AInf.connective_comparison`). For connective `C` whose `H^0` is I-torsion-free, the lower-truncation map `Lη_I C→C` is natural; after inverting I it is an equivalence. An unbounded complex has the localized comparison, not an unjustified integral map in all degrees.

Same lower-bound/torsion condition as Lemma 6.10; local inversion of the line ideal.

Take `n=0` in the lower-truncation map. After inversion the termwise normalized construction agrees with the original complex. (BMS1 (arXiv v3), Lemma 6.10; printed p.51). *Needs:* *Truncation bounds for décalage* (§AI.1.2).

**Composition of décalage** (`AInf.decalage_composition`). For invertible ideals I,J, `Lη_I Lη_J C≃Lη_(IJ) C`, naturally and compatibly with products. Locally this is division of the differential successively by generators `f` and `g`.

Invertible ideals in the common ringed topos; eligible representatives.

Use a complex termwise regular for both factors and compare the divisibility conditions. Glue the equality via the degree-i line factors. (BMS1 (arXiv v3), Lemma 6.11; printed p.52). *Needs:* *Derived décalage* (§AI.1.2); EnhancedDerivedSheaves §0.2 (`ClassicalDerived.replacements`).

### AI.1.3 Multiplicativity

**Lax symmetric monoidal structure** (`Decalage.etaTensor`). Construct the natural maps `Lη_I C ⊗^L Lη_I D→Lη_I(C ⊗^L D)` and `O→Lη_I O`, with the associativity, symmetry and unit coherence of a lax symmetric monoidal functor.

Standing hypotheses (T).

The API:

- `Decalage.derivedEta_tensorMap`: The map has direction `Lη_I C ⊗^L Lη_I D→Lη_I(C ⊗^L D)`.
- `Decalage.derivedEta_tensor_naturality`: The map commutes with a pair of input morphisms.
- `Decalage.derivedEta_tensor_coherence`: Associativity, braiding with the cochain sign, and the unit diagrams commute.

Choose strongly K-flat models C,D. Locally send `x` tensor `y` in normalized degrees i,j to `x` tensor `y` in degree i+j. The signed Leibniz identity puts it in the required divisibility submodule. Globally combine the line factors `I^⊗i` tensor `I^⊗j→I^⊗(i+j)`. The complexes `η_I C` and `η_I D` need not be K-flat. Resolve them before forming the derived source tensor and map that tensor to the ordinary tensor used by the element-level formula. Check coherence before passing to localization; E1 supplies independence of resolution and monoidal coherence in the shared category. (BMS1 (arXiv v3), Proposition 6.7, printed pp.50–51). *Needs:* *Derived décalage* (§AI.1.2); EnhancedDerivedSheaves, E1; *Tensor powers of an invertible ideal sheaf* (§AI.1.2).

**Checks.**

- `tensor_unit`: For `C=O` in degree 0 the tensor map agrees with the unit constraint.
- `tensor_sign`: Interchanging two degree-one cycles introduces a minus sign.
- `tensor_zero`: A tensor map with a zero input is the unique zero map.
- No universal tensor equivalence is asserted.
- Do not silently identify the derived source with its ordinary tensor product.

**Finitely generated torsion-free modules over a valuation ring**. Over a valuation ring `V`, every finitely generated torsion-free V-module is free, and every finitely generated submodule of a finite free V-module is free.

`V` a valuation ring (no rank or noetherian hypothesis).

Use Mathlib’s valuation-ring instances for `IsBezout` and `IsLocalRing`. By `Module.Flat.flat_iff_torsion_eq_bot_of_isBezout`, torsion-freeness gives flatness; `Module.free_of_flat_of_isLocalRing` then makes the finitely generated module free. A submodule of a free module is torsion-free, so the same argument applies to a finitely generated submodule. (Stacks, Tags 0539 (torsion-free modules over a valuation ring are flat), 00NZ (finite flat modules over a local ring are free) and 0ASU (finite submodules of free modules over a Bézout domain)). *Needs:* Mathlib `ValuationRing`, `Submodule.isTorsionFree_iff_torsion_eq_bot`, `Module.Flat.flat_iff_torsion_eq_bot_of_isBezout`, `Module.free_of_flat_of_isLocalRing`; PerfectoidSpaces, P0 (*The basic setup (K°, K°°) of a valuation ring with non-principal maximal ideal*).

**Checks.**

- For nonzero `a∈V`, the submodule `aV⊂V` is free of rank one, even when `a` is a nonunit.
- For a field `V`, a finite torsion-free module is a finite-dimensional vector space.
- For a nonzero nonunit `a`, `V/aV` is finitely generated but has torsion and is not free.

**Finitely presented modules over a valuation ring and their Fitting ideals**. Over a valuation ring `V`, every finitely presented V-module is isomorphic to `V^r ⊕ ⊕_{i=1}^{s} V/a_iV` with `a_i` nonzero nonunits; the zeroth Fitting ideal of a finitely presented torsion module `⊕ V/a_iV` is `(a_1 ⋯ a_s)`, and, for `V` of rank one, `Fitt_0(M) = Fitt_0(M′)·Fitt_0(M″)` for every short exact sequence 0 `→ M′ → M → M″ →` 0 of finitely presented torsion V-modules, so that the length val(M) `= v(Fitt_0 M)` for a real valuation `v` is additive.

`V` a valuation ring; for the length statement `V` has rank one and `v` is a fixed real-valued valuation.

Diagonalize a presentation matrix: over a valuation ring an entry of minimal valuation divides all others, so row and column operations reduce to diagonal form. Compute `Fitt_0` of a diagonal presentation; multiplicativity in exact sequences of torsion modules follows from the diagonal forms and the multiplicativity of determinants. Additivity of val follows. (Stacks, Stacks Project, Tag 0ASP (over a valuation ring every finitely presented module is a finite direct sum of cyclic modules V/fV); ČK (arXiv v3), §7.10, printed pp.70–71). *Needs:* Mathlib `ValuationRing`; Tau Ceti `TauCeti.RingTheory.FittingIdeal.Basic` (`TauCeti.fittingIdeal`, `TauCeti.fittingIdeal_eq_minorsIdeal_ker`) and `TauCeti.RingTheory.FittingIdeal.BaseChange` (`TauCeti.fittingIdeal_baseChange`); *Finitely generated torsion-free modules over a valuation ring* (§AI.1.3).

**Checks.**

- For `V/a⊕V/b`, `Fitt₀=(ab)`, giving valuation length `v(a)+v(b)`.
- For the zero module the zeroth Fitting ideal is `V` and its valuation is zero.
- Over a DVR, `0→V/π→V/π²→V/π→0` gives `(π²)=(π)(π)` and length two.

**Monoidality over a valuation ring** (`AInf.valuation_monoidality`). For a valuation ring `R` and nonzero `f`, the lax product map `Lη_f(C) ⊗^L Lη_f(D)→Lη_f(C ⊗^L D)` is an equivalence. For a general ring only the lax map is constructed.

`R` valuation ring; `f` nonzero; derived tensor computed with eligible replacements.

Reduce by filtered colimits and flat pullback to finitely presented modules over a valuation ring. Compute the cyclic torsion summands using the relative divisibility of f,g,h. (BMS1 (arXiv v3), Proposition 6.8; printed p.50). *Needs:* *Lax symmetric monoidal structure* (§AI.1.3); *Principal cohomology quotient* (§AI.1.1); *Finitely generated torsion-free modules over a valuation ring* (§AI.1.3); *Finitely presented modules over a valuation ring and their Fitting ideals* (§AI.1.3).

**Checks.**

- For `C=D=R[0]`, the product is the identity on `R[0]`.
- Over a DVR with uniformizer `π`, `f=π` and `C=R/π`, both sides vanish for every `D`.
- Over the same DVR, for `C=D=R/π²` and `f=π`, each side has `R/π` in cohomological degrees −1 and 0 and vanishes in all other degrees.

### AI.1.4 The Bockstein complex and the Beilinson filtration

**Bockstein complex** (`Decalage.bockstein`). Construct `B_I(C)` with degree-i term `H^i(C ⊗^L O/I)` tensor `I^⊗i` and differential the connecting map for `0→I/I²→O/I²→O/I→0`, with its conormal factor absorbed in the next line twist.

Standing hypotheses (T). `C` is an object of D(O).

The API:

- `Decalage.bockstein_term`: The degree-i module is `H^i(C ⊗^L O/I)` tensor `I^⊗i`.
- `Decalage.bockstein_lift`: Locally, `d x=f y` gives `β([x])=[y]`.
- `Decalage.bockstein_square`: The composite of consecutive Bockstein maps is zero.

Use a termwise I-torsion-free model to compute reduction by the two-term flat resolution of O/I. On a principal chart a cocycle modulo `f` is lifted to `x` with `d x=f y`; send its class to the class of `y` modulo `f`. Changing the lift or a cohomology representative changes `y` by a boundary. Since `d y=0` by f-injectivity, repeating the boundary operation gives zero. The line factors make this description independent of a chosen generator. (BMS1 (arXiv v3), Proposition 6.12, printed p.52). *Needs:* *Derived décalage* (§AI.1.2); EnhancedDerivedSheaves, E1.

**Checks.**

- `bockstein_identity`: For `C=[Z --p→Z]` in degrees 0,1, reduction has two `ℤ/p` groups and `β` between them is the identity.
- `bockstein_zero`: For `C=[Z --p²→Z]`, `β` is zero.
- `bockstein_shift`: For the cochain shift C[1], the source differential and hence the normalized Bockstein acquire the cochain shift sign.
- The differential is the Bockstein, not zero by definition.
- The construction does not assume that `C` itself has torsion-free cohomology.

**Reduction to the Bockstein complex** (`AInf.bockstein_reduction`). There is a natural quasi-isomorphism `(Lη_I C) ⊗^L O/I→B_I(C)`. On an I-torsion-free representative it is induced by sending a divided-differential term to its cohomology class modulo I.

Standing hypotheses (T). `C` is an object of D(O).

Both C/I and `(η_I C)/I` compute their derived reductions: the flat resolution `[I→O]` is bounded and scalar multiplication is termwise injective. This is not an assertion that the complexes themselves are K-flat. The assignment `x↦[x` mod `f`] in normalized coordinates kills fE and intertwines the divided differential with `β`. Injectivity on cohomology: write a reduced cycle `x` with `d x=f² z`. If `[x]` is a Bockstein boundary, choose `y` with `d y=f w` and `x−w=d` v+f a. Replacing `y` by y+f `v` gives `x−δ(y+f v)=f` a. Differentiation gives `f d a=f² z`, so a belongs to `E` and `x` is a boundary modulo fE. Surjectivity: a `β-closed` class has a lift `x` with `d x=f y` and `y=d` z+f `w`. Replace `x` by x−f `z`. Its differential is `f² w`; `d w=0`, so the corrected lift is a cycle of E/fE. The argument works in every degree with the prescribed line factors and is natural under chain maps. (BMS1 (arXiv v3), Proposition 6.12 and proof, printed pp.52–53). *Needs:* *Ideal décalage* (§AI.1.2); *Bockstein complex* (§AI.1.4); *Derived décalage* (§AI.1.2); EnhancedDerivedSheaves, E1.

**Checks.**

- The `[Z --p→Z]` test is acyclic on both sides; replacing `β` by zero would fail it.
- For `C=[ℤ --p²→ℤ]`, `β` is zero and both sides have `ℤ/p` in degrees 0 and 1; this distinguishes the comparison from the acyclic p-differential case.

**Bockstein comparison chain map** (`Decalage.bocksteinMap`). For I-torsion-free `C` locally with generator `f`, send `x=f^i y` in `(η_I C)^i` to the class of `y` modulo `f` in `H^i(C/f)⊗I^i`. This defines a chain map from `η_I C⊗O/I` to the Bockstein complex; division records the trivialization and glues intrinsically.

Termwise I-torsion-free `C`; quotient and line factors as in Proposition 6.12.

The API:

- `Decalage.bocksteinMap_component`: Degree `i` sends `f^i y` to `[y]⊗f^i`.
- `Decalage.bocksteinMap_chain`: The next component carries the divided differential to `β`.
- `Decalage.bocksteinMap_natural`: Commutes with maps of termwise regular complexes.

Check `dy=fz` and `β[y]=[z]`. Changing `f` by a unit rescales the degree-i factors correctly. (BMS1 (arXiv v3), Proposition 6.12 proof; printed p.52). *Needs:* *Ideal décalage* (§AI.1.2); *Bockstein complex* (§AI.1.4).

**Checks.**

- `Decalage.bocksteinMap_test_unit`: For `I=O` both reductions are zero.
- `Decalage.bocksteinMap_test_zero_d`: For the zero-differential two-term regular complex `R` in degrees 0 and 1, the comparison modulo `f` is a quasi-isomorphism; both cohomologies are the ordinary quotient R/f.
- `Decalage.bocksteinMap_test_f2`: For `[R --f²→R]`, reduction after `η` has zero differential, while the original f-complex Bockstein calculation detects the correct scaling.

**Injectivity of the Bockstein comparison** (`AInf.bockstein_map_injectivity`). The comparison map induces injective cohomology maps; a class mapping to a Bockstein boundary is a boundary modulo I in `η_I C`.

Proposition 6.12 hypotheses.

Lift the Bockstein boundary in `C` and use termwise regularity to remove the residual I multiple. (BMS1 (arXiv v3), Proposition 6.12 proof, injectivity argument; printed p.52). *Needs:* *Bockstein comparison chain map* (§AI.1.4).

**Surjectivity of the Bockstein comparison** (`AInf.bockstein_map_surjectivity`). Every Bockstein cocycle class lifts to a cocycle modulo I in `η_I C`, giving the surjectivity of the comparison on cohomology.

Proposition 6.12 hypotheses.

Lift a representative with differential divisible by I. The vanishing `β` condition permits a correction whose new divided differential is an I multiple. (BMS1 (arXiv v3), Proposition 6.12 proof, surjectivity argument; printed p.53). *Needs:* *Bockstein comparison chain map* (§AI.1.4).

**Filtered décalage as Beilinson truncation** (`AInf.filtered_beilinson_description`). For an invertible ideal I, the filtered object `Fil^i=I^i⊗K (i∈Z, transitions from I→O)` has Beilinson connective cover `τ_B≤0` Fil whose underlying object is `Lη_I K`. Underlying means the colimit as `i` tends to minus infinity. The graded pieces agree with the Bockstein/good-truncation description, compatibly with products.

`K` in the enhanced unbounded derived category; Cartier ideal I.

Apply Beilinson truncation to the explicit I-power filtration. Identify the local divided-differential model and compute its graded pieces. Use the symmetric monoidal filtered enhancement for the lax product coherence. (BMS2 (arXiv), Proposition 5.8; Remark 5.9; Corollary 5.10; printed pp.32–33). *Needs:* DerivedDeRhamCohomology, §1.18 (*The Beilinson t-structure*); DerivedDeRhamCohomology, §1.19 (*The Beilinson heart is the category of complexes*); *Reduction to the Bockstein complex* (§AI.1.4); *Derived décalage* (§AI.1.2).

### AI.1.5 Completion

**Preservation of derived completeness** (`AInf.preservation_derived_completeness`). If `J` is a locally finitely generated ideal and `C` is derived J-complete, then `Lη_I C` is derived J-complete.

Standing hypotheses (T). The topos `T` is replete. `J` is locally finitely generated; `C` is derived J-complete.

Use the replete-sheaf cohomology criterion supplied by E4 from DerivedModuleAlgebra §§1.2–1.5. The map `H^i(C)→H^i(C)` tensor `I^(-1)` has complete source and target. Its kernel is complete; the quotient by that kernel is complete. Tensor with the invertible line `I^⊗i`, locally a free rank-one module, and apply the cohomology criterion again. (BMS1 (arXiv v3), §6.2 standing assumptions and Lemma 6.19, printed pp.53–55). *Needs:* *Cohomology of ideal décalage* (§AI.1.2); *Derived décalage* (§AI.1.2); DerivedModuleAlgebra, §1.3 (*The derived completion reflector*); DerivedModuleAlgebra, §1.5 (*When ordinary quotient towers compute completion*); EnhancedDerivedSheaves, E2 (*Replete topoi*); EnhancedDerivedSheaves, E2 (*Derived limit of an epimorphic system*); EnhancedDerivedSheaves, §E4.3 (`derivedComplete_iff_cohomology`); EnhancedDerivedSheaves, E4 (*Kernels and cokernels of complete modules*); EnhancedDerivedSheaves, E4 (*Inverse limit of a coefficient system*).

**Checks.**

- Closure is under kernels/cokernels of maps BETWEEN complete modules and extensions; arbitrary submodules are not covered.
- This statement does not commute `Lη_I` with J-completion.

**Completion at the décalage ideal** (`AInf.completion_at_decalage_ideal`). For derived I-completion `C→Ĉ`, the canonical comparison `completion_I(Lη_I C)→Lη_I` Ĉ is a quasi-isomorphism.

Standing hypotheses (T). The topos `T` is replete.

The target is complete by *Preservation of derived completeness* (§AI.1.5), so the map extends along the completion unit. On a principal chart both objects are derived f-complete; reduce the comparison modulo `f` by derived Nakayama. Completion preserves the `mod-f²` coefficient sequence and its mod-f reduction, so the cohomology classes and Bockstein agree. Apply *Reduction to the Bockstein complex* (§AI.1.4). Glue the comparison using the sheaf completion interface. (BMS1 (arXiv v3), Lemma 6.20, first map, printed p.55). *Needs:* *Preservation of derived completeness* (§AI.1.5); *Reduction to the Bockstein complex* (§AI.1.4); DerivedModuleAlgebra, §1.3 (*The derived completion reflector*); DerivedModuleAlgebra, §1.5 (*When ordinary quotient towers compute completion*); EnhancedDerivedSheaves, §E4.3 (`derivedComplete_iff_cohomology`); EnhancedDerivedSheaves, E4 (*Kernels and cokernels of complete modules*); EnhancedDerivedSheaves, E4 (*Inverse limit of a coefficient system*).

**Checks.**

- The ideal is I on BOTH sides; an unrelated `J` is excluded.
- This target is the first map of Lemma 6.20; its second map is *Inverse-limit comparison* (§AI.1.5).

**Inverse-limit comparison** (`AInf.completion_limit_model`). The canonical map `Lη_I Ĉ→Rlim_n Lη_I(C ⊗^L O/I^n)` is a quasi-isomorphism, where Ĉ is derived I-completion.

Standing hypotheses (T). The topos `T` is replete.

All objects are derived I-complete; derived tensor with O/I commutes with this limit because O/I has the finite flat resolution `[I→O]`. Locally use `f` and a complex `D` of O/f-modules. Compute `D ⊗^L O/f^n` using `[O --f^n→O]`, so it has the zero-differential extra shifted summand. The transition `n+1→n` is identity on the unshifted summand and multiplication by `f` on the shifted summand, hence zero there on `D`. The extra pro-system is pro-zero. This identifies the mod-f Bockstein towers; the inverse-limit and repleteness comparison is that of EnhancedDerivedSheaves, E2 and E4. Conclude by the complete-object reduction criterion. (BMS1 (arXiv v3), Lemma 6.20, second map and last proof paragraph, printed p.55). *Needs:* *Completion at the décalage ideal* (§AI.1.5); *Reduction to the Bockstein complex* (§AI.1.4); DerivedModuleAlgebra, §1.3 (*The derived completion reflector*); DerivedModuleAlgebra, §1.5 (*When ordinary quotient towers compute completion*); EnhancedDerivedSheaves, E2 (*Replete topoi*); EnhancedDerivedSheaves, E2 (*Derived limit of an epimorphic system*); EnhancedDerivedSheaves, §E4.3 (`derivedComplete_iff_cohomology`); EnhancedDerivedSheaves, E4 (*Kernels and cokernels of complete modules*); EnhancedDerivedSheaves, E4 (*Inverse limit of a coefficient system*).

**Checks.**

- Do not replace the derived tensor factors by naive quotients of a torsion complex.
- Record the transition maps: a termwise splitting alone does not prove a pro-isomorphism.

**Injectivity before completion** (`Decalage.finite_shift_injective`). Let `B=Q[x]`, `M=direct` sum over `n≥0` of `B e_n`, and `S(e_0)=0`, `S(e_(n+1))=e_n`. The B-linear endomorphism `F=S−x` is injective on `M`.

For a nonzero finite sequence a choose the largest `N` in its support. The coefficient of `e_N` in F(a) is −x `a_N`. It is nonzero because `B` is a domain and `a_N≠0`. (BMS1 (arXiv v3), Warning after Lemma 6.19, printed p.55; the displayed coefficient calculation proves injectivity). *Needs:* Mathlib `Finsupp`.

**Checks.**

- The same assertion fails on the x-adic completion, as computed below.
- This lemma does not use a finite-dimensional truncation with an artificial boundary condition.

**Completion of the test module** (`AInf.restricted_sequence_completion`). With B,M as above, let `A=B[t]` act on `M` by `t=F`. The derived (x)-completion of M[0] is concentrated in degree zero and equals `N={(a_n) in product Q[[x]] : for each r, all but finitely many a_n lie in x^r Q[[x]]}`. The A-action extends by `t(a)_n=a_(n+1)−x a_n`.

The endomorphism `F` is B-linear, so polynomial evaluation defines an A-module structure. Both `x` and `t` are nonzerodivisors of A; `x` is injective on `M`. The free A-resolution [A `--x^r→A`] of `A/x^r` shows `M ⊗^L A/x^r=(M/x^rM)[0]`. The quotient transition maps are surjective, so their derived limit is their ordinary limit in degree zero. Use the regular-principal completion comparison from DerivedModuleAlgebra §1.5. Taking coordinates identifies this inverse limit with `N`: each finite-level vector has finite support; conversely this support condition makes every truncation a finite vector. Shift and multiplication by `x` preserve the restricted-sequence condition and agree with the original action on finite sequences. (BMS1 (arXiv v3), After Lemma 6.19, printed p.55; affine completion framework in Stacks 091N). *Needs:* *Injectivity before completion* (§AI.1.5); DerivedModuleAlgebra, §1.3 (*The derived completion reflector*); DerivedModuleAlgebra, §1.5 (*When ordinary quotient towers compute completion*); Mathlib `PowerSeries`; Mathlib `PowerSeries.coeff`.

**Checks.**

- `N` is a restricted product, not the entire product.
- The natural map `M→N` is the usual coefficientwise inclusion.

**Kernel created by completion** (`Decalage.completed_shift_kernel`). For `N` and `F` in *Completion of the test module* (§AI.1.5), ker `F={ (a,xa,x²a,...) : a in Q[[x]] }`. This kernel is nonzero.

The equation `F(v)=0` is `v_(n+1)=x v_n`; induction gives `v_n=x^n v_0`. Every such sequence satisfies the restricted condition: `n≥r` implies `x^n` a is divisible by `x^r`. Choose `a=1` to obtain a nonzero kernel element whose zeroth coordinate is 1. (BMS1 (arXiv v3), Warning after Lemma 6.19, printed p.55; the displayed recurrence computes the kernel). *Needs:* *Completion of the test module* (§AI.1.5); Mathlib `PowerSeries`.

**Checks.**

- No convergence of a numerical series is being assumed: the condition is x-adic divisibility of coordinates.

**Failure of unrelated completion** (`AInf.unrelated_completion_counterexample`). For `A=Q[x,t]`, `I=(t)`, `J=(x)`, and the module `M` defined above, the canonical map `completion_J(Lη_t M[0])→Lη_t(completion_J M[0])` is not a quasi-isomorphism. On `H^0` it is `N→N/N[t]`, with nonzero kernel generated as Q[[x]]-module by `(1,x,x²,...)`.

`F` is injective on `M`, so `Lη_t M[0]=M[0]`. Its derived J-completion is N[0]. The cohomology formula gives `Lη_t N[0]=(N/N[t])[0]`. Naturality of the quotient formula and the completion adjunction identify the canonical comparison with the quotient map `N→N/N[t]`. The displayed kernel is nonzero, so that comparison is not a quasi-isomorphism. (BMS1 (arXiv v3), Independent counterexample motivated by the warning after Lemma 6.19, printed p.55; not BMS1 Example 6.5). *Needs:* *Injectivity before completion* (§AI.1.5); *Completion of the test module* (§AI.1.5); *Kernel created by completion* (§AI.1.5); *Derived décalage* (§AI.1.2); *Cohomology of ideal décalage* (§AI.1.2); *Preservation of derived completeness* (§AI.1.5).

**Checks.**

- This refutes the canonical comparison, not the stronger claim that the two objects can never be abstractly isomorphic.
- Noetherianity of A does not repair the example: `M` is not finitely generated.
- Finite truncations `v_N=Σ_(n<N)x^n e_n` satisfy `F(v_N)=−x^N e_(N−1)`, recording the disappearing defect.

**Cohomology of completed direct sums** (`AInf.completed_sum_cohomology`). In a replete ringed topos with `J` locally principal, let `C_i` be derived J-complete, `H^0(C_i)` classically J-complete, and `H^0(C_i)[J^infinity]=H^0(C_i)[J^n]` for a single `n` independent of `i`. The `H^0` of the derived J-completed direct sum is the classical completion `lim_k direct-Σ_i H^0(C_i)/J^k`. The analogous degree-q statement follows by shifting each `C_i` and imposing these hypotheses on `H^q`.

Replete ringed topos; `J` locally generated by one element. Each indicated cohomology module classically complete and its J-power torsion uniformly bounded in the family.

Derived completion of a direct sum of derived complete modules has no negative cohomology: its possible inverse-limit torsion obstruction injects into the zero product obstruction. Use the cohomology/completion spectral sequence and the uniform bound to get ordinary separated completion. (BMS1 (arXiv v3), Lemma 6.17; Lemma 6.18; printed p.54). *Needs:* EnhancedDerivedSheaves, E2 (*Derived limit of an epimorphic system*); EnhancedDerivedSheaves, §E4.3 (`derivedComplete_iff_cohomology`); DerivedDeRhamCohomology, §1.15 (*Completion of a filtered object*).

**Completed extension of scalars along a map of adic rings** (`Decalage.completedTensor`). For a map of commutative rings `R → S` with finitely generated ideals I `⊂ R` and `J ⊂ S` such that IS `⊆ J`, and `K ∈` D(R), define `K ⊗̂^L_R S` as the derived J-completion of `K ⊗^L_R S`; it lies in the derived J-complete objects of D(S), and is a commutative algebra object when `K` is one. It is transitive along `(R, I) → (S, J) → (S′, J′)`, and agrees with `K ⊗^L_R S` when `K` is perfect and `S` is derived J-complete. The same construction on a ringed topos uses derived completion of sheaves.

`R → S`, I, `J` as stated; on a topos, the completion is the one of the following target when the topos is not replete.

The API:

- `Decalage.completedTensor`: `K ↦ (K ⊗^L_R S)^∧_J` with values in derived J-complete S-complexes.
- `Decalage.completedTensor_trans`: transitivity along `(R, I) → (S, J) → (S′, J′)`
- `Decalage.completedTensor_perfect`: agreement with `⊗^L_R S` for perfect `K` and derived J-complete `S`.
- `Decalage.completedTensor_alg`: commutative algebra objects go to commutative algebra objects.

Derived J-completion is a left adjoint to the inclusion of derived J-complete objects, so the composite with `⊗^L_R S` is a well-defined functor; lax monoidality gives the algebra structure. Transitivity: completing in `J′` after completing in `J` agrees with completing in `J′` once JS′ `⊆ J′`, by the universal property. For perfect `K`, `K ⊗^L_R S` is a perfect S-complex and hence derived J-complete when `S` is. (ČK (arXiv v3), §1.7, (1.7.1) and the paragraph after it, printed pp.6–7; ČK (arXiv v3), §5.43, (5.43.1)–(5.43.2), printed p.58). *Needs:* DerivedModuleAlgebra, §1.3 (*The derived completion reflector*); EnhancedDerivedSheaves, E4 (*Completed sheaf tensor product*); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*).

**Checks.**

- `completedTensor_unit`: For `K = R` and `S` derived J-complete, `K ⊗̂^L_R S = S`.
- `completedTensor_Qp`: For `R = S = ℤ_p` and I `= J = (p)`, `ℚ_p ⊗̂^L ℤ_p =` 0, whereas `ℚ_p ⊗^L ℤ_p = ℚ_p`.
- `completedTensor_Ainf_W`: For `(A_inf, (p, μ)) →` (W(k), `(p)`), `A_inf ⊗̂^L` W(k) `=` W(k).

**Derived p-completion on a site that is not replete** (`Decalage.pCompletion`). For a ringed topos `T` that need not be replete and `K ∈` D(T, `ℤ`), set `K^∧ = Rlim_n (K ⊗^L ℤ/p^n)`. Then `K^∧` is derived p-complete, `K → K^∧` is the derived p-completion, `(K^∧)^∧ = K^∧`, and `Rf_*` commutes with this completion for a morphism of ringed topoi. On a replete topos it agrees with the completion of EnhancedDerivedSheaves, E4.

`T` a ringed topos, not assumed replete; the derived limit is that of D(T).

The API:

- `Decalage.pCompletion`: `K ↦ Rlim_n (K ⊗^L ℤ/p^n)` on any ringed topos.
- `Decalage.pCompletion_isComplete`: the result is derived p-complete and idempotent.
- `Decalage.pCompletion_pushforward`: compatibility with `Rf_*`.
- `Decalage.pCompletion_replete`: agreement with the completion of E4 on a replete topos.

Derived p-completeness of `Rlim_n(K ⊗^L ℤ/p^n)` is checked on the defining Rlim of multiplication by `p`, which commutes with `Rlim_n`. The universal property follows from `K ⊗^L ℤ/p^n ≅ K^∧ ⊗^L ℤ/p^n`. Commutation with `Rf_*` uses that `Rf_*` commutes with derived limits and with `⊗^L ℤ/p^n`. (ČK (arXiv v3), §1.7, (1.7.1), printed p.7; Stacks, Tags 0940, 0A07 and 0944). *Needs:* EnhancedDerivedSheaves, E2 (*Countable products in a replete topos*); EnhancedDerivedSheaves, E4 (*Derived complete sheaves*).

**Checks.**

- `pCompletion_point`: On the punctual topos, `ℤ^∧ = ℤ_p`.
- `pCompletion_Q`: On the punctual topos, `ℚ^∧ =` 0.
- `pCompletion_torsion`: For `K` killed by `p^n`, `K^∧ = K`.

### AI.1.6 Base change

**Base-change criterion for décalage** (`AInf.flat_and_nonflat_base_change`). `Lη` commutes with flat pullback of ringed topoi. For the nonflat coefficient reductions used in `AΩ`, prove the specific comparison by the finite Witt toric calculation and the Bockstein/Tor criterion; no universal base-change theorem is asserted without its own hypotheses.

For flat pullback, pullback of the ideal remains invertible and pullback is exact. For the nonflat applications use the regular finite coefficient quotient, termwise flat representative and injectivity/Tor conditions explicitly verified in Layer AI.3–AI.4.

For flat maps, pullback preserves termwise I-torsion-freeness and the defining kernel/image submodules. The nonflat applications use the explicitly computed comparison maps, not Lemma 6.15, which is the completeness criterion. (BMS1 (arXiv v3), Lemma 6.14; Theorem 9.4(i); printed pp.53–70). *Needs:* EnhancedDerivedSheaves §0.2 (`ClassicalDerived.replacements`); *Reduction to the Bockstein complex* (§AI.1.4).

**Nonflat quotient base change for décalage** (`AInf.nonflat_quotient_decalage`). Let `f` and `g` be nonzerodivisors in A, and suppose the image f̄ of `f` is a nonzerodivisor in A/g. If every `H^i(K⊗^L_A A/f)` has no nonzero g-torsion, the natural map `(Lη_f K)⊗^L_A A/g→Lη_f(K⊗^L_A A/g)` is an equivalence. On the right `f` denotes its image and décalage is computed on representatives on which division is defined. The condition concerns derived reduction of `K`, not just `H^i(K)/f`.

A commutative ring; `f`, `g` and f̄ as stated; `K∈D(A)`. The extra regularity of f̄ makes (f̄) an invertible ideal, as required by this roadmap’s definition of derived décalage. ČK Lemma 3.24 also has a formulation for arbitrary `f`; that extension is not used here.

Compare the two complexes on termwise-flat representatives. Use the g-torsion-free hypothesis on derived mod-f cohomology to remove the Tor obstruction in the divided differential. This is the base-change lemma CK applies, not general commutation of `Lη` with completion. (ČK (arXiv v3), Lemma 3.24, printed p.19). *Needs:* *Derived décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*).

**Checks.**

- Taking `g` a unit gives the zero comparison on both sides.
- For `A=ℤ[x]`, `f=x` and `g=p`, `f̄=x` remains regular; taking `K=A` gives the identity comparison between free rank-one A/p complexes.
- Taking `f=g=p` in `A=ℤ` makes `f̄=0` in A/g, so this invertible-ideal formulation does not apply.
- The torsion hypothesis concerns derived mod-f cohomology; ordinary reduction is not an acceptable replacement.

**Derived-reduction almost-to-integral criterion** (`AInf.decalage_almost_integral`). If `b:B→B′` in `D(A_inf)` has `W(m^♭)-annihilated` cone cohomology and every `H^i(B⊗^L A_inf/μ)` has no nonzero `W(m^♭)-annihilated` element, then `Lη_μ(b)` is an equivalence. This criterion uses the source derived reduction; it does not identify `Lη` of a cone with the cone of `Lη`.

Standing hypotheses (C). Both conditions hold in every cohomological degree. `W(m^♭)` is the Witt residue-kernel ideal, without an idempotence assumption.

Derived `mod-μ` reduction gives the short exact sequence of Bockstein complexes in CK proof 3.18, using the source no-almost-zero hypothesis. The `mod-μ` cone of `Lη_μ(b)` vanishes. Thus `μ` acts invertibly on its cohomology. After `μ-localization b` is already an equivalence because `μ` belongs to `W(m^♭)`; conclude that the cone vanishes. (ČK (arXiv v3), Lemma 3.18 and proof, printed p.16). *Needs:* *Reduction to the Bockstein complex* (§AI.1.4); *Cohomology of ideal décalage* (§AI.1.2); *Witt residue specialization* (§AI.0:integral.1); *The Witt almost ideal* (§AI.0.3).

**Checks.**

- Do not invoke exactness of `Lη` as a triangulated functor.
- Almostness alone, without the derived-reduction source hypothesis, is insufficient.

### AI.1.7 Koszul complexes

**Koszul complex of commuting endomorphisms** (`Decalage.koszulComplex`). For a commutative ring A, an A-module `M` and pairwise commuting A-linear endomorphisms `g_1`, …, `g_d` of `M`, define `K_M(g_1, …, g_d)` as the cochain complex in degrees 0, …, `d` with `K^j = M ⊗_A Λ^j(A^d)` and differential d(m `⊗ e_J) = Σ_i g_i(m) ⊗ e_i` ∧ `e_J`. Equivalently `K_M(g_1, …, g_d)` is the iterated fibre of the `g_i`: `K_M(g_1, …, g_d) = Cone(g_d : K_M(g_1, …, g_{d−1}) → K_M(g_1, …, g_{d−1}))[−1]`. The same definition applies to a complex `M^•` with commuting chain endomorphisms, by totalization. When `M =` A and `g_i` is multiplication by `f_i` it is the cochain dual `Hom_A(K_chain(f_1, …, f_d), A)` of the supplier’s homological Koszul complex, with the standard ordered dual exterior basis. It has `H^d=A/(f_1,…,f_d)`, whereas the supplier has `H_0=A/(f_1,…,f_d)`.

A is a commutative ring; `M` an A-module (or a complex of A-modules); `g_1`, …, `g_d` commuting A-linear endomorphisms.

The API:

- `Decalage.koszulComplex`: the complex `K_M(g_1, …, g_d)` with terms `M ⊗ Λ^j(A^d)`
- `Decalage.koszulComplex_cone`: `K_M(g_1, …, g_d) ≅ Cone(g_d)[−1]` on `K_M(g_1, …, g_{d−1})`
- `Decalage.koszulComplex_H0`: `H^0 = ⋂_i ker(g_i)` and `H^d = M` / `Σ_i g_i(M)`
- `Decalage.koszulComplex_map`: functoriality for A-linear maps `M → M′` intertwining the `g_i`.
- `Decalage.koszulComplex_sequence`: for `g_i = f_i` · `id_A` identify it with `Hom_A(K_chain(f_1, …, f_d), A)`, with the stated cochain grading

Write the differential with the exterior-algebra sign `e_i` ∧ `e_J`; `d` ∘ `d =` 0 because the `g_i` commute and `e_i` ∧ `e_i =` 0. The cone description is the usual splitting of `Λ^•(A^d) = Λ^•(A^{d−1}) ⊗ Λ^•(A)`. For multiplication operators, dualize the finite free chain complex of DerivedModuleAlgebra, §0.K.1, so that the differential raises degree. In two variables `d⁰(m)=(f_1m,f_2m)` and `d¹(a,b)=f_1b−f_2a`; the chain supplier instead has `d_1(a,b)=f_1a+f_2b`. The ordered dual exterior basis fixes this sign and the degree convention. (BMS1 (arXiv v3), Lemma 7.3 and Lemma 7.5, printed pp.56–57; BMS1 (arXiv v3), Lemma 7.9, printed p.59). *Needs:* DerivedModuleAlgebra, §0.K.1; Mathlib `ExteriorAlgebra`; Mathlib `CochainComplex`.

**Checks.**

- `koszul_empty`: For `d=0`, `K_M()=M[0]`.
- `koszul_one`: For `d =` 1, `K_M(g) = [M --g--> M]` in degrees 0 and 1.
- `koszul_two_sign`: For multiplication by x,y, `d¹(1,0)=−y` and `d¹(0,1)=x`; `d¹d⁰(m)=xym−yxm=0`, including in characteristic 2.
- `koszul_identity`: If some `g_i` is the identity of `M`, the complex is acyclic.
- `koszul_sequence`: For A `= M = ℤ[x`, `y`] and `g = (x, y)` multiplications, `H^2 = ℤ` and `H^0 = H^1 =` 0.
- `koszul_noncommuting`: For a nonzero commutative ring `A`, take `M=A²`, `g₁=E₁₂` and `g₂=E₂₁`. The commutator is `diag(1,−1)≠0`, so the displayed differential has `d²≠0`; on `(1,0)` it gives `(1,0)`. Over the zero ring the commutator and `d²` are zero.

**Dé­calage of commuting Koszul operators** (`AInf.koszul_decalage_calculation`). For `f` regular and a complex `M` of f-torsion-free modules, let regular scalars `g_i` each divide `f` or be divisible by `f`. If some `g_i` divides `f`, `η_f(M tensor K(g_i))` is acyclic. If `f` divides every `g_i`, `η_f(M tensor K(g_i))≅η_f M` tensor `K(g_i/f)`. The toric `γ_i−1` calculation is obtained weightwise from these scalar statements; the general Koszul complex of commuting endomorphisms is *Koszul complex of commuting endomorphisms* (§AI.1.7).

`f` and every `g_i` regular; `M` termwise f-torsion-free; pairwise commuting scalar operators; exterior signs and cohomological degrees 0 through `d`.

In the divides-f case multiplication by `f` is null-homotopic on the Koszul complex, so its cohomology is killed by `f`. In the divisible-by-f case compare termwise divided differentials and the degree scaling. For toric operators first decompose into scalar weight summands. (BMS1 (arXiv v3), Definitions 7.1–7.2; Lemma 7.9; printed pp.56–59). *Needs:* DerivedModuleAlgebra, §0.K.1 (*The Koszul complex*); *Principal décalage complex* (§AI.1.1); *Koszul complex of commuting endomorphisms* (§AI.1.7).

**Checks.**

- For commuting scalars `f²` and `f³` on `R`, `η` gives `K(R;f,f²)`, including the degree-two differential `(−f²,f)`.
- For a unit first operator the Koszul pair is contractible.

**Koszul products and integral cohomology** (`AInf.koszul_products_and_cohomology`). For commuting A-algebra automorphisms `γ_i` of a possibly noncommutative A-algebra `R`, `K_R(γ_i−1)` has the source DGA product: `x_i x_j=−x_j x_i`, `x_i²=0`, `x_i a=γ_i(a)x_i`, `d(x_i)=0` and `d(a)=Σ_i(γ_i(a)−a)x_i`. It induces the group-cohomology cup product. If multiplication by `g` on a complex `M` is nullhomotopic, `0→H^(n−1)(M)→H^n(M tensor K_R(g))→H^n(M)→0` splits. If all scalar `g_i` are divisible by `g` and one is `g` times a unit, `H^n(K_M(g_1,…,g_m))≅Ann_M(g)^(binom(m−1,n)) ⊕ (M/gM)^(binom(m−1,n−1))`.

For the product: A commutative, `R` an A-algebra, and `γ_i` commuting A-algebra automorphisms. For the split sequence: a specified nullhomotopy of multiplication by `g`. For the scalar formula: `m≥1`, all `g_i` divisible by `g` and one `g_i` equal to `g` times a unit; binomial terms outside their range are zero.

Construct the twisted DGA by the displayed relations and verify the Leibniz rule and group-cohomology product. Use the nullhomotopy to split the mapping-cone cohomology sequence. Reorder the unit-multiple scalar first and induct to get the annihilator/quotient formula. (BMS1 (arXiv v3), Lemma 7.5, Remark 7.8, Lemma 7.10; printed pp.57–59). *Needs:* DerivedModuleAlgebra, §0.K.1 (*The Koszul complex*); *Dé­calage of commuting Koszul operators* (§AI.1.7); *Koszul complex of commuting endomorphisms* (§AI.1.7).

**Checks.**

- For the trivial action on `ℤ` in rank two, `x₁x₂` is nonzero and `x₂x₁=−x₁x₂`.
- In characteristic two impose `x₁²=0`; graded commutativity alone does not imply it, as the odd generator of the polynomial algebra over `𝔽₂` shows.
- For `R=ℤ[t,t⁻¹]` and `γ(t)=−t`, the defining relation is `xt=−tx`. The twisted DGA carries these computations.


**Continuous cochains as an integer-indexed complex** (`Decalage.contCochains`). For a profinite group `Γ` and a topological `Γ-module N = lim_k N_k`, where each `N_k` is a discrete continuous `Γ`-module killed by `p^k` and the transition maps are surjective, define `C^•_cont(Γ, N)` as the complex of continuous inhomogeneous cochains, placed in degrees `≥` 0 of a `ℤ-indexed` cochain complex of abelian groups. Its cohomology is the module underlying Mathlib's continuousCohomology of `N`, and `C^•_cont(Γ, N) ≅ lim_k C^•_cont(Γ, N_k)`, which computes `Rlim_k RΓ_cont(Γ, N_k)` because the transition maps of cochain groups are surjective.

`Γ` profinite; `N = lim_k N_k` as stated, with surjective transition maps.

The API:

- `Decalage.contCochains`: the `ℤ-indexed` complex `C^•_cont(Γ, N)`, zero in negative degrees.
- `Decalage.contCochains_homology`: its cohomology agrees with the module underlying continuousCohomology.
- `Decalage.contCochains_lim`: `C^•_cont(Γ, lim N_k) ≅ lim_k C^•_cont(Γ, N_k)`, a derived limit.

Define cochains as continuous maps `Γ^n → N` with the inhomogeneous differential and extend by zero to negative degrees. Identify the cohomology with Mathlib's homogeneous-cochain model by the standard isomorphism of the two cochain complexes. Continuous maps to `N =` lim `N_k` are compatible families of continuous maps to the `N_k`; the cochain groups of the `N_k` have surjective transitions, so the limit is a derived limit. (BMS1 (arXiv v3), Lemma 7.3(ii), printed p.56). *Needs:* Mathlib `continuousCohomology`; Mathlib `CochainComplex`; ClassicalAdicEtaleCohomology, §1.3 (*Cohomology on profinite G-sets is continuous group cohomology*); ArithmeticGaloisDuality, §D7.3 (*Continuous cochains in the derived category*).

**Checks.**

- `contCochains_trivial`: For `Γ` trivial, the unnormalized complex has `N` in every nonnegative degree, `d^{2j}=0` and `d^{2j+1}=id_N`. Its normalized complex is N[0], and the two are quasi-isomorphic; `H^{i>0}=0`.
- `contCochains_Zp`: For `Γ = ℤ_p` acting trivially on `N = ℤ_p`, `H^1 = Hom_cont(ℤ_p, ℤ_p) ≅ ℤ_p`.
- `contCochains_exterior`: For `Γ = ℤ_p^d` acting trivially on `N = ℤ_p`, `H^i ≅ Λ^i Hom_cont(Γ,ℤ_p)`. The standard ordered generators identify the continuous dual with `ℤ_p^d`, giving the Koszul complex of the zero operators; `d=0` recovers the trivial-group cohomology.

**Continuous cochains and Koszul complexes** (`AInf.continuous_cochains_koszul`). Let `Γ_disc=Z^d` with generators `γ_i` and `Γ=ℤ_p^d`. If `N=lim_k N_k` is a topological abelian group, each `N_k` a discrete continuous `Γ`-module killed by `p^k`, then `RΓ_cont(Γ,N)→RΓ(Γ_disc,N)` is a quasi-isomorphism and both are computed by `K_N(γ_1−1,…,γ_d−1)`. The topology on `N` is the limit topology; this does not identify cohomology for arbitrary discrete `Γ`-modules.

`N=lim_{k≥1} N_k` with its inverse-limit topology; `N_k` discrete continuous `Γ`-modules killed by `p^k`. Replace `N_k` by the images of `N` if needed to make the transitions surjective.

For each finite reduction use the standard completed Iwasawa resolution; compare it with the ordinary resolution for `Γ_disc`. Pass to the inverse limit with surjective transitions and the controlled completed-sum comparison. Mathlib's continuousCohomology is compared with the integer-indexed complex of *Continuous cochains as an integer-indexed complex* (§AI.1.7). (BMS1 (arXiv v3), Lemma 7.3 and its finite-reduction hypotheses; printed p.56). *Needs:* Mathlib `continuousCohomology`; DerivedModuleAlgebra, §0.K.1 (*The Koszul complex*); *Cohomology of completed direct sums* (§AI.1.5); *Koszul complex of commuting endomorphisms* (§AI.1.7); *Continuous cochains as an integer-indexed complex* (§AI.1.7).

**Continuous cohomology of completed coefficient sums** (`AInf.continuous_completed_sum`). Let `H` be profinite, `i≥0` and `M_j` p-adically complete p-torsion-free continuous H-modules. If either every `H^i_cont(H,M_j)` is p-torsion-free, or a single `p^n` annihilates them all, the coordinate map `H^i_cont(H,⊕̂_j M_j)→∏_j H^i_cont(H,M_j)` is injective. Consequently the completed-sum cohomology is respectively p-torsion-free or killed by that same `p^n`. Completion is p-adic and the bound is uniform in `j`.

The topology on `⊕̂_j M_j` is the completed direct-sum topology; all actions are continuous. The alternatives and p-torsion-freeness of the coefficient modules are part of the hypotheses.

Write a cocycle coordinatewise. Its coordinate p-adic orders tend to infinity. Choose primitives at those orders, or with the fixed loss `n` in the bounded-torsion case. The primitives still tend to zero and form a cochain in the completed sum. (ČK (arXiv v3), Lemma 3.6 and proof, printed p.12). *Needs:* *Continuous cochains and Koszul complexes* (§AI.1.7); EnhancedDerivedSheaves, E2 (*Countable products in a replete topos*).

**Checks.**

- A nonuniform family of exponents cannot be used to conclude one fixed annihilator.
- This is injectivity into a product, not surjectivity or a claim of commutation with an arbitrary direct sum.

**Dé­calage interface for Dieudonné consumers** (`AInf.dieudonne_consumer_contract`). At `R=ℤ`, `f=p`, the module-level names of AI.1 are aliases of CrystallineCohomology CR.4's normalized principal-`p` construction, its enhanced derived localization, Bockstein reduction and completion comparison. On a general ringed topos, AI.1 extends these to invertible ideals; its one-point principal-`p` instance uses that same core. CR.4 owns Dieudonné structures, saturation, strict fixed points and Nygaard filtrations.

`p` prime, termwise `p`-torsion-free representatives; derived `p`-completion for the fixed-point category.

The formulas `E_p(C)^n={x:dx∈pC^(n+1)}` and `δ(x)=dx/p` are the CR.4 definitions, so the named aliases preserve terms, differentials and maps. Inherit the enhanced localization and the Bockstein/completion theorems from CR.4; compatibility with the ringed-topos extension follows locally from the same model, and filtered products use AI.1.4. (BLM, Construction 2.1.3 and Remark 2.1.4, arXiv v3 pp.13–14; Proposition 2.4.5, pp.17–18; Corollaries 7.2.2–7.2.3 and Proposition 7.2.4, pp.84–85). *Needs:* CrystallineCohomology, CR.4 (*Principal p-décalage on torsion-free complexes*; *Bockstein reduction of principal p-décalage*; *Derived p-décalage and completion*; *Strict Dieudonné complexes as décalage fixed points*; *Nygaard, conjugate, Hodge and lift filtrations*); *Filtered décalage as Beilinson truncation* (§AI.1.4).

**Checks.**

- On `[ℤ →ᵖ ℤ]` in degrees `0,1`, both names denote `[ℤ →¹ ℤ]`; no independent complex or localization is introduced.
- In degree `−1`, the normalized copy of `ℤ` identifies with `p⁻¹ℤ` in the localization, as in CR.4's integer-indexed convention.
- The mod-`p` Bockstein of `[ℤ →ᵖ ℤ]` is the identity, whereas that of `[ℤ →ᵖ² ℤ]` is zero, and both specializations use CR.4's Bockstein map.
- On `ℤ_p[0]`, the completion comparison is the inherited identity comparison; it is compatible with the enhanced localization.

### Examples

For `R = ℤ` and `f = p`: `Lη_p(ℤ/p) = 0` while `Lη_p(ℤ/p²) = ℤ/p`, so `Lη_p` is not exact. For
the two-term complex `[R --f²--> R]` in degrees `0, 1` with `f` regular, `η_f` gives
`[R --f--> R]`, also when the two degrees are negative. The divisibility submodule is everything
for `f = 1` and the cocycles for `f = 0`.

### Dependencies

Earlier layers: AI.0, AI.0:integral. Other roadmaps: ArithmeticGaloisDuality §D7.3, ClassicalAdicEtaleCohomology §1.3, CrystallineCohomology CR.4, DerivedModuleAlgebra §§1.1–1.9, DerivedDeRhamCohomology §§1.14–1.22, EnhancedDerivedSheaves E1, EnhancedDerivedSheaves E2, EnhancedDerivedSheaves E4, DerivedModuleAlgebra, §0.K.1, PerfectoidSpaces P0. Tau Ceti: `TauCeti.RingTheory.FittingIdeal.Basic`, `TauCeti.RingTheory.FittingIdeal.BaseChange`. Mathlib: `CochainComplex`, `CochainComplex.of`, `CochainComplex.ofHom`, `DerivedCategory`, `DerivedCategory.Q`, `ExteriorAlgebra`, `Finsupp`, `HomologicalComplex.d_comp_d`, `Module.Invertible`, `ModuleCat`, `PowerSeries`, `PowerSeries.coeff`, `ValuationRing`, `continuousCohomology`.

## Layer AI.2: Breuil–Kisin–Fargues modules, lattices and modifications

This layer is module theory over `A_inf`. The structure theorem for finitely presented
`A_inf`-modules that are free after inverting `p` comes first; then Breuil–Kisin–Fargues
modules, lattice pairs `(T, Ξ)` and Fargues' classification of finite free BKF modules, whose
proof of essential surjectivity runs through `φ`-modules on the analytic annulus and vector
bundles on the punctured spectrum.

### AI.2.1 Finitely presented modules over `A_inf`

**Valuation submodule dimension bound** (`AInf.valuation_special_fiber_bound`). For `E⊂(C^♭)^d` an `O_C^♭-submodule`, `dim_k(E⊗k)≤d`.

No finite generation assumed for `E`.

Every finitely generated torsion-free submodule is finite free of `rank≤d`. A hypothetical larger independent residue family would lift to such a submodule. (BMS1 (arXiv v3), Lemma 4.7, printed pp.35–36). *Needs:* PerfectoidSpaces, P1; Mathlib `ModuleCat`; *Finitely generated torsion-free modules over a valuation ring* (§AI.1.3); PerfectoidSpaces, P1 (tilt, valuation and compatible roots).

**Residue-dimension criterion for a lattice** (`AInf.valuation_lattice_criterion`). If `D⊂(C^♭)^d` and `dim_k(D⊗k)=d`, then `D` is finite free of rank `d`.

`D` an `O_C^♭-submodule`; `C^♭` algebraically closed valuation field.

In rank one choose `x∈D∖𝔪D`, which exists because `D/𝔪D≠0`. If `y∈D` had `v(y)<v(x)`, then `x=(x/y)y∈𝔪D`, a contradiction. Thus every `y∈D` lies in `xO_C^♭`, and `D=xO_C^♭`. For higher rank saturate a lift of a nonzero residue vector to obtain a rank-one submodule `J` with torsion-free quotient. The dimension bound and right exactness after tensoring with `k` give residue dimensions `1` and `d−1`; apply induction and split the free quotient. (BMS1 (arXiv v3), Lemma 4.8, printed pp.35–36; rank one uses a nonzero residue class, with no assumption that valuation cuts are realized). *Needs:* *Valuation submodule dimension bound* (§AI.2.1); *Finitely generated torsion-free modules over a valuation ring* (§AI.1.3).

**Checks.**

- For `d=0`, `D=0` and the conclusion has rank zero.
- A principal fractional ideal has one-dimensional residue and is a rank-one lattice.
- For `F=ℂ_p^♭` with `v(F^×)=ℚ`, the submodule `D={0}∪{x:v(x)>√2}` is neither principal nor a principal multiple of `𝔪`. Every nonzero element admits a smaller value still above `√2`, so `D=𝔪D` and its residue is zero; the criterion excludes it.

**Linear module patching across a principal divisor** (`AInf.linear_module_patching`). For any commutative ring `R` and non-zero-divisor `f`, let R̂ be its f-adic completion. Base extension is an equivalence from f-torsion-free R-modules to triples `(N,P,β)`, with `N` an f-torsion-free R̂-module, `P` an R[1/f]-module and `β:N[1/f]≅P ⊗_R` R̂. The inverse is the fiber product in the common overlap. A module is finite projective exactly when both members of its triple are finite projective; morphisms are pairs commuting with `β`.

No Noetherian hypothesis. Completion need not be flat. The specified overlap is R̂[1/f], and `f` is regular on `N`.

Form the equalizer of the two maps `N⊕P→N[1/f]`, using `β`. Use regularity of `f` and the f-adic approximation argument to recover both scalar extensions, then the Hom equalizer. Apply the finite-projective patching criterion to obtain the restriction of the equivalence used by BKF lattices. (SW20, Lemma 5.2.9, printed p.38 (PDF p.48); applied without assuming flat completion). *Needs:* Mathlib `ModuleCat`; Mathlib `AdicCompletion`; Mathlib `TensorProduct`.

**Checks.**

- Keep f-torsion-freeness, the overlap map and morphism compatibility; a bare pair of modules is insufficient.

**Kedlaya triviality on the punctured spectrum** (`AInf.punctured_spectrum_triviality`). Finite free `A_inf`-modules restrict equivalently to vector bundles on `U=Spec(A_inf)` minus its closed point; the inverse is `H^0(U,−)`. This algebraic `U` is distinguished from the analytic punctured Spa used subsequent.

`C` as above; vector bundles of finite rank.

Patch on the source two opens and compute the intersection lattice. Use the valuation residue-dimension criterion and p-completeness to prove it is finite free. (BMS1 (arXiv v3), Lemma 4.6, printed pp.34–35). *Needs:* *Residue-dimension criterion for a lattice* (§AI.2.1); *Regularity of integral periods* (§AI.0.2); *Linear module patching across a principal divisor* (§AI.2.1).

**Perfectness of finitely presented A_inf modules** (`AInf.ainf_module_perfectness`). A finitely presented `A_inf-module M` with M[1/p] finite free is perfect as an `A_inf` complex.

`M` finitely presented; M[1/p] finite free; `C` as above; `x=[ϖ^♭]` nonzero topologically nilpotent.

Use finite Witt coherence for p-power-torsion modules, then devissage after embedding into a p-local free module. (BMS1 (arXiv v3), Lemma 4.9(i); printed p.35). *Needs:* *Coherence of Witt vectors of perfectoid integers* (§AI.0.3); *Finite-presentation devissage over Witt rings* (§AI.0.3); *Regularity of integral periods* (§AI.0.2).

**Bounded and finitely presented A_inf torsion** (`AInf.ainf_bounded_torsion`). For such `M`, `M_tor` is killed by `p^n` for some `n` and is finitely presented and perfect.

`M` finitely presented; M[1/p] finite free; `C` as above; `x=[ϖ^♭]` nonzero topologically nilpotent.

Bound p-torsion by a finite presentation and use the finite Witt coherent submodule criterion. (BMS1 (arXiv v3), Lemma 4.9(ii); printed p.35). *Needs:* *Coherence of Witt vectors of perfectoid integers* (§AI.0.3); *Finite-presentation devissage over Witt rings* (§AI.0.3); *Regularity of integral periods* (§AI.0.2).

**Tor bounds for A_inf modules** (`AInf.ainf_tor_bounds`). Such `M` has `Tor-dimension≤2`, `Tor_2^(A_inf)(M,W(k))=0`; if `M` has no x-torsion, `Tor_i(M,W(k))=0` for `i>0`, where `x=[ϖ^♭]` is a topologically nilpotent Teichmüller parameter.

`M` finitely presented; M[1/p] finite free; `C` as above; `x=[ϖ^♭]` nonzero topologically nilpotent.

Resolve over finite Witt valuation rings and use the x-root filtered quotient model of W(k). (BMS1 (arXiv v3), Lemma 4.9(iii); printed p.35). *Needs:* *Coherence of Witt vectors of perfectoid integers* (§AI.0.3); *Finite-presentation devissage over Witt rings* (§AI.0.3); *Regularity of integral periods* (§AI.0.2).

**Vector-bundle criterion and p-local freeness** (`AInf.punctured_vector_bundle_criterion`). A finitely generated p-torsion-free `M` with M[1/p] finite projective defines a vector bundle on `U`. Consequently every finite projective `A_inf[1/p]`-module is finite free.

`A_inf=W(O_C^♭)` for `C` complete algebraically closed of characteristic zero; `U` is `Spec(A_inf)` minus its closed point. `M` is finitely generated and p-torsion-free, with M[1/p] finite projective.

On D(p), use the assumed projectivity. The only remaining prime of `U` containing `p` is `(p)`. Show `A_inf,(p)` is a DVR with uniformizer `p`: a nonzero Witt vector has a first nonzero p-adic coefficient, whose Teichmüller representative is a unit after localization at `(p)`. A finite p-torsion-free module over this DVR is free. Apply punctured-spectrum triviality; extend a finite projective `A_inf[1/p]`-module by a finitely generated p-torsion-free lattice to prove Corollary 4.12. (BMS1 (arXiv v3), Lemma 4.10, printed pp.36–37; Corollary 4.12, p.37). *Needs:* *Kedlaya triviality on the punctured spectrum* (§AI.2.1).

`Suggested.lean` states the p-local conclusion as `ainf_invert_p_projective_free` on Mathlib's localization carrier, with finite generation and projectivity as hypotheses.

**Checks.**

- The zero module is free of rank zero.
- The conclusion applies in every finite rank, including rank one; it is not restricted to line bundles.
- The ideal `(p,x)` has free p-inversion but need not be projective over `A_inf`; freeness of the localization does not assert freeness of the original module.

**A_inf module structure theorem** (`AInf.ainf_module_structure`). For finitely presented `M` with M[1/p] finite projective, there is a functorial exact sequence `0→M_tor→M→M_free→M_bar→0`. `M_free` is finite free; `M_tor` is perfect and bounded p-power torsion; `M_bar` is finitely presented perfect and killed by a power of (p,x). If `M⊗W(k)` is p-torsion-free, or `M⊗O_C` is p-torsion-free in mixed characteristic, then `M` is finite free.

`Suggested.lean` states the mixed-characteristic last criterion as `ainf_free_of_torsionFree_reduction`, using `M/ξM≅M⊗O_C` for the ordinary θ reduction.

Source hypotheses on `M`; ordinary scalar extensions in the last criterion.

Extend `M/M_tor` from `U` by global sections. Its finite closed-point-supported cokernel yields the four-term exact sequence. Compare generic and residue rank by Fitting ideals for the freeness criterion. (BMS1 (arXiv v3), Proposition 4.13, printed pp.37–38). *Needs:* *Perfectness of finitely presented A_inf modules* (§AI.2.1); *Bounded and finitely presented A_inf torsion* (§AI.2.1); *Vector-bundle criterion and p-local freeness* (§AI.2.1).

**Checks.**

- For a finite free module the torsion term and the closed-point cokernel vanish.
- For `M=A_inf/p`, the θ reduction is `O_C/p`, which has p-torsion and does not satisfy the freeness criterion.
- The ideal `(p,ξ)` has free p-inversion but is not free over `A_inf`; its θ reduction has a nonzero class represented by `ξ` that is killed by `p`.

**p-local freeness from two period realizations** (`AInf.p_local_freeness_from_periods`). For finitely presented `M`, if `M[1/(p μ)]` is finite projective and `M⊗B_crys^+` is finite projective, then `M[1/p]` is finite free.

Mixed characteristic cyclotomic base; common `B_crys^+` and its map to the `μ`-adic completion of `A_inf[1/p]`.

Construct the factorization through `B_crys^+` using bounded divided-power estimates. Apply Beauville–Laszlo and prove absence of `μ`-torsion by the source flat coefficient sequence. (BMS1 (arXiv v3), Lemma 4.19; printed p.39). *Needs:* *Vector-bundle criterion and p-local freeness* (§AI.2.1); *Comparison with rational period rings* (§AI.0:period-comparison.1); *Linear module patching across a principal divisor* (§AI.2.1).

**Checks.**

- For `M=A_inf^n` both realizations and the conclusion have rank `n`, including `n=0`.
- For `M=A_inf/p^a`, `a≥1`, both rational realizations vanish and `M[1/p]=0` is free of rank zero.
- For `M=A_inf/(μ)`, the `pμ`-local realization vanishes but `M[1/p]` has nonzero `μ`-torsion and is not projective. Thus the crystalline projectivity hypothesis cannot be omitted.

### AI.2.2 Breuil–Kisin–Fargues modules and lattice pairs

**Breuil–Kisin–Fargues module** (`BKF.Module`). A BKF module is a finitely presented `A_inf-module M`, finite free after inverting `p`, with a `φ-semilinear` isomorphism `M[1/ξ]→M[1/ξ̃]`. Equivalently its linearization is `φ^*M[1/ξ̃]≅M[1/ξ̃]`; morphisms commute with the linearized Frobenius. Finite free and minuscule are additional conditions.

Perfectoid field and chosen kernel generator; p-local finite freeness; semilinearity uses the existing Witt Frobenius.

The API:

- `BKF.Module_linearized`: Semilinear and linearized Frobenius presentations agree with localization at `ξ̃`.
- `BKF.Module_hom`: Morphisms are `A_inf`-linear maps commuting with localized Frobenius.
- `BKF.Module_ext`: A morphism is determined by its underlying `A_inf`-linear map.
- `BKF.Module_unit`: The unit is `A_inf` with Witt Frobenius.
- `BKF.Module_twist`: `A_inf{n}` is finite free BKF with the source Frobenius factor.
- `BKF.Module_base_change`: Eligible perfectoid coefficient change preserves the linearized presentation.
- `BKF.Module_twist_frobenius`: On the conormal basis of `A_inf{1}`, the linearized Frobenius coefficient is `ξ̃^(-1)`, not 1; use the Frobenius-pulled source basis.

Use localization and scalar restriction/extension on existing ModuleCat objects. Transport `ξ` to `ξ̃` under Frobenius and prove the linearization dictionary. (BMS1 (arXiv v3), Definition 4.22; printed p.40). *Needs:* *A_inf module structure theorem* (§AI.2.1); *Cyclotomic period elements* (§AI.0.1); Mathlib `LocalizedModule`.

**Checks.**

- `BKF.Module_test_unit`: The unit has étale realization `ℤ_p` and de Rham lattice `B_dR⁺`.
- `BKF.Module_test_twist`: `A_inf{1}` has étale realization `ℤ_p(1)`, not the untwisted unit with identity Frobenius.
- `BKF.Module_test_torsion`: The object `A_inf/p` with Frobenius is allowed in the finitely presented category but is outside the finite-free Fargues equivalence.

**Crystalline-rigidified BKF modules** (`BKF.Rigidified`). Fix a Frobenius-compatible section `W(k)→A_inf` of the residue map. An object is a BKF module `M` with a specified `φ`-equivariant `B_crys⁺`-linear isomorphism `α:M⊗_{A_inf}B_crys⁺≅(M⊗_{A_inf}W(k))⊗_{W(k)}B_crys⁺`. Here the right scalar extension uses the section, the left uses the period map, and reduction along `B_crys⁺→W(k)[1/p]` is the identity on `(M⊗W(k))[1/p]`. A morphism is a BKF morphism `h` satisfying `α_N∘(h⊗1)=((h⊗W(k))⊗1)∘α_M`.

The section, both coefficient maps and the reduction map are fixed; the Frobenius on the residue realization is the one induced from `M`.

The identity, composition and equality of morphisms are inherited from BKF morphisms subject to the displayed square; the unit has the identity comparison, and tensor products use `α_M⊗α_N`. The forgetful functor is faithful. (BMS1 (arXiv v3), Lemma 4.27 and following paragraph, printed p.42). *Needs:* *Breuil–Kisin–Fargues module* (§AI.2.2); *Witt residue specialization* (§AI.0:integral.1); *Comparison with rational period rings* (§AI.0:period-comparison.1).

**Checks.**

- The unit has `M⊗W(k)=W(k)` and its comparison reduces to the identity.
- For `M=A_inf/p`, both crystalline sides vanish, giving the unique comparison between zero modules.
- Multiplication by a constant `c∈ℚ_p^×`, `c≠1`, on the unit is Frobenius compatible but fails the identity reduction and is not a rigidification.

**Operations in valid BKF subcategories** (`AInf.bkf_valid_operations`). The finite free BKF subcategory has tensor products, duals and internal Homs with localized Frobenius; the larger finitely presented BKF category inherits the exact sequences of underlying `A_inf`-modules and has tensor products and an invertible Tate twist, but is not closed under arbitrary cokernels. Tensoring is right exact; it preserves these short exact sequences when the other factor is `A_inf-flat`, as in the finite free subcategory. The map `A_inf⊗ℤ_p(1)→A_inf{1}` has cokernel modeled by `A_inf/(μ)`, which fails p-local projectivity. Kernel/cokernel closure is asserted only for the variant with the crystalline rigidification of *Crystalline-rigidified BKF modules* (§AI.2.2).

`C` complete algebraically closed of characteristic zero for the cyclotomic counterexample. Tensor-dual/internal-Hom closure here is in the finite free subcategory. For abelian closure retain the specified crystalline comparison and require morphisms to respect it; this variant is not the unrigidified BKF category.

Tensor and dualize the localized Frobenius equivalences of finite free modules. Use the dlog inclusion into the intrinsic twist and Example 4.23 to exhibit failure of cokernel closure. For the separately rigidified variant use Lemma 4.19 and the compatible crystalline map to check the p-local condition on kernels and cokernels. (BMS1 (arXiv v3), Examples 4.23–4.24, Remark 4.25; discussion following Lemma 4.27; printed pp.40–42). *Needs:* *Breuil–Kisin–Fargues module* (§AI.2.2); *A_inf module structure theorem* (§AI.2.1); *p-local freeness from two period realizations* (§AI.2.1); *Crystalline-rigidified BKF modules* (§AI.2.2).

**Checks.**

- The finite free objects admit duals and their tensor product preserves the inherited short exact sequences.
- The finitely presented object `A_inf/p` has zero p-inversion and is permitted. Tensor `0→A_inf→ᵖA_inf→A_inf/p→0` with it: the first map becomes the zero map `A_inf/p→A_inf/p`, which is not injective. Thus tensoring with an arbitrary torsion object is not exact.
- The cokernel of `A_inf⊗ℤ_p(1)→A_inf{1}` has underlying module `A_inf/(μ)`, whose p-inversion is not projective, so it cannot be admitted as a BKF cokernel.

**Étale lattice and de Rham lattice pair** (`BKF.LatticePair`). A lattice pair `(T,Ξ)` has `T` finite free over `ℤ_p` and `Ξ` a finite free `B_dR⁺-submodule` of `T⊗ℤ_p B_dR` spanning that ambient `B_dR-vector` space. Morphisms are `ℤ_p`-linear maps whose `B_dR` scalar extensions preserve `Ξ`.

Common `B_dR⁺` discrete valuation ring and `B_dR` supplied by PadicPeriodRings §§1.5, 4.1; finite ranks.

The API:

- `BKF.LatticePair_standard`: The standard pair is `(T,T⊗B_dR⁺)`.
- `BKF.LatticePair_hom`: A `ℤ_p`-linear map is a pair morphism exactly when its scalar extension carries `Ξ` into `Ξ′`.
- `BKF.LatticePair_ext`: Morphisms agree if their maps on `T` agree.
- `BKF.LatticePair_tensor`: Tensor pairs use `Ξ⊗Ξ′` inside `(T⊗T′)⊗B_dR`.
- `BKF.LatticePair_dual`: The dual lattice consists of functionals taking `Ξ` into `B_dR⁺`.
- `BKF.LatticePair_bounds`: Every lattice lies between `ξ^n` and `ξ^(-n)` multiples of the standard lattice for some `n`.

Use a submodule of the existing scalar-extension carrier, with lattice conditions. Use tensor and dual lattices with their actual ambient identifications. (BMS1 (arXiv v3), Theorem 4.28, printed pp.42–43; SW20, Proposition 12.4.6, printed pp.106–107; Theorem 14.1.1, printed pp.115–116; 12.4.6 is a proposition). *Needs:* *Comparison with rational period rings* (§AI.0:period-comparison.1); Mathlib `TensorProduct`.

**Checks.**

- `BKF.LatticePair_test_zero`: The rank-zero pair is the zero module and zero lattice.
- `BKF.LatticePair_test_shift`: `(ℤ_p,ξ^(-1)B_dR⁺)` is a nonstandard rank-one modification.
- `BKF.LatticePair_test_nospan`: The zero submodule of `B_dR` is not a lattice for `T=ℤ_p`.

**Integral Witt Frobenius descent** (`AInf.integral_frobenius_descent`). For an algebraically closed perfect characteristic-p field `F`, invariants and W(F) scalar extension give inverse equivalences between finite W(F)-modules with bijective semilinear Witt Frobenius and finite `ℤ_p`-modules. The canonical map W(F) `⊗_Z_p M^(φ=1)→M` is an isomorphism, including p-power-torsion modules. It preserves the finite-free subcategories, morphisms and tensor products.

`p` prime. Witt Frobenius is an automorphism. The `ℤ_p` coefficient map is canonical and Frobenius-fixed; `F=C^♭` is the BKF application.

In the free case apply Artin–Schreier–Witt descent and algebraic closedness to trivialize the Frobenius module. Apply the finite-level descent statement over `W_n(F)` to torsion modules and pass through finite p-power filtrations; finite W(F)-modules split into free and bounded-torsion parts over the DVR. Identify the natural invariant/scalar-extension maps, including morphisms and tensor compatibility. This integral assertion precedes and differs from rational isocrystal classification. (BMS1 (arXiv v3), Lemma 4.26 and its proof, printed pp.41–42; SW20, Theorem 12.3.4 and proof, printed p.104 (PDF p.114); finite-level descent supplies the torsion extension used by BMS). *Needs:* Mathlib `WittVector`; Mathlib `ModuleCat`; Mathlib `TensorProduct`; FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4 (*Fontaine's equivalence for étale φ-modules over a Cohen ring*); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.2 (*Frobenius-fixed Witt vectors are the p-adic integers*).

**Checks.**

- Retain finite torsion modules: W(F)/p descends to `𝔽_p`, not to a free `ℤ_p`-module.

**Étale realization of BKF modules** (`BKF.etale`). For any BKF module `M`, `T(M)=(M⊗A_inf W(C^♭))^(φ=1)` is finite over `ℤ_p`, and `T(M)⊗ℤ_p W(C^♭)≅M⊗A_inf W(C^♭)`. For finite free `M`, T(M) is finite free; `Ξ(M)=M⊗A_inf B_dR⁺` embeds as a lattice in `T(M)⊗B_dR`. Moreover `M` tensor `A_inf[1/μ]=T(M)` tensor `A_inf[1/μ]` as submodules of the common `W(C^♭)` extension.

`C` algebraically closed; use the source completed Witt localization `W(C^♭)`, not the fraction field of `A_inf`.

The API:

- `BKF.etale_finite`: T(M) is finite; finite free when `M` is finite free.
- `BKF.etale_descent`: The Frobenius-invariant reconstruction holds over `W(C^♭)`.
- `BKF.etale_lattice`: For finite free `M` the `B_dR⁺` realization is the lattice `Ξ(M)`.
- `BKF.etale_tensor`: Étale realization preserves finite-free tensor products and twists.
- `BKF.etale_mu_comparison`: `M` tensor `A_inf[1/μ]≅T(M)` tensor `A_inf[1/μ]` in the common `W(C^♭)` extension.

Apply the integral Frobenius descent theorem in this Layer AI.2 layer to finite `W(C^♭)`-modules, including torsion; do not infer it from rational isocrystal classification. Reduce the `μ`-inverted equality to finite free `M` via Proposition 4.13. Twist to make inverse Frobenius integral, use minimal valuations of Witt coefficients to put invariants in `M`, and apply the argument to the dual for the reverse inclusion. Use the common map to `B_dR` to obtain the finite-free lattice. (BMS1 (arXiv v3), Lemmas 4.26–4.27, printed pp.41–43). *Needs:* *Breuil–Kisin–Fargues module* (§AI.2.2); *A_inf module structure theorem* (§AI.2.1); *Étale lattice and de Rham lattice pair* (§AI.2.2); *Integral Witt Frobenius descent* (§AI.2.2).

**Checks.**

- `BKF.etale_test_unit`: `T(A_inf)=ℤ_p`.
- `BKF.etale_test_twist`: `T(A_inf{1})=ℤ_p(1)`.
- `BKF.etale_test_p_torsion`: `T(A_inf/p)=𝔽_p`, so finite presentation does not imply a free `ℤ_p` realization.

**Full faithfulness of Fargues realization** (`AInf.fargues_full_faithfulness`). The functor from finite free BKF modules to pairs `(T,Ξ)` is fully faithful. Its early algebraic intersection proof depends on §4.2 and period maps, independently of the subsequent proper cohomology theorem.

`C` algebraically closed; finite free source objects.

Identify a map after `W(C^♭)` extension by its map on `T`. Intersect the integral `A_inf` lattice with the `B_dR⁺` condition to recover an `A_inf`-linear Frobenius-compatible map. (BMS1 (arXiv v3), Remark 4.29, using Lemmas 3.23 and 4.26 (Theorem 4.28 is the statement only); printed pp.27–43). *Needs:* *Étale realization of BKF modules* (§AI.2.2); *A_inf module structure theorem* (§AI.2.1); *Infinite Witt specialization kernel* (§AI.0.2).

### AI.2.3 The Fargues classification

**Boundary neighbourhoods and section rings of Y^an** (`AInf.Yan`). On `Y^an =` D(p) `∪ D([ϖ^♭]) ⊂ Spa(A_inf, A_inf)` define the rational subsets `Y_{[0, r]}` and `Y_{[r, ∞]}` (radius 0 at the point `x_{C^♭}`, radius `∞` at the point `x_L`), their section rings `B^{[0, r]}` and `B^{[r, ∞]}` with their integral subrings, and the stalks at the two boundary points: the integral Robba-type ring at `x_{C^♭}` and the local ring at `x_L`. The interior `Y_{[r, s]}` with 0 `< r ≤ s < ∞` is the space of TauCetiRoadmap AdicSpaces, Layer 6 with its interval rings; this target adds the two ends and their sheaf property, with `Y^an = Y_{[0, r]} ∪ Y_{[r, ∞]}` and intersection `Y_{[r, r]}`.

The space `Y^an` of (Y); `ϖ^♭ ∈ O_C^♭` a pseudouniformizer; 0 `< r < ∞` rational.

The API:

- `AInf.Yan.left`: the rational subset `Y_{[0, r]}` and its section ring `B^{[0, r]}`.
- `AInf.Yan.right`: the rational subset `Y_{[r, ∞]}` and its section ring `B^{[r, ∞]}`.
- `AInf.Yan.cover`: `Y^an = Y_{[0, r]} ∪ Y_{[r, ∞]}` with intersection `Y_{[r, r]}`.
- `AInf.Yan.stalks`: the integral Robba stalk at `x_{C^♭}` and the local ring at `x_L`.
- `AInf.Yan.frobenius`: `φ` maps `Y_{[0, r]}` to `Y_{[0, pr]}` and `Y_{[r, ∞]}` to `Y_{[pr, ∞]}`.

Describe `Y_{[0, r]}` and `Y_{[r, ∞]}` as rational subsets by the inequalities of the radius function between |p| and `|[ϖ^♭]|`. Compute their section rings as completions of `A_inf[1/p]` or `A_inf[1/[ϖ^♭]]` with the stated integrality, and show that they are sheafy (Kedlaya); the interior windows come from the cited layer. Identify the stalks at `x_{C^♭}` and `x_L` as filtered colimits of the section rings over shrinking neighbourhoods. (SW20, Proposition 13.1.1, printed p.108, and Theorem 13.2.1, printed p.109: `Y` is an adic space; `φ`-modules over `Y_{[r, ∞)}` extend uniquely to `Y_{[r, ∞]}`; SW20, §14.2, Theorem 14.2.1, Lemmas 14.2.3–14.2.4 and the proof of Theorem 14.2.1, printed pp.116–120: vector bundles on `Y` extend across the closed point (Kedlaya); the proof glues along the two boundary neighbourhoods.) *Needs:* TauCetiRoadmap AdicSpaces, Layer 6; AdicSpacesPartIII, R3 (*Kiehl glueing of finite projective modules over sheafy Tate affinoids*).

**Checks.**

- `yan_interior`: For 0 `< r ≤ s < ∞`, `Y_{[0, s]} ∩ Y_{[r, ∞]} = Y_{[r, s]}`, the window of AdicSpaces, Layer 6.
- `yan_not_affinoid`: `Y^an` itself is not affinoid: `Spa(A_inf, A_inf)` has the closed non-analytic point removed.
- `yan_endpoints`: `x_{C^♭}` lies in `Y_{[0, r]}` and not in `Y_{[r, ∞]}`; `x_L` lies in `Y_{[r, ∞]}` and not in `Y_{[0, r]}`.

**Integral Robba Frobenius descent and no-leg shtukas** (`AInf.integral_robba_frobenius_descent`). On the punctured analytic `Y^an` for `C^♭`, finite free `φ`-modules over the integral extended Robba ring `Rtilde_int`, finite free `φ`-modules over `W(C^♭)`, and finite free `ℤ_p`-modules are equivalent. The first functor is coefficient extension and the second is `φ-invariants`. Shtukas over `Spa(C^♭)` with no legs, namely `φ-vector` bundles on `Y_[0,infinity)`, are equivalent to these categories.

`C` complete algebraically closed perfectoid of characteristic zero. Use the existing `Y` and its intervals and Frobenius, with the integral Robba rings of SW Definition 12.3.1. The space `Y^an` of (Y).

Show equality of integral Robba and Witt Frobenius invariants by the Newton-polygon argument. Use integral Witt descent for essential surjectivity. Descend a `φ^-1`-module to a sufficiently small `Y_[0,r]` and extend successively by inverse Frobenius to `Y_[0,infinity)`; these extensions recover the given localization. (SW20, Definition 12.3.1, Theorem 12.3.4 and Proposition 12.3.5, printed pp.103–104 (PDF pp.113–114)). *Needs:* *Integral Witt Frobenius descent* (§AI.2.2); TauCetiRoadmap AdicSpaces, Layer 6; PerfectoidSpaces, P1; *Boundary neighbourhoods and section rings of Y^an* (§AI.2.3).

**Checks.**

- Keep the integral coefficient ring and bijective semilinear Frobenius; rational isocrystals alone do not supply this equivalence.

**Isocrystal origin of analytic annulus Frobenius modules** (`AInf.annulus_isocrystal_classification`). Fix a section `k→O_C^♭` of the residue map, inducing `L=W(k)[1/p]→A_inf[1/p]`. For a `φ-vector` bundle `E` on `Y_[r,infinity)`, `0<r<infinity`, there is a finite-dimensional isocrystal `M` over `L` and a `φ`-equivariant isomorphism `E≅M ⊗_L O_Y_[r,infinity)`. The isocrystal carrier and its Witt Frobenius already exist in Mathlib; the new target is this analytic classification.

`C` complete algebraically closed perfectoid, `k` its residue field, and the specified section. Use the shared analytic intervals and their Frobenius pullbacks. The space `Y^an` of (Y).

Use Frobenius pullback to extend the interval toward zero without changing its `φ`-module category. Identify `φ-vector` bundles with `φ`-modules over the extended Robba ring. Apply Kedlaya’s analytic classification in the stated residue-field section; retain the induced L-coefficient map. Smaller Newton-polygon and slope arguments remain inside this proof. (SW20, Theorem 13.4.1, Remark 13.4.2 and Definition 13.4.3, printed pp.111–113 (PDF pp.121–123)). *Needs:* Mathlib `WittVector.Isocrystal`; Mathlib `WittVector.FractionRing.frobenius`; TauCetiRoadmap AdicSpaces, Layer 6; *Integral Robba Frobenius descent and no-leg shtukas* (§AI.2.3); *Boundary neighbourhoods and section rings of Y^an* (§AI.2.3).

**Checks.**

- For the unit bundle and `r>0`, the unit isocrystal extends scalars along `L→O_Y_[r,infinity)` to the unit bundle.
- At `r=0`, `x_{C^♭}` has characteristic-`p` residue, so `p` is not invertible in its stalk; even the unit cannot be expressed by this `L`-scalar extension.
- Positive-radius restriction and Frobenius pullback preserve the isocrystal representative; this is an analytic interval statement.

**Unique Frobenius extension across infinity** (`AInf.frobenius_extension_infinity`). For `0≤r<infinity`, restriction from `φ-vector` bundles on `Y_[r,infinity]` to `φ-vector` bundles on `Y_[r,infinity)` is an equivalence. In particular a one-leg shtuka becomes a `φ`-module beyond the radius of its leg and extends uniquely across `x_L`; this is the extension at infinity required by finite-free BKF reconstruction.

Shared `Y`, `x_L`, radius function and Frobenius. The algebraically closed `C` used for analytic classification supplies essential surjectivity; full faithfulness also holds over a general perfectoid field. The space `Y^an` of (Y).

For full faithfulness reduce to invariant sections of an internal Hom. Use the Newton-polygon argument of Proposition 13.3.2 to extend Frobenius eigenvectors across `x_L`. For essential surjectivity choose a positive-radius tail `Y_[s,infinity)` with `s>r`, extend its isocrystal representative to `Y_[s,infinity]`, and glue to the original bundle on the bounded part along their common positive-radius interval. For `r=0` the bounded part retains `x_{C^♭}`; scalar extension from `L` is used only on the tail. (SW20, Theorem 13.2.1, Remark 13.2.2, Proposition 13.3.2 and Theorem 13.4.1, printed pp.109–111 (PDF pp.119–121); the theorem is not deletion of the zero endpoint). *Needs:* *Isocrystal origin of analytic annulus Frobenius modules* (§AI.2.3); TauCetiRoadmap AdicSpaces, Layer 6; *Boundary neighbourhoods and section rings of Y^an* (§AI.2.3).

**Checks.**

- For `r=0`, the unit extends across infinity by gluing a positive-radius unit tail to the bounded unit bundle, retaining the characteristic-`p` endpoint.
- For `r>0`, an isocrystal representative extends across `x_L` by the same `L`-scalar extension.
- Restriction is fully faithful on internal Homs, so two extensions of the same tail agree uniquely; the leg is outside that tail.

**Vector bundles on Y^an by gluing two opens** (`AInf.analytic_bundle_gluing`). A vector bundle on `Y^an` is the same as a triple `(E_1, E_2, α)` of finite projective modules over `B^{[0, r]}` and `B^{[r, ∞]}` with an isomorphism `α` of their base changes to `B^{[r, r]}`; global sections are the fibre product of the two section modules over `B^{[r, r]}`. Frobenius-equivariant versions hold with `φ`: `Y_{[0, r]} → Y_{[0, pr]}`.

The space `Y^an` of (Y) and the cover of *Boundary neighbourhoods and section rings of Y^an*.

On each sheafy affinoid, finite projective modules are vector bundles (Kedlaya–Liu; SW Theorem 5.2.8); glue along the two-open cover. Sections over the union are the equalizer of the two restrictions. (SW20, Theorem 5.2.8, printed p.38; SW20, §14.3, proof of Theorem 14.2.1, printed pp.119–121). *Needs:* *Boundary neighbourhoods and section rings of Y^an* (§AI.2.3); AdicSpacesPartIII, R3 (*Kiehl glueing of finite projective modules over sheafy Tate affinoids*).

**Finite free A_inf modules and bundles on punctured analytic Y** (`AInf.analytic_vector_bundle_extension`). Restriction of finite free `A_inf`-modules to the punctured analytic `Y^an` induces an equivalence with finite-rank vector bundles on `Y^an`. This is distinct from the algebraic punctured spectrum `U=Spec(A_inf)` minus its closed point. Applying it to the extended one-leg shtuka recovers the finite free underlying module; its Frobenius is then linearized after inverting `ξ̃`.

`C` complete algebraically closed of characteristic zero. `Y^an` is the punctured analytic locus of SW §12.2, printed pp.101–102; topology and endpoint carriers remain owned by AdicSpaces Layer 6. The space `Y^an` of (Y).

Use the source two-open cover and the associated equalizer for sections; use the affinoid equivalence between finite projective modules and vector bundles (AdicSpacesPartIII, R3) and *Vector bundles on Y^an by gluing two opens* (§AI.2.3). Recover a finite free `A_inf`-module from a vector bundle by the source lattice and approximation argument. Identify scalar extension back to `Y` and the Hom equalizer, giving essential surjectivity and full faithfulness. (SW20, Theorem 14.2.1, printed pp.116–117, and its proof in §14.3, pp.119–121 (PDF pp.126–127,129–131)). *Needs:* *Linear module patching across a principal divisor* (§AI.2.1); TauCetiRoadmap AdicSpaces, Layer 6; *Boundary neighbourhoods and section rings of Y^an* (§AI.2.3); *Vector bundles on Y^an by gluing two opens* (§AI.2.3); AdicSpacesPartIII, R3 (*Kiehl glueing of finite projective modules over sheafy Tate affinoids*).

**Checks.**

- The interior is the space `𝒴` of TauCetiRoadmap AdicSpaces, Layer 6; the two ends are *Boundary neighbourhoods and section rings of Y^an* (§AI.2.3). The equivalence here is on `Y^an`, not on the interior Fargues–Fontaine cover alone.

**Analytic reconstruction of a finite free BKF module** (`BKF.reconstruct`). Reconstruct a finite free BKF module from a pair `(T,Ξ)` using the one-leg shtuka, unique extension across infinity and finite-free/vector-bundle equivalence on the punctured analytic `Y^an`. Layer AI.2 owns these linear patching and reconstruction theorems; AdicSpaces Layer 6 supplies the interior and its Frobenius; the boundary neighbourhoods and unique extension across infinity are the targets of §AI.2.3.

`C` algebraically closed; pair as defined; in SW the leg is at `φ^(-1)(x_C)`. Translate this to linearization inverted at `ξ̃=φ(ξ)`, retaining the direction of Frobenius. The space `Y^an` of (Y).

The API:

- `BKF.reconstruct_pair`: The reconstructed BKF module realizes to the given pair.
- `BKF.reconstruct_morphism`: Pair morphisms induce Frobenius-compatible maps.
- `BKF.reconstruct_tensor`: Reconstruction preserves tensor products in the finite-free category.
- `BKF.reconstruct_modification`: Under the canonical realization-pair isomorphism, the image of the reconstructed `B_dR⁺`-lattice equals the specified `Ξ`, element by element. This identifies the completed-stalk lattice of the associated modification on the punctured analytic `Y^an`; it is not merely freeness of the underlying module.

Use Proposition 12.4.6 to build the one-leg shtuka from `(T,Ξ)`: patch `Ξ` at `x_C` and its successive Frobenius translates, with the leg at `φ^-1(x_C)`. No-leg descent is supplied by *Integral Robba Frobenius descent and no-leg shtukas* (§AI.2.3). Use *Unique Frobenius extension across infinity* (§AI.2.3) to extend its `φ`-module tail across `x_L`; glue with the bounded part. Use *Finite free A_inf modules and bundles on punctured analytic Y* (§AI.2.3) to recover the finite free `A_inf`-module, then SW Theorem 14.1.1 to identify its Frobenius linearization after `ξ̃` inversion. (SW20, Theorem 11.4.5, printed p.97; Theorem 12.3.4 and Proposition 12.3.5, p.104; Proposition 12.4.6, pp.106–107; Theorems 13.2.1,13.4.1, pp.109–113; Theorems 14.1.1,14.2.1, pp.115–117). *Needs:* *Étale lattice and de Rham lattice pair* (§AI.2.2); *Linear module patching across a principal divisor* (§AI.2.1); *Integral Robba Frobenius descent and no-leg shtukas* (§AI.2.3); *Unique Frobenius extension across infinity* (§AI.2.3); *Finite free A_inf modules and bundles on punctured analytic Y* (§AI.2.3); TauCetiRoadmap AdicSpaces, Layer 6; *Boundary neighbourhoods and section rings of Y^an* (§AI.2.3); *Vector bundles on Y^an by gluing two opens* (§AI.2.3).

**Checks.**

- `BKF.reconstruct_test_standard`: The standard pair reconstructs the unit as a BKF object: the comparison and inverse commute with linearized Frobenius and have inverse underlying maps.
- `BKF.reconstruct_test_shift`: A `ξ-shifted` rank-one lattice reconstructs the corresponding BK twist with the source sign convention: the comparison has a BKF morphism and inverse whose underlying maps are inverse and whose linearized Frobenius squares commute.
- `BKF.reconstruct_test_zero`: The zero pair reconstructs the zero finite-free BKF object.

**Fargues classification of finite free BKF modules** (`AInf.fargues_classification`). Over algebraically closed `C`, finite free BKF modules are tensor equivalent to lattice pairs `(T,Ξ)`. The inverse and comparison preserve Tate twists and the associated FF modifications. No such equivalence is asserted for every finitely presented torsion BKF object.

Common rational period rings and supplied analytic patching; finite free modules.

Combine full faithfulness with reconstruction and its two unit/counit comparisons. Check tensor and twist identities in the two realizations. (BMS1 (arXiv v3), Theorem 4.28, printed pp.42–43; full faithfulness and reconstruction are separate preceding targets; SW20, Theorem 14.1.1, printed pp.115–116). *Needs:* *Full faithfulness of Fargues realization* (§AI.2.2); *Analytic reconstruction of a finite free BKF module* (§AI.2.3).

**Continuous Galois descent of BKF pairs** (`AInf.bkf_galois_descent`). For a discretely valued `K` with `C` its completed algebraic closure, retain a continuous semilinear `G_K` action on the BKF module and compatible continuous action on `T` and `Ξ`. The Fargues correspondence respects this descent data; discarding the action does not recover the K-object.

`K` complete discretely valued with perfect residue field; continuity for the p-adic and period topologies. Finite free BKF modules and their lattice pairs for transport by Fargues classification. The explicit crystalline case begins with a `G_K-stable ℤ_p` lattice in a crystalline representation.

Transport semilinear actions by the fully faithful Fargues functor. Check continuity using the topologies of PadicPeriodRings, §§1.5, 4.1, rather than infer it from algebraic equivariance. For lattices in crystalline `G_K` representations, use the Frobenius on W(k) and `T↦[π^♭]^p` in Proposition 4.32; Proposition 4.34 identifies the crystalline/de Rham lattice and its compatible action. (BMS1 (arXiv v3), §4.4, Lemma 4.30, Proposition 4.32 and Proposition 4.34; printed pp.33–44). *Needs:* *Fargues classification of finite free BKF modules* (§AI.2.3); PadicPeriodRings, §§1.5, 4.1 (*generalBasePeriodRings*: period topologies and continuous actions).

### AI.2.4 Minuscule modules

**Minuscule Breuil–Kisin–Fargues modules** (`AInf.MinusculeBKF`). A minuscule BKF module is a finite free `A_inf-module M` with an injective linearized Frobenius `F:φ_A^*M→M` such that `ξ̃M⊆F(φ_A^*M)⊆M`. Thus coker `F` is killed by `ξ̃` and `F[1/ξ̃]` is an isomorphism. Morphisms are `A_inf`-linear maps commuting with `F`. This is a full subcategory of the BKF category of §AI.2.2, defined entirely by integral linear algebra.

Standing hypotheses (C).

The API:

- `AInf.MinusculeBKF.toBKF`: forget the integral-image condition; the localized Frobenius is the given one.
- `AInf.MinusculeBKF.baseChange`: for a flat map between the coefficient rings of (C), commuting with Frobenius and carrying `ξ̃` to a unit multiple of `ξ̃′`, scalar extension preserves the two image inclusions and injectivity.
- `AInf.MinusculeBKF.dual`: `M↦M^∨⊗(A_inf,ξ̃·φ_A)` preserves the category, with Frobenius `ξ̃(F^∨)⁻¹` on the localized dual.
- `AInf.MinusculeBKF.directSum`: finite direct sums have componentwise Frobenius and the same image bounds.

For duality, the inclusions imply that `ξ̃F⁻¹` is integral. Its transpose is the displayed dual Frobenius; applying the construction twice recovers `F`. Base change uses flatness for injectivity and right exactness for the cokernel bound. These arguments use neither a site nor an equivalence with crystals. (ALB (arXiv v4), Remark 4.1.11 and Proposition 4.1.12, printed p.30; BMS1 (Publ. IHÉS), Definition 4.22 and Remark 4.29, pp.276,280.) *Needs:* *Breuil–Kisin–Fargues module* (§AI.2.2); *Operations in valid BKF subcategories* (§AI.2.2); *Regularity of integral periods* (§AI.0.2).

**Checks.**

- `minuscule_unit`: `(A_inf,φ_A)` has zero cokernel and is minuscule.
- `minuscule_xi`: `(A_inf,ξ̃·φ_A)` has cokernel `A_inf/ξ̃`; duality interchanges it with the unit object.
- `minuscule_square`: `(A_inf,ξ̃²·φ_A)` is BKF but fails the image bound, since `ξ̃` is nonzero in `A_inf/ξ̃²`.
- A direct sum of the first two objects has Frobenius matrix `diag(1,ξ̃)`; its dual twist has matrix `diag(ξ̃,1)`, including when `p=2`.
- The scalar image-bound witness `2∉(2²)` in `ℤ` detects replacing an ideal by its square.

### Examples

The trivial module `(A_inf, φ)` corresponds to the pair `(ℤ_p, B_dR⁺)` under Fargues'
classification. A torsion module such as `A_inf/p` with its Frobenius is a Breuil–Kisin–Fargues
module that is not finite free; it falls under the structure theorem and the integral Witt
descent, not under the classification of finite free modules.

### Dependencies

Earlier layers: AI.0, AI.0:period-comparison. Other roadmaps: AdicSpacesPartIII R3, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4, Tau Ceti `TauCeti.fittingIdeal`, PadicPeriodRings §§1.5, 2–4, PerfectoidSpaces P0, PerfectoidSpaces P1, TauCetiRoadmap AdicSpaces, Layer 6. Mathlib: `AdicCompletion`, `LocalizedModule`, `ModuleCat`, `TensorProduct`, `ValuationRing`, `WittVector`, `WittVector.FractionRing.frobenius`, `WittVector.Isocrystal`.

## Layer AI.3: Integral pro-étale period sheaves and `AΩ`

This layer defines `AΩ_𝔛 = Lη_μ Rν_* 𝔸_inf,X` for a smooth formal scheme `𝔛` over `O_C` with
generic fibre `X`, through the integral pro-étale sheaves of AdicEtaleGeometry, A1, and computes
it locally by the `q`-de Rham complex of a framing. The classical sheaf `W(Ô⁺♭_X)` and its derived
`p`-completion are kept apart until they are compared.

### AI.3.1 Integral period sheaves

**Completed integral structure sheaf** (`AInfSheaf.completedIntegral`). On `X_proét` for a locally noetherian analytic adic `X` over `Spa(ℚ_p,ℤ_p)`, define `Ô_X⁺=lim_n O_X⁺/p^n` as a sheaf of rings. There are compatible `O_X⁺/p^n≅Ô_X⁺/p^n`, p-flatness and rational localization `Ô_X=Ô_X⁺[1/p]`. The site uses the corrected transfinite covers.

The corrected pro-étale site is supplied by AdicEtaleGeometry A1; smoothness is not required here.

The API:

- `AInfSheaf.completedIntegral_mod_pn`: `Ô^+/p^n≅O⁺/p^n` as sheaves.
- `AInfSheaf.completedIntegral_sections`: For affinoid perfectoid `Û=Spa(R,R+)`, `Ô^+(U)=R+`.
- `AInfSheaf.completedIntegral_localization`: Inverting `p` gives Ô.
- `AInfSheaf.completedIntegral_pullback`: The completed integral sheaf is functorial under eligible adic morphisms.

Use the corrected site and its affinoid perfectoid basis. Form the sheaf inverse limit and prove its finite-reduction properties. (Sch13, Lemma 4.2, printed pp.21–22; Definition 4.3, pp.22–23; BMS1 (arXiv v3), Definition 5.4, Remark 5.5 and Lemma 5.6, printed pp.46–48; Sch13-corr, 2016 corrigendum, pp.1–3; the point claims deleted by the corrigendum are not used). *Needs:* PerfectoidSpaces, P7.16 (`ProEtaleSite.affinoidPerfectoid_basis`); PerfectoidSpaces, P6 (*Scholze 2013's affinoid perfectoid objects of X_proét give affinoid pro-étale perfectoid spaces in the sense of ECD Definition 7.8*); EnhancedDerivedSheaves, E2 (*Countable products in a replete topos*); AdicEtaleGeometry, A1 (*The pro-étale site X_proét of a locally noetherian analytic adic space, with Scholze's corrected coverings*); AdicEtaleGeometry, A1 (*Finite-étale towers: transfinite compositions of pullbacks of finite étale surjections (the erratum's corrected covering condition)*).

**Checks.**

- `AInfSheaf.completedIntegral_test_point`: On `Spa(C,O_C)` the canonical affinoid-perfectoid sections are `O_C`.
- `AInfSheaf.completedIntegral_test_mod_p`: The mod-p quotient is `O⁺/p`, with no extra inverse-limit Tor.
- `AInfSheaf.completedIntegral_test_profinite`: On U×S for profinite `S`, sections are continuous maps `S→R+` with the p-adic topology.

**Tilted integral structure sheaf** (`AInfSheaf.tilt`). Define `Ô_X^{+,flat}=lim_F (Ô_X⁺/p)`; it is a perfect characteristic-p sheaf of rings. For an affinoid perfectoid `Û=Spa(R,R+)`, its sections identify with `R^{+,flat}` and its higher cohomology is almost zero.

`X` as above; quotient and Frobenius limit in the corrected pro-étale topos.

The API:

- `AInfSheaf.tilt_sections`: On affinoid perfectoids, sections are the existing PreTilt R+ p.
- `AInfSheaf.tilt_frobenius`: Frobenius is an automorphism of the tilt sheaf.
- `AInfSheaf.tilt_untilt`: The multiplicative sharp map agrees with the existing untilt on sections.
- `AInfSheaf.tilt_pullback`: Compatible with pullback and rational restriction.

Compute sections and limits on the perfectoid basis. Use the source almost acyclicity and inverse-limit argument, not exactness of arbitrary sheaf limits. (Sch13, Lemma 5.10, printed p.33; BMS1 (arXiv v3), Lemma 5.6, printed pp.47–48). *Needs:* *Completed integral structure sheaf* (§AI.3.1); Mathlib `PreTilt`; PerfectoidSpaces, P7.16 (`ProEtaleSite.affinoidPerfectoid_basis`); PerfectoidSpaces, P3 (étale almost acyclicity); PerfectoidSpaces, P6 (*Scholze 2013's affinoid perfectoid objects of X_proét give affinoid pro-étale perfectoid spaces in the sense of ECD Definition 7.8*).

**Checks.**

- `AInfSheaf.tilt_test_char_p`: For a perfect characteristic-p section ring the tilt is that ring.
- `AInfSheaf.tilt_test_zero`: The tilt of the zero section ring is zero.
- `AInfSheaf.tilt_test_sharp_add`: Sharp is multiplicative and generally not additive; do not expose a ring homomorphism sharp.

**Classical integral Witt period sheaf**. On the corrected pro-étale site of a locally noetherian analytic adic space `X` over `Spa(ℚ_p,ℤ_p)`, set `A_inf,X^cl=W(Ô_X^{+,flat})=lim_R W_r(Ô_X^{+,flat})` in sheaves of rings. Sheafifying BMS1 Lemma 3.2 gives its identification with `lim_F W_r(Ô_X⁺)`, with projections `θ̃_r` and `θ_r=θ̃_r∘φ^r`. It is a discrete sheaf, distinct from the derived p-completed `A_inf,X` used in `AΩ`.

The corrected analytic pro-étale site of AdicEtaleGeometry, A1, with inverse limits in its ringed topos. No smoothness or formal model is needed. Derived completeness of this ordinary sheaf is not assumed.

The API:

- `AInf.classical_ainf_sheaf.restriction`: For `V→U` on `X_proét`, restriction is the Witt map induced by `Ô^{+,flat}(U)→Ô^{+,flat}(V)`.
- `AInf.classical_ainf_sheaf.theta_r`: Projection to `W_r(Ô⁺)` is `θ̃_r`; composing with `φ^r` gives `θ_r`, whose length-one map is `θ`.
- `AInf.classical_ainf_sheaf.perfectoid_sections`: On an affinoid perfectoid `U` with completed integral ring `R⁺`, `A_inf,X^cl(U)=W(R^{+,flat})` with its Witt Frobenius.

Form finite Witt-vector sheaves and their restriction limit. Sheafify the perfectoid Witt-limit identities; use the Frobenius limit rather than identifying Witt vectors with a coordinatewise ring product. (BMS1 (arXiv v3), Definition 5.4, Remark 5.5 and the paragraph after Lemma 5.6, printed pp.46–47; Sch13, Definitions 6.1 and 6.3, printed pp.35–36; read with the 2016 corrected covering definition). *Needs:* *Completed integral structure sheaf* (§AI.3.1); *Tilted integral structure sheaf* (§AI.3.1); *Finite Witt coefficient maps* (§AI.0.2); Mathlib `WittVector`; EnhancedDerivedSheaves, E2 (*Countable products in a replete topos*).

**Checks.**

- `classical_ainf_sheaf_point`: On `Spa(C,O_C)` with its affinoid perfectoid presentation, sections are `W(O_C^♭)`, not W(C).
- `classical_ainf_sheaf_level_one`: At `r=1`, `θ_1` is `θ` and `θ̃_1=θ∘φ^−1`; their cyclotomic kernels differ.
- `classical_ainf_sheaf_sheaf_not_complex`: The classical sheaf is concentrated in degree zero; its definition alone supplies no vanishing theorem for derived inverse-limit or section functors.
- `classical_ainf_sheaf_units`: The Witt unit restricts to the unit at every finite level.
- Keep the ordinary sheaf in degree zero before derived completion.
- All `θ_r` use the same scalar normalization as AI.0.

**Derived p-completed A_inf sheaf** (`AInfSheaf.ainf`). Let `A_inf,X` be the derived p-completion of the Witt sheaf `W(Ô_X^{+,flat})` in the shared enhancement. BMS1 Definition 5.4 uses this derived object, distinct from presuming an everywhere discrete ordinary limit. Its `H^0` on affinoid perfectoids is `W(R^{+,flat})`, and `H^{>0}` of sections is almost zero.

Corrected pro-étale topos; shared enhancement and derived p-completion; almost ideal determined by the perfectoid base.

The API:

- `AInfSheaf.ainf_mod_pn`: Finite derived `p` reductions agree with the finite Witt sheaf reductions.
- `AInfSheaf.ainf_sections_H0`: `H^0` of sections on an affinoid perfectoid is `W(R^{+,flat})`.
- `AInfSheaf.ainf_theta`: The common `θ` and finite `θ_r` maps define sheaf coefficient specializations.
- `AInfSheaf.ainf_frobenius`: The Witt Frobenius gives an equivalence of `A_inf,X` with its scalar-twisted form.
- `AInfSheaf.ainf_complete`: `A_inf,X` is derived p-complete.

Take Witt vectors sectionwise, sheafify and derive p-completion. Use finite Witt acyclicity and the surjective-system inverse-limit theorem. (BMS1 (arXiv v3), Definition 5.4, Remark 5.5, Lemma 5.6; printed pp.46–47). *Needs:* *Tilted integral structure sheaf* (§AI.3.1); Mathlib `WittVector`; EnhancedDerivedSheaves, E4 (*Derived complete sheaves*).

**Checks.**

- `AInfSheaf.ainf_test_point`: On the canonical point affinoid, `H^0` is the existing `W(O_C^♭)`.
- `AInfSheaf.ainf_test_higher`: The comparison is almost acyclicity, not a claim that all higher sheaf cohomology vanishes integrally.
- `AInfSheaf.ainf_test_level_one`: The `θ_1` map on sections is the already fixed Fontaine map.

**Integral period sections and profinite products** (`AInf.perfectoid_period_sections`). On an affinoid perfectoid `Û=Spa(R,R+)`, the completed integral and tilt sections are R+ and R+flat, and `H^0(Û,A_inf,X)=W(R+flat)`. Their higher integral cohomology is almost zero, not asserted zero. For Û×S with `S` profinite, the integral sections are continuous S-valued maps with the specified inverse-limit topology. Rational period-sheaf acyclicity is *Rational pro-étale de Rham period sheaves* below.

`X` locally noetherian over a perfectoid field; Û affinoid perfectoid in the corrected pro-étale site; `S` profinite.

Use the completed integral and tilt descriptions on the perfectoid basis. Induct through finite Witt lengths and use the controlled derived inverse limit for `A_inf,X`; retain the almost-zero higher cohomology. (Sch13, Theorem 6.5 and Corollary 6.6, printed p.36; BMS1 (arXiv v3), Lemma 5.6, printed pp.47–48; no rational sheaf is asserted here). *Needs:* *Derived p-completed A_inf sheaf* (§AI.3.1); *Completed integral structure sheaf* (§AI.3.1); EnhancedDerivedSheaves, E2 (*Derived limit of an epimorphic system*).

**Classical-to-derived integral period comparison** (`AInf.classical_derived_period_comparison`). There is a canonical multiplicative map `A_inf,X^cl[0]→A_inf,X=Rlim_n(A_inf,X^cl⊗^L ℤ/p^n)`. Its cone has `[m^♭]`-torsion cohomology over a perfectoid base `C`. On affinoid perfectoids the induced map on `H^0` of sections identifies both sides with `W(R^{+,flat})`; higher cohomology of the derived object is almost zero. No global equality of the classical sheaf with its derived completion is asserted.

`X` as in *Classical integral Witt period sheaf* (§AI.3.1), over a perfectoid `C` for the almost statement; `m^♭` is the maximal ideal of `O_C^♭`. Use the derived p-completion functor of the shared enhancement.

Take the derived-completion unit on the ordinary Witt sheaf. Use perfectoid basis computations and the almost derived-completeness argument of Remark 5.5 to bound its failure; retain the cone rather than asserting it vanishes. Extend finite-Witt `θ_r` to the completion because their targets are already derived complete. (BMS1 (arXiv v3), Definition 5.4(vi), Remark 5.5 and Lemma 5.6, printed pp.46–47). *Needs:* *Classical integral Witt period sheaf* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); EnhancedDerivedSheaves, E4 (*Derived complete sheaves*).

**Checks.**

- On `R_∞=O_C⟨T^{±1/p^∞}⟩`, the degree-zero comparison sends each `[T^{1/p^m,♭}]` to that same Teichmüller coordinate.
- On the point, derived reduction modulo `p²` is the identity of `W₂(O_C^♭)`.
- On a profinite product, the map on `H⁰` preserves continuous functions with the Witt inverse-limit topology.

Perform these computations on the period-sheaf carriers when constructing the comparison.

**The projection from the pro-étale site of the generic fibre** (`AInf.nu`). For a p-adic formal scheme `𝔛` locally of finite type over `O_C` (smooth, or as in (SS)) with adic generic fibre `X`, the functor sending an étale 𝔘 `→ 𝔛` to its adic generic fibre `𝔘_η → X`, viewed in `X_proét`, defines a morphism of sites `ν` : `X_proét → 𝔛_ét`, and composing with `𝔛_ét → 𝔛_Zar` gives `ν_Zar`. There is a natural map `ν^{−1}O_𝔛 → Ô⁺_X`, so `ν` is a morphism of ringed topoi to `(𝔛_ét, O_𝔛)`, and `Rν_*` sends `Ô⁺_X`-modules to `O_𝔛`-modules.

`𝔛` as stated; `X_proét` is the corrected pro-étale site.

The API:

- `AInf.nu`: the morphism of ringed topoi `ν` : `(X_proét, Ô⁺_X) → (𝔛_ét, O_𝔛)`
- `AInf.nu_zar`: the composite with `𝔛_ét → 𝔛_Zar`.
- `AInf.nu_etale`: compatibility with étale maps 𝔘 `→ 𝔛`: `ν` restricts to the slice sites.

The generic fibre functor preserves étale maps, coverings, fibre products and the final object (Huber 3.5.1), so it is a continuous functor between sites with finite limits. The map `ν^{−1}O_𝔛 → Ô⁺_X` is the map from functions on 𝔘 to power-bounded functions on `𝔘_η`. (ČK (arXiv v3), §1.5, (1.5.5), printed p.5; BMS1 (arXiv v3), Definition 8.1 and Definition 9.1, printed pp.61 and 69). *Needs:* AdicEtaleGeometry, A1 (*The pro-étale site X_proét of a locally noetherian analytic adic space, with Scholze's corrected coverings*); AdicSpacesPartIII, R2 (*The specialisation map λ_X = sp: d(X) → X*); AdicSpacesPartIII, R2 (*The étale site of a formal scheme is the étale site of its special fibre; the generic-fibre functor on étale objects*); AdicSpacesPartIII, R2 (*For formal O_K-schemes locally of tf presentation, d(X) is the adic space of Raynaud's rigid generic fibre*).

**Checks.**

- `nu_point`: For `𝔛 =` Spf `O_C`, `H^0` of `ν_* Ô⁺_X` is `O_C`.
- `nu_empty`: For `𝔛` empty, `ν` is the identity of the empty topos.
- `nu_composite`: For 𝔘 étale over `𝔛`, `ν_𝔘` is the restriction of `ν_𝔛` to `X_proét/𝔘_η`.


**Primitive mod-p comparison and finiteness** (`AInf.primitive_mod_p_comparison`). For `X` proper smooth over the `C` of (C) and an `F_p-local` system `L` on `X_ét`, `H^i_ét(X,L)` is finite-dimensional over `F_p`, vanishes for `i>2dim X`, and the canonical map `H^i_ét(X,L)⊗_{F_p}O_C/p→H^i(X_proét,ν^*L⊗O_X⁺/p)` is an almost isomorphism for all `i≥0`. Almost refers to the maximal ideal of `O_C`. The same statement for constant coefficients is the input to AI.5; no rational period comparison is assumed.

Standing hypotheses (C); `X` proper smooth; `L` finite locally constant. In particular `X` need not descend to a discretely valued field.

Use affinoid perfectoid acyclicity and toric towers to make cohomology of the integral coefficient sheaf almost finitely generated. Properness gives nested finite small-affinoid covers; the image estimates on their Čech spectral sequences yield almost finite generation. Artin–Schreier and the Frobenius/tilt comparison identify the finite `F_p`-cohomology and the primitive almost map. This is Sch13 Theorem 5.1 and its proof, pp.28–34 (local estimates Lemmas 5.3–5.8; Lemma 5.10 for the tilted coefficients), using the corrected site. *Needs:* PerfectoidSpaces, P3, P6 (almost purity and affinoid perfectoid acyclicity); AdicEtaleGeometry, A1 (corrected site and toric covers); ClassicalAdicEtaleCohomology, §1.3 (étale–pro-étale comparison and Čech descent); *Completed integral structure sheaf* (§AI.3.1); *Tilted integral structure sheaf* (§AI.3.1); *Continuous cochains and Koszul complexes* (§AI.1.7).

**Checks.**

- For `Spa(C,O_C)` and `L=F_p`, the map in degree zero is `O_C/p→O_C/p` and higher cohomology is almost zero on the right.
- For `P¹_C` with constant coefficients, `H⁰=F_p`, `H¹=0` and `H²=F_p(−1)`; the positive-degree bound is two.
- The higher integral coefficient cohomology is used in the almost category. The theorem does not replace an almost isomorphism by an integral isomorphism.

**Vector bundles and change of site**. For a smooth adic space `X` over a complete discretely valued extension `K/ℚ_p` with perfect residue field, pullback induces equivalences between finite locally free modules on `X_an`, `X_ét` and `X_proét`, using the uncompleted structure sheaf `O_X=ν^*O_{X_ét}` on the last site. Morphisms and tensor products are carried by these same pullbacks.

Sch13 Lemma 7.3, pp.42–43. Full faithfulness uses the structure-sheaf pushforward. On an affinoid, descend finite projective modules along finite étale faithfully flat algebras; for a pro-étale trivialization use the faithfully flat filtered colimit of its finite étale stages. Finite presentation descends the idempotent defining the module and its morphisms to a finite stage, and analytic local triviality follows. *Needs:* AdicSpacesPartIII, R3 (analytic vector bundles and finite projective modules); AdicEtaleGeometry, A1 (pro-étale structure sheaf and its sections); ClassicalAdicEtaleCohomology, §1.3 (change of site); SchemeAndStackFoundations, §1.1 (`qcoh_fpqc_descent`); Mathlib `comonadicExtendScalars` (effective faithfully flat module descent). Finite locally free descent follows by descending the dual, evaluation and coevaluation together with the module: their triangle identities are detected faithfully flatly.

**Checks.**

- The trivial rank-r bundle stays `O^r` on all three sites, including `r=0`.
- For a finite étale Galois affinoid cover, the descended module is the invariant module with its specified descent data, and scalar extension recovers the bundle.
- The assertion uses `O_X`, not `Ô_X`. Substituting the completed sheaf changes the category and is not this equivalence.

**Rational pro-étale de Rham period sheaves** (`AInfSheaf.deRhamPeriods`). On the corrected pro-étale site of a smooth adic X/C, define `𝔹_dR⁺=lim_n(𝔸_inf,X[1/p]/(ker θ)^n)`, with residue `Ô_X` and its kernel-adic filtration; define `𝔹_dR=𝔹_dR⁺[1/t]`, `Fil^j𝔹_dR=t^j𝔹_dR⁺`. Here `t=log[ε]` is a generator of ker `θ` up to a unit; the filtration is independent of `ε`. Use the integral sheaf and its rational finite quotients, rather than the period ring of an unrelated constant field. For `X` over a discretely valued `K`, the same construction on `X_proét` carries its natural Galois base-change action.

Standing hypotheses (C); `X` smooth. Topologies are the inverse limits of the p-adic topologies on finite quotients, and the filtered union topology after t-inversion. Only fixed filtration-stage multiplication is used on the latter.

The API:

- `AInfSheaf.deRhamPeriods.sections`: on an affinoid perfectoid `Û=Spa(R,R⁺)`, the plus sections are the ker `θ`-completion of `W(R^{+,♭})[1/p]`; finite t-quotients are the corresponding ring quotients, and higher cohomology of these quotients vanishes.
- `AInfSheaf.deRhamPeriods.graded`: `gr^j𝔹_dR≃Ô_X(j)`, with the positive Tate convention `g(t)=χ(g)t`.
- `AInfSheaf.deRhamPeriods.profinite`: on Û×S for `S` profinite, each finite quotient has sections the continuous S-valued maps into the quotient for its p-adic topology. Pass to the plus sheaf by inverse limit; localizations use the specified filtered stages.
- `AInfSheaf.deRhamPeriods.functorial`: restrictions, pullbacks and compatible Galois actions commute with `θ`, finite quotients and filtration, with identity and composition.

Form finite quotients of the existing integral sheaf, invert `p`, and use almost acyclicity of `Ô_X⁺` on the perfectoid basis: inverting `p` annihilates the almost-zero error. Induct on `n` using the exact graded pieces `Ô_X(j)`, then use the surjective quotient tower for the complete plus sheaf. The topology on profinite products must be retained before taking limits. (Sch13 Definition 6.1, pp.34–35; Theorem 6.5 and Corollary 6.6, p.36; Proposition 6.7, pp.36–37.) *Needs:* *Integral period sections and profinite products* (§AI.3.1); *Classical integral Witt period sheaf* (§AI.3.1); *Comparison with rational period rings* (§AI.0:period-comparison.1); *Finite de Rham coefficient quotients and flatness* (§AI.0:period-comparison.1); PerfectoidSpaces, P3, P6; EnhancedDerivedSheaves, E2.

**Checks.**

- On `Spa(C,O_C)`, plus sections are the existing BDeRhamPlus `O_C p`, and the first quotient is `C`.
- The first graded piece is `Ô_X(1)`, not `Ô_X(−1)`; `ξ̃` is a unit after `θ` and cannot generate this filtration.
- On a profinite product, sections modulo `t` are continuous functions `S→R`. For `S=ℤ_p` and `R=C` the inclusion `s↦s·1` is continuous and is not locally constant; a discrete quotient topology gives the wrong answer. The scalar model `PadicInt p → Padic p` in Lean witnesses the same distinction before extension to `C`.
- Integral `𝔸_inf` acyclicity remains almost acyclicity; the honest vanishing here is obtained only after p-inversion and finite t-quotient induction.

**Structural de Rham period sheaf and Poincaré lemma** (`AInfSheaf.structuralDeRhamPeriods`). Let X/K be smooth, with `K` complete discretely valued of mixed characteristic and perfect residue field, and `C=K̄^∧`. On the affinoid perfectoid basis write `U=lim_i U_i`, with `U_i=Spa(R_i,R_i⁺)` and completed limit `(R,R⁺)`, and put `A_inf(R,R⁺)=W(R^{+,♭})`. Define

```text
S_i(U) = (((R_i⁺ ⊗_{W(k₀)} A_inf(R,R⁺))^∧_p)[1/p])^∧_{ker θ_i},
O𝔹_dR⁺ = sheafification of (U ↦ colim_i S_i(U)).
```

Here `θ_i` is induced by `R_i⁺→R⁺` and Fontaine's `θ:A_inf(R,R⁺)→R⁺`, with target `R` after p-inversion. Both completions are classical: first complete the integral tensor p-adically, then invert `p`, then complete at `ker θ_i`; take the finite-stage colimit and sheafify afterwards (Sch13-corr, item (3), pp.1–2, correcting Sch13 Definition 6.8). Put `O𝔹_dR=O𝔹_dR⁺[1/t]`. It has the connection ∇ induced by the first factor, the kernel-adic filtration before inversion, and `Fil^iO𝔹_dR=∑_{j≥0}t⁻ʲFil^{i+j}O𝔹_dR⁺` after inversion. The relative Poincaré sequence `0→𝔹_dR⁺→O𝔹_dR⁺→O𝔹_dR⁺⊗Ω¹_X→⋯` is strict exact for the filtration with the usual degree shift; its localized version is strict exact as well.

The API:

- `AInfSheaf.structuralDeRhamPeriods.connection`: ∇ obeys the Leibniz rule, `∇²=0`, and Griffiths transversality; horizontal sections are `𝔹_dR⁺` before inversion and `𝔹_dR` afterwards.
- `AInfSheaf.structuralDeRhamPeriods.toric`: on a small toric chart and an affinoid perfectoid `U` over its root cover, for every sufficiently large `i` the ring `S_i(U)` is `B_dR⁺(R,R⁺)[[u₁,…,u_d]]`, independently of `i`. Consequently the sheaf is `𝔹_dR⁺[[u₁,…,u_d]]`, with `u_i=T_i⊗1−1⊗[T_i^♭]`, `∇u_i=dT_i` and `Fil^m=(t,u₁,…,u_d)^m` for `m≥0`.
- `AInfSheaf.structuralDeRhamPeriods.geometricPushforward`: over `X_C` the zeroth associated graded structural sheaf has pushforward `O_{X_C}` and vanishing higher direct images, locally by toric continuous cohomology. Faltings' exact sequence is `0→Ô_X(1)→gr¹O𝔹_dR⁺→Ô_X⊗Ω¹_X→0`.
- `AInfSheaf.structuralDeRhamPeriods.functorial`: pullback and the `G_K` action preserve the filtered connection and the embedding of the horizontal sheaf.

Use the strengthened small-chart power-series computation of Sch13-corr, item (3), p.2 (Sch13 Proposition 6.10, pp.37–38). The integral p-adic tensor completion makes the coordinate map and its inverse mutually inverse already at sufficiently large finite stage. The connection extends from the first tensor factor through these completions and has a formal antiderivative in each variable in characteristic zero. This proves the strict Poincaré lemma, Corollary 6.13 (p.39), and Faltings' extension, Corollary 6.14 (p.39). Proposition 6.16(i) (pp.39–40) proves the geometric pushforward after adjoining all roots of unity. It is distinct from arithmetic Proposition 6.16(ii), where `H¹` contains log `χ`. Descent makes the construction independent of charts. *Needs:* *Rational pro-étale de Rham period sheaves* (§AI.3.1); *Continuous cochains and Koszul complexes* (§AI.1.7); *Continuous cohomology of completed coefficient sums* (§AI.1.7); AdicSpacesPartIII, R2, R3 (smooth charts and differentials); ClassicalAdicEtaleCohomology, §1.3 (Cartan–Leray descent); PadicPeriodRings, §§1.1–1.5, 2, 4.1 (arithmetic period topologies and actions).

**Checks.**

- At `d=0` the horizontal inclusion is the identity; the construction does not introduce a coordinate variable.
- On a one-dimensional chart, `∇u=dT` and `u` is not horizontal. A connection set to zero fails the exact sequence.
- For affinoid perfectoid `U` over a toric root cover and sufficiently large `i`, the coordinate maps give inverse isomorphisms `S_i(U)/(ker θ_i)^n≅B_dR⁺(R,R⁺)[[u₁,…,u_d]]/(t,u₁,…,u_d)^n` for every `n≥1`. At `n=1` this is `R`; passage to the limit recovers the stabilized section ring of the corrected construction.
- The class of `t` in `gr¹` gives `Ô_X(1)`; the quotient by it is `Ô_X⊗Ω¹_X`. This fixes the sign in the connecting map `R¹ν_*Ô_X(1)≃Ω¹_X` after geometric base change.
- The geometric pushforward has no extra log `χ` class. The arithmetic base has an additional `G_K`-cohomology calculation and is kept distinct.

**Constant-coefficient rational de Rham comparison** (`AInf.constant_deRham_comparison`). For `X` proper smooth over the `K` in the preceding target, `H^i_ét(X_C,ℤ_p)` is finitely generated, and the structural-period-sheaf comparison gives `H^i_ét(X_C,ℤ_p)⊗B_dR≃H^i_dR(X/K)⊗_K B_dR`, naturally, `G_K-equivariantly` and compatibly with filtrations, for all `i≥0`. The Hodge–de Rham spectral sequence degenerates. This target uses constant coefficients; arbitrary de Rham local systems belong to the downstream theory.

Sch13 Theorem 7.11 (pp.46–47) and Theorem 8.4 (pp.48–49), specialized to the constant local system; BMS1 (arXiv v3), Theorem 5.1 and §5.2, pp.45,49–51. The primitive mod-p comparison, induction on `p^n`, derived inverse limit and p-inversion compare the constant étale complex tensored with the finite t-quotients of `𝔹_dR⁺` to period-sheaf cohomology. Almost errors vanish on these rational quotients. Taking the quotient limit and then inverting `t` gives the horizontal side of the structural Poincaré resolution. Its geometric pushforward identifies the other side with de Rham cohomology tensored with `B_dR`. Carry the filtrations through the strict resolution. The associated graded gives the Hodge–Tate direct-sum dimensions; comparison with the de Rham side forces degeneration. This proves the filtered constant-coefficient comparison without the canonical `B_dR⁺` deformation of AI.6, which later compares its own map to this one. *Needs:* *Primitive mod-p comparison and finiteness* (§AI.3.1); *Rational pro-étale de Rham period sheaves* (§AI.3.1); *Structural de Rham period sheaf and Poincaré lemma* (§AI.3.1); *Vector bundles and change of site* (§AI.3.1); ClassicalAdicEtaleCohomology, §1.3; EnhancedDerivedSheaves, E2 (derived limits and complete tensor); PadicPeriodRings, §4.1 (`B_dR` and its filtration).

**Checks.**

- The point comparison is `B_dR=B_dR` with the fixed K-embedding.
- `H²` of `P¹` is `ℤ_p(−1)`; its period `t` identifies it with the de Rham class in `Fil¹`. Reversing the Tate sign breaks equivariance.
- The theorem identifies the filtered `B_dR` realizations. Equality of integral `B_dR⁺` lattices is a separate AI.6 target and does not follow from t-inversion alone.

**The first higher direct image of the completed structure sheaf** (`AInf.completed_structure_first_image`). For a smooth adic space `X` over `C` with `ν` : `X_proét → X_ét`, there is a natural isomorphism `R¹ν_*Ô_X ≅ Ω¹_X(−1)`, and `R^iν_*Ô_X ≅ Ω^i_X(−i)`; integrally, `(R¹ν_*Ô⁺_X)[1/p] ≅ Ω¹_X(−1)`.

`X` smooth over `C`.

Compute locally on a toric chart by continuous cohomology of `ℤ_p^d` acting on the perfectoid cover, and identify the class of dlog `T_i` with a generator of `Ω¹(−1)`. (ČK (arXiv v3), §4.10, printed p.28; ČK (arXiv v3), §4.15 and Claim 4.15.1, printed pp.29–30). *Needs:* AdicEtaleGeometry, A1 (the corrected pro-étale site); PerfectoidSpaces, P3 (affinoid perfectoid acyclicity); *Continuous cochains and Koszul complexes* (§AI.1.7); *Continuous cohomology of completed coefficient sums* (§AI.1.7).

**Checks.**

- On `Spa(C,O_C)`, `ν_*Ô=C` and `R^iν_*Ô=0` for `i>0`.
- On a one-dimensional torus the first class is dlog `T` in `Ω¹(−1)`, and exterior degree two vanishes.
- This is geometric cohomology over `C`; no arithmetic log `χ` summand occurs. Descent over a discretely valued `K` has the additional `G_K`-cohomology and is not this formula.

### AI.3.2 `AΩ` and the toric computation

**The AΩ complex** (`AOmega.local`). For a smooth p-adic formal `O_C-scheme 𝔛` with analytic generic fiber `X` and `ν:X_proét→𝔛_Zar`, define `AΩ_𝔛=Lη_μ Rν_* A_inf,X` in the shared enhanced derived category of `A_inf`-module sheaves. The ideal `(μ)`, hence the object, is independent of `ε`.

Smooth p-adic formal scheme; corrected site; derived p-completed coefficients; common enhancement.

The API:

- `AOmega.local_definition`: `AΩ=Lη_μ Rν_* A_inf,X` in the enhancement.
- `AOmega.local_roots`: Changing `ε` gives a canonical comparison through the ideal `(μ)`.
- `AOmega.local_restriction`: Restriction to a Zariski open agrees with its `AΩ` construction.
- `AOmega.local_multiplication`: There is coherent unital `E_infinity` multiplication from the lax functors.
- `AOmega.local_frobenius`: The Witt Frobenius yields `φ^*AΩ→AΩ`, factoring through `Lη_ξ̃ AΩ`.
- `AOmega.local_complete`: `AΩ` is derived `(p,ξ)`-complete in the smooth setting.

Construct the morphism of ringed topoi and its derived pushforward using E1. Apply generic `Lη` to the intrinsic ideal `(μ)`. Use change-of-generator descent to identify different root choices. (BMS1 (arXiv v3), Definition 9.1; printed p.69). *Needs:* *Derived p-completed A_inf sheaf* (§AI.3.1); *Derived décalage* (§AI.1.2); *Infinite Witt specialization kernel* (§AI.0.2); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); AdicEtaleGeometry, A1; *The projection from the pro-étale site of the generic fibre* (§AI.3.1).

**Checks.**

- `AOmega.local_test_point`: For `𝔛=Spf O_C`, `AΩ≃A_inf` in degree 0.
- `AOmega.local_test_torus`: For a framed formal torus the toric q-Koszul model computes `AΩ`.
- `AOmega.local_test_framings`: Two framings on the same smooth affine yield equivalences through the single sheaf `AΩ`, not coordinatewise equality of formulas.

**Toric perfectoid cover** (`AOmega.toricCover`). For a small framed smooth `R` over `O_C`, set `R_infinity=R completed-⊗_(O_C<T_i±1>) O_C<T_i±1/p^infinity>`. It gives an affinoid perfectoid pro-étale cover with continuous `Γ=ℤ_p(1)^d` action. Its integral and nonintegral monomial weight summands are completed, not unrestricted products.

`R` p-complete, p-torsion-free and formally étale over the displayed torus; choose compatible roots for the action.

The API:

- `AOmega.toricCover_action`: `γ_i` scales the p-power roots of `T_i` by the compatible roots of unity.
- `AOmega.toricCover_perfectoid`: The completed cover is affinoid perfectoid.
- `AOmega.toricCover_integral_part`: Integral weights give the completed original torus part.
- `AOmega.toricCover_transition`: Finite root covers and their transition maps give the corrected pro-étale cover.

Use PerfectoidSpaces P7.16’s root-torus site object over `C`, then its formally étale pullback and p-completion. The chosen roots of unity give the displayed `Γ` action; the supplier’s root-torus construction itself requires no roots of unity. (BMS1 (arXiv v3), §8.1; Definition 9.3 (framing and root tower); printed pp.61–69). *Needs:* PerfectoidSpaces, P7.16 (`ProEtaleSite.proEtale_rootTorus_exists`); PerfectoidSpaces, P6 (*Scholze 2013's affinoid perfectoid objects of X_proét give affinoid pro-étale perfectoid spaces in the sense of ECD Definition 7.8*); PerfectoidSpaces, P3 (*The almost purity theorem for perfectoid Tate rings (ECD Theorem 6.1)*); *Cohomology of completed direct sums* (§AI.1.5); *Continuous cochains as an integer-indexed complex* (§AI.1.7).

**Checks.**

- `AOmega.toricCover_test_d0`: In relative dimension 0 the coordinate tower and `Γ` are trivial.
- `AOmega.toricCover_test_d1`: `γ(T^(1/p^n))=ζ_(p^n)T^(1/p^n)`.
- `AOmega.toricCover_test_continuity`: Giving `Γ` the discrete topology does not supply the required continuous completed cochain comparison.

**Integral toric cohomology computation** (`AInf.toric_cohomology`). The continuous cohomology of `R_infinity` decomposes by weights. Integral weights have the source exterior cohomology, and nonintegral weights have the bounded root-of-unity annihilation estimates of Proposition 8.9 and Lemma 8.10. After `Lη_(ζ_p−1)`, only the predicted differential-form part survives.

Framed small smooth `R`; completed weight decomposition; continuous `Γ`.

Compute each one-variable `γ−1` eigenvalue. Use the scalar Koszul divisibility alternatives for each weight and tensor with correct signs. Pass to completed direct sums using the uniform torsion estimate. (BMS1 (arXiv v3), Proposition 8.9; Lemma 8.10; printed pp.63–64). *Needs:* *Toric perfectoid cover* (§AI.3.2); *Continuous cochains and Koszul complexes* (§AI.1.7); *Dé­calage of commuting Koszul operators* (§AI.1.7).

**Finite Witt toric cohomology** (`AInf.witt_toric_cohomology`). For finite `r`, the toric `W_r(R_infinity)` cohomology has the integral-part and completed nonintegral weight decomposition in Lemma 9.7, with the annihilators used by `Lη_[ζ_(p^r)]−1`. The resulting cohomology modules have no almost-zero elements where Corollary 3.29 is invoked.

Small framed `R`; `r≥1`; finite-level almost setting `W_r(m)`.

Use the finite Witt polynomial weight decomposition. Compute the `γ` eigenvalues and apply finite Witt no-almost-zero results. (BMS1 (arXiv v3), Lemma 9.7; Lemmas 9.8–9.9; printed pp.73–74). *Needs:* *Toric perfectoid cover* (§AI.3.2); *Finite Witt polynomial decomposition* (§AI.0.3); *Absence of almost-zero finite Witt sections* (§AI.0.3); *Cohomology of completed direct sums* (§AI.1.5).

**Almost-to-honest décalage criterion** (`AInf.almost_to_honest`). Let `f∈I` be regular in A. If `g:C→D` induces cohomology maps with I-annihilated kernel/cokernel, and `H^i(C)` and `H^i(C)/f` have no nonzero I-annihilated elements for every `i`, then `Lη_f g` is an equivalence. The assumptions are on `C`, not an unsupported assertion about all almost maps.

A commutative ring; ideal I; regular `f∈I`; source no-almost-zero conditions.

Identify H/H[f] with fH. Prove `fH(C)=fH(D)` using the absence of I-annihilated elements in H(C)/f. (BMS1 (arXiv v3), Lemma 8.11; printed p.64). *Needs:* *Cohomology of ideal décalage* (§AI.1.2).

**Checks.**

- The almost map `m→O_C` fails the source quotient condition and does not become an integral equivalence after `Lη_(ζ_p−1)`.

**The A_inf almost comparison criterion** (`AInf.ainf_almost_criterion`). For `g:C→D` between derived p-complete `A_inf` complexes, `Lη_μ g` is an equivalence if (i) `g` mod `p` is almost an equivalence over `O_C^♭`, (ii) `H^i(Lη_μ g)` is injective for every `i`, and (iii) `intersection_{a∈W(m^♭), a divides μ}(μ/a)H^i(C)=μ H^i(C)` for every `i`. `W(m^♭)` is not treated as an idempotent ideal in `A_inf`.

All three displayed conditions; derived p-completeness of C,D.

Lift finite Witt almost multipliers and pass through derived p-completion. Use the intersection condition to show that every cokernel class lifts from `μ`-torsion. (BMS1 (arXiv v3), Lemma 9.12, printed pp.75–76). *Needs:* *Cohomology of ideal décalage* (§AI.1.2); *The Witt almost ideal* (§AI.0.3).

**Almost purity comparison for integral toric cochains** (`AInf.toric_almost_purity_comparison`). Continuous `Γ` cochains on the toric perfectoid cover map to pro-finite-étale and pro-étale cohomology. Almost purity gives the finite-level almost comparisons; the toric injectivity and no-almost-zero/intersection estimates upgrade them under `Lη` to honest integral equivalences.

Smooth framed affine; derived p-complete `A_inf` coefficients; exact source conditions in the almost criteria.

Use Faltings/Scholze almost purity to identify the almost cone. Verify each independent hypothesis of Lemma 8.11 or 9.12 in the toric model. (BMS1 (arXiv v3), §§8.2–8.3; Theorem 9.4(ii–iii), Lemma 9.13; printed pp.61–76). *Needs:* PerfectoidSpaces, P3 (*The almost purity theorem for perfectoid Tate rings (ECD Theorem 6.1)*); *Integral toric cohomology computation* (§AI.3.2); *Finite Witt toric cohomology* (§AI.3.2); *Almost-to-honest décalage criterion* (§AI.3.2); *The A_inf almost comparison criterion* (§AI.3.2).

### AI.3.3 The q-de Rham model, descent and Frobenius

**Framed q-de Rham model** (`AOmega.qModel`). For a framed torus algebra over `A_inf`, `q=[ε]`, the normalized complex is `η_(q−1)K(A_inf<T_i±1>;γ_i−1)`, where `γ_i(T_i)=qT_i`. In one variable `d(T^n)=[n]_q T^n dlog_q T` and `dlog_q T*f(T)=f(qT)*dlog_q T`. The model depends on the framing; it is not a commutative dga.

For a unit `q`, use `[n]_q=−q^n[−n]_q` at negative exponents. The classical specialization gives `[n]_1=n` for every integer `n`.

Chosen framing and compatible roots; the smooth lift and completion are the source ones.

The API:

- `AOmega.qModel_monomial`: `d(T^n)=[n]_q T^n dlog_q T`, also for negative `n` with the Laurent q-integer.
- `AOmega.qModel_product`: `dlog_q T*f(T)=f(qT)*dlog_q T`.
- `AOmega.qModel_tensor`: Several coordinates use the signed tensor product of one-variable models.
- `AOmega.qModel_comparison`: The framed model computes the sheaf `AΩ` on the small affine.
- `AOmega.qModel_q_one`: At `q=1` the formula specializes to the ordinary de Rham differential after eligible derived coefficient change.

Split integral and nonintegral toric weights after `η`. Compute the divided `γ` differential on monomials. Check the twisted multiplication rather than assuming strict commutativity. (BMS1 (arXiv v3), Example 7.7, Remark 7.8; §9 toric description; printed p.58). *Needs:* *Almost purity comparison for integral toric cochains* (§AI.3.2); *Koszul products and integral cohomology* (§AI.1.7); *Cyclotomic period elements* (§AI.0.1); *Koszul complex of commuting endomorphisms* (§AI.1.7).

**Checks.**

- `AOmega.qModel_test_T`: `d(T)=T dlog_q T`.
- `AOmega.qModel_test_T2`: `d(T²)=(1+q)T² dlog_q T`.
- `AOmega.qModel_test_noncommutative`: For `q≠1`, `dlog_q T*T=qT*dlog_q T`, so a strictly commutative product is wrong.

**Framing independence and sheaf descent** (`AInf.framing_independence_and_descent`). The toric, profinite-étale and pro-étale `AΩ` complexes on a small smooth affine map equivalently to `RΓ(𝔛,AΩ)`. Their canonical comparisons imply independence of framing, étale restriction and descent for general smooth formal schemes.

Small affine comparisons first; descent and limit conditions from the shared enhancement.

Prove étale base change at finite Witt level. Use Scholze Lemma 3.18 with explicit acyclic-basis and Mittag-Leffler hypotheses for the sheaf limits. Pass to p-complete `A_inf` and glue via the common sheaf object. (BMS1 (arXiv v3), Lemma 9.9, printed p.74; Lemmas 9.13–9.15, pp.76–78; Theorem 9.4(iii), pp.70–71). *Needs:* *The AΩ complex* (§AI.3.2); *Almost purity comparison for integral toric cochains* (§AI.3.2); EnhancedDerivedSheaves, E2 (*Unbounded hypercover descent*); EnhancedDerivedSheaves, E2 (*Derived limit of an epimorphic system*); *Étale base change of Witt vectors* (§AI.0.3).

**AΩ Frobenius and completeness** (`AInf.aomega_frobenius`). Frobenius gives `φ^*AΩ≃Lη_ξ̃ AΩ` and thus a map `φ^*AΩ→AΩ` that becomes an equivalence after `ξ̃` inversion. `AΩ` is derived `(p,ξ)`-complete; its coherent multiplication is obtained in the enhancement.

Smooth formal `O_C-scheme`; local boundedness and regular coefficients.

Check `φ(μ)=μ*ξ̃` in the toric calculation. Use composition of `η` and local descent to get the factorization. Use finite reductions and derived completeness detection. (BMS1 (arXiv v3), §9, printed pp.69–79; Theorem 1.10, pp.7–8; Theorem 14.3, pp.119–120). *Needs:* *Framed q-de Rham model* (§AI.3.3); *Composition of décalage* (§AI.1.2); *Preservation of derived completeness* (§AI.1.5); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*).

**The operation Sq^0 on E∞-𝔽_2-algebras**. The cohomology of an `E∞-algebra E` over `𝔽_2` carries a natural operation `Sq^0` : `H^*(E) → H^*(E)`, Frobenius-semilinear over `E∞-A`-algebras for A an `𝔽_2`-algebra, equal to the identity on `H^*(X, 𝔽_2) = H^*(C^*(X, 𝔽_2))` for every space `X`, and zero on `H^i(D)` for `i >` 0 when `E` is a commutative differential graded `𝔽_2-algebra D`.

`E` an `E∞`-algebra in the derived `∞`-category of `𝔽_2`-modules (EnhancedDerivedSheaves, E5).

The API:

- `AInf.sqZero`: The natural degree-preserving extended-power operation on cohomology.
- `AInf.sqZero_natural`: `E∞-maps` commute with the operation.
- `AInf.sqZero_scalars`: For an `E∞-A`-algebra, `Sq^0(a x)=a² Sq^0(x)`.
- `AInf.sqZero_cochains`: The operation on cochains of a space is the identity.
- `AInf.sqZero_strict`: For a strictly commutative differential graded algebra it vanishes in positive degrees.

Define `Sq^0` through the extended power construction of `E∞`-algebras and check the three properties on the universal examples. (BMS1 (arXiv v3), Remark 7.8, printed pp.58–59). *Needs:* EnhancedDerivedSheaves, E5:abstract (*Operadic algebras*).

**Checks.**

- On `C^*(S¹,𝔽_2)`, `Sq^0` fixes the nonzero class in `H¹`; defining it to vanish in every positive degree fails this.
- On the strictly commutative exterior algebra `𝔽_2[e]/(e²)`, `|e|=1` with zero differential, `Sq^0(e)=0`; defining it to be the identity on every `E∞`-algebra fails this.
- On `A=𝔽_2[t]` concentrated in degree zero, `Sq^0(t)=t²`; this distinguishes Frobenius semilinearity from A-linearity.

**Failure of a strictly commutative q-model** (`AInf.enhanced_noncommutative_regression`). The `E_infinity` q-de Rham algebra in characteristic two cannot in general be represented by a commutative dga: in the source example `Sq^0` on the degree-one q-log class is nonzero. The twisted cochain product is retained; `E_infinity` enhancement is the multiplicative target.

`A=F_2[q±1]`, `R=A[T±1]`, q-variable as in Remark 7.8.

Use the `E∞-structures` of EnhancedDerivedSheaves, E5 and *The operation Sq^0 on E∞-𝔽_2-algebras* (§AI.3.3). Use the map to group cochains and the Frobenius-semilinearity of `Sq^0` to detect the nonzero image. (BMS1 (arXiv v3), Remark 7.8, printed pp.58–59, with `E1=Lη_(q−1)E2`). *Needs:* *Framed q-de Rham model* (§AI.3.3); *Lax symmetric monoidal structure* (§AI.1.3); EnhancedDerivedSheaves, E5; *The operation Sq^0 on E∞-𝔽_2-algebras* (§AI.3.3); EnhancedDerivedSheaves, E5:abstract (*Operadic algebras*).

### Examples

For `𝔛 = Spf O_C`, `AΩ_𝔛 = A_inf` in degree `0`; for the torus `O_C⟨T^{±1}⟩` the local model is the
`q`-de Rham complex with `d(T^n) = [n]_q T^n dlog_q T` (see *Worked examples*).

### Dependencies

Earlier layers: AI.0, AI.1. Other roadmaps: AdicEtaleGeometry A1, AdicSpacesPartIII R2, EnhancedDerivedSheaves E1, EnhancedDerivedSheaves E2, EnhancedDerivedSheaves E4, EnhancedDerivedSheaves E5, EnhancedDerivedSheaves E5:abstract, PerfectoidSpaces P3, PerfectoidSpaces P6, PerfectoidSpaces P7.16. Mathlib: `PreTilt`, `WittVector`.

## Layer AI.4: Local specializations of `AΩ`

Every specialization in this layer is a map out of the one object `AΩ_𝔛`: modulo `ξ̃`
(Hodge–Tate), modulo `ξ` (de Rham), along `θ_r` (de Rham–Witt), to `A_cris` (crystalline) and
after inverting `μ` (étale). The Hodge–Tate specialization uses the shifted coefficient map
`θ̃`.

### AI.4.1 The Hodge–Tate specialization

**Framed Hodge–Tate reduction** (`AInf.hodge_tate_local`). For a smooth p-adic formal
`O_C`-scheme, construct the multiplicative coefficient comparison
`AΩ ⊗^L_(A_inf,θ̃) O_C≃Ω̃:=Lη_(ζ_p−1) Rν_* Ô_X⁺`. On a small formally smooth algebra `R`
with a framing by `d` torus coordinates, compute `H⁰(Ω̃_R)=R`, the framed free module
`H¹(Ω̃_R)≅R^d`, and the cup-product isomorphisms `Λ^i_R H¹(Ω̃_R)≅H^i(Ω̃_R)`.
Prove formally étale base change and descent for this calculation. The identification with
continuous differential forms is the subsequent *Hodge–Tate specialization* target.

Standing hypotheses (C); the local computation has a chosen framing and uses `θ̃` scalar extension.

Reduce the q-Koszul model along `θ̃` and apply the almost-to-honest criterion to the toric
comparison. Read the framed generators and their exterior products from that complex, and
prove formally étale base change before descent.
(BMS1 (arXiv v3), Corollary 8.13, pp.64–65, and Theorem 9.2(i), pp.69–70.)
*Needs:* *The AΩ complex* (§AI.3.2); *Integral toric cohomology computation* (§AI.3.2); *Almost-to-honest décalage criterion* (§AI.3.2); *Framed q-de Rham model* (§AI.3.3); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1).

**Checks.**

- At `R=O_C`, `Ω̃_R=O_C[0]` and all positive exterior powers vanish.
- For `R=O_C⟨T^{±1}⟩`, the framed cohomology has one free generator in degree one and no degree two.
- For two torus coordinates, the ordered cup product generates `H²`; the square of each degree-one generator is zero also at `p=2`.

**Factorization criterion through connective décalage** (`AInf.eta_factorization_criterion`). If `C∈D≤1(A)`, `D∈D≥0(A)`, `H^0(D)` is f-torsion-free and `f` is regular, a map `C→D` factors through `Lη_f D` in at most one way. It factors exactly when `H^1(C ⊗^L A/f)→H^1(D ⊗^L A/f)` is zero, equivalently `H^1(C)→H^1(D)` factors through `fH^1(D)`.

The stated t-structure bounds and `H^0` regularity are essential.

Compute the distinguished triangle `Lη_f D→D→H^1(D/f)[−1]` after truncating `D`. Apply Hom(C,−); the preceding Hom vanishes by the t-structure bounds. (BMS1 (arXiv v3), Lemma 8.16, printed pp.66–68). *Needs:* *Connective comparison and localization* (§AI.1.2); *Cohomology of ideal décalage* (§AI.1.2); Mathlib `DerivedCategory`.

**Checks.**

- For `C=D=A[0]`, every scalar map factors through `Lη_f A=A`.
- For `A=ℤ`, `f=2`, `C=D=ℤ[−1]`, multiplication by two factors uniquely through the degree-one submodule `2ℤ`.
- With those same complexes the identity does not factor: its map on `H¹` modulo two is nonzero.

**Cotangent description of the first Hodge–Tate truncation** (`AInf.hodge_tate_cotangent`). For small smooth `R`, the canonical transitivity map induces `L̂_(R/ℤ_p)[−1]{−1}≃τ≤1 Ω̃_R`. In degree zero it is `R` and in degree one `Ω^1_(R/O_C),cont{−1}`.

Small formally smooth `R`; p-completed cotangent complex; source cohomological shifts.

Construct the transitivity map on the perfectoid cover. Use the framed computation and formally étale base change to reduce its degree-one map to the one-dimensional torus. Fontaine dlog identifies its image in continuous cohomology with `(ζ_p−1)H¹`; apply the factorization criterion to obtain the map through `Lη_(ζ_p−1)` and the first-truncation equivalence. (BMS1 (arXiv v3), Remark 8.4, printed pp.61–62; Proposition 8.15, pp.66–67). *Needs:* *Framed Hodge–Tate reduction* (§AI.4.1); *Factorization criterion through connective décalage* (§AI.4.1); *Fontaine dlog theorem* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); DerivedModuleAlgebra, §0.8 (*The cotangent transitivity triangle*).

**Checks.**

- At `R=O_C`, the shifted twisted completed cotangent complex is `O_C[0]`.
- At `R=O_C⟨T^{±1}⟩`, the transitivity map takes `dlog T{−1}` to the normalized torus class: before décalage its image is `(ζ_p−1)` times the continuous-cohomology generator.
- At `R=O_C⟨T₁^{±1},T₂^{±1}⟩`, the first truncation has `H⁰=R` and `H¹=R²{−1}`, with no degree-two cohomology.

**Hodge–Tate specialization** (`AInf.hodge_tate`). For a smooth p-adic formal `O_C`-scheme,
the coefficient comparison `AΩ ⊗^L_(A_inf,θ̃) O_C≃Ω̃` has the canonical multiplicative
cohomology identification `H^i(Ω̃)≅Ω^i_(𝔛/O_C),cont{−i}`. In degree one this is induced by
the cotangent transitivity map; in every degree it is its exterior power followed by cup product.

Standing hypotheses (C); continuous differentials and the intrinsic twists are retained.

Use the cotangent equivalence to identify degree one canonically. The framed exterior-power
calculation proves that its multiplicative extensions are isomorphisms. Naturality of the
cotangent map and cup product identifies them on overlaps, giving the sheaf statement.
(BMS1 (arXiv v3), Theorems 8.3 and 8.7, pp.61–62; Corollary 8.13 and Proposition 8.15,
pp.64–68; Theorem 9.2(i), pp.69–70.)
*Needs:* *Framed Hodge–Tate reduction* (§AI.4.1); *Cotangent description of the first Hodge–Tate truncation* (§AI.4.1).

**Checks.**

- On the one-dimensional torus, `dlog T{−1}` maps to the cotangent-normalized degree-one class.
- Replacing `T` by `T⁻¹` negates both `dlog T` and its cohomology class, so the identification agrees across these framings.
- On the two-dimensional torus at `p=2`, the individual squares vanish and `dlog T₁∧dlog T₂{−2}` maps to the ordered degree-two cup product; the sign rule alone does not supply the square-zero assertion.

**Hodge–Tate extension and lifting obstruction** (`AInf.hodge_tate_lifting_obstruction`). Under the cotangent identification, the extension class of `τ≤1 Ω̃_R` is the obstruction to lifting `R` to `A_inf/(ξ̃²)`, with the source twist and normalization. A chosen lift gives the corresponding splitting; existence of a canonical splitting is not asserted for every `R`.

Smooth p-adic formal `O_C-scheme`, with the local statement on a small smooth `R`; the square-zero `θ̃` thickening; obstruction in `Ext²` of continuous differentials with the conormal line.

Use cotangent transitivity for `A_inf/(ξ̃²)→O_C`. Identify the connecting morphism with the square-zero lifting obstruction and compare the conormal line. (BMS1 (arXiv v3), Remark 8.4, printed pp.61–62; Proposition 8.15, pp.66–67). *Needs:* *Cotangent description of the first Hodge–Tate truncation* (§AI.4.1); DerivedModuleAlgebra, §0.4 (*The full cotangent complex*); DerivedModuleAlgebra, §0.6 (*The cotangent universal property*).

**Local Künneth and multiplicativity** (`AInf.local_kunneth`). For two small smooth `O_C-algebras R_1,R_2` and their completed tensor product `R`, the completed tensor maps for `Ω̃` and `AΩ` are equivalences; finite Witt reductions satisfy the compatible source tensor comparison. These are maps of coherent multiplicative objects.

Smoothness, completed products and eligible bounded/perfect coefficient extensions as in Proposition 8.14 and Lemmas 9.16,9.18.

Use a product framing and the continuous Koszul tensor calculation. Apply valuation monoidality and same-ideal completion where justified. Prove finite-level tensor exchange with the source Tor conditions. (BMS1 (arXiv v3), Proposition 8.14, printed pp.65–66; Lemmas 9.16 and 9.18, pp.78–79). *Needs:* *Hodge–Tate specialization* (§AI.4.1); *Framing independence and sheaf descent* (§AI.3.3); *Monoidality over a valuation ring* (§AI.1.3); DerivedDeRhamCohomology, §1.17 (*Completed filtered tensor products*).

### AI.4.2 Witt specializations and de Rham–Witt complexes

**Finite Witt specialization of AΩ** (`AInf.finite_witt_specialization`). For `r≥1`, `AΩ ⊗^L_(A_inf,θ̃_r) W_r(O_C)≃W̃_r-Ω:=L_η_([ζ_(p^r)]−1) Rν_* W_r(Ô_X⁺)`, compatibly on framed affines and after sheaf descent. The subsequent cohomology identification with relative de Rham–Witt is the separate *Relative de Rham–Witt comparison* (§AI.4.2); it is not used to prove this early finite reduction.

Smooth formal scheme; `r≥1`; derived scalar extension and continuous relative de Rham–Witt.

Prove the finite coefficient reduction comparison on framed affines by the special nonflat `η/base-change` criterion and explicit toric injectivity estimates. Descend the compatible canonical finite Witt maps via the common sheaf construction. (BMS1 (arXiv v3), Theorem 9.2(ii); Theorem 9.4(i–iii); printed pp.69–86). *Needs:* *Finite Witt coefficient maps* (§AI.0.2); *Finite Witt toric cohomology* (§AI.3.2); *Framing independence and sheaf descent* (§AI.3.3); *Base-change criterion for décalage* (§AI.1.6).

**Witt Bockstein precomplex** (`AOmega.wittPre`). For a commutative algebra object `D` over `A_inf(S)`, with `D` and `D/ξ` connective and a Frobenius automorphism, set `W_r^n(D)_pre=H^n(D ⊗^L A_inf/(ξ̃_r))`. The differential is the Bockstein, and F,V,R have the source coefficient-twisted definitions. This precomplex may contain nonintegral-weight torsion.

`D` is a commutative algebra object in `D(A_inf(S))` with `φ-semilinear` automorphism and `H^i(D)=H^i(D ⊗^L A_inf/(ξ))=0` for `i<0`; equivalently `D` and `D/ξ` are connective. Integral perfectoid `S` with the source chosen `ξ` normalized so `θ_r(ξ)=V(1)` for every `r≥1`. The initial precomplex is graded-anticommutative; odd squares need not vanish until the improvement hypotheses are imposed.

The API:

- `AOmega.wittPre_term`: `W_r^n(D)_pre=H^n(D/ξ̃_r)`.
- `AOmega.wittPre_d`: The differential is the coefficient Bockstein.
- `AOmega.wittPre_FVR`: `RF=FR`, `RV=VR`, `FV=p`, `FdV=d`; VF uses V(1), not automatically p.
- `AOmega.wittPre_lambda`: A family `λ_r:W_r(B)→W_r^0(D)_pre` preserving the unit, multiplication and coefficient maps, compatible with F,V,R and satisfying F(d `λ_(r+1)([b]))=λ_r([b])^(p−1) d λ_r([b]`) for every `r≥1`, induces a unique compatible family of relative de Rham–Witt maps. Require odd squares to vanish when using the relative F-V-procomplex universal property; this is a genuine extra condition for the unimproved precomplex.

Define finite coefficient cohomology and its Bockstein. Transport F,V,R through the finite Witt coefficient maps and Frobenius on `D`. (BMS1 (arXiv v3), Definition 10.5, printed p.81; Proposition 11.2 and §11.1.1, printed p.86). *Needs:* *Finite Witt kernel generators* (§AI.0.2); *Bockstein complex* (§AI.1.4); CrystallineCohomology, CR.4 (*Relative Frobenius–Verschiebung procomplexes*); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); *Finite Witt coefficient maps* (§AI.0.2).

**Checks.**

- `AOmega.wittPre_test_point`: For `D=A_inf` with Witt Frobenius, it is `W_r(S)` in degree zero.
- For `S=O_C` and `D=A_inf/p` with the induced Frobenius, `ξ̃_r` is regular modulo `p`, so the precomplex is `W_r(O_C)/p` in degree zero and zero elsewhere.
- For `S=O_C` and the square-zero algebra `D=A_inf⊕A_inf[−1]`, give both summands coefficientwise Witt Frobenius, `φ(a,b)=(φ(a),φ(b))`. The precomplex has `W_r(O_C)` in degrees zero and one, with zero Bockstein and square-zero degree-one product.

Perform these computations on the derived algebra and Bockstein carriers when constructing the precomplex.

**Improved Witt Bockstein complex** (`AOmega.wittImproved`). Set `W_r^n(D)=H^n((Lη_μ D) ⊗^L A_inf/(ξ̃_r))`. Under Assumption 11.4 (p-torsion-free `W_r^n(D)` for every `r≥1,n≥0`; at `p=2` this forces the odd squares to vanish), this is a relative F-V-procomplex with d,F,R,V and multiplication. The injection into the precomplex has the source scaled image; `R` is constructed using `η_(φ(μ))` and inverse Frobenius.

`D` and `D/ξ` are connective; `D` is an enhanced commutative algebra over `A_inf(S)` with `φ-semilinear` automorphism and `H^0(D) μ`-torsion-free. `S` p-torsion-free integral perfectoid with the chosen compatible primitive roots. Assumption 11.4: `W_r^n(D)` is p-torsion-free for every `r≥1,n≥0`; for `p=2` this also forces odd squares to vanish.

The API:

- `AOmega.wittImproved_term`: `W_r^n(D)=H^n((Lη_μ D)/ξ̃_r)`.
- `AOmega.wittImproved_inclusion`: The map to `W_r^n(D)_pre` is injective under Assumption 11.4.
- `AOmega.wittImproved_FVR`: The induced F,V,R obey the F-V-procomplex identities.
- `AOmega.wittImproved_restriction`: `R` is induced by multiplication by `ξ̃^n`, `η_(φ(μ))` and inverse Frobenius.
- `AOmega.wittImproved_universal_map`: Under Assumption 11.4, a unit-preserving multiplicative family `λ_r:W_r(B)→W_r^0(D)`, compatible with F,V,R and the Teichmüller differential identity, extends uniquely to relative de Rham–Witt maps in every degree. The improved p-torsion-free hypotheses imply the odd-square condition, including at `p=2`. Uniqueness and all compatibilities with `F`, `V`, `R` and `λ` are part of the statement.

Apply `η` before the finite quotient and define the Bockstein. Prove injection into the precomplex with the bounded comparison maps. Construct `R` on regular representatives, correcting the source `η_(φ(μ))` target. (BMS1 (arXiv v3), Assumption 11.4; Proposition 11.5; Remark 11.6; printed pp.89–90). *Needs:* *Witt Bockstein precomplex* (§AI.4.2); *Composition of décalage* (§AI.1.2); *Truncation bounds for décalage* (§AI.1.2).

**Checks.**

- `AOmega.wittImproved_test_point`: For `D=A_inf` the improved and precomplex agree in degree zero.
- `AOmega.wittImproved_test_weight`: Toric nonintegral weights removed by `η` cannot be reintroduced by using the precomplex.
- `AOmega.wittImproved_test_level_one`: At `r=1` the source differential is the Bockstein, not a zero differential on the graded modules.

**Torus realization of the improved Witt complex** (`AInf.torus_witt_realization`). For `D=RΓ(Z^d,A_inf[U_i±1/p^infinity])`, the improved `W_r^n(D)` is p-torsion-free and canonically `W_r Ω^n_(O_C[T_i±1]/O_C)`, compatible with d,F,R,V and multiplication. The degree-zero `λ` has domain `W_r(O_C[T_i±1])` and sends `[T_i]` to `U_i^(p^r)` in the source coordinate normalization.

Uncompleted torus calculation first; no replacement of `W_r(O[T])` by `W_r(O)[T]`.

Compute `η` on every weight by Lemma 7.9. Use Lemmas 11.9 and 11.14 for the finite Witt weight decomposition. Construct corrected `λ` and reduce to the perfect residue field with the corrected Tor-independence statement. (BMS1 (arXiv v3), Proposition 11.8; Lemmas 11.9,11.11,11.14,11.16; Corollary 11.12; Theorem 11.13; printed pp.91–93). *Needs:* *Improved Witt Bockstein complex* (§AI.4.2); *Framed q-de Rham model* (§AI.3.3); *Finite Witt polynomial decomposition* (§AI.0.3); CrystallineCohomology, CR.4 (*Laurent Witt weights and the integral quasi-isomorphism*).

**Relative de Rham–Witt comparison** (`AInf.relative_witt_comparison`). The universal F-V-procomplex maps give `H^i(W̃_r-Ω_R)≅W_r Ω^i_(R/O_C),cont{−i}` for `i≥0`. For `r≥1,s≥0`, Proposition 11.17 instead uses the restriction map `W_(r+s)(O_C)→W_r(O_C)`: `H^i(Lη_([ζ_(p^(r+s))]−1) RΓ_proét(X,W_r(Ô⁺)))` identifies, through the source `φ^s` scalar twist, with `H^i(W̃_(r+s)-Ω_R ⊗^L_(W_(r+s)(O_C)) W_r(O_C))`, and hence with `(W_(r+s) Ω^i_(R/O_C),cont / V^r W_s Ω^i_(R/O_C),cont){−i}`. This is a finite-Witt restriction comparison of cohomology groups, not reduction modulo `p^s` of `W_r(O_C)`. The relative Witt objects and their Cartier theory are those of CrystallineCohomology, CR.4.

Small smooth p-complete `R`; `r≥1`; source finite-level Tor-independence and ordinary p-completion of the continuous relative Witt terms.

Extend the torus comparison by étale base change. Use the source completed coefficient exchange and Bockstein compatibility. Descend as sheaves, retaining all twists. For the variant, apply Lemma 9.18 with `E=W_r(O_C)` as a `W_(r+s)(O_C)`-module via restriction and use Lemma 3.13. The exact coefficient triangle and injectivity of `V^r`, from p-torsion-freeness and `F^r V^r=p^r`, give the stated quotient; retain the `φ^s` identification and the Breuil–Kisin twist. (BMS1 (arXiv v3), Theorem 11.1; §11.3; Proposition 11.17; printed pp.86–95). *Needs:* *Torus realization of the improved Witt complex* (§AI.4.2); *Étale base change of Witt vectors* (§AI.0.3); CrystallineCohomology, CR.4 (*Relative Witt forms over perfectoid bases*); CrystallineCohomology, CR.4 (*Continuous relative de Rham–Witt complex*); *Finite Witt specialization of AΩ* (§AI.4.2).

**Unshifted finite de Rham–Witt specialization** (`AInf.finite_witt_de_rham`). For a smooth p-adic formal `O_C`-scheme `𝔛` and `r≥1`, there is a natural multiplicative equivalence of complexes of sheaves
`AΩ_𝔛 ⊗^L_(A_inf,θ_r) W_r(O_C) ≃ W_rΩ^•_(𝔛/O_C),cont`, with the relative de Rham–Witt differential on the right. It commutes with restriction to opens and with the finite-Witt operators transported from the Bockstein construction: `R` is a map of differential graded algebras, while `F` and `V` have their graded scalar-twisted types and satisfy the F-V-procomplex identities, including `FV=p` and `FdV=d`.

Standing hypotheses (C); smoothness and `r≥1`; the continuous relative Witt terms use ordinary p-completion. The coefficient map is `θ_r`, rather than `θ̃_r`.

Iterate the Frobenius/décalage identification to obtain `φ^{r*}AΩ≃Lη_ξ̃_r AΩ`, using `φ^r(μ)=μξ̃_r`. Since `θ_r=θ̃_r∘φ^r`, the left side specializes to `(Lη_ξ̃_r AΩ)⊗^L_(A_inf,θ̃_r)W_r(O_C)`. Bockstein reduction identifies this with the complex having terms `H^i(AΩ/ξ̃_r)⊗(ξ̃_r)^⊗i` and its Bockstein differential. The relative Witt comparison cancels the degreewise Breuil–Kisin twists against these ideal powers and identifies the differential with `d` on continuous relative Witt forms. Its multiplicative and F-V-procomplex compatibilities give the claimed maps; `F` and `V` are not asserted to be unscaled chain maps. (BMS1 (arXiv v3), proof of Theorem 14.1, pp.118–119; Proposition 6.12 and Lemma 6.13, pp.52–53; Theorem 11.1 and §11.3, pp.86–95.) *Needs:* *AΩ Frobenius and completeness* (§AI.3.3); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Relative de Rham–Witt comparison* (§AI.4.2); CrystallineCohomology, CR.4 (*Continuous relative de Rham–Witt complex*).

**Checks.**

- At `r=1`, `θ₁=θ` and `W₁Ω^•=Ω^•`, so this is the de Rham specialization with its ordinary differential.
- At `𝔛=Spf O_C`, it is `W_r(O_C)` in degree zero, with zero positive-degree terms.
- On `O_C⟨T^{±1}⟩`, the degree-zero Teichmüller class has differential `d[T]`; `F(d[T])=[T]^(p−1)d[T]` and `FdV=d`, including at `p=2`. Replacing the differential by zero fails this check.
- Restriction `W_(r+1)→W_r` carries the product of two classes to the product of their restrictions and commutes with `d`.

### AI.4.3 De Rham and crystalline specializations

**De Rham specialization** (`AInf.de_rham`). `AΩ ⊗^L_(A_inf,θ) O_C≃Ω^bullet_(𝔛/O_C),cont` as multiplicative complexes. The ordinary de Rham differential is recovered by the appropriate Bockstein after the `Frobenius/η_(ξ̃)` identification; this `θ` statement is different from the `θ̃` Hodge–Tate graded cohomology description.

Smooth p-adic formal scheme; derived `θ` extension; source Frobenius normalization.

Use `φ^*AΩ≃Lη_ξ̃ AΩ` and reduce the latter along `θ̃`. Identify the Bockstein on the degree-one cotangent generator with the ordinary derivation. (BMS1 (arXiv v3), Theorem 1.10, printed pp.7–8; Theorem 12.1 and discussion, pp.96–98). *Needs:* *Hodge–Tate specialization* (§AI.4.1); *AΩ Frobenius and completeness* (§AI.3.3); *Reduction to the Bockstein complex* (§AI.1.4); *Unshifted finite de Rham–Witt specialization* (§AI.4.2).

**Checks.**

- At `Spf O_C`, the specialization is `O_C[0]`.
- On `O_C⟨T^{±1}⟩`, the differential sends `T` to `T dlog T`; the `r=1` finite-Witt comparison gives this same map.
- On the two-dimensional formal torus, the product of the coordinate one-forms is their ordered wedge, and each individual square vanishes, including at `p=2`.

**Bounded divided-power coefficient subrings** (`AInf.bounded_pd_coefficients`). Define `A_crys^(m)` as the p-adic completion of the `A_inf-subalgebra` of `A_crys` generated by `ξ^j/j!` for 0 `≤ j ≤ m`; `A_crys` is the p-completion of `colim_m A_crys^(m)`. For `m ≥ p²`, `ξ̃_r = p^r` times a unit of `A_crys^(m)`, and Lemma 12.2 holds in `A_crys^(m)`. For every `m`, the systems of ideals ({a | `μa ∈ p^s A_crys^(m)})_s` and `(p^s A_crys^(m))_s` are intertwined, and `⋂_r (μ/φ^{−r}(μ)) A_crys^(m) = μ A_crys^(m)`. In particular the bounded quotient by `μ` is p-adically separated; the unbounded `A_crys/μ` is not assumed separated. These absolute rings are the coefficient rings of *Finite-level crystalline period rings A_cris^(m)* (§AI.6.4), which adds their relative versions.

Cyclotomic `A_inf` over `O_C`, completed integral PD coefficients; `m≥p²` and `r≥1`.

The API:

- `AInf.boundedPD`: The specified p-completed subalgebra of `A_crys` generated by `ξ^j/j!` for `j≤m`.
- `AInf.boundedPD_transition`: For `m≤m′` the inclusion is compatible with `A_inf` and the divided powers already present.
- `AInf.boundedPD_colimit`: The p-completed filtered colimit is `A_crys`.

Establish Lemma 12.2 in the bounded subring and the unit formula for `ξ̃_r`. Descend the topology estimate to the noetherian bounded PD algebra over `A_0=ℤ_p[[T]]`, with `T` mapping to `[ε]^(1/p)−1`, using *Flat cyclotomic power-series specialization* (§AI.0.2); use Artin–Rees and topological freeness over `A_0`. Reduce the intersection statement modulo `(μ,p^s)`, then to the tilt valuation calculation, before taking the separated inverse limit. (BMS1 (arXiv v3), Lemma 12.8(i–iii), printed pp.100–101; Lemma 12.2, pp.96–97). *Needs:* *Flat cyclotomic power-series specialization* (§AI.0.2); DerivedDeRhamCohomology, §PD.7 (*The crystalline period ring A_cris of a p-adically complete ring*); *Regularity of integral periods* (§AI.0.2).

**Checks.**

- For `m=0` the subalgebra is `A_inf`; its p-completion is `A_inf`.
- For `0≤m<p` every j! is a p-adic unit, so `A_crys^(m)=A_inf`. The first new divided-power generator occurs at `m=p`.
- For `m≥p²` and `r=1`, `ξ̃` is `p` times a unit; this unit assertion is restricted to the stated range and is not used to invert `p` in `A_inf`.
- Sending the power-series variable to the unit `[ε]^(1/p)` cannot define this ring map: the unit `1−T` would map to a nonunit. The specialization uses `[ε]^(1/p)−1`.

**Toric décalage after crystalline coefficient change** (`AInf.pd_toric_eta_comparison`). For the toric complex, `η_μ` after completed extension to `A_crys^(m)` compares equivalently with the extended q-de Rham model for `m≥p²`. The bounded-coefficient annihilation and injectivity estimates justify this particular exchange; no unrestricted `η/base-change` commutation is used.

Small framed smooth `R`; bounded PD coefficients; source completion and regularity conditions.

Recompute every weight with the bounded PD estimates. Use the almost-comparison criterion and finite reduction injectivity. Use Lemma 12.8(iv) for each `m≥p²`, and (v) for the all-coordinate comparison map before p-completing the filtered colimit. (BMS1 (arXiv v3), Lemma 12.8(iv–v); Lemmas 12.4,12.6 and Corollaries 12.5,12.7; printed pp.97–100). *Needs:* *Bounded divided-power coefficient subrings* (§AI.4.3); *The A_inf almost comparison criterion* (§AI.3.2); *Framed q-de Rham model* (§AI.3.3).

**Crystalline logarithmic coordinate change** (`AInf.pd_logarithmic_coordinate`). In the eligible bounded PD extension, `log([ε])=log(1+μ)` is `μ` times a unit, so the q-Koszul operators compare with ordinary logarithmic de Rham operators. The coordinate is `log([ε])`, not `log(μ)`.

PD convergence and bounded-subring hypotheses of Corollary 12.7.

Expand `log(1+μ)` by its convergent PD series. Compare the `γ` action and ordinary logarithmic derivation using this unit. (BMS1 (arXiv v3), Lemma 12.2(iii), Lemma 12.8(i), and Corollary 12.7; printed pp.96–101). *Needs:* *Toric décalage after crystalline coefficient change* (§AI.4.3).

**Absolute A_crys comparison** (`AInf.absolute_crystalline_comparison`). There is a functorial multiplicative equivalence `AΩ completed-⊗^L A_crys≃Ru_* O_crys` for the absolute crystalline site of `𝔛_(O_C/p)` over `A_crys`. The all-coordinate PD-envelope construction and its cocycle comparisons make the framed maps presentation-independent.

Smooth formal `O_C-scheme`; absolute crystalline base `A_crys` and its PD ideal; derived p-completion.

Use the corrected PD envelope of `A_0→A_0/ξ_0` in Lemma 12.8. Identify the toric comparison map by Proposition 12.9. Add all coordinates and use the PD universal property to prove common refinements and descent. (BMS1 (arXiv v3), Theorem 12.1, printed pp.96–98; Lemma 12.8, pp.100–101; Proposition 12.9, pp.102–103). *Needs:* *Toric décalage after crystalline coefficient change* (§AI.4.3); *Crystalline logarithmic coordinate change* (§AI.4.3); CrystallineCohomology, CR.2 (*Crystalline cohomology from an embedding*); CrystallineCohomology, CR.2 (*Independence of the presentation and of the embedding*); CrystallineCohomology, CR.2 (*Enhanced crystalline direct image and global sections*).

**Derived crystalline special-fiber specialization** (`AInf.crystalline_witt_special_fiber`). Further derived extension of the absolute `A_crys` comparison along `A_crys→W(k)`, with its correct Frobenius scalar map, gives crystalline cohomology of `𝔛_k`. The identification uses CR.3 base change and relative/absolute Witt comparison; ordinary degreewise tensor is not substituted.

Smooth formal scheme; source Tor/derived completion conditions.

Apply the crystalline base-change theorem to the common PD map. Identify the special-fiber model and Frobenius through CR.4. (BMS1 (arXiv v3), Theorem 1.10, printed pp.7–8; §12, pp.96–103; Theorem 14.3, pp.119–120). *Needs:* *Absolute A_crys comparison* (§AI.4.3); CrystallineCohomology, CR.3 (*Derived crystalline base change*); CrystallineCohomology, CR.4 (*Finite and infinite crystalline de Rham–Witt comparison*); *Witt residue specialization* (§AI.0:integral.1).

**Agreement with the saturated de Rham–Witt route** (`AInf.blm_crystalline_route`). The BLM saturated-de-Rham–Witt crystalline comparison for the smooth special fiber agrees with the `AΩ` crystalline map, including Frobenius and cup products. Layer AI.1 supplies `Lη_p` completion and Bockstein; CR.4 supplies saturated complexes, Cartier/Nygaard theory and their crystalline equivalence.

Smooth characteristic-p special fiber; the multiplicative comparison maps, not just an abstract isomorphism of groups.

Compare the degree-zero universal Witt maps and Bockstein normalization. Prove the agreement of the maps of BLM §10.3 with the all-coordinate `AΩ` construction from CR.4. (BLM, Theorem 10.2.1, printed p.128; §§10.3–10.4 and Theorem 10.4.4, pp.129–138; the identification with the other canonical comparison is proved here, by comparing degree-zero maps, Bockstein differentials and Frobenius on the universal saturated de Rham–Witt complex). *Needs:* *Derived crystalline special-fiber specialization* (§AI.4.3); *Dé­calage interface for Dieudonné consumers* (§AI.1.7); CrystallineCohomology, CR.4 (*Strict Dieudonné complexes as décalage fixed points*); CrystallineCohomology, CR.4 (*Finite and infinite crystalline de Rham–Witt comparison*); CrystallineCohomology, CR.4 (*Universal saturated de Rham–Witt complex*); CrystallineCohomology, CR.4 (*Bockstein reduction of principal p-décalage*).

### AI.4.4 The étale specialization

**Mu-inverted étale specialization** (`AInf.mu_inverted_etale`). For a smooth formal scheme `𝔛` over `O_C`, with analytic generic fiber `X` and `ν:X_proét→𝔛_Zar`, `AΩ` tensor `A_inf[1/μ]≃(Rν_* A_inf,X)` tensor `A_inf[1/μ]`, compatibly with multiplication. This is the local pro-étale `A_inf-sheaf` comparison of Theorem 14.1(iv). The comparison with `RΓ_et(X,ℤ_p)` is the separate proper theorem in *Proper mu-inverted étale comparison* (§AI.5.1).

`C` perfectoid of characteristic zero with compatible primitive p-power roots; `𝔛` smooth over `O_C`. `A_inf,X` is the derived p-completed Witt sheaf.

Invert `μ` in the defining `L_η_μ` complex; `η` becomes the identity after its parameter is a unit. Use the natural comparison map to `Rν_* A_inf,X` and retain the source derived sheaf. No primitive proper comparison is used locally. (BMS1 (arXiv v3), Definition 9.1, printed p.69; Theorem 14.1(iv) and Remark 14.2, printed p.118). *Needs:* *The AΩ complex* (§AI.3.2); *Connective comparison and localization* (§AI.1.2); *Derived p-completed A_inf sheaf* (§AI.3.1); EnhancedDerivedSheaves, E4 (*Derived complete sheaves*).

### Examples

For `𝔛 = Spf O_C` every specialization is a coefficient map: `θ̃` and `θ` give `O_C`, the residue
map gives `W(k)`, and inverting `μ` gives `A_inf[1/μ]`, matching the étale cohomology `ℤ_p` of the
point.

### Dependencies

Earlier layers: AI.0, AI.0:integral, AI.1, AI.3. Other roadmaps: DerivedDeRhamCohomology §§PD.6–PD.7, CrystallineCohomology CR.2, CrystallineCohomology CR.3, CrystallineCohomology CR.4, DerivedModuleAlgebra §§0.4, 0.6, 0.8, DerivedModuleAlgebra §§1.1–1.9, DerivedDeRhamCohomology §§1.14–1.22, EnhancedDerivedSheaves E1, EnhancedDerivedSheaves E4. Mathlib: `DerivedCategory`.

## Layer AI.5: Proper `A_inf` cohomology and torsion control

For `𝔛` proper and smooth over `O_C`, this layer proves that `RΓ_{A_inf}(𝔛)` is perfect, that its
specializations are the derived base changes of the local ones, and that each `H^i_{A_inf}(𝔛)` is
a Breuil–Kisin–Fargues module. The torsion comparisons keep the adjacent-degree Tor terms.

### AI.5.1 Proper `A_inf` cohomology and its specializations

**Proper A_inf cohomology complex** (`AOmega.proper`). For smooth proper `𝔛/O_C` set `RΓ_Ainf(𝔛)=RΓ(𝔛,AΩ_𝔛)` in the common enhancement. It carries functorial cup products and linearized Frobenius, and its cohomology modules are denoted `H_Ainf^i`.

Smooth proper p-adic formal `O_C-scheme`; the common `AΩ` sheaf and derived global sections.

The API:

- `AOmega.proper_cohomology`: `H_Ainf^i=H^i(RΓ_Ainf)`.
- `AOmega.proper_pullback`: Formal morphisms induce pullback maps compatible with cup products.
- `AOmega.proper_cup`: The unit and cup products come from the enhanced `AΩ` algebra.
- `AOmega.proper_frobenius`: Linearized `φ` on `RΓ_Ainf` becomes an equivalence after `ξ̃` inversion.
- `AOmega.proper_base_change`: Eligible proper smooth coefficient change uses derived scalar extension with the specified completion.

Apply enhanced derived global sections to the canonical sheaf `AΩ`. Transport the coherent product and Frobenius factorization. (BMS1 (arXiv v3), §14, Theorem 1.8; printed p.5). *Needs:* *The AΩ complex* (§AI.3.2); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*).

**Checks.**

- `AOmega.proper_test_point`: `RΓ_Ainf(Spf O_C)=A_inf` in degree 0.
- `AOmega.proper_test_projective_line`: The expected degree 0 and degree 2 lines for formal `P^1` carry the unit and inverse degree twist.
- `AOmega.proper_test_torsion`: Perfectness of the complex does not assert that all `H_Ainf^i` are finite free.

**Perfectness of proper A_inf cohomology** (`AInf.proper_perfectness`). `RΓ_Ainf` is a perfect `A_inf` complex. It is derived `ξ`-complete and its `θ` reduction is the proper de Rham complex, which is perfect over `O_C`; the lifted bounded finite-projective criterion proves perfectness over `A_inf`.

Smooth proper formal `O_C-scheme`; derived completeness and finite-reduction criterion from EnhancedDerivedSheaves E4 and DerivedModuleAlgebra §§1.3–1.5.

Use the lower-tier coefficient-free proper smooth de Rham perfectness theorem DerivedDeRhamCohomology, §§5.1–5.5, 5.23 (*Proper smooth de Rham perfectness*). Its finite-level Hodge filtration and compatible perfect-complex lifting apply over `O_C` without a Noetherian hypothesis. Lift a bounded finite-projective complex through the regular `ξ`-adic tower. Use completeness to identify the lift. (BMS1 (arXiv v3), Theorem 14.3(i) and proof, printed pp.119–120). *Needs:* *Proper A_inf cohomology complex* (§AI.5.1); *AΩ Frobenius and completeness* (§AI.3.3); *De Rham specialization* (§AI.4.3); EnhancedDerivedSheaves, E4 (*Equivalences detected modulo the ideal*); DerivedModuleAlgebra, §1.3 (*The derived completion reflector*); DerivedDeRhamCohomology, §§5.1–5.5, 5.23 (*Proper smooth de Rham perfectness*).

**Proper de Rham specialization** (`AInf.global_de_rham`). `RΓ_Ainf ⊗^L_(A_inf,θ) O_C≃RΓ_dR(𝔛/O_C)`, with cup products and functoriality. Perfect coefficient exchange justifies globalizing the local comparison.

Proper smooth; derived scalar extension.

Use perfect tensor exchange with derived global sections and the local de Rham comparison. (BMS1 (arXiv v3), Theorem 14.3; printed p.119). *Needs:* *Perfectness of proper A_inf cohomology* (§AI.5.1); *De Rham specialization* (§AI.4.3); DerivedDeRhamCohomology, §1.22 (*Valid exchanges of completion and derived operations*).

**Proper A_crys specialization** (`AInf.global_acrys`). `RΓ_Ainf completed-⊗^L A_crys≃RΓ_crys(𝔛_(O_C/p)/A_crys)`, compatibly with Frobenius and products. Bounded divided-power Frobenius diagrams use `φ^r-twisted` coefficient subrings `A_crys^(m)`, as corrected in Theorem 14.1.

Proper smooth; derived p-completion; explicit Frobenius scalar twisting.

Globalize the all-coordinate local equivalence via proper perfect tensor exchange. Track `φ^r` on each bounded coefficient stage before the colimit. (BMS1 (arXiv v3), Theorems 14.1 and 14.3; printed pp.118–119). *Needs:* *Perfectness of proper A_inf cohomology* (§AI.5.1); *Absolute A_crys comparison* (§AI.4.3); CrystallineCohomology, CR.3 (*Derived crystalline base change*).

**Proper Witt special-fiber specialization** (`AInf.global_witt`). `RΓ_Ainf ⊗^L A_inf W(k)≃RΓ_crys(𝔛_k/W(k))`, using the fixed Witt residue map. It respects semilinear Frobenius and cup products; torsion remains in the derived object.

Proper smooth; perfect complex; `k` perfect.

Apply crystalline derived base change along the common `A_crys→W(k)` map. (BMS1 (arXiv v3), Theorem 14.3; printed p.119). *Needs:* *Proper A_crys specialization* (§AI.5.1); *Derived crystalline special-fiber specialization* (§AI.4.3); CrystallineCohomology, CR.3 (*Derived crystalline base change*).

**The primitive comparison over A_inf** (`AInf.primitive_integral_comparison`). For a proper smooth adic space `X` over `C`, the inclusion `A_inf → 𝔸_inf,X` induces an almost quasi-isomorphism `RΓ_ét(X, ℤ_p) ⊗^L_{ℤ_p} A_inf → RΓ(X_proét, 𝔸_inf,X)`, almost with respect to `W(𝔪^♭)`; in particular `H^i(X_proét, 𝔸_inf,X)` is almost finitely generated and almost isomorphic to `H^i_ét(X, ℤ_p) ⊗ A_inf`.

Standing hypotheses (C); `X` proper smooth over `C`.

Scholze's primitive comparison gives the almost isomorphism `H^i_ét(X, 𝔽_p) ⊗ O_C/p ≅ H^i(X_proét, O⁺_X/p)` with finite-dimensional source. Pass to `𝔸_inf,X/p = Ô⁺♭_X` and to `W_r` by induction on `r` using the exact sequences of Witt vectors and the almost vanishing on affinoid perfectoids (Scholze, Lemma 4.10 and Lemma 5.10; BMS1, Lemma 5.6). Take the derived limit over `r`; both sides are derived complete, so the almost isomorphisms at finite level give the statement. (BMS1 (arXiv v3), Lemma 5.6 and Theorem 5.7, printed p.47; Sch13, Lemma 4.10, Lemma 4.12 and Theorem 5.1, printed pp.26–28). *Needs:* *Primitive mod-p comparison and finiteness* (§AI.3.1); ClassicalAdicEtaleCohomology, §1.3 (*Descent and the étale–pro-étale comparison*); *Classical integral Witt period sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Finite Witt coefficient maps* (§AI.0.2).

**Proper mu-inverted étale comparison** (`AInf.global_etale`). `RΓ_Ainf[1/μ]≃RΓ_et(X,ℤ_p) ⊗_Z_p A_inf[1/μ]` for the analytic generic fiber `X`; proper finite étale cohomology allows the final source simplification of completion. The integral input is *The primitive comparison over A_inf* (§AI.5.1).

Smooth proper formal scheme; actual generic-fiber p-adic étale cohomology; primitive comparison theorem as in BMS1 Theorem 5.7.

Use the primitive comparison with `A_inf` coefficients and invert the almost parameter. Use proper finiteness to exchange finite cohomology and the required coefficient completion. (BMS1 (arXiv v3), Theorem 5.7; Theorem 14.3; printed pp.47–119). *Needs:* *Perfectness of proper A_inf cohomology* (§AI.5.1); *Mu-inverted étale specialization* (§AI.4.4); *The primitive comparison over A_inf* (§AI.5.1).

**Rational Frobenius bijectivity over A_cris** (`AInf.crystalline_frobenius_bijective`). (a) For a quasi-compact quasi-separated smooth `O_C/p-scheme Z`, the linearized Frobenius `H^i_crys(Z/A_cris) ⊗_{A_cris, φ} A_cris → H^i_crys(Z/A_cris)` is an isomorphism after inverting p. (b) For `Y=𝔛_(O_C/p)` with `𝔛` a proper smooth p-adic formal `O_C`-scheme and `n≥0`, base change gives `H^i_crys(Y/A_cris) ⊗_{A_cris, φ^n} A_cris ≅ H^i_crys(Y ⊗ O_C/p^{1/p^n} / φ^{−n}(A_cris)) ⊗_{φ^{−n}(A_cris), φ^n} A_cris`. (c) For any smooth finitely presented `Y/O_C/p` and a fixed section `k→O_C/p`, for `n` large `Y ⊗ O_C/p^{1/p^n} ≅ Ȳ ×_k O_C/p^{1/p^n}` with `Ȳ=Y⊗k`, by an isomorphism reducing to the identity over `k`, and any two such isomorphisms agree after increasing `n`.

`Z` is qcqs smooth in (a); `Y` is the reduction of a proper smooth formal scheme in (b), and smooth of finite presentation in (c). `k` is the residue field of `O_C` and a section `k→O_C/p` is fixed for (c); no noetherian hypothesis on `A_cris`.

(a) reduces to the affine case; there `Z ≅ Z̄ ×_k O_C/p`, because such an isomorphism exists modulo `p^{1/p^n}` by finite presentation and lifts by smoothness, and the statement follows by base change from the smooth k-scheme `Z̄`, where the constant-coefficient corollary is: for a smooth affine `k`-scheme `Z̄` of relative dimension `d` and `i≥0`, the linearized crystalline Frobenius on `H^i_crys(Z̄/W(k))` has kernel and cokernel killed by `p^(d(i+1))`, hence becomes bijective after inverting `p`. Apply CR.3’s *p-power control for purely inseparable pullback* to relative Frobenius and the unit crystal; Witt Frobenius over the perfect field `k` is an automorphism, so its scalar base change is exact and gives the absolute linearization. No properness is used in this corollary. For (b), use the proper smooth cohomology base-change formula in the proof of Proposition 13.21. At the complex level apply crystalline base change modulo `p^e`; *Proper A_crys specialization* (§AI.5.1) supplies the perfect complex and compatible reductions needed to pass to the p-adic limit. The ordinary cohomology formula uses this proper comparison, rather than an unrestricted exchange of tensor with cohomology or infinite products. (c) follows from finite presentation. (BMS1 (arXiv v3), §13.4, Proposition 13.21 and its proof, printed pp.116–117). *Needs:* *Proper A_crys specialization* (§AI.5.1); CrystallineCohomology, CR.3 (*Derived crystalline base change*); CrystallineCohomology, CR.3:Frobenius-isogeny (*p-power control for purely inseparable pullback*); *Integral crystalline coefficient interface* (§AI.0:integral.2).

**Checks.**

- For `Z̄=Spec k[T]`, the constant-coefficient corollary applies although `Z̄` is not proper; its degree-zero Frobenius is Witt Frobenius and the degree-one kernel and cokernel satisfy the bound `p²`.
- For `Y=Spec(O_C/p)` and every `n≥0`, the degree-zero base-change map identifies the unit crystal with `A_cris`; at `n=0` it is the identity.
- For the formal projective line, Frobenius on the hyperplane class is multiplication by `p`; (a) gives bijectivity after inverting `p`, while integral bijectivity fails in degree two.
- For `C=ℂ_p`, `A=A_cris` and `Y=∐_{j≥1}Spec(O_C/p)`, the degree-zero map `(∏_j A)⊗_{A,φ}A→∏_j A`, `(a_j)⊗b↦(φ(a_j)b)`, is not surjective. Put `δ=[p^♭]−p` and `J=(p,[𝔪^♭])A`. The principal PD presentation gives `A/J≅k⟨X⟩/(X)` with `(X)` the ordinary ideal, and the classes `γ_{p^j}(δ)` are linearly independent modulo `J`. Since `φ(δ)∈pA` and `m−v_p(m!)≥1` for `m≥1`, `φ(A)` maps into `k⊂A/J`. The coordinates of any finite tensor sum therefore lie in one finite-dimensional `k`-span, excluding the sequence `(γ_{p^j}(δ))_j`. This smooth étale scheme is not quasi-compact. (Lodh, *Almost étale extensions of Fontaine rings*, Lemma 1.3, proof, printed p.1893, for the principal PD presentation.)

**Primitive rational crystalline Frobenius input** (`AInf.rational_crystalline_frobenius`). Fix a section `k→O_C/p`. For `Y=𝔛_(O_C/p)` with `𝔛` proper smooth, there is a canonical `φ`-equivariant isomorphism `H_crys^i(Y/A_crys)[1/p]≅H_crys^i(𝔛_k/W(k)) ⊗_W(k) A_crys[1/p]`. In particular the left side is finite free over `A_crys[1/p]`, hence its `B_crys^+` realization is free as required by Corollary 4.20. This is BMS1 Proposition 13.21; its Frobenius and descent inputs are *Rational Frobenius bijectivity over A_cris* (§AI.5.1).

`C` complete algebraically closed of characteristic zero, residue field `k`, and a specified section `k→O_C/p`. `𝔛` proper smooth over `O_C`; use the specified section-induced `W(k)→A_crys` map.

Use the non-noetherian `A_cris` version of rational Frobenius bijectivity (*Rational Frobenius bijectivity over A_cris*, §AI.5.1) for qcqs smooth `O_C/p-schemes`, using affine reduction and descent along `p^(1/p^n)` thickenings to the residue field. Iterate Frobenius-twisted crystalline base change. Use finite presentation to descend `Y` to its special fiber modulo `p^(1/p^n)`; after enlarging `n` the choices agree. Apply proper crystalline finiteness over W(k) and extend to `A_crys[1/p]` and `B_crys^+`. Retain the fixed residue-field section and do not assume `H_Ainf[1/p]` free beforehand. (BMS1 (arXiv v3), Proposition 13.21, printed pp.116–117; Theorem 14.3 proof, pp.119–120). *Needs:* *Proper A_crys specialization* (§AI.5.1); CrystallineCohomology, CR.3 (*Derived crystalline base change*); CrystallineCohomology, CR.3:Frobenius-isogeny (*p-power control for purely inseparable pullback*); *Comparison with rational period rings* (§AI.0:period-comparison.1); *Rational Frobenius bijectivity over A_cris* (§AI.5.1).

**Checks.**

- For `𝔛=Spf O_C`, the degree-zero comparison is the coefficient identification `W(k)⊗_{W(k)}A_crys[1/p]=A_crys[1/p]`.
- For the formal projective line, degree two is the rank-one module with Frobenius multiplication by `p`; this becomes bijective over `A_crys[1/p]`.
- When `k` contains `𝔽_(p²)`, a Teichmüller coefficient `[a]` with `a^p≠a` is sent by Frobenius to `[a^p]` on both sides; replacing semilinear Frobenius by a coefficient-linear map fails this comparison.

### AI.5.2 Torsion, length and freeness

**Length increase under Witt specialization** (`AInf.finite_level_length_bound`). For a finitely presented `W_n(O_C^♭)-module M`, the generic and residue specializations have finite length and `l(M_η)=l(M_s)−l(Tor_1(M,W_n(k)))≤l(M_s)`.

`n≥1`; generic `W_n(C^♭)` and residue `W_n(k)`; finite presentation.

Use Tor-dimension and Euler characteristic additivity. Devise by `p` and the finitely presented valuation-module classification. (BMS1 (arXiv v3), Lemma 4.14; printed p.37). *Needs:* *Tor bounds for A_inf modules* (§AI.2.1).

**Rank and torsion-length comparison** (`AInf.specialization_rank_and_length`). For finitely presented `M` with M[1/p] finite free, `M⊗W(C^♭)` and `M⊗W(k)` have equal rank; for every `n≥1`, `l((M⊗W(k))/p^n)≥l((M⊗W(C^♭))/p^n)`.

Ordinary scalar extensions; source finite presentation; no assertion that either torsion group is a subquotient of the other.

Compare ranks after p-inversion. Apply the finite-level length bound to `M/p^n`. (BMS1 (arXiv v3), Corollary 4.15; printed p.38). *Needs:* *Length increase under Witt specialization* (§AI.5.2); *A_inf module structure theorem* (§AI.2.1).

**Injection into derived Witt specialization** (`AInf.derived_witt_cohomology_injection`). For `C` with every `H^j(C)[1/p]` free, `H^i(C)⊗W(k)→H^i(C ⊗^L W(k))` is injective and an isomorphism after p-inversion. It is an integral isomorphism if `H^(i+1)(C)` has no x-torsion.

Unbounded `C` allowed as in the source; all p-local cohomology free; `x=[ϖ^♭]`.

First use the filtered x-root quotient model and its Koszul resolution. Compare its p-completion with W(k); the kernel is p-inverted and tensor-exact under the source hypothesis. (BMS1 (arXiv v3), Lemma 4.16; printed p.38). *Needs:* *Tor bounds for A_inf modules* (§AI.2.1); *Witt residue specialization* (§AI.0:integral.1).

**Finite presentation and adjacent-degree freeness** (`AInf.adjacent_degree_freeness`). For a perfect `C` with all `H^j(C)[1/p]` free, every `H^j(C)` is finitely presented. If `H^i(C ⊗^L W(k))` is p-torsion-free, `H^i(C)` is finite free. If also `H^(i+1)(C)⊗W(k)` is p-torsion-free, `H^i(C)⊗W(k)≅H^i(C ⊗^L W(k))`.

Perfect `C`; all p-local cohomology free; retain the adjacent-degree hypothesis.

Descend in cohomological degree using perfectness of the next truncation. Apply the structure theorem for degree-i freeness and use degree i+1 to eliminate the Tor obstruction. (BMS1 (arXiv v3), Corollary 4.17; printed p.39). *Needs:* *Injection into derived Witt specialization* (§AI.5.2); *A_inf module structure theorem* (§AI.2.1); *Perfectness of finitely presented A_inf modules* (§AI.2.1).

**De Rham and crystalline torsion-freeness criterion** (`AInf.de_rham_crystalline_torsion_equivalence`). For perfect `C` over `A_inf` with every `H^j(C)[1/p]` free, `H^i(C ⊗^L W(k))` is p-torsion-free iff `H^i(C ⊗^L_(θ) O_C)` is p-torsion-free.

Mixed characteristic and all p-power roots of unity; perfect `C` and free p-local cohomology.

Apply the finite-free criterion to `H^i(C)`. Compare good truncations after the two scalar extensions and then reduce to the common residue field `k`. (BMS1 (arXiv v3), Lemma 4.18; printed p.39). *Needs:* *Finite presentation and adjacent-degree freeness* (§AI.5.2); *Tor bounds for A_inf modules* (§AI.2.1).

**Cohomology finiteness from period realizations** (`AInf.cohomology_finiteness_from_periods`). For perfect `C` with `H^j(C)[1/(p μ)]` free and `H^j(C ⊗^L B_crys^+)` free for every `j`, every `H^j(C)` is finitely presented and free after p-inversion. The finite-free and adjacent-degree conclusions of Corollary 4.17 then apply.

Perfect `C` and both free realization hypotheses; neither deduced merely from finiteness.

Use descending induction on top cohomology and the module criterion. Apply the already proved adjacent-degree package. (BMS1 (arXiv v3), Corollary 4.20; printed p.40). *Needs:* *p-local freeness from two period realizations* (§AI.2.1); *Finite presentation and adjacent-degree freeness* (§AI.5.2).

**BKF structure on proper cohomology** (`AInf.global_bkf`). Each `H_Ainf^i` is finitely presented and free after p-inversion, and the localized linearized Frobenius makes it a BKF module. This follows from the two period realizations and rational crystalline Frobenius, without assuming all integral cohomology is free.

Smooth proper formal scheme; all proper comparisons and primitive inputs established.

Use proper perfectness and the free `p-μ` and `B_crys^+` realizations. Apply Corollary 4.20 and then the localized Frobenius factorization. (BMS1 (arXiv v3), Theorem 14.3; §14; printed p.119). *Needs:* *Cohomology finiteness from period realizations* (§AI.5.2); *Proper mu-inverted étale comparison* (§AI.5.1); *Primitive rational crystalline Frobenius input* (§AI.5.1); *Breuil–Kisin–Fargues module* (§AI.2.2); *AΩ Frobenius and completeness* (§AI.3.3); *Rational Frobenius bijectivity over A_cris* (§AI.5.1).

**Torsion and lattice statements for proper cohomology** (`AInf.torsion_and_lattice_export`). State the generic length inequality and the adjacent-degree recovery maps for use by CohomologyComparisons. For the proper complex they give crystalline torsion-length bounds against generic-fiber étale torsion and finite-free lattice recovery when the source consecutive crystalline degrees are torsion-free.

Use `H^i` and `H^(i+1)` hypotheses exactly where the recovery map needs them.

Apply the generic module estimates to the proper BKF cohomology. Use the derived-specialization injection and adjacent-degree criterion before extracting an ordinary lattice. The strict-inequality and non-subquotient examples of BMS1 §2 are not prerequisites of Layer AI.2. (BMS1 (arXiv v3), Theorems 1.1,1.8, printed pp.2–3,5–7; Theorems 14.5–14.6, pp.120–122; §2, pp.11–18). *Needs:* *BKF structure on proper cohomology* (§AI.5.2); *Rank and torsion-length comparison* (§AI.5.2); *Finite presentation and adjacent-degree freeness* (§AI.5.2); *Full faithfulness of Fargues realization* (§AI.2.2).

### Examples

BMS1, Remark 1.2, p.3: for a lift of an Enriques surface in characteristic `2`, whose generic
fibre has `H^1_ét(·, 𝔽_2) ≅ 𝔽_2`, the torsion inequality of Layer AI.5 forces nonzero de Rham
cohomology `H^1` of the special fibre.

### Dependencies

Earlier layers: AI.0, AI.0:integral, AI.0:period-comparison, AI.2, AI.3, AI.4. Other roadmaps: CrystallineCohomology CR.3, CrystallineCohomology CR.3:Frobenius-isogeny, DerivedModuleAlgebra §§1.1–1.9, DerivedDeRhamCohomology §§1.14–1.22, DerivedDeRhamCohomology §§5.1–5.5, 5.23, EnhancedDerivedSheaves E1, EnhancedDerivedSheaves E4.

## Layer AI.6: Semistable `AΩ` and logarithmic specializations

This layer extends AI.3–AI.5 to semistable formal schemes in the setting (SS). It computes a
semistable chart and its root tower, whose integral map at a singular point is not flat;
defines semistable `AΩ` on the étale site of `𝔛`; and proves its log Hodge–Tate, log de Rham and
log crystalline specializations through all-coordinates models. It owns the canonical
`B_dR⁺`-deformation of a smooth rigid space over `C`: the infinitesimal envelope is completed
along the full embedding ideal, redundant coordinates contract, and finite freeness for proper
smooth spaces comes from spreading out. The comparison maps are identified before the torsion
inequalities and the model-independent de Rham lattice are derived.

### AI.6.1 Semistable charts, log structures and root towers

**Standard semistable chart ring** (`Semistable.chartRing`). For a commutative ring `R`, `π∈R` and integers `r,s≥0`, let `P=R[T₀,…,Tᵣ,Y₁,Z₁,…,Yₛ,Zₛ]`. Let `J` be generated by `∏Tᵢ−π` and YⱼZⱼ−1. The algebraic chart `Q=P/J` and its ordinary p-adic completion `R□=AdicCompletion((p),Q)` give the restricted-power-series chart. In CK use `R=O_C` and `π=p^q`, `q∈Q>0`; the torus coordinates are Yⱼ. The construction here is this chart, not a general formal scheme.

Standing hypotheses (SS). p-adic completion is along the image of the integer `p`; `π=p^q` with the fixed roots in the CK application.

The API:

- `Semistable.chartRing.branch_relation`: In the completion, `∏ᵢTᵢ` equals the image of `π`.
- `Semistable.chartRing.torus_inverse`: The images of Yⱼ and Zⱼ multiply to 1.
- `Semistable.chartRing.reduction`: Projection to level `n` sends a polynomial class to its class in `Q/(p)^n`, agreeing with AdicCompletion.evalₐ and Ideal.Quotient.mk.
- `Semistable.chartRing.lift`: A ring map `R→B` and branch/torus values satisfying the relations induce a unique map `Q→B`. If moreover `I⊂B` is an ideal containing the image of `p`, a compatible family of ring maps `Q→B/I^n` induces a unique ring map from AdicCompletion((p),Q) to `lim_n B/I^n` compatible with the projections evalₐ.

Use Mathlib multivariable polynomials and Ideal.Quotient for Q. Use the existing AdicCompletion ring instance and quotient projections. Identification with CK (1.5.1) (CK does not spell this out; it uses the explicit decomposition (3.2.1)): `f=T₀⋯Tᵣ−p^q` is a nonzerodivisor modulo `p`, because as a polynomial in T₀ its leading coefficient T₁⋯Tᵣ is a nonzerodivisor (for `r=0` it is monic); hence the principal ideal `(f)` of `O_C{t₀,…,tᵣ,t_{r+1}^{±1},…,t_d^{±1}}` is p-adically closed, the quotient is p-torsion-free and p-adically complete, and it equals `lim_n Q/p^n`. (ČK (arXiv v3), §1.5, (1.5.1), p.4; ČK (arXiv v3), §1.5, sentence after (1.5.1), p.4; ČK (arXiv v3), §1.5, p.4; ČK (arXiv v3), §1.7, p.6). *Needs:* Mathlib `MvPolynomial`; Mathlib `Ideal.Quotient.mk`; Mathlib `AdicCompletion`; Mathlib `AdicCompletion.evalₐ`; Mathlib `AdicCompletion.evalₐ_of`; Mathlib `AdicCompletion.liftRingHom`; Mathlib `IsAdicComplete.liftRingHom`; Mathlib `AdicCompletion.isAdicComplete`.

**Checks.**

- `Semistable.chartRing.nodal`: For `r=1,s=0`, `T₀T₁=π` in R□.
- `Semistable.chartRing.unit_coordinate`: For `s=1`, `Y₁Z₁=1`, including after reduction modulo p.
- `Semistable.chartRing.point`: For `r=s=0`, `Q≃R` by `T₀↦π`, and `R□≃AdicCompletion((p),R)`.
- `Semistable.chartRing.restricted`: For `R=ℤ_p`, `π=p`, `r=1`, `s=0`: evalₐ at level 1 induces `R□/pR□≅𝔽_p[T₀,T₁]/(T₀T₁)`, and 1−T₀ is not a unit of R□ (its image in `𝔽_p[T₀,T₁]/(T₀T₁,T₁)=𝔽_p[T₀]` is not a unit). In the completion along (p,T₀,T₁) it would be a unit.
- The completed nodal relation is `T₀T₁=π`.
- At `r=s=0` the completion is the p-adic completion of `R`.

**Log regularity and the divisorial log structure** (`Semistable.divisorial_log_regular`). On a log regular scheme `U`, with open subset `U_triv` where the log structure is trivial and `j` : `U_triv → U`, the log structure is `O_U ∩ j_*O_{U_triv}^×`. Applied to a scheme `U` étale over O[t₀, …, `t_r`, `t_{r+1}^{±1}`, …, `t_d^{±1}]/(t₀⋯t_r − π)`, for a valuation ring `O` as in ČK, Claim 1.6.1, and a nonzero nonunit `π ∈ O`, the log structure `O_U ∩ (O_U[1/p])^×` has the chart `ℕ^{r+1} ⊔_ℕ (O ∖ {0}) → Γ(U, O_U)`, given by `(a_i) ↦ ∏ t_i^{a_i}`, the diagonal `ℕ → ℕ^{r+1}` and a `↦ π^a` on `ℕ`.

`U` log regular in the sense of Kato for the first clause; `O` and `π` as in ČK, Claim 1.6.1, for the second.

Kato, Toric singularities, Theorem 11.6, identifies the log structure of a log regular scheme with `O ∩ j_*O^×`. For the chart, reduce by a limit argument to `O` discretely valued; then `U` with the chart log structure is log regular and its locus of triviality is U[1/p], so the first clause applies. (ČK (arXiv v3), Claims 1.6.1 and 1.6.3, printed pp.5–6). *Needs:* CrystallineCohomology, CR.5:log-algebra (*Log regular schemes*); CrystallineCohomology, CR.5:log-algebra (*Prelog rings*).

**Algebraization and descent of semistable charts**. An étale map from an affine formal scheme Spf `R` to the chart Spf R□ (as in (SS)) is, after shrinking, the p-adic completion of an étale map of schemes of finite type over a discrete valuation ring `O ⊂ O_C` containing `p^q` (ČK (1.5.2)); and an étale map to the generic-fibre chart Spa of C⟨T₀, …, `T_d⟩/(T₀⋯T_r − p^q)` descends to the ring of integers of a finite extension of W(k̄)[1/p] in `C`. `R` is flat over R□ and each `R ⊗_{R□} R□_m` is p-adically complete.

Standing hypotheses (SS).

Elkik-type approximation for étale algebras over the p-adic completion (Stacks 04D1 with limit arguments) gives the algebraization (ČK (1.5.2)). Huber 1.7.3(iii) gives the descent of étale maps to the rigid chart. Flatness and completeness follow from Gabber–Ramero 7.1.6. (ČK (arXiv v3), §1.5, (1.5.2) and footnote 2, printed p.4). *Needs:* ClassicalAdicEtaleCohomology, §4.7 (*Local algebraization of semistable formal charts*); AdicSpacesPartII, R0 (*Algebraic models of affinoid étale maps (Huber 1.7.3(iii))*); Mathlib `Algebra.Etale`.

**Divisorial semistable log structure** (`Semistable.divisorialLog`). For a CK formal model `𝔛`, take the associated log structure of `O_𝔛,ét∩(O_𝔛,ét[1/p])×→O_𝔛,ét`; the base prelog monoid is `O_C∖{0}`. On a chart it is the pushout of `ℕ^{r+1}` along the diagonal `ℕ→ℕ^{r+1}` and `1↦p^q` in `O_C∖{0}`. It is quasi-coherent and integral; the base need not be fine. Every local section of the log structure becomes a unit after inverting p.

Standing hypotheses (SS). `𝔛` is a p-adic formal scheme over `O_C` that étale locally admits the charts (1.5.1); flatness and local finite presentation of each `𝔛⊗O_C/p^n` over `O_C/p^n` follow from the charts.

The API:

- `Semistable.divisorialLog.chart`: The associated chart is `ℕ^{r+1}⊔_ℕ(O_C∖{0})` with the displayed maps.
- `Semistable.divisorialLog.pullback`: Strict étale chart pullback agrees with the divisorial log structure, and composes under refinement.
- `Semistable.divisorialLog.generic`: Every local section of the log structure is invertible in `O_𝔛,ét[1/p]`; for the algebraic model `U` of CK Claim 1.6.1 the locus of triviality of the log structure is U[1/p].

Use associated log structures and integral monoid pushouts from CrystallineCohomology, CR.5:log-algebra. CK Claim 1.6.1 (chart (1.6.2)), for a scheme `U` étale over Spec `O[t₀,…,tᵣ,t_{r+1}^{±1},…,t_d^{±1}]/(t₀⋯tᵣ−π)` with `O` a valuation subring of the integral closure of W(k̄) and `π` a nonzero nonunit: by a limit argument `O` may be taken discretely valued; then `U` with the chart log structure is logarithmically regular (Kato, Toric singularities, 2.1), its locus of triviality is U[1/p], and Kato, Toric singularities, Theorem 11.6 identifies it with the log structure of `O_U∩(O_U[1/p])×`. (Kato’s results: CR.5:log-algebra.) CK Claim 1.6.3: for a flat O-scheme the p-adic completion morphism is strict for these log structures (comparison of stalks modulo units, using Stacks Project 04D1). Since the chart (1.5.1) is the p-adic completion of the base change of an étale O-morphism (1.5.2), the chart (1.6.2) with `O` replaced by `O_C` and `π=p^q` is a chart on `𝔛`; quasi-coherence and integrality follow. Use fine versions only when the log-crystalline site requires them. (ČK (arXiv v3), §1.6 (1), p.5; ČK (arXiv v3), §1.6 (2), p.5; ČK (arXiv v3), §1.6, p.5; ČK (arXiv v3), Claim 1.6.1 (proof), p.6; the triviality locus is U[1/p]; ČK (arXiv v3), Claim 1.6.3, (1.6.4), p.6). *Needs:* *Standard semistable chart ring* (§AI.6.1); *Log regularity and the divisorial log structure* (§AI.6.1); *Algebraization and descent of semistable charts* (§AI.6.1); CrystallineCohomology, CR.5:log-algebra (*Prelog rings*); CrystallineCohomology, CR.5:log-algebra (*Log regular schemes*).

**Checks.**

- `Semistable.divisorialLog.node`: At the closed node of `T₀T₁=p^q` the stalk of `M/O^×` is `ℕ²⊔_ℕℚ≥0` (classes e₀, e₁ of T₀, T₁ and the value monoid `ℚ≥0` of `O_C∖{0}`, with `e₀+e₁=q`), and its quotient by the image of the base monoid `ℚ≥0` is `ℕ²/ℕ(1,1)≅ℤ` via `(a,b)↦a−b`.
- `Semistable.divisorialLog.smooth`: At `r=0 (t₀=p^q, R□≅O_C{t₁^{±1},…,t_d^{±1}})` the chart monoid is `ℕ⊔_ℕ(O_C∖{0})=O_C∖{0}`, the map to Spf `O_C` is strict, and the relative log differentials are the ordinary differentials, free on `dt₁/t₁,…,dt_d/t_d`.
- `Semistable.divisorialLog.nonfine`: The base chart `O_C∖{0}` has value monoid `Q≥0` in the CK setup, which is not finitely generated; no fine hypothesis is asserted for this chart.
- At a node the two branch generators satisfy `dlogT₀+dlogT₁=0` over the log base.

**Normalized semistable monomial indices** (`Semistable.monomialExponents`). At root level `m`, an index consists of `a∈ℕ^{r+1}`, `b∈ℤ^s` and a branch `j` with `a_j=0`, modulo equality of a and `b` (the witness `j` is not extra data). It represents `∏Tᵢ^{aᵢ/p^m}∏Yⱼ^{bⱼ/p^m}`. Normalize an arbitrary a by subtracting `min_i a_i`; the removed factor is `p^{q·min(a)/p^m}`. The index is integral precisely when `p^m` divides every `a_i` and `b_j`. Level-m and level-(m+1) indices are identified by `(a,b)↦(pa,pb)`; the union over `m` is the index set of CK (3.2.1), namely `(Z[1/p]≥0)^{r+1}⊕Z[1/p]^{d−r}` with `a_j=0` for some branch `j (s=d−r)`.

Standing hypotheses (SS). r+1 is nonempty; signed torus exponents are essential; normalization acts on branch exponents only.

The API:

- `Semistable.monomialExponents.normalize`: Normalization sends a to a−min(a) coordinatewise and records min(a).
- `Semistable.monomialExponents.normalized`: A branch exponent is normalized iff at least one coordinate is zero; normalize fixes such tuples.
- `Semistable.monomialExponents.integral`: At level `m` integrality means simultaneous divisibility by `p^m` of branch and signed torus numerators.
- `Semistable.monomialExponents.transition`: `(a,b)↦(pa,pb)` maps level-m indices to level-(m+1) indices, preserves normalization and integrality, and represents the same monomial.
- `Semistable.monomialExponents.level`: The exact level of a level-m index is the least `m′≤m` such that `p^{m−m′}` divides every `a_i` and `b_j`; the index is integral iff its exact level is 0, and the exact level is unchanged by transition.
- `Semistable.monomialExponents.weight`: The `Δ-weights` of a level-m index are `w_j=a_j−a₀` for `1≤j≤r` and `w_j=b_j` for the torus directions (CK (3.19.3), in units of `1/p^m`); the generator `δ_j` of `Δ` scales the monomial by `ε^{w_j/p^m}`. The exact level is also the least `m′≤m` such that `p^{m−m′}` divides every `w_j`; in particular a nonintegral index has a weight not divisible by `p^m`.

Use finite tuples and integer divisibility from the baseline. Apply the unique normal form of the completed direct sum decomposition CK (3.2.1) (monomials with `a_j=0` for some `0≤j≤r`); retain the removed coefficient `p^{q·min(a)/p^m}` instead of deleting it. The `Δ-weights` are those of CK (3.19.3) and the exact level is the `m` of CK §3.22 (the least `m` with `p^m·a` integral, equivalently with `p^m·b` integral for the weights `b`); both are definitions on indices and need no further input. (ČK (arXiv v3), §3.2, (3.2.1), p.10; the display follows this sentence; ČK (arXiv v3), §3.2, p.10; ČK (arXiv v3), §3.14, p.15; ČK (arXiv v3), Proposition 3.19 (proof), (3.19.3), p.17; ČK (arXiv v3), §3.22, p.18). *Needs:* *Standard semistable chart ring* (§AI.6.1); Mathlib `Finset.max'`.

**Checks.**

- `Semistable.monomialExponents.node`: `normalize(2,3)=(0,1)` and the removed minimum is 2.
- `Semistable.monomialExponents.point`: For `r=s=0` the sole normalized branch exponent is 0 and every level has only the integral index.
- `Semistable.monomialExponents.fractional_torus`: At `p=2,m=1`, branch tuple (0,2) and torus numerator −1 give a nonintegral index; ignoring negative torus exponents would give the wrong answer.
- `Semistable.monomialExponents.level_weight`: For `p=2`, `r=1`, `s=1`: the level-1 index ((0,2),(4)) is the transition of the level-0 index ((0,1),(2)) and has exact level 0; the level-2 index ((0,2),(1)) has exact level 2 and weights (2,1); the level-1 index ((1,0),(0)) has weights (−1,0) and exact level 1.
- The normalized node monomial `T₀²T₁³` has coefficient `p^{2q}` and exponent (0,1).

**Semistable perfectoid root tower** (`Semistable.rootTower`). Given an étale morphism `Spf(R)→Spf(R□)` of p-adic formal schemes, form `R_m` by base change from the chart adjoining `p^m-th` roots of every branch and invertible coordinate and imposing `∏Tᵢ^{1/p^m}=p^{q/p^m}`. Set `R_∞` to the p-adic completion of `colim_mR_m`. Its generic fibre is an affinoid perfectoid pro-(finite étale) cover with group `Δ={(ε₀,…,ε_d)∈(lim_m μ_{p^m}(O_C))^{d+1}:∏_{i=0}^rεᵢ=1}≃ℤ_p^d`; `R_∞` is integral perfectoid.

Standing hypotheses (SS). `R` is a p-adically complete `O_C`-algebra with an étale morphism `Spf(R)→Spf(R□)` as in CK (3.1.1): each `R/p^n` is étale over `R□/p^n` (étale, not merely formally étale); roots use the fixed compatible systems.

The API:

- `Semistable.rootTower.transition`: Level `m` embeds into level m+1 by sending each root to the p-th power of the next root.
- `Semistable.rootTower.action`: The continuous `Δ-action` scales each compatible root `t_j^{1/p^m}` by the `μ_{p^m}-component` of `ε_j` and preserves the branch-product relation because `ε₀⋯εᵣ=1`. `Δ` is topologically freely generated by `δᵢ=(ε⁻¹,1,…,1,ε,1,…,1)` (entries 0 and `i`) for `1≤i≤r` and `δᵢ=(1,…,1,ε,1,…,1)` (entry `i`) for `r<i≤d`.
- `Semistable.rootTower.perfectoid`: `R_∞` is p-torsion-free, p-adically complete and integral perfectoid (Frobenius `R_∞/p^{1/p}→R_∞/p` is bijective), and the tower lim `Spa(R_m[1/p],R_m)` is a finite-étale tower over the adic generic fibre, hence a covering in its pro-étale site, with group `Δ`.
- `Semistable.rootTower.generic_finite_etale`: For each `m`, `R□_m[1/p]` is the direct sum of `R□[1/p]·t₁^{a₁}⋯t_d^{a_d}` over `a₁,…,a_d∈{0,1/p^m,…,(p^m−1)/p^m}`; it is finite étale of degree `p^{md}` over R□[1/p], and `R□_m` is the ring of power-bounded elements of `R□_m[1/p]`.

CK (3.2.1): `R□_m` is the p-adically completed direct sum of `O_C·t^a` over the normalized exponents a of *Normalized semistable monomial indices* (§AI.6.1) with `p^m·a` integral, and `R□_∞` is the p-adically completed direct sum of `O_C·t^a` over all a in `(Z[1/p]≥0)^{r+1}⊕Z[1/p]^{d−r}` with `a_j=0` for some `0≤j≤r`; each `R□_m→R□_∞` is the inclusion of the direct summand formed by those summands. Do not assert integral flatness of the tower over R□. Perfectoidness (CK §1.7 and §3.2; BMS1 Lemmas 3.9 and 3.10): `R□_∞` is p-torsion-free and p-adically complete and Frobenius `R□_∞/p^{1/p}→R□_∞/p` is bijective on the monomial basis, so `R□_∞` is integral perfectoid by the criterion of PerfectoidSpaces, P4 (*Integral perfectoid criterion: integral perfectoid rings give perfectoid Tate rings (compatible-root annuli)*) applied to the pair `(R□_∞,p^{1/p})`; the annulus worked out in that node is the case `r=1`, `d=1` with exponent in Z[1/p], and for general `r`, `d` and `q∈Q>0` the hypothesis of the criterion is checked on the basis of step 1. `R` is R□-flat and each `R_m=R⊗_{R□}R□_m` is p-torsion-free, p-adically formally étale over `R□_m` and p-adically complete (Gabber–Ramero, Almost ring theory, 7.1.6); hence `R_∞` is p-adically formally étale over `R□_∞`, p-adically complete and integral perfectoid. Group and action (CK §3.2): `Δ` acts R□-linearly on `R□_m` by scaling `t_j^{1/p^m}` by the `μ_{p^m}-component` of `ε_j`; compute the generators `δᵢ` and the isomorphism `Δ≃ℤ_p^d`. Cover (CK §3.2): `R□_m[1/p]` is obtained from R□[1/p] by adjoining `p^m-th` roots of the units `t₁,…,t_d`, hence is finite étale of degree `p^{md}`, and `R□_m=(R□_m[1/p])°`; so lim `Spa(R_m[1/p],R_m)` is a finite-étale tower over the adic generic fibre, a covering of AdicEtaleGeometry, A1 (*The pro-étale site X_proét of a locally noetherian analytic adic space, with Scholze's corrected coverings*), with group `Δ`. That it is affinoid perfectoid and that `Ô⁺` takes the value `R_∞` on it (Scholze, p-adic Hodge theory for rigid-analytic varieties, 4.10(iii)) is supplied by AI.3. (ČK (arXiv v3), §3.1, (3.1.1), p.10; ČK (arXiv v3), §3 (introduction), p.10; ČK (arXiv v3), §3.2, p.10; ČK (arXiv v3), §1.7, p.7; ČK (arXiv v3), §3.2, p.11). *Needs:* *Standard semistable chart ring* (§AI.6.1); *Normalized semistable monomial indices* (§AI.6.1); *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); PerfectoidSpaces, P4 (*Integral perfectoid criterion: integral perfectoid rings give perfectoid Tate rings (compatible-root annuli)*); AdicEtaleGeometry, A1 (*The pro-étale site X_proét of a locally noetherian analytic adic space, with Scholze's corrected coverings*); *Algebraization and descent of semistable charts* (§AI.6.1).

**Checks.**

- `Semistable.rootTower.node_action`: For `T₀T₁=p^q` and the generator `δ₁=(ε⁻¹,ε)` of `Δ`, `δ₁(T₀^{1/p^m})=ζ_{p^m}^{-1}T₀^{1/p^m}` and `δ₁(T₁^{1/p^m})=ζ_{p^m}T₁^{1/p^m}`, where `ζ_{p^m}` is the `p^m-th` component of `ε`.
- `Semistable.rootTower.point`: For `r=s=0` the tower is `O_C` with trivial `Δ`.
- `Semistable.rootTower.nonflat`: For the nodal chart at `p=2,m=1`, the generic root cover has rank 2 but its closed-node special-fibre algebra has basis 1,a,b and length 3 `(a²=b²=ab=0)`; the integral map is not flat.
- The group has rank `d` rather than d+1; the chart remains non-flat integrally.

**Integral A_inf chart lift** (`Semistable.ainfChartLift`). Let `A(R□)=A_inf{X₀,…,Xᵣ,X_{r+1}^{±1},…,X_d^{±1}}/(∏Xᵢ−[(p^{1/p∞})^q])`, completed for `(p,μ)`, with the surjection `θ:A(R□)→R□`, `Xᵢ↦tᵢ`. Using `θ`, lift the étale R□/p-algebra R/p uniquely to a `(p,μ)`-adically complete, formally étale A(R□)-algebra A(R). It has Frobenius `Xᵢ↦Xᵢ^p` and the integral `Δ-action` from the root tower, which is trivial modulo `μ`; reduction along `θ` is `R`.

Standing hypotheses (SS). `X=Spf(R)` with an étale coordinate map as in CK (3.1.1). Use the fixed compatible roots; the lift is of the specified étale chart algebra, not an arbitrary singular `A_inf`-algebra.

The API:

- `Semistable.ainfChartLift.theta`: `A(R)⊗̂_{A_inf,θ}O_C≃R`, agreeing with `θ`.
- `Semistable.ainfChartLift.frobenius`: `φ(Xᵢ)=Xᵢ^p` and `φ` acts by Witt Frobenius on coefficients.
- `Semistable.ainfChartLift.etale`: The lift A(R) of the étale R□/p-algebra R/p is unique up to unique isomorphism; for a map `R→R′` of étale R□-algebras there is a unique compatible map `A(R)→A(R′)`, and the Frobenius and the `Δ-action` of A(R) are the unique lifts of those of A(R□).
- `Semistable.ainfChartLift.delta_monomial`: `(ε₀,…,ε_d)∈Δ` sends Xⱼ to `[εⱼ]Xⱼ`; the action is continuous, `A_inf`-linear and commutes with `φ`.
- `Semistable.ainfChartLift.delta_trivial_mod_mu`: `Δ` acts trivially on `A(R)/μ`; for `δ∈Δ` the `A_inf`-linear map `(δ−1)/μ:A(R)→A(R)` is defined and `δ=1+μ·(δ−1)/μ`.

Define A(R□) by the presentation CK (3.14.2), convergence being `(p,μ)`-adic, with Frobenius semilinear over that of `A_inf` and `Xᵢ↦Xᵢ^p`, and with `Δ` acting by `Xⱼ↦[εⱼ]Xⱼ` (the relation is preserved because `ε₀⋯εᵣ=1`). The map `θ` of CK (3.14.3) is `Xᵢ↦tᵢ` over `θ:A_inf→O_C` (Layer AI.0:integral); its kernel is generated by `ξ`. The ideal `(p,ξ)` of A(R□) is topologically nilpotent for the `(p,μ)`-adic topology and `A(R□)/(p,ξ)=R□/p`, so the étale R□/p-algebra R/p lifts uniquely to a `(p,μ)`-adically complete formally étale A(R□)-algebra A(R) (CK §3.14; unique lifting of étale algebras, Stacks Project 04D1; Layer AI.3). By the same uniqueness the Frobenius and the `Δ-action` lift uniquely, the `Δ-action` being Frobenius-equivariant, and `A(R)/ξ≅R`. `Δ` acts trivially on `A(R□)/μ` because `[εⱼ]≡1` modulo `μ`, hence trivially on `A(R)/μ` by uniqueness of lifts (CK §3.14). A(R) is `μ`-torsion-free: A(R□) is the `(p,μ)`-adic completion of a free `A_inf`-module on the integral monomials, so each `(p^n,μ^{n′})` is a regular sequence on it with quotient free over `A_inf/(p^n,μ^{n′})`; `A(R)/(p^n,μ^{n′})` is étale over `A(R□)/(p^n,μ^{n′})`, which gives the same regularity and flatness for A(R), and `μ-torsion-freeness` follows by `(p,μ)`-adic completeness (compare CK Lemma 3.13 and the proof of Proposition 5.6), so `(δ−1)/μ` is a well-defined `A_inf`-linear endomorphism of A(R) (CK §3.27). The identification of A(R) with the integral summand of `A_inf(R_∞)` is *Integral and nonintegral monomial splitting* (§AI.6.1), not this target. (ČK (arXiv v3), §3.14, (3.14.2), p.15; its presentation is the display that follows; ČK (arXiv v3), §3.14, p.15; ČK (arXiv v3), §3.14, (3.14.3), p.15). *Needs:* *Standard semistable chart ring* (§AI.6.1); *Semistable perfectoid root tower* (§AI.6.1); *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); AdicEtaleGeometry, A1.

**Checks.**

- `Semistable.ainfChartLift.node`: At `r=1`, `X₀X₁=[(p^{1/p∞})^q]` before `θ-reduction`.
- `Semistable.ainfChartLift.point`: At `R=O_C` the lift is `A_inf`.
- `Semistable.ainfChartLift.theta_tilde`: `θ(Xᵢ)=tᵢ`, and the reduction map `A(R□)→R□` is `θ`. The formula `θ̃=θ∘φ_A⁻¹` of `A_inf` does not define a map on A(R□): the Frobenius of A(R□) is not surjective, since Xᵢ is not in its image for a torus coordinate, nor for a branch coordinate when `r≥1`. So the reduction cannot be relabelled `θ̃`.
- `Semistable.ainfChartLift.delta_mod_mu`: On the node chart, for `δ₁=(ε⁻¹,ε)`: `δ₁(X₁)−X₁=μ·X₁` and `δ₁(X₀)−X₀=([ε]⁻¹−1)·X₀=−[ε]⁻¹·μ·X₀`, both divisible by `μ`; so `(δ₁−1)/μ` sends X₁ to X₁ and X₀ to `−[ε]⁻¹X₀`.
- Frobenius raises the lifted relation to its p-th power and lifts absolute Frobenius mod p.

**Integral and nonintegral monomial splitting** (`Semistable.monomialSplitting`). The completed monomial expansion yields `Δ`-equivariant decompositions `R_∞=R⊕M_∞` of R-modules and `A_inf(R_∞)=A(R)⊕N_∞` of A(R)-modules, with integral indices in the first summand and nonintegral indices in the second; A(R) is the `(p,μ)`-complete lift of *Integral A_inf chart lift* (§AI.6.1). Modulo `ξ` the second decomposition reduces to the first, so `N_∞/ξ≅M_∞`. These are completed module decompositions, not a direct product of rings.

Standing hypotheses (SS). `X=Spf(R)` with an étale coordinate map as in CK (3.1.1); completions are p-adic in (3.2.1)–(3.2.2) and `(p,μ)`-adic in §3.14.

CK (3.2.1)–(3.2.2): `R□_∞` is the p-adically completed direct sum of `O_C·t^a` over the normalized exponents (*Semistable perfectoid root tower* (§AI.6.1), *Normalized semistable monomial indices* (§AI.6.1)); the summands with some `a_j∉Z` form the R□-submodule `M□_∞`, and base change along the étale map `R□→R` gives `M_∞:=R⊗̂_{R□}M□_∞` and `R_∞≅R⊕M_∞`. `Δ` preserves the decompositions. CK §3.11 and §3.14: the tilt `(R□_∞)^♭` is the `p^{1/p^∞}`-adically completed direct sum of `O_C^♭·x^a`, where `x_i^{1/p^m}` is the compatible system `(…,t_i^{1/p^{m+1}},t_i^{1/p^m})`, and `R_∞^♭` is the completed étale lift of `R_∞/p`. Since W(A) is the unique p-adically complete p-torsion-free `ℤ_p`-algebra lifting a perfect `𝔽_p`-algebra A, with Teichmüller lifts computed as limits of `p^n-th` powers (Bhatt, Specializing varieties and their cohomology from characteristic 0 to characteristic `p`, 2.4–2.5; Layer AI.0:integral), `A_inf(R□_∞)` is the `(p,μ)`-adically completed direct sum of `A_inf·X^a` with `X_i^{1/p^m}=[x_i^{1/p^m}]`; the integral summands form the subring A(R□), the others the A(R□)-submodule `N□_∞`. CK (3.14.3)–(3.14.5): with the lift A(R) of *Integral A_inf chart lift* (§AI.6.1), `A_inf(R_∞)≅A_inf(R□_∞)⊗̂_{A(R□)}A(R)`, completion `(p,μ)`-adic (the value of `A_inf,X` on the cover is `W(R_∞^♭)`, Scholze, p-adic Hodge theory for rigid-analytic varieties, 6.5(i); Layer AI.3); set `N_∞:=N□_∞⊗̂_{A(R□)}A(R)`. The decompositions are `Δ`-equivariant and reduce modulo `ξ` to (3.2.2). (ČK (arXiv v3), §3.2, (3.2.2), p.10; ČK (arXiv v3), §3.2, p.11; ČK (arXiv v3), §3.11, p.14; ČK (arXiv v3), §3.14, p.15; ČK (arXiv v3), §3.14, (3.14.5), p.15). *Needs:* *Semistable perfectoid root tower* (§AI.6.1); *Normalized semistable monomial indices* (§AI.6.1); *Integral A_inf chart lift* (§AI.6.1); *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); AdicEtaleGeometry, A1.

**Checks.**

- At `R=O_C` with the dimension-zero chart, both nonintegral complements `M_∞` and `N_∞` are zero.
- On the torus, integral exponents belong to `A(R)`, while `X^{1/p}` belongs to `N_∞`.
- The product `X^{1/p}X^{(p−1)/p}=X` leaves `N_∞`, so `N_∞` is not an ideal.
- Under the embedding of A(R□) into `A_inf(R□_∞)`, `Xᵢ=[xᵢ]` with `xᵢ=(…,tᵢ^{1/p},tᵢ)`; on the nonintegral monomial `X₁^{1/p}` of the node chart, `δ₁−1` is multiplication by `[ε^{1/p}]−1=φ⁻¹(μ)`, which is not divisible by `μ`, whereas on the integral summand A(R□) every `δ−1` is divisible by `μ`.

Perform these computations on the completed monomial modules when constructing the splitting.

**All-coordinates presentation indices** (`Semistable.allCoordinates`). Let Spf `R` be an affine nonempty étale open of `𝔛` such that every two irreducible components of `Spec(R⊗_{O_C}k̄)` meet. An index `(Σ,Λ)` consists of a finite set `Σ`, a nonempty finite set `Λ`, for each `λ∈Λ` a chart ring `R□_λ=O_C{t_{λ,0},…,t_{λ,r_λ},t_{λ,r_λ+1}^{±1},…,t_{λ,d}^{±1}}/(t_{λ,0}⋯t_{λ,r_λ}−p^{q_λ})` with `q_λ∈Q_{>0}` (the same `d` for all `λ`; `r_λ` and `q_λ` may vary), and a closed immersion Spf `R→Spf O_C{t_σ^{±1}:σ∈Σ}×∏_{λ∈Λ}Spf R□_λ` over Spf `O_C` such that already Spf `R→Spf O_C{t_σ^{±1}:σ∈Σ}` is a closed immersion and each Spf `R→Spf R□_λ` is étale (CK §5.17). Indices are refined by enlarging `Σ` and `Λ` and form a filtered system. Each irreducible component of `Spec(R⊗k̄)` is cut out by a unique `t_{λ,i}` with `0≤i≤r_λ`. If `R⊗k̄` is not k̄-smooth, then `R` determines `q_λ`, so `q_λ` does not depend on `λ`; if `R⊗k̄` is smooth, `q_λ` may depend on `λ` and `r_λ>0` is allowed.

Standing hypotheses (SS). Spf `R` is affine, nonempty and étale over `𝔛`, with pairwise intersecting special-fibre components. `Λ≠∅`, every chart has relative dimension `d`, the torus map is a closed immersion and every chart map is étale. These are presentation data, without a perfectoidness assertion.

The API:

- `Semistable.allCoordinates.refine`: Finite union of invertible coordinates and finite union of chart families define a common refinement of eligible indices.
- `Semistable.allCoordinates.components`: For every `λ∈Λ` each irreducible component of `Spec(R⊗k̄)` is cut out by a unique `t_{λ,i}` with `0≤i≤r_λ`.
- `Semistable.allCoordinates.valuation`: If `R⊗k̄` is not smooth, `q_λ` is the same for all `λ∈Λ`; if `R⊗k̄` is smooth, there is for each `λ` a unique `i_λ` with `t_{λ,i_λ}∉R^×`, and `q_λ` may depend on `λ`.

Construct the indices on an étale basis using the chart maps and small Zariski opens embedding into a torus. Shrink around a point to remove components not passing through it. The component assertion follows from the chart's branch loci; the invariant `q` in the nonsmooth case follows from the Fitting ideal of differentials. Finite unions give common refinements. (ČK (arXiv v3), §5.17, (5.17.2)–(5.17.3), p.40; §5.21, p.42; §1.5, footnote 2, p.4). *Needs:* *Standard semistable chart ring* (§AI.6.1); *Algebraization and descent of semistable charts* (§AI.6.1); AdicSpacesPartIII, R2 (formal schemes and étale charts); Tau Ceti `TauCeti.RingTheory.FittingIdeal.Basic`.

**Checks.**

- `Semistable.allCoordinates.two_charts`: Two distinct eligible node charts are both refined by the index containing their union.
- `Semistable.allCoordinates.no_chart`: `Λ=∅` is excluded; torus coordinates alone do not constitute the logarithmic semistable presentation.
- `Semistable.allCoordinates.smooth_valuations`: For `R=O_C{t^{±1}}` and any `q∈Q_{>0}`, the map `t₀↦p^q·t`, `t₁↦t^{-1}` from `O_C{t₀,t₁}/(t₀t₁−p^q)` is an étale chart with `r_λ=1` (the completed localisation at t₁). Two such charts with different `q`, together with `Σ={t}`, form an index; so `q_λ` is not constant on `Λ` when `R⊗k̄` is smooth.

**Perfectoidness of products of root towers** (`Semistable.root_tower_products`). For a finite set `Λ` of semistable charts of `R` and a finite set `Σ` of units, form the product of the corresponding root covers and its pullback to the generic fibre of `R` in adic spaces. Define its integral ring `R_{Σ,Λ,∞}` as the p-adic completion of the integral closure of the image of the integral tensor/base-change algebra inside the generic-fibre algebra. This ring is a perfectoid `O_C`-algebra, integrally closed in `R_{Σ,Λ,∞}[1/p]`. Use this integral ring in all all-coordinate root-cover and period-ring constructions.

Standing hypotheses (SS); `R` as in (SS) with the *All-coordinates presentation indices* (§AI.6.1) data `(Σ, Λ)` of Layer AI.6.

Each chart tower is perfectoid. At each finite root level the additional coordinates give a finite étale cover after inverting `p`; the completed inverse limit of these covers is affinoid perfectoid by Scholze, Perfectoid spaces, Theorem 7.9(iii). The full infinite product tower is pro-finite-étale, and is not asserted to be finite étale: adjoining all p-power roots of a new torus coordinate has unbounded finite-level degree. The integral closure defines the plus ring of the adic pullback; its completion gives the integral ring of the affinoid perfectoid cover. Apply the ordinary integral-closure completion criterion with the compatible root of `p` and Frobenius-surjectivity hypotheses, rather than identifying the raw completed tensor algebra with its closure. (ČK (arXiv v3), §5.18, (5.18.1), printed p.41; ČK (arXiv v3), Lemma 5.37 and its proof, printed p.53). *Needs:* *All-coordinates presentation indices* (§AI.6.1); *Semistable perfectoid root tower* (§AI.6.1); PerfectoidSpaces, P3 (*The almost purity theorem for perfectoid Tate rings (ECD Theorem 6.1)*); PerfectoidQuotients, §0.5 (ordinary integral-closure completion criterion).

**Checks.**

- With one chart and no additional torus coordinates, the product is its original root tower.
- With a second copy of a torus chart, the extra roots form an infinite pro-finite-étale tower, not a single finite étale extension.
- For two eligible node charts, the product cover maps to each single-chart cover and remains perfectoid after integral closure and completion.
- For `R=O_C`, `Σ={1}` and a dimension-zero chart, the integral ring contains the characteristic function of the clopen set where the first root `T₁` equals 1. In the generic-fibre algebra it is `e=(1/p)Σ_{j<p}T₁^j`, with `e²=e`. The raw integral root algebra and its p-completion omit `e`: evaluation at compatible roots starting with 1 or a primitive p-th root has equal residue for every raw integral element, but `e` has values 1 and 0.

### AI.6.2 The local edge map and semistable `AΩ`

**Integral structure-sheaf edge comparison** (`Semistable.structureSheafEdge`). Let `e`: `RΓ_cont(Δ,R_∞)→RΓ_proét(X_C^ad,Ô⁺)` be the edge map of CK (3.3.1) for the `Δ-cover` of *Semistable perfectoid root tower* (§AI.6.1); by almost purity the maximal ideal `m` of `O_C` kills the cohomology of its cone. An `O_C`-module has no nonzero m-torsion if no nonzero element is annihilated by all of `m`. (a) For every `i`, `ζ_p−1` kills `H^i_cont(Δ,M_∞)`; for every `b∈O_C`, the `O_C-modules R_∞/b` and `H^i_cont(Δ,R_∞/b)` have no nonzero m-torsion (CK Proposition 3.8). `(b)` For every `b∈O_C^♭∖{0}`, `R_∞^♭/b` and `H^i_cont(Δ,R_∞^♭/b)` have no nonzero `m^♭`-torsion (CK Lemma 3.12). (c) `Lη_{ζ_p−1}(e)`: `Lη_{ζ_p−1}RΓ_cont(Δ,R_∞)→Lη_{ζ_p−1}RΓ_proét(X_C^ad,Ô⁺)` is an isomorphism (CK Theorem 3.9). `(d)` The same holds for the edge map `e′` of any pro-(finite étale) affinoid perfectoid `Δ′-cover Spa(R′_∞[1/p],R′_∞)→X_C^ad` that refines the `Δ-cover` compatibly with a continuous surjection `Δ′→Δ` of profinite groups (CK Remark 3.10).

Standing hypotheses (SS). `X=Spf(R)` with an étale coordinate map as in CK (3.1.1); `R_∞`, `Δ` and `M_∞` are those of *Semistable perfectoid root tower* (§AI.6.1) and *Integral and nonintegral monomial splitting* (§AI.6.1), and `R_∞^♭` is the tilt of `R_∞`.

Edge map (CK §3.3): the Čech complex of `Ô⁺` for the cover is `RΓ_cont(Δ,R_∞)` (Scholze, p-adic Hodge theory for rigid-analytic varieties, 3.5, 3.7(iii) and 6.6, with its corrigendum), which gives `e`; by almost purity (loc. cit. 4.10(v); Layer AI.3) `m` kills the cohomology of Cone(e). Single summand (proof of CK Proposition 3.8): for a summand `S=O_C·t^a` of (3.2.1), CK Lemma 3.7 (BMS1 Lemma 7.3(ii); Layer AI.3) computes `H^i_cont(Δ,S)` as the cohomology of a tensor product of `d` complexes `O_C→O_C`, each multiplication by `ζ−1` for a p-power root of unity `ζ`; these are defined over a discrete valuation subring of `O_C`, so CK Lemma 3.5 (for a discrete valuation ring o inside a non-discrete valuation ring `O` of rank 1 with maximal ideal `M`, `(N⊗_o O)[M]=0`) gives (3.8.1). If `S` is nonintegral some `ζ` is not 1, and `ζ−1`, hence `ζ_p−1`, kills `H^i_cont(Δ,S)` ((3.8.2)). Completed sums and base change: group the summands by exact level into `M□_m` (*Normalized semistable monomial indices* (§AI.6.1)). CK Lemma 3.6 (for p-adically complete p-torsion-free continuous modules `M_j` whose `H^i_cont` are all p-torsion-free, or all killed by one power of `p`, `H^i_cont` of the p-adically completed direct sum injects into the product of the `H^i_cont(M_j)`) gives (3.8.3). `R` is R□-flat, so `H^i_cont(Δ,R⊗_{R□}M□_m)≅R⊗_{R□}H^i_cont(Δ,M□_m)` ((3.8.4)), and Lemma 3.6 again shows that `ζ_p−1` kills `H^i_cont(Δ,M_∞)`. For `b≠0` the summands of `R_∞/(b,p^n)` and the `Δ-action` on them are defined over discrete valuation subrings, so Lemmas 3.5 and 3.7 give the absence of m-torsion in `R_∞/b` and `H^i_cont(Δ,R_∞/b)`; the case `b=0` follows from the injection `H^i_cont(Δ,M_∞)→H^i_cont(Δ,M_∞/(ζ_p−1))` and from `H^i_cont(Δ,R)` being a direct sum of copies of `R`. This proves (a). `(b)`: one may assume `b∈m^♭` and, using Frobenius, that `b` divides `p^{1/p^∞}` in `O_C^♭`; then `R_∞^♭/b≅R_∞/b^♯ Δ-equivariantly` for some `b^♯∈O_C` (tilt of *Integral and nonintegral monomial splitting* (§AI.6.1), CK §3.11), and (a) applies. (c): put `M=H^i_cont(Δ,R_∞)=H^i_cont(Δ,R)⊕H^i_cont(Δ,M_∞)`. By (a), `M` has no nonzero m-torsion, and `M/(ζ_p−1)M=H^i_cont(Δ,R)/(ζ_p−1)⊕H^i_cont(Δ,M_∞)`, a finite direct sum of copies of `R/(ζ_p−1)` plus a submodule of `M`, has none either. Since `m` kills the kernel and cokernel of `H^i(e)`, CK Lemma 3.4 (BMS1 Lemma 8.11(i); Layer AI.1) gives `M/M[ζ_p−1]≅H^i(X_C^ad,Ô⁺)/H^i(X_C^ad,Ô⁺)[ζ_p−1]`, and these quotients compute the cohomology of `Lη_{ζ_p−1}` (*Cohomology of ideal décalage* (§AI.1.2)). CK's written proof checks the absence of m-torsion in `M/M[ζ_p−1]` instead of `M/(ζ_p−1)M`; the hypothesis of Lemma 3.4 is the latter, verified here from (a). `(d)`: by almost purity `m` kills the cohomology of Cone(e′) as well, so by the octahedral axiom it kills that of the cone of `RΓ_cont(Δ,R_∞)→RΓ_cont(Δ′,R′_∞)`; Lemma 3.4 applies to this map, with the same `M`, and combines with (c). (ČK (arXiv v3), §3.3, (3.3.1), p.11; ČK (arXiv v3), Lemma 3.5, p.12; ČK (arXiv v3), Lemma 3.6, p.12; ČK (arXiv v3), Lemma 3.7, p.12; ČK (arXiv v3), Proposition 3.8, p.12; ČK (arXiv v3), Theorem 3.9, p.13; the displayed isomorphism `Lη_{ζ_p−1}(e)` follows; ČK (arXiv v3), Theorem 3.9 (proof), p.13; ČK (arXiv v3), Remark 3.10, p.13; ČK (arXiv v3), Lemma 3.12, p.14). *Needs:* *Semistable perfectoid root tower* (§AI.6.1); *Normalized semistable monomial indices* (§AI.6.1); *Integral and nonintegral monomial splitting* (§AI.6.1); *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); AdicEtaleGeometry, A1; *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2); *Cohomology of ideal décalage* (§AI.1.2); *Algebraization and descent of semistable charts* (§AI.6.1).

**Checks.**

- For the torus chart `R=O_C{t^{±1}}` and `S=O_C·t^{1/p}`: the generator `δ` acts by `ζ_p`, so `H⁰_cont(Δ,S)=0` and `H¹_cont(Δ,S)=O_C/(ζ_p−1)`, which is killed by `ζ_p−1` and has no nonzero m-torsion. For `S=O_C·t^{1/p²}` one gets `O_C/(ζ_{p²}−1)`, killed by `ζ_{p²}−1`, which divides `ζ_p−1`.
- For `R=O_C{t^{±1}}`, `Lη_{ζ_p−1}RΓ_cont(Δ,R_∞)` has `H⁰=R` and `H¹≅R` (from the integral summand), so by (c) the same holds for `Lη_{ζ_p−1}RΓ_proét(X_C^ad,Ô⁺)`, in agreement with `H¹(Ω̃_𝔛)≅Ω¹{−1}`.
- The statement is integral: before `Lη_{ζ_p−1}` the kernel and cokernel of `H^i(e)` are only known to be killed by `m`.

**Nonintegral cohomology annihilation** (`Semistable.nonintegralAnnihilation`). For every `i∈Z`: (a) `μ` annihilates `H^i_cont(Δ,N_∞)` (CK Proposition 3.25); equivalently `Lη_μ` of the Koszul complex of `N_∞` on `δ₁−1,…,δ_d−1` vanishes. `(b) H^i_cont(Δ,A_inf(R_∞)/μ)` is p-torsion-free and p-adically complete, the natural maps `H^i_cont(Δ,A_inf(R_∞)/μ)⊗_{A_inf}A_inf/p^n→H^i_cont(Δ,A_inf(R_∞)/(μ,p^n))` are isomorphisms for `n>0`, and `H^i_cont(Δ,A_inf(R_∞)/(μ,p^n))` and `H^i_cont(Δ,A_inf(R_∞)/μ)` have no nonzero `W(m^♭)`-torsion (CK Proposition 3.19). (c) For `n,m≥0`, `H^i_cont(Δ,N_m/(μ,p^n))` is killed by `φ^{−m}(μ)` and is a flat `A_inf/(φ^{−m}(μ),p^n)`-module (CK Corollary 3.23). Part `(b)` is the input of the integral edge comparison (CK Theorem 3.20); part (a) removes the nonintegral summand.

Standing hypotheses (SS). `X=Spf(R)` with an étale coordinate map as in CK (3.1.1); `R_∞`, `Δ`, A(R) and `N_∞` are those of *Semistable perfectoid root tower* (§AI.6.1), *Integral A_inf chart lift* (§AI.6.1) and *Integral and nonintegral monomial splitting* (§AI.6.1). For `m≥0`, `N_m` is the `(p,μ)`-adically completed summand of `A_inf(R_∞)` formed by the monomials of exact level `m`, base changed to A(R) (CK §3.22); `N_0=A(R)` and `N_∞` is the completed direct sum of the `N_m` with `m>0`.

Single summand (proof of CK Proposition 3.19, (3.19.3)–(3.19.6)): for `S=A_inf·X^a` contributing to `N□_∞`, with weights `b_j` of (3.19.3) and exact level `m>0`, the Koszul description of continuous cohomology of `Δ≃ℤ_p^d` (CK Lemma 3.7 `=` BMS1 Lemma 7.3(ii); Layer AI.3) gives `H^i_cont(Δ,S/μ)` as a direct sum of copies of `A_inf/φ^{−m}(μ)`; it is p-torsion-free and `H^i_cont(Δ,S/μ)⊗A_inf/p^n≅H^i_cont(Δ,S/(μ,p^n))` (Stacks Project 061Z, 0662). Completed sums and base change (CK (3.19.7)–(3.19.10)): pass to `N□_∞/μ` by CK Lemma 3.6(i) (`H^i_cont` of a p-adically completed direct sum injects into the product), to `N_∞` by flatness of `A(R)/(μ,p^n)` over `A(R□)/(μ,p^n)` ((3.19.8)), and to the limit over `n` by Stacks Project 0D6K. On the summand A(R), `Δ` acts trivially modulo `μ` (*Integral A_inf chart lift* (§AI.6.1)) and `A(R)/(μ,p^n)` has no nonzero `W(m^♭)`-torsion (CK (3.14.1), from Lemmas 3.12 and 3.13). For `N_∞`, the absence of `W(m^♭)`-torsion in `H^i_cont(Δ,N_∞/(μ,p^n))` reduces by dévissage to `n=1`, where `N_∞/(μ,p)` is a direct summand of `R_∞^♭/μ` and CK Lemma 3.12 applies (*Integral structure-sheaf edge comparison* (§AI.6.2)). This proves `(b)`. (c): CK §3.22 and Corollary 3.23, from (3.19.5)–(3.19.6) for `N□_m`, the base change (3.19.8) and Lazard's theorem for the flat `A(R□)/(μ,p^n)-algebra A(R)/(μ,p^n)`. (a): CK Proposition 3.25. By Lemma 3.7 it suffices that `Lη_μ(K_{N_∞}(δ₁−1,…,δ_d−1))=0` ((3.25.1)). By `(b)` the cohomology of this Koszul complex modulo `μ` is p-torsion-free, so the base-change lemma for `Lη` (CK Lemma 3.24 `=` Bhatt, Specializing varieties…, 5.16; Layer AI.1; applied with `f=μ` and `g=ξ̃`, which is congruent to `p` modulo `μ`) identifies its reduction modulo `ξ̃` with `Lη_{ζ_p−1}` of the Koszul complex of `N_∞/ξ̃`. Since `φ⁻¹` maps `N_∞/ξ̃` isomorphically onto a direct summand of `N_∞/ξ≅M_∞` (*Integral and nonintegral monomial splitting* (§AI.6.1)), `ζ_p−1` kills the cohomology of that complex by CK Proposition 3.8 (*Integral structure-sheaf edge comparison* (§AI.6.2)), so both sides are acyclic. `N_∞` is `(p,μ)`-adically, hence `ξ̃`-adically complete (Stacks Project 090T), so the Koszul complex and its `Lη_μ` are derived `ξ̃`-complete (BMS1 Lemma 6.19; *Preservation of derived completeness* (§AI.1.5)), and the vanishing follows. (ČK (arXiv v3), Proposition 3.19, p.16; ČK (arXiv v3), Proposition 3.19 (last sentence), p.16; ČK (arXiv v3), Proposition 3.19 (proof), (3.19.5), p.17; ČK (arXiv v3), Corollary 3.23, p.19; ČK (arXiv v3), Proposition 3.25, p.19; ČK (arXiv v3), Proposition 3.25 (proof), p.19; ČK (arXiv v3), Lemma 3.24, p.19). *Needs:* *Integral and nonintegral monomial splitting* (§AI.6.1); *Normalized semistable monomial indices* (§AI.6.1); *Integral A_inf chart lift* (§AI.6.1); *Integral structure-sheaf edge comparison* (§AI.6.2); *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); AdicEtaleGeometry, A1; *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2).

**Checks.**

- A fractional branch eigencharacter is removed after `Lη_μ`; merely applying almost purity is insufficient.
- For the node chart `(r=d=1)` and `S=A_inf·X₁^{1/p} (a=(0,1/p), weight 1/p)`: `δ₁` acts on `S` by `[ε^{1/p}]`, so `H⁰_cont(Δ,S)=0` and `H¹_cont(Δ,S)=A_inf/([ε^{1/p}]−1)=A_inf/φ⁻¹(μ)`, which is nonzero, killed by `μ`, and hence removed by `Lη_μ`.

**Integral semistable local edge comparison** (`Semistable.localEdge`). The edge map `e` of CK (3.15.1) induces an isomorphism `Lη_μ(e)`: `Lη_μRΓ_cont(Δ,A_inf(R_∞))≃Lη_μRΓ_proét((Spf R)_C^ad,A_inf,X)` (CK Theorem 3.20). Moreover `Lη_μRΓ_cont(Δ,A_inf(R_∞))≅Lη_μRΓ_cont(Δ,A(R))` is represented by the Koszul complex `K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ)`. The comparison is compatible with refinement of the cover: for a continuous surjection `Δ′→Δ` of profinite groups and a pro-(finite étale) affinoid perfectoid `Δ′-cover Spa(R′_∞[1/p],R′_∞)` refining the `Δ-cover` compatibly, the edge map `e′` also becomes an isomorphism after `Lη_μ`, and so does `RΓ_cont(Δ,A_inf(R_∞))→RΓ_cont(Δ′,A_inf(R′_∞))` (CK Remark 3.21).

Standing hypotheses (SS). `X=Spf(R)` with an étale coordinate map as in CK (3.1.1).

Edge map (CK §3.15): the Čech complex of `A_inf,X` for the `Δ-cover` of *Semistable perfectoid root tower* (§AI.6.1) is `RΓ_cont(Δ,A_inf(R_∞))`, which gives `e`. By almost purity (Scholze, p-adic Hodge theory for rigid-analytic varieties, 6.5(ii); Layer AI.3) the Teichmüller elements `[m^♭]` kill the cohomology of Cone(e); these modules are derived p-adically complete (Bhatt–Scholze, The pro-étale topology for schemes, 3.4.4 and 3.4.14), so the ideal `W(m^♭)` kills them (CK Lemmas 3.16 and 3.17). By the projection formula (3.20.1) (Stacks Project 0944) and *Nonintegral cohomology annihilation* (§AI.6.2) `(b)`, the cohomology of `RΓ_cont(Δ,A_inf(R_∞))⊗^L A_inf/μ` has no nonzero `W(m^♭)`-torsion. The almost-to-integral criterion CK Lemma 3.18 (from Bhatt, Specializing varieties and their cohomology from characteristic 0 to characteristic `p`; supplied by Layer AI.1) then gives CK Theorem 3.20; *Derived décalage* (§AI.1.2) supplies `Lη_μ`. Koszul description (not part of Theorem 3.20; it is what CK does in the proof of Proposition 5.6): by (3.14.5) (*Integral and nonintegral monomial splitting* (§AI.6.1)) the left side splits as the sum of the parts of A(R) and of `N_∞`; `Lη_μ` of the `N_∞-part` vanishes by *Nonintegral cohomology annihilation* (§AI.6.2) (a); `Δ` acts trivially on `A(R)/μ` and A(R) is `μ`-torsion-free (*Integral A_inf chart lift* (§AI.6.1)), so by CK Lemma 3.7 the A(R)-part is `η_μK_{A(R)}(δ₁−1,…,δ_d−1)≅K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ)`. Refinements (CK Remark 3.21, under the conditions of Remark 3.10): by almost purity and the octahedral axiom `[m^♭]` kills the cohomology of the cone of `RΓ_cont(Δ,A_inf(R_∞))→RΓ_cont(Δ′,A_inf(R′_∞))`; Lemma 3.17 upgrades this to `W(m^♭)` and Lemma 3.18 applies to this map. (ČK (arXiv v3), Theorem 3.20, p.18; the displayed isomorphism `Lη_μ(e)` follows this line; ČK (arXiv v3), Theorem 3.20 (proof), p.18; ČK (arXiv v3), Lemma 3.16, p.16; ČK (arXiv v3), Lemma 3.18, p.16; ČK (arXiv v3), Proposition 3.25 (proof), (3.25.1), p.19; ČK (arXiv v3), Proposition 5.6 (proof), p.34; ČK (arXiv v3), Remark 3.21, p.18). *Needs:* *Nonintegral cohomology annihilation* (§AI.6.2); *Semistable perfectoid root tower* (§AI.6.1); *Integral and nonintegral monomial splitting* (§AI.6.1); *Integral A_inf chart lift* (§AI.6.1); *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); AdicEtaleGeometry, A1; *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2); *Derived décalage* (§AI.1.2); *The projection from the pro-étale site of the generic fibre* (§AI.3.1).

**Checks.**

- The comparison is integral; it must not be weakened to an almost quasi-isomorphism.
- For `R=O_C (d=0)` both sides are `A_inf` in degree 0. For the torus chart `R=O_C{t^{±1}}` the left side is `A_inf{X^{±1}}→A_inf{X^{±1}}` with differential `X^n↦(([ε]^n−1)/μ)·X^n`; `([ε]^n−1)/μ` is a unit when p∤n, so only the monomials with `p∣n` contribute to `H¹`, and the `n=0` part of `H¹` is `A_inf`.

**Semistable AΩ complex** (`Semistable.aOmega`). For `ν:X_C,proét^ad→𝔛_ét` define `AΩ_𝔛=Lη_μRν_*A_inf,X∈D^{≥0}(𝔛_ét,A_inf)` in the monoidal derived category of sheaves of EnhancedDerivedSheaves, E1. The semistable extension uses the same integral sheaf and décalage as Layer AI.3, now on the étale site of `𝔛` and the CK charts; the same formula with the Zariski site as target of `ν` defines `AΩ_{𝔛_Zar}`, the object used in BMS1. `AΩ_𝔛` is a commutative algebra object of `D(𝔛_ét,A_inf)`, contravariantly functorial for `O_C-morphisms` of formal schemes as in CK §1.5 and, semilinearly, for isomorphisms lying over a continuous automorphism of `O_C`; `RΓ_Ainf(𝔛)=RΓ(𝔛_ét,AΩ_𝔛)`, and `AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]`. Its presheaf version `AΩ^psh=Lη_μRν^psh_*A_inf,X`, on the site `𝔛^psh_ét` of connected affine étale opens admitting a coordinate map (1.5.1) with isomorphisms as coverings, satisfies `φ⁻¹AΩ^psh≅AΩ_𝔛` and `RΓ(𝔘,AΩ^psh)≅Lη_μRΓ_proét(𝔘_C^ad,A_inf,X)`, and is derived `ξ`-adically and `ξ̃`-adically complete. Derived `ξ-completeness` of the sheaf `AΩ_𝔛` and `AΩ^psh≅Rφ_*AΩ_𝔛` are not asserted here; they are *Derived completeness and sheaf property of AΩ* (§AI.6.3).

Standing hypotheses (SS). `𝔛` is as in CK §1.5, not required proper for this sheaf definition.

The API:

- `Semistable.aOmega.local`: For `𝔘=Spf(R)` in `𝔛^psh_ét`, `RΓ(𝔘,AΩ^psh)≅Lη_μRΓ_proét(𝔘_C^ad,A_inf,X)` (CK (4.1.3)), which by *Integral semistable local edge comparison* (§AI.6.2) is the Koszul complex `K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ)`; the right side does not involve the framing. That `RΓ(𝔘_ét,AΩ_𝔛)` is the same complex is *Derived completeness and sheaf property of AΩ* (§AI.6.3).
- `Semistable.aOmega.functorial`: An `O_C-morphism 𝔛′→𝔛` of formal schemes as in CK §1.5 induces a pullback map on `AΩ` and on `RΓ_Ainf`, compatible with products and satisfying identity/composition.
- `Semistable.aOmega.complete`: `AΩ^psh` is derived `ξ`-adically and `ξ̃`-adically complete (CK §4.1); this is preservation of derived completeness by `Lη` sectionwise, in the topos of sets, not commutation of décalage and completion. Derived `ξ-completeness` of the sheaf `AΩ_𝔛` is *Derived completeness and sheaf property of AΩ* (§AI.6.3).
- `Semistable.aOmega.smooth`: For a chart with `r=0` the local complex `Lη_μRΓ_cont(Δ,A_inf(R_∞))` is the Layer AI.3 toric complex with the same `Δ`, tower and coefficient maps. The global comparison of the étale-site `AΩ_𝔛` with the Zariski-site `AΩ_{𝔛_Zar}` used in BMS1 is CK Corollary 4.21, in *Derived completeness and sheaf property of AΩ* (§AI.6.3).
- `Semistable.aOmega.psh`: `φ⁻¹(AΩ^psh)≅AΩ_𝔛` for the morphism of topoi `φ` from `𝔛_ét` to `𝔛^psh_ét` (CK (4.1.2)).
- `Semistable.aOmega.invert_mu`: `AΩ_𝔛⊗^L_{A_inf}A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L_{A_inf}A_inf[1/μ]` (CK (2.2.7)).
- `Semistable.aOmega.zariski`: `AΩ_{𝔛_Zar}=Lη_μRν^Zar_*A_inf,X∈D^{≥0}(𝔛_Zar,A_inf)`, with `ν^Zar` the projection to the Zariski site (CK (2.2.4)); it is the object of BMS1. Its comparison with `AΩ_𝔛` is *Derived completeness and sheaf property of AΩ* (§AI.6.3).
- `Semistable.aOmega.semilinear`: Let `σ` be a continuous automorphism of `O_C` and `g:𝔛′→𝔛` an isomorphism of formal schemes lying over `Spf(σ)`. Then `W(σ^♭)` is an automorphism of `A_inf` commuting with `φ_A` and preserving the ideals `(μ)`, `(ξ)` and `(ξ̃)`, and pullback of period sheaves along the isomorphism of adic generic fibres induced by `g` gives a `W(σ^♭)-semilinear` isomorphism `RΓ_Ainf(𝔛)→RΓ_Ainf(𝔛′)`, compatible with composition. For `𝔛=𝔛₀⊗̂_{O_K}O_C` with `𝔛₀` a formal `O_K-scheme` and `σ∈G_K=Gal(K̄/K)`, taking `g=id⊗Spf(σ)` gives an `A_inf-semilinear` action of `G_K` on each `H^i_Ainf(𝔛)`. CK §8.1 obtains this action from the functoriality of §7.2, which is stated there for `O_C-morphisms` only.

Use the period sheaf `A_inf,X=W(Ô^{+,♭})` and the multiplicative pushforward from AI.3/E1; `ν` is the morphism of sites of CK (1.5.5), sending an étale `𝔘→𝔛` to its adic generic fibre (it preserves coverings, fibre products and final objects by Huber, Étale cohomology of rigid analytic varieties and adic spaces, 3.5.1). Define `AΩ_𝔛` by CK (2.2.3) and `AΩ_{𝔛_Zar}` by (2.2.4), with *Derived décalage* (§AI.1.2) for the ideal `(μ)` of the constant sheaf `A_inf`. Commutative algebra structure (not discussed in CK): `Rν_*` of the sheaf of rings `A_inf,X` is a commutative algebra object and `Lη_μ` is lax symmetric monoidal (BMS1 Proposition 6.7; *Lax symmetric monoidal structure* (§AI.1.3)), exactly as for the smooth case in BMS1 Definition 9.1; algebra objects are taken in the sense of EnhancedDerivedSheaves, E5:abstract (*Operadic algebras*). BMS1 proves the lax structure on the derived category; nothing beyond what *Lax symmetric monoidal structure* (§AI.1.3) supplies is used. Functoriality (CK §7.2) and inversion of `μ` (CK (2.2.7)): `Lη` commutes with pullback along flat morphisms of ringed topoi (BMS1 Lemma 6.14; Layer AI.1); this gives the pullback maps for `𝔛′→𝔛` and, for the localisation `A_inf→A_inf[1/μ]` where `Lη_μ` is the identity, the isomorphism `AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]`. The same argument applies to an isomorphism `𝔛′→𝔛` lying over a continuous automorphism `σ` of `O_C`: it induces an isomorphism of the pro-étale sites of the generic fibres under which `A_inf,X` pulls back to `A_inf,X′`, semilinearly over `W(σ^♭)`, and the ideal `(μ)` is stable under `W(σ^♭)` because it does not depend on the choice of `ε` (CK §2.1, §8.1). Presheaf version (CK §4.1): on `𝔛^psh_ét` every presheaf is a sheaf, `φ_*` is restriction, `φ⁻¹` is sheafification and `φ⁻¹∘φ_*≅id`; (4.1.2) follows from BMS1 Lemma 6.14 and (4.1.3) from the definition. `RΓ_proét(𝔘_C^ad,A_inf,X)` is derived `ξ-` and `ξ̃`-adically complete, and *Preservation of derived completeness* (§AI.1.5) (BMS1 Lemma 6.19), applied in the replete topos of sets, shows that `AΩ^psh` is. Local computation: for `𝔘=Spf(R)` in `𝔛^psh_ét`, (4.1.3) and *Integral semistable local edge comparison* (§AI.6.2) identify `RΓ(𝔘,AΩ^psh)` with the Koszul complex `K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ)`. (ČK (arXiv v3), §1.5, (1.5.5), p.5; ČK (arXiv v3), §2.2, (2.2.3), p.9; ČK (arXiv v3), §2.2, (2.2.4), p.9; ČK (arXiv v3), §2.2, (2.2.7), p.9; the display (2.2.7) follows these words; ČK (arXiv v3), §4.1, p.24; ČK (arXiv v3), §4.1, (4.1.2), p.25; ČK (arXiv v3), §4.1, p.25; ČK (arXiv v3), §7.2, p.68; BMS1 (Publ. IHÉS), Proposition 6.7, p.290; ČK (arXiv v3), §8.1, p.72). *Needs:* *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); AdicEtaleGeometry, A1; *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2); *Derived décalage* (§AI.1.2); *Lax symmetric monoidal structure* (§AI.1.3); *Integral semistable local edge comparison* (§AI.6.2); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); EnhancedDerivedSheaves, E5:abstract (*Operadic algebras*); *The projection from the pro-étale site of the generic fibre* (§AI.3.1).

**Checks.**

- `Semistable.aOmega.point`: For `SpfO_C` the global complex is `A_inf` concentrated in degree 0.
- `Semistable.aOmega.node`: For the node `T₀T₁=p^q (r=d=1)`, `RΓ(𝔘,AΩ^psh)` is the two-term complex `A(R□)→A(R□)` with differential `(δ₁−1)/μ`, where `δ₁` multiplies X₀ by `[ε]⁻¹` and X₁ by `[ε]`.
- `Semistable.aOmega.good_reduction`: For the torus chart `R□=O_C{t₁^{±1},…,t_d^{±1}} (r=0)`, `RΓ(𝔘,AΩ^psh)` is `K_{A(R□)}((δ₁−1)/μ,…,(δ_d−1)/μ)` with `δᵢ(Xᵢ)=[ε]Xᵢ`, the Layer AI.3 toric `AΩ` complex with identical coefficient maps.
- `Semistable.aOmega.decalage_torsion`: For the torus chart with `d=1` and p∤n, the `X^n-summand` of `H¹(𝔘,AΩ^psh)` is `A_inf/(([ε]^n−1)/μ)=0`, whereas the `X^n-summand` of `H¹_cont(Δ,A_inf(R_∞))` is `A_inf/([ε]^n−1)=A_inf/μ`, which is not killed by `W(m^♭)`: the Teichmüller lift of `(p^♭)^{1/p^j}` lies in `W(m^♭)` and, for `j` large, not in `(μ)`, because modulo `p` the element `μ` is `ε−1`, whose valuation is p/(p−1) times that of `p^♭`. Since `H¹_cont→H¹_proét(𝔘_C^ad,A_inf,X)` has kernel killed by `W(m^♭)`, the image of this summand is a nonzero `μ`-torsion submodule of `H¹_proét`. So without `Lη_μ` the first cohomology would have nonzero `μ`-torsion classes in every monomial degree `n` prime to p.
- On a chart with `r=0` the complex `RΓ(𝔘,AΩ^psh)≅Lη_μRΓ_cont(Δ,A_inf(R_∞))` agrees with the Layer AI.3 toric complex, including the map from pro-étale cochains.

**Semistable AΩ Frobenius** (`Semistable.aOmegaFrobenius`). The Frobenius automorphism of the period sheaf `A_inf,X` induces `φ_A^*AΩ_𝔛:=AΩ_𝔛⊗^L_{A_inf,φ_A}A_inf≃Lη_{ξ̃}AΩ_𝔛→AΩ_𝔛` in `D^{≥0}(𝔛_ét,A_inf)` (CK (2.2.5)). The linearized map becomes an isomorphism after inverting `ξ̃` (CK (2.2.6)); it need not be an integral equivalence. It is compatible with the pullback maps of aomega. Compatibility with products is not asserted: CK does not state it.

Standing hypotheses (SS). `𝔛` is as in CK §1.5; no properness is needed.

`φ_A(μ)=ξ̃·μ`, so `Lη_{φ_A(μ)}≅Lη_{ξ̃}∘Lη_μ` (BMS1 Lemma 6.11; Layer AI.1). `φ_A` is an automorphism of `A_inf` and the Frobenius of `A_inf,X` is an automorphism semilinear over it, so `φ_A^*AΩ_𝔛≅Lη_{φ_A(μ)}Rν_*A_inf,X≅Lη_{ξ̃}AΩ_𝔛` (CK (2.2.5); *Derived décalage* (§AI.1.2)). `AΩ_𝔛` lies in `D^{≥0}` and `H⁰(AΩ_𝔛)=ν_*A_inf,X` has no `ξ̃`-torsion, because `ξ̃` divides `φ_A(μ)` and `μ` is a nonzerodivisor on `A_inf` of a perfectoid ring (BMS1 Proposition 3.17(ii)); so BMS1 Lemma 6.10 (Layer AI.1) gives the canonical map `Lη_{ξ̃}AΩ_𝔛→AΩ_𝔛`. After inverting `ξ̃` the map is an isomorphism, since `Lη` commutes with the flat localisation `A_inf→A_inf[1/ξ̃]` (BMS1 Lemma 6.14; Layer AI.1) and `Lη_{ξ̃}` is the identity where `ξ̃` is invertible (CK (2.2.6)). Compatibility with pullback (not stated in CK): the three constructions above are defined on torsion-free representatives and commute with the exact pullback functors used for the functoriality of aomega. (ČK (arXiv v3), §2.1, p.8; ČK (arXiv v3), §2.2, (2.2.5), p.9; ČK (arXiv v3), §2.2, (2.2.6), p.9; the display (2.2.6) follows; ČK (arXiv v3), §7.2, p.68; BMS1 (Publ. IHÉS), Lemma 6.10, p.292; BMS1 (Publ. IHÉS), Lemma 6.11, p.292). *Needs:* *Semistable AΩ complex* (§AI.6.2); *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2); *Derived décalage* (§AI.1.2).

**Checks.**

- On the local Koszul model `K_{A(R)}((δ₁−1)/μ,…,(δ_d−1)/μ)=η_μK_{A(R)}(δ₁−1,…,δ_d−1)` of *Integral semistable local edge comparison* (§AI.6.2) the Frobenius acts in degree `j` by `ξ̃^j·φ` (an element `μ^j·x` is sent to `φ_A(μ)^j·φ(x)=μ^j·ξ̃^j·φ(x)`); it is an isomorphism only after inverting `ξ̃` and reduces modulo `μ` to `p^j·φ`, since `ξ̃≡p` modulo `μ`.

**Acyclicity of quasi-coherent sheaves on affine formal schemes** (`Semistable.affine_formal_acyclicity`). For an affine p-adic formal scheme Spf `R` with `R` p-adically complete and topologically of finite presentation over `O_C`, and a quasi-coherent sheaf attached to a p-adically complete R-module `M`, `H^i(Spf R, M^Δ) =` 0 for `i >` 0 and `H^0 = M`; the same holds on the étale site.

`R` and `M` as stated.

Reduce modulo `p^n`, where it is acyclicity of quasi-coherent sheaves on an affine scheme, and pass to the limit using the Mittag-Leffler property (Fujiwara–Kato I.1.1.23(2)). (ČK (arXiv v3), proofs of Corollary 4.6 and Proposition 5.13, printed pp.26 and 38). *Needs:* AdicSpacesPartIII, R2 (*The étale site of a formal scheme is the étale site of its special fibre; the generic-fibre functor on étale objects*).

### AI.6.3 Hodge–Tate and de Rham specializations

**Formal GAGA over a complete rank-one valuation ring** (`Semistable.valuation_formal_gaga`). Let `V` be a height-one valuation ring complete for a nonzero nonunit a, and `Y` a proper finitely presented V-scheme. Finitely presented `O_Y`-modules are equivalent to compatible systems of finitely presented modules on the `Y ⊗ V/a^n`, and compatible systems of locally free modules algebraize to locally free modules.

`V`, a and `Y` as stated; no noetherian hypothesis.

Reduce to the noetherian case by finite presentation and limit arguments, and apply Grothendieck's existence theorem in the form of Fujiwara–Kato, Foundations of rigid geometry I, I.10.1.2. (ČK (arXiv v3), Theorem 4.12 and Remark 4.13, printed p.29). *Needs:* AdicSpacesPartIII, F0 (*Grothendieck’s algebraization theorem (formal GAGA)*).

**Proper compactifications of standard semistable charts**. A standard chart of (SS) is an open of the p-adic completion of the base change to `O_C` of a proper flat scheme over the integral closure of `W(k̄)` in `C`, with Zariski-local semistable coordinates. Its relative nonsmooth locus has total-space codimension at least two, with the depth-two property needed for restriction of bundle morphisms.

Use the fixed `p^q` and its compatible roots of (SS). Construct the compactification over a finite extension of `W(k̄)` containing the chart constants, using a projective toric compactification and subdivisions of its boundary charts, then extend scalars to the integral closure and `O_C`. This construction includes the finite gluing data and the verification that every resulting boundary chart has a semistable coordinate equation; a projective closure alone does not supply this. The noetherian chart models are normal and satisfy the required depth bound. (ČK (arXiv v3), §4.15, pp.29–30, using the coordinates (1.5.2), p.4; EGA IV₂ 5.10.5 for depth). *Needs:* *Standard semistable chart ring* (§AI.6.1); *Algebraization and descent of semistable charts* (§AI.6.1); SchemeAndStackFoundations, §0.9 (`noetherian_approximation`, `finite_presentation_limits`).

**Checks.**

- The node `xy=p^q` embeds into `XY=p^q Z²`; on the charts at infinity its equation eliminates one coordinate and gives a smooth chart.
- Each inverted torus coordinate compactifies by `P¹`; its zero and infinity charts are smooth directions.
- For `r=0` the chart is smooth and the relative nonsmooth locus is empty, so the depth condition is vacuous.

**Extension of vector bundles across codimension two over a valuation base**. Restriction is fully faithful on vector bundles on the base change to `O_C` of the proper compactified standard semistable charts above, with the relative nonsmooth locus removed. Both bundles are constructed on the total space before applying full faithfulness.

For a locally noetherian normal total space, use SchemeAndStackFoundations §0.6 (`reflexive_extension_normal`, `coherent_hartogs`) when the complement has codimension at least two. For the specified valuation-base charts, prove the corresponding restriction isomorphism on Hom sheaves by noetherian approximation, retaining depth at least two along the complement in the total space; apply it to the two vector bundles and their inverse maps. No normal-fibre or fibrewise-codimension hypothesis is imposed in this application. This asserts uniqueness and extension of morphisms between existing bundles, without asserting that every bundle on the open extends as a bundle. (ČK (arXiv v3), §4.15, p.30; EGA IV₂ 5.10.5). *Needs:* SchemeAndStackFoundations, §§0.6, 0.9 (`reflexive_extension_normal`, `coherent_hartogs`, `noetherian_approximation`, `finite_presentation_limits`); *Proper compactifications of standard semistable charts* (§AI.6.3).

**Checks.**

- For `Spec(O_K[x,y]/(xy−π))`, the node has codimension two in the regular total space and codimension one in its nonnormal special fibre; the total-space theorem applies.
- On `Spec k[x,y]` minus the origin, every morphism between two free bundles extends uniquely by the depth-two calculation.
- On `Spec k[t]` minus the origin, multiplication by `t⁻¹` does not extend to a morphism `O→O`; codimension one is excluded.

**Log Hodge–Tate reduction** (`Semistable.hodgeTateComparison`). `AΩ_𝔛⊗^L_{A_inf,θ̃}O_C≃Ω̃_𝔛:=Lη_{ζ_p−1}Rν_*Ô_X⁺`, the décalage being for the ideal sheaf `(ζ_p−1)O_𝔛,ét` (CK Theorem 4.2). For every `i≥0` the `O_𝔛,ét-module H^i(Ω̃_𝔛)` is locally free, of rank binom(d,i) at a closed point of `𝔛_k̄` where `𝔛_k̄` has dimension `d`, and `H^0(Ω̃_𝔛)=O_𝔛` via `ν^♯` (CK Proposition 4.4); for `i>0` the cup product induces `∧^iH^1(Ω̃_𝔛)≅H^i(Ω̃_𝔛)` (CK Proposition 4.8). The map `Ω¹_{𝔛/O_C}{−1}→H^1(Ω̃_𝔛)` of CK (4.10.3), an isomorphism over the smooth locus `𝔛^sm`, extends uniquely from `𝔛^sm` to an isomorphism `Ω¹_{𝔛/O_C,log}{−1}≅H^1(Ω̃_𝔛)`, and this induces `Ω^i_{𝔛/O_C,log}{−i}≅H^i(Ω̃_𝔛)` for every `i≥0`, with multiplication corresponding to exterior product (CK Theorem 4.11). Here {1} denotes the tensor product with the free rank-one `O_C-module O_C{1}=lim_n Ω¹_{O_C/ℤ_p}[p^n]` (transition maps multiplication by `p`).

Standing hypotheses (SS). `𝔛` is as in CK §1.5 (no properness or quasi-compactness), with the log structure of *Divisorial semistable log structure* (§AI.6.1).

CK Theorem 4.2. The kernel of `θ̃` on the period sheaf is generated by the nonzerodivisor `ξ̃`, so the projection formula (Stacks Project 0944) gives `Rν_*A_inf,X⊗^L_{A_inf,θ̃}O_C≅Rν_*Ô⁺`; since `θ̃(μ)=ζ_p−1` this induces the map, and by aomega ((4.1.2)) it suffices to show that its presheaf version is an isomorphism on each `𝔘=Spf(R)` of `𝔛^psh_ét`. There *Nonintegral cohomology annihilation* (§AI.6.2) `(b)` with (3.20.1) shows that the cohomology of `RΓ_cont(Δ,A_inf(R_∞))⊗^L A_inf/μ` is p-torsion-free, so, `ξ̃` being congruent to `p` modulo `μ`, the base-change lemma for `Lη` (CK Lemma 3.24; Layer AI.1) gives `Lη_μRΓ_cont(Δ,A_inf(R_∞))⊗^L_{A_inf,θ̃}O_C≅Lη_{ζ_p−1}RΓ_cont(Δ,R_∞)`. The edge maps (3.3.1) and (3.15.1) are compatible, so *Integral semistable local edge comparison* (§AI.6.2) (CK Theorem 3.20) and *Integral structure-sheaf edge comparison* (§AI.6.2) (CK Theorem 3.9) conclude. CK Propositions 4.4 and 4.8. Étale locally, by CK Lemma 3.7 and *Integral structure-sheaf edge comparison* (§AI.6.2) (Proposition 3.8, Theorem 3.9), `H^i_cont(Δ,R_∞)` modulo its `(ζ_p−1)`-torsion is `H^i_cont(Δ,R)≅R^{binom(d,i)}`, compatibly with étale maps `R→R′` ((4.4.3)–(4.4.5)); this gives local freeness, and for `i=0` that `R=(R_∞)^Δ`, the complement `M_∞^Δ` being p-torsion-free and killed by `ζ_p−1`. The edge maps are compatible with cup products, and `H^i_cont(Δ,R)≅∧^i(R^d)` by BMS1 Lemmas 7.3 and 7.5 (Layer AI.3). CK §§4.9–4.10 and Theorem 4.11. The p-completed cotangent complex of `Ô⁺` over `ℤ_p` is `Ô⁺{1}[1]` ((4.9.1): BMS1 Lemma 3.14; the completed cotangent calculation used in ČK §4.9, p.28; Fontaine, Formes différentielles et modules de Tate des variétés abéliennes sur les corps locaux, Théorème 1′(ii)), and functoriality of the cotangent complex gives `Ω¹_{𝔛/O_C}{−1}→R¹ν_*Ô⁺→H^1(Ω̃_𝔛)` ((4.10.2)), whose restriction to `𝔛^sm` is an isomorphism onto `(ζ_p−1)·H^1(Ω̃_𝔛)` by the smooth case (BMS1 Proposition 8.15; Layer AI.4); dividing by `ζ_p−1` gives (4.10.3). For the extension (CK §4.15) uniqueness allows one to assume that `𝔛` is the chart, which is an open of the p-adic completion of a proper flat scheme `𝒳` over the integral closure of W(k̄) with Zariski-local coordinates (1.5.2). Formal GAGA over `O_C` (CK Theorem 4.12 and Remark 4.13, after Fujiwara–Kato; *Formal GAGA over a complete rank-one valuation ring*, §AI.6.3) algebraises (4.10.3) to an `O_{𝒳_{O_C}}`-module map `f:Ω¹_{𝒳_{O_C}/O_C}{−1}→H`, with `H` locally free; this is the only use of formal GAGA, and it serves (4.11.1) only. By adic GAGA and Scholze's isomorphism between `R¹ν_*Ô⁺[1/p]` and `Ω¹` on the smooth proper generic fibre (CK Claim 4.15.1), source and target of `f_C` are isomorphic vector bundles, so the determinant of the generically surjective `f_C` is a nowhere vanishing constant on each component and `f_C` is an isomorphism; hence `f` is an isomorphism over the smooth locus, whose complement has codimension `≥2`, restriction is fully faithful for the two already constructed vector bundles by *Extension of vector bundles across codimension two over a valuation base* (§AI.6.3), and it is identified with `Ω¹_log{−1}` using *Divisorial semistable log structure* (§AI.6.1) (Claims 1.6.1, 1.6.3) and log smoothness (Kato, Logarithmic structures of Fontaine–Illusie, 3.7(2) and 3.10; CR.5). Then (4.4.1) and Proposition 4.8 give (4.11.2). (ČK (arXiv v3), Theorem 4.2, (4.2.1), p.25; ČK (arXiv v3), Theorem 4.2 (proof), p.25; ČK (arXiv v3), Proposition 4.4, p.26; the rank and (4.4.1) follow in the same statement; ČK (arXiv v3), Proposition 4.8, p.27; ČK (arXiv v3), §4.10, p.28; ČK (arXiv v3), §4.10, (4.10.3), p.28; ČK (arXiv v3), Theorem 4.11, p.28; ČK (arXiv v3), Theorem 4.12, p.29; ČK (arXiv v3), §4.15, p.30; ČK (arXiv v3), Claim 4.15.1 (proof), p.30). *Needs:* *Semistable AΩ complex* (§AI.6.2); *Divisorial semistable log structure* (§AI.6.1); *Integral structure-sheaf edge comparison* (§AI.6.2); *Integral semistable local edge comparison* (§AI.6.2); *Nonintegral cohomology annihilation* (§AI.6.2); *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2); *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); AdicEtaleGeometry, A1; *Hodge–Tate specialization* (§AI.4.1); *Cotangent description of the first Hodge–Tate truncation* (§AI.4.1); *De Rham specialization* (§AI.4.3); *Bounded divided-power coefficient subrings* (§AI.4.3); *Toric décalage after crystalline coefficient change* (§AI.4.3); *Crystalline logarithmic coordinate change* (§AI.4.3); *Absolute A_crys comparison* (§AI.4.3); *Mu-inverted étale specialization* (§AI.4.4); *Algebraization and descent of semistable charts* (§AI.6.1); *Formal GAGA over a complete rank-one valuation ring* (§AI.6.3); *Proper compactifications of standard semistable charts* (§AI.6.3); *The first higher direct image of the completed structure sheaf* (§AI.3.1); *Extension of vector bundles across codimension two over a valuation base* (§AI.6.3); AdicSpacesPartIII, R3 (*Proper GAGA: comparison of coherent cohomology (Köpf)*); CrystallineCohomology, CR.5 (*Log de Rham complexes*); CrystallineCohomology, CR.5 (*Semistable chart differential formula*).

**Checks.**

- At `xy=π`, ordinary differentials are `(O dx⊕O dy)/(y dx+x dy)`: their fibre at the node has dimension two, although their generic rank is one. The log module has rank one with `dlog x+dlog y=0`; only it and `H` are vector bundles globally.

- For `Spf O_C`, the reduction has `H⁰=O_C` and no higher cohomology.
- For `xy=π`, the two locally free sheaves are compared off a total-space codimension-two locus; the special fibre is nonnormal, as allowed by the extension theorem.


**Log de Rham specialization** (`Semistable.logDeRhamComparison`). `AΩ_𝔛⊗^L_{A_inf,θ}O_C≃Ω^•_{𝔛/O_C,log}` in `D(𝔛_ét,O_C)` (CK Theorem 4.17). Under this identification the term in degree `i` is `Ω^i_{𝔛/O_C,log}` and the differential is the log de Rham differential, obtained as the Bockstein of the `θ̃-reduction`; in degree 0 it is `f↦df`. Consequently, for every `𝔛` as in CK §1.5, `RΓ_Ainf(𝔛)⊗^L_{A_inf,θ}O_C≃RΓ_logdR(𝔛/O_C):=RΓ(𝔛_ét,Ω^•_{𝔛/O_C,log})`, with the ordinary derived tensor product (CK Corollary 4.18). Compatibility of these identifications with products, as isomorphisms in `D(𝔛_ét,O_C)`, is not asserted. CK prove only a local form, which *Log crystalline and de Rham agreement* (§AI.6.4) uses: on the Koszul complexes `η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1)` the specialisation is represented by a map of differential graded algebras to `Ω^•_{Spf(R)/O_C,log}` that is `θ` in degree 0 (proof of CK Proposition 5.41, by BMS1 Lemmas 6.13 and 7.5).

Standing hypotheses (SS). `𝔛` is as in CK §1.5; neither properness nor quasi-compactness is needed.

Since `φ_A(μ)=ξ̃·μ`, *Semistable AΩ Frobenius* (§AI.6.2) gives `AΩ_𝔛⊗^L_{A_inf,θ}O_C≅(φ_A^*AΩ_𝔛)⊗^L_{A_inf,θ̃}O_C≅(Lη_{ξ̃}AΩ_𝔛)⊗^L_{A_inf,θ̃}O_C` (BMS1 Lemma 6.11), and *Reduction to the Bockstein complex* (§AI.1.4) (BMS1 Proposition 6.12) identifies the right side with the complex whose i-th term is `H^i(AΩ_𝔛⊗^L_{A_inf,θ̃}O_C)⊗(Ker θ̃/(Ker θ̃)²)^{⊗i}`, with Bockstein differentials. Ker `θ̃/(Ker θ̃)²≅O_C{1}`: the p-completed cotangent complex of `A_inf` over `ℤ_p` vanishes because `O_C^♭` is perfect, and that of `O_C` over `ℤ_p` is `O_C{1}[1]` by CK (4.9.1) for Spf `O_C`; hence that of `O_C` over `A_inf` (via `θ̃`) is `O_C{1}[1]` (Illusie, Complexe cotangent et déformations I, III.3.2.4(iii)). With *Log Hodge–Tate reduction* (§AI.6.3) ((4.2.1) and (4.11.2)) the i-th term is `Ω^i_{𝔛/O_C,log}`. Each `Ω^i_{𝔛/O_C,log}` is a vector bundle and no nonzero local section of a vector bundle vanishes on `𝔛^sm`, so the Bockstein differentials agree with those of `Ω^•_log` as soon as they do over `𝔛^sm`, where this is the smooth case with its differential (BMS1 Theorem 14.1(ii), or Bhatt, Specializing varieties and their cohomology from characteristic 0 to characteristic `p`, proof of Proposition 7.9; Layer AI.4). This proves CK Theorem 4.17. CK Corollary 4.18: apply `RΓ(𝔛_ét,−)` and the projection formula (Stacks Project 0944) for the perfect `A_inf-module O_C=A_inf/(ξ)` (EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*)); CR.5 supplies the log de Rham complex. (ČK (arXiv v3), Theorem 4.17, (4.17.1), p.30; ČK (arXiv v3), Theorem 4.17 (proof), p.30; ČK (arXiv v3), Theorem 4.17 (proof), p.31; ČK (arXiv v3), Corollary 4.18, p.31; no hypothesis on `𝔛` beyond §1.5; BMS1 (Publ. IHÉS), Theorem 14.1, pp.388–389; the clause on multiplicative structures there is for smooth `X` and is not carried over to the semistable case). *Needs:* *Log Hodge–Tate reduction* (§AI.6.3); *Semistable AΩ Frobenius* (§AI.6.2); *Reduction to the Bockstein complex* (§AI.1.4); *Hodge–Tate specialization* (§AI.4.1); *Cotangent description of the first Hodge–Tate truncation* (§AI.4.1); *De Rham specialization* (§AI.4.3); *Bounded divided-power coefficient subrings* (§AI.4.3); *Toric décalage after crystalline coefficient change* (§AI.4.3); *Crystalline logarithmic coordinate change* (§AI.4.3); *Absolute A_crys comparison* (§AI.4.3); *Mu-inverted étale specialization* (§AI.4.4); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); CrystallineCohomology, CR.5 (*Log de Rham complexes*); CrystallineCohomology, CR.5 (*Semistable chart differential formula*).

**Checks.**

- On `T₀T₁=p^q` the relation `dlogT₀+dlogT₁=0` is respected by the actual differential.
- For `𝔛=Spf O_C{t^{±1}}` the global statement reads `RΓ_Ainf(𝔛)⊗^L_θ O_C≃[O_C{t^{±1}}→O_C{t^{±1}}·dlog t]`, `Σaₙtⁿ↦Σn·aₙtⁿ·dlog t`; `H¹` modulo `p` is free of infinite rank over `O_C/p` on the classes of tⁿ·dlog `t` with `p∣n`, so no finiteness holds without properness.

**Derived completeness and sheaf property of AΩ** (`Semistable.aOmegaSheafCompleteness`). (a) If `𝔛` is affine, connected and admits a coordinate map (1.5.1), then for every `i` the presheaf assigning `H^i(𝔛′^ad_C,Ô⁺)/H^i(𝔛′^ad_C,Ô⁺)[ζ_p−1]` to an affine étale `𝔛-scheme 𝔛′` is a sheaf (CK Remark 4.5). `(b)` For every `𝔛` as in CK §1.5, `AΩ_𝔛` is derived `ξ`-adically complete and the adjunction map `AΩ^psh→Rφ_*(AΩ_𝔛)≅Rφ_*φ⁻¹(AΩ^psh)` is an isomorphism (CK Corollary 4.6). Hence `RΓ(𝔘_ét,AΩ_𝔛)≅Lη_μRΓ_proét(𝔘_C^ad,A_inf,X)` for every object 𝔘 of `𝔛^psh_ét`, and `RΓ_Ainf(𝔛)` is derived `ξ`-adically complete. (c) If the coordinate morphisms (1.5.1) exist Zariski locally on `𝔛` (for instance if `𝔛` is smooth over `O_C`, or Zariski locally arises from a strictly semistable scheme over a discrete valuation ring), then `H^i(Ω̃_{𝔛_Zar})≅H^i(Ω̃_𝔛)|_{𝔛_Zar}` for every `i`, the identifications of *Log Hodge–Tate reduction* (§AI.6.3) and *Log de Rham specialization* (§AI.6.3) hold for `AΩ_{𝔛_Zar}`, `AΩ_{𝔛_Zar}` is derived `ξ`-adically complete, and `RΓ(𝔛_Zar,AΩ_{𝔛_Zar})≅RΓ(𝔛_ét,AΩ_𝔛)` (CK Remarks 4.5 and 4.16, Theorems 4.2 and 4.17, Corollary 4.21, Example 4.22).

Standing hypotheses (SS). `𝔛` is as in CK §1.5; (a) and (c) carry the additional hypotheses stated in them. `AΩ^psh`, `φ` and `AΩ_{𝔛_Zar}` are those of aomega; `Ω̃_{𝔛_Zar}` is defined as `Ω̃_𝔛` with the Zariski site in place of the étale site.

(a): by the proof of CK Proposition 4.4 in *Log Hodge–Tate reduction* (§AI.6.3) ((4.4.3)–(4.4.5)), for `𝔛=Spf(R)` with coordinates and an affine étale `𝔛′=Spf(R′)`, `H^i(𝔛′^ad_C,Ô⁺)` modulo its `(ζ_p−1)`-torsion is the base change to `R′` of the free R□-module `H^i((Spf R□)^ad_C,Ô⁺)` modulo its `(ζ_p−1)`-torsion, compatibly with restriction; so the presheaf is the sheaf attached to a free module, namely `H^i(Ω̃_𝔛)`. `(b)`, reduction: `φ⁻¹∘Rφ_*≅id`, so it suffices to prove that `AΩ^psh→Rφ_*φ⁻¹(AΩ^psh)` is an isomorphism; the derived `ξ-completeness` of `AΩ^psh` (aomega) then passes to `AΩ_𝔛`. For this one may assume `𝔛` affine, connected, with a coordinate map. `AΩ^psh` is derived `ξ̃`-adically complete (aomega), so by the analogue for `𝔛^psh_ét` of BMS1 Lemma 9.15 (a derived limit of sheaves is a sheaf; Layer AI.3) and the five lemma it suffices that `AΩ^psh⊗^L A_inf/ξ̃→Rφ_*φ⁻¹(AΩ^psh⊗^L A_inf/ξ̃)` is an isomorphism. `(b)`, the case modulo `ξ̃`: by the proof of CK Theorem 4.2 (presheaf form (4.2.2), *Log Hodge–Tate reduction* (§AI.6.3)), `AΩ^psh⊗^L A_inf/ξ̃≅Lη_{ζ_p−1}Rφ_*Rν_*Ô⁺`, whose cohomology presheaves are the presheaves of (a); these are sheaves, and being vector bundles (CK Proposition 4.4) they have no higher cohomology on affine objects, so the adjunction map is an isomorphism. CK states only that the cohomology presheaves are sheaves; the vanishing of their higher cohomology on affines is left implicit there. Sections: `RΓ(𝔘_ét,AΩ_𝔛)=RΓ(𝔘,Rφ_*AΩ_𝔛)≅RΓ(𝔘,AΩ^psh)`, and (4.1.3) of aomega gives the formula; `RΓ(𝔛_ét,−)` commutes with derived limits (Stacks Project 0A07), so `RΓ_Ainf(𝔛)` is derived `ξ`-adically complete. (c): the sheaf property (a) for Zariski opens gives (4.5.1). The proofs of *Log Hodge–Tate reduction* (§AI.6.3) and *Log de Rham specialization* (§AI.6.3) apply with the Zariski presheaf site of opens admitting coordinates (CK Theorem 4.2, second sentence; Remark 4.16; Theorem 4.17, second sentence, whose proof CK describes as the same), and so do the two preceding steps, giving the Zariski analogue of Corollary 4.6. Then (CK Corollary 4.21) the reduction modulo `ξ` of `RΓ(𝔛_Zar,AΩ_{𝔛_Zar})→RΓ(𝔛_ét,AΩ_𝔛)` is `RΓ(𝔛_Zar,Ω^•_log)→RΓ(𝔛_ét,Ω^•_log)` by *Log de Rham specialization* (§AI.6.3), an isomorphism because the `Ω^i_log` are vector bundles; both sides being derived `ξ`-complete, the map is an isomorphism. (ČK (arXiv v3), Remark 4.5, p.26; ČK (arXiv v3), Corollary 4.6, p.26; the display (4.6.1) follows; ČK (arXiv v3), Corollary 4.6 (proof), p.26; ČK (arXiv v3), Corollary 4.6 (proof), p.27; ČK (arXiv v3), Theorem 4.2 (second sentence), p.25; ČK (arXiv v3), Remark 4.16, p.30; ČK (arXiv v3), Theorem 4.17 (second sentence), p.30; ČK (arXiv v3), Corollary 4.21, p.31; ČK (arXiv v3), Corollary 4.21 (proof), p.32; ČK (arXiv v3), Example 4.22, p.32; BMS1 (Publ. IHÉS), Lemma 9.15, p.331; CK uses its analogue for `𝔛^psh_ét`). *Needs:* *Semistable AΩ complex* (§AI.6.2); *Log Hodge–Tate reduction* (§AI.6.3); *Log de Rham specialization* (§AI.6.3); *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); AdicEtaleGeometry, A1; *Acyclicity of quasi-coherent sheaves on affine formal schemes* (§AI.6.2).

**Checks.**

- For `𝔛=Spf O_C`, `AΩ^psh` and `AΩ_𝔛` have global sections `A_inf` in degree 0, which is `ξ`-adically complete.
- For the torus chart `𝔘=Spf O_C{t^{±1}}`, `(b)` gives `RΓ(𝔘_ét,AΩ_𝔛)≅K_{A(R□)}((δ−1)/μ)`: `H⁰=A_inf` and the `X^n-summand` of `H¹` is `A_inf/(([ε]^n−1)/μ)`.
- (c) applies to every smooth `𝔛` (CK Example 4.22); there it identifies the étale-site `RΓ_Ainf(𝔛)` with the Zariski-site complex of BMS1.

**Finiteness and base change for proper formal schemes over O_C** (`Semistable.proper_formal_base_change`). For a proper flat p-adic formal scheme `𝔛` over `O_C` (resp. over `O_K`) and a coherent `O_𝔛-module F`, `RΓ(𝔛, F)` is a perfect complex of `O_C`-modules (resp. `O_K`-modules); for `𝔛 = 𝔛₀ ⊗̂_{O_K} O_C`, `RΓ(𝔛, F₀ ⊗ O_𝔛) ≅ RΓ(𝔛₀, F₀) ⊗^L_{O_K} O_C`; and for locally free `F`, `RΓ(𝔛, F)[1/p] ≅ RΓ(X^ad, F^ad)`, so `RΓ_logdR(𝔛/O_C) ⊗ C ≅ RΓ_dR(X^ad/C)`.

`𝔛` proper flat over `O_C` or `O_K` as stated.

Finiteness: the direct image theorem in formal geometry over a coherent complete base (Ullrich 5.3), using coherence of `O_C`. Base change from `O_K` to `O_C`: the comparison theorem (EGA III 4.1.7) with limit arguments, or Fujiwara–Kato I.9.2.1; `O_K → O_C` is flat. Generic fibre: acyclicity of coherent sheaves on affinoids and Čech computation on an affine cover. (ČK (arXiv v3), Remark 4.19 and Corollary 4.20, printed p.31; ČK (arXiv v3), §6.6, Theorem 6.6 and its proof, printed pp.66–67). *Needs:* AdicSpacesPartIII, R3 (*Proper GAGA: comparison of coherent cohomology (Köpf)*); AdicSpacesPartIII, R2 (*For formal O_K-schemes locally of tf presentation, d(X) is the adic space of Raynaud's rigid generic fibre*); *Formal GAGA over a complete rank-one valuation ring* (§AI.6.3); *Coherence of Witt vectors of perfectoid integers* (§AI.0.3).

**Perfect semistable A_inf cohomology** (`Semistable.properPerfectness`). If `𝔛` is proper over `O_C`, `RΓ_Ainf(𝔛)` is a perfect `A_inf-complex` (CK Corollary 4.20). If moreover `𝔛_k̄` has dimension at most `d`, then `H^i_Ainf(𝔛)=0` for `i∉[0,2d]` (CK Theorem 7.4, under CK §7.1) and `RΓ_Ainf(𝔛)` is represented by a complex of finite free `A_inf`-modules in degrees 0,…,2d. This does not imply that its cohomology modules are free.

Standing hypotheses (SS). `𝔛` is proper over `O_C`; this is needed for both assertions. The bound dim `𝔛_k̄≤d` is needed only for the range assertion (CK §7.1 assumes `𝔛_k̄` purely d-dimensional).

By *Log de Rham specialization* (§AI.6.3) (CK Corollary 4.18), `RΓ_Ainf(𝔛)⊗^L_{A_inf}A_inf/ξ≅RΓ_logdR(𝔛/O_C)`. The sheaves `Ω^i_{𝔛/O_C,log}` are vector bundles (CR.5), so by the finiteness theorem for proper formal schemes over `O_C` (Ullrich, The direct image theorem in formal and rigid geometry, 5.3) and the Hodge–de Rham spectral sequence the `O_C-modules H^j(RΓ_logdR(𝔛/O_C))` are finitely presented, hence perfect (Stacks Project 0ASP), and `RΓ_logdR(𝔛/O_C)` is a perfect `O_C-complex` (Stacks Project 066U). `RΓ_Ainf(𝔛)` is derived `ξ`-adically complete (*Derived completeness and sheaf property of AΩ* (§AI.6.3), CK Corollary 4.6). A derived `ξ`-complete complex whose reduction modulo `ξ` is perfect is perfect (Stacks Project 09AW; Layer AI.5). This is CK Corollary 4.20. Formal GAGA is not used in this proof; it enters only through *Log Hodge–Tate reduction* (§AI.6.3). Range. The vanishing of `H^i_Ainf(𝔛)` outside [0,2d] is CK Theorem 7.4. The finite free representative is not in CK; it follows thus: `A_inf` is local with residue field k̄, and by Corollary 4.18 and base change through `O_C/p (𝔛⊗O_C/p` is a quasi-compact separated scheme, flat over `O_C/p`, and the `Ω^i_log` are flat) `RΓ_Ainf(𝔛)⊗^L_{A_inf}k̄≅RΓ(𝔛_k̄,Ω^•_{𝔛_k̄/k̄,log})`, which lies in degrees [0,2d] because `Ω^i_log` vanishes for `i>d` and coherent cohomology of `𝔛_k̄` vanishes above its dimension. A perfect complex over a local ring is represented by a bounded complex of finite free modules whose differentials vanish modulo the maximal ideal, the rank in degree `i` being the dimension of `H^i` of its reduction to the residue field (Layer AI.5). (ČK (arXiv v3), Corollary 4.20, p.31; ČK (arXiv v3), Corollary 4.20 (proof), p.31; ČK (arXiv v3), §7.1, p.68; ČK (arXiv v3), Theorem 7.4, p.69; ČK (arXiv v3), Theorem 7.4 (proof), p.69). *Needs:* *Derived completeness and sheaf property of AΩ* (§AI.6.3); *Log de Rham specialization* (§AI.6.3); *Perfectness of finitely presented A_inf modules* (§AI.2.1); *A_inf module structure theorem* (§AI.2.1); *Primitive rational crystalline Frobenius input* (§AI.5.1); *Length increase under Witt specialization* (§AI.5.2); *Rank and torsion-length comparison* (§AI.5.2); *Finite presentation and adjacent-degree freeness* (§AI.5.2); *p-local freeness from two period realizations* (§AI.2.1); *Cohomology finiteness from period realizations* (§AI.5.2); CrystallineCohomology, CR.5; *Finiteness and base change for proper formal schemes over O_C* (§AI.6.3).

**Checks.**

- A perfect two-term multiplication-by-p complex has torsion cohomology; the theorem must allow it.
- Properness is necessary: for `𝔛=Spf O_C{t^{±1}}`, the `θ-specialisation` of `RΓ_Ainf(𝔛)` has `H¹` whose reduction modulo `p` is free of infinite rank over `O_C/p` (*Log de Rham specialization* (§AI.6.3)), so `RΓ_Ainf(𝔛)` is not perfect.

### AI.6.4 Logarithmic crystalline specialization

**Finite-level crystalline period rings A_cris^(m)** (`Semistable.finiteLevelAcris`). The absolute rings `A_cris^(m)` (the p-adic completion of the `A_inf-subalgebra A_cris^{0,(m)} ⊂ A_inf[1/p]` generated by the `ξ^s/s!` with `s ≤ m`) are those of *Bounded divided-power coefficient subrings* (§AI.4.3); thus `A_cris^{0,(m)} ⊂ A_cris^0`, `A_cris^(m) = A_inf` for `m < p`, `A_cris^0` is the union of the `A_cris^{0,(m)}`, and `A_cris` is the p-adic completion of `colim_m A_cris^(m)` (ČK (5.1.1)). In the local setup of ČK §3.1 define the relative rings `A_cris^(m)(R) :=` A(R) `⊗̂_{A_inf} A_cris^(m)` and `A_cris^(m)(R_∞) := A_inf(R_∞) ⊗̂_{A_inf} A_cris^(m)`, the completions being `(p, μ)`-adic, equivalently p-adic if `m ≥ p` (ČK §3.27). The absolute rings carry `θ:A_cris^(m)→O_C`; the relative rings carry `θ:A_cris^(m)(R)→R` and `θ:A_cris^(m)(R_∞)→R_∞`, extending the corresponding untilt augmentations. All carry Frobenius endomorphisms compatible with each other and with varying `m`, and `Δ` acts continuously, Frobenius-equivariantly and `A_cris^(m)`-linearly on `A_cris^(m)(R)` and `A_cris^(m)(R_∞)`.

Standing hypotheses (SS). `m≥1` is an integer. For the relative rings: `X=Spf(R)` with an étale coordinate map as in CK (3.1.1), with A(R) of *Integral A_inf chart lift* (§AI.6.1) and `A_inf(R_∞)` of *Integral and nonintegral monomial splitting* (§AI.6.1).

The API:

- `Semistable.finiteLevelAcris.small`: For `m<p`: `A_cris^{0,(m)}=A_inf`, `A_cris^(m)=A_inf`, `A_cris^(m)(R)=A(R)` and `A_cris^(m)(R_∞)=A_inf(R_∞)`.
- `Semistable.finiteLevelAcris.topology`: For `m≥p`: `μ^p/p!∈A_cris^(m)`, so the p-adic and `(p,μ)`-adic topologies of `A_cris^(m)` agree, and for each `n` one has `A_cris^(m)/p^n=A_cris^(m)/(p^n,μ^{n′})` for `n′` large.
- `Semistable.finiteLevelAcris.intertwined`: The systems of ideals `(p^nA_cris^(m))_n` and `({x:μx∈p^nA_cris^(m)})_n` are intertwined; equivalently, for every `n` the map `(A_cris^(m)/p^{n′})[μ]→A_cris^(m)/p^n` vanishes for `n′` large (CK (3.26.2)). The same holds for `A_cris^(m)(R□_∞)` and `A_cris^(m)(R_∞)`.
- `Semistable.finiteLevelAcris.mu_torsion_free`: `A_cris^(m)` and `A_cris^(m)(R_∞)` are p-torsion-free and `μ`-torsion-free, and `A_cris^(m)/μ` and `A_cris^(m)(R_∞)/μ` are p-adically complete (CK (3.26.4), (3.27.2)).
- `Semistable.finiteLevelAcris.theta`: `θ:A_inf→O_C` extends to a surjection `θ:A_cris^(m)→O_C` (CK (3.26.1)), compatibly in `m`. The relative augmentations are `θ:A_cris^(m)(R)→R` and `θ:A_cris^(m)(R_∞)→R_∞`, over the absolute `θ`; the square with `R→R_∞` commutes.
- `Semistable.finiteLevelAcris.frobenius`: `φ_A` preserves `A_cris^{0,(m)}` and induces a Frobenius endomorphism of `A_cris^(m)` which, through `θ`, is compatible with the absolute Frobenius of `O_C/p`; `A_cris^(m)(R)` and `A_cris^(m)(R_∞)` carry compatible `A_cris^(m)-semilinear` Frobenius endomorphisms, compatible as `m` varies.
- `Semistable.finiteLevelAcris.monomials`: `A_cris^(m)(R□_∞)` is the `(p,μ)`-adically completed direct sum of `A_cris^(m)·X^a` over the normalized exponents (CK (3.27.1)); `A_cris^(m)(R_∞)` is `(p,μ)`-adically formally étale over it, and `A_cris^(m)(R)` is a direct summand of `A_cris^(m)(R_∞)` as an `A_cris^(m)(R)`-module.
- `Semistable.finiteLevelAcris.delta_trivial_mod_mu`: `Δ` acts continuously, Frobenius-equivariantly and `A_cris^(m)`-linearly on `A_cris^(m)(R)` and `A_cris^(m)(R_∞)`. For `δ∈Δ` the endomorphism `(δ−1)/μ` of A(R) induces an `A_cris^(m)`-linear endomorphism `(δ−1)/μ` of `A_cris^(m)(R)` with `δ=1+μ·(δ−1)/μ`; hence `Δ` acts trivially on `A_cris^(m)(R)/μ`.
- `Semistable.finiteLevelAcris.no_almost_torsion`: For `m≥p`, `A_cris^(m)(R_∞)/(μ,p^n)` for every `n` and `A_cris^(m)(R_∞)/μ` have no nonzero `W(m^♭)`-torsion (CK Proposition 3.29); for `m<p` this is CK (3.14.1).
- `Semistable.finiteLevelAcris.colimit`: `A_cris` is the p-adic completion of `colim_m A_cris^(m)`, Frobenius-equivariantly and compatibly with the maps `θ` (CK (5.1.1)).
- `Semistable.finiteLevelAcris.injective`: For an affinoid perfectoid `Spa(R′_∞[1/p],R′_∞)` over `Spa(C,O_C)` and `m≥1` the maps `A_cris^{0,(m)}(R′_∞)→A_cris^(m)(R′_∞)→A_cris(R′_∞)→B_dR⁺(R′_∞)=(A_inf(R′_∞)[1/p])^ (ξ-adic completion)` are injective; in particular none of these rings has nonzero `μ`-torsion, `μ/ξ` being a unit of `B_dR⁺(R′_∞)` (CK Proposition 5.36).

Definition and first properties (CK §3.26): `A_cris^{0,(m)}` is p-torsion-free as a subring of `A_inf[1/p]`, hence so is `A_cris^(m)`; for `m<p` the generators lie in `A_inf` because s! is a p-adic unit for `s<p`; for `m≥p`, `μ=ξ·φ_A⁻¹(μ)` gives `μ^p/p!=(ξ^p/p!)·φ_A⁻¹(μ)^p∈A_cris^{0,(m)}`, so `μ^p∈pA_cris^(m)` and the p-adic and `(p,μ)`-adic topologies agree. `θ` extends because `θ(ξ)=0` (Layer AI.0:integral). (3.26.2) is BMS1 Lemma 12.8(ii) (Layer AI.4); taking the inverse limit over `n` of the exact sequences `0→(A_cris^(m)/p^n)[μ]→A_cris^(m)/p^n→A_cris^(m)/p^n→A_cris^(m)/(μ,p^n)→0` ((3.26.3)) gives (3.26.4). Frobenius (CK §3.26): `φ_A(ξ)=ξ̃` is congruent to `ξ^p` modulo `p`, and for `m≥p`, `ξ^p=p!·(ξ^p/p!)∈pA_cris^{0,(m)}`; hence `ξ̃∈pA_cris^{0,(m)}`, `ξ̃^s/s!∈A_cris^{0,(m)}` for all `s`, and `φ_A` preserves `A_cris^{0,(m)}`. Relative rings (CK §3.27): the monomial decomposition of `A_inf(R□_∞)` (*Integral and nonintegral monomial splitting* (§AI.6.1)) gives (3.27.1), and `A_cris^(m)(R_∞)` is `(p,μ)`-adically formally étale over `A_cris^(m)(R□_∞)`; so (3.26.2) holds for both, (3.27.2) follows as (3.26.4) did, and `A_cris^(m)(R_∞)` is p-torsion-free. By (3.14.5), `A_cris^(m)(R)` is a direct summand of `A_cris^(m)(R_∞)`. The Frobenius, the `Δ-action` and the endomorphisms `(δ−1)/μ` come from *Integral A_inf chart lift* (§AI.6.1) by base change; for `m<p`, CK Lemma 3.13 gives `A_cris^(m)(R)=A(R)` and `A_cris^(m)(R_∞)=A_inf(R_∞)`. CK Proposition 3.29 `(m≥p)`: `ℤ_p[[T]]→A_inf`, `T↦[ε^{1/p}]−1`, is faithfully flat (BMS1 Remark 4.31), and `A_cris^(m)(R_∞)/(μ,p^n)` is the base change of a module `M` over `ℤ_p[[T]]/((T+1)^p−1,p^n)` along the flat map to `A_inf(R_∞)/(μ,p^n)` (CK Lemma 3.13); so its `φ_A⁻¹(μ)`-torsion is the base change of M[T], and filtering M[T] p-adically reduces the claim to `R_∞^♭/φ_A⁻¹(μ)` having no nonzero `m^♭`-torsion, which is *Integral structure-sheaf edge comparison* (§AI.6.2) `(b)`. The statement for `A_cris^(m)(R_∞)/μ` follows by p-adic completeness ((3.27.2)). Colimit (CK (5.1.1)): `A_cris^0` is the union of the `A_cris^{0,(m)}` by definition, and p-adic completion gives `A_cris`; CR.0 supplies `A_cris^0` as the divided power envelope of `A_inf→O_C/p` and `A_cris` as its p-adic completion (CK §5.1). General affinoid perfectoid `R′_∞` (CK §5.19, §5.35, Proposition 5.36): `A_inf(R′_∞)` is `(p,μ)`-adically formally flat over `A_inf` (CK Lemma 3.13), which gives p-torsion-freeness, and (3.26.2), (3.26.3) give `μ-torsion-freeness` and the completeness of the quotient by `μ`. Since `(p,ξ)` is a regular sequence on `A_inf(R′_∞)`, the quotient of `A_inf(R′_∞)[T^n/n!]_{n≥1}` by `A_inf(R′_∞)[T^n/n!]_{m≥n≥1}` has no `(T−ξ)`-torsion, which gives (5.35.1) and (5.35.2). Injectivity: `A_inf(R′_∞)[1/p]` is `ξ`-adically separated, so it and `A_cris^{0,(m)}(R′_∞)` inject into `B_dR⁺(R′_∞)`. For `A_cris(R′_∞)` use the ideals `Fil_n⁰` of `A_cris⁰(R′_∞)` generated by the `ξ^{n′}/n′!` with `n′≥n`: each quotient `A_cris⁰(R′_∞)/Fil_n⁰` is p-torsion-free and p-adically complete (Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, A2.9(2), whose proof applies to `R′_∞`), the filtration is separated modulo `p` by the explicit description (5.36.4) of `A_cris⁰(R′_∞)/p`, hence its completion is a separated filtration of `A_cris(R′_∞)`, and `A_cris⁰(R′_∞)/Fil_n⁰` injects into `B_dR⁺(R′_∞)/ξ^n`. For `A_cris^(m)(R′_∞)→A_cris(R′_∞)` the same argument is run with the induced filtration of `A_cris^{0,(m)}(R′_∞)`: the kernel lies in `p·A_cris^(m)(R′_∞)`, and `A_cris(R′_∞)` is p-torsion-free while `A_cris^(m)(R′_∞)` is p-adically separated. (ČK (arXiv v3), §3.26, p.19; ČK (arXiv v3), §3.26, p.20; ČK (arXiv v3), §3.26, (3.26.4), p.20; ČK (arXiv v3), §3.27, (3.27.2), p.20; ČK (arXiv v3), §3.27, p.20; ČK (arXiv v3), Proposition 3.29, p.21; ČK (arXiv v3), §5.1, (5.1.1), p.32; the display (5.1.1) precedes this line; BMS1 (Publ. IHÉS), Lemma 12.8, p.364; part (ii) of that lemma is (3.26.2); ČK (arXiv v3), §5.19, (5.19.3), p.42; ČK (arXiv v3), §5.35, p.52; (5.35.1) and (5.35.2) follow; ČK (arXiv v3), Proposition 5.36, p.52). *Needs:* *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); *Semistable perfectoid root tower* (§AI.6.1); *Integral A_inf chart lift* (§AI.6.1); *Integral and nonintegral monomial splitting* (§AI.6.1); *Integral structure-sheaf edge comparison* (§AI.6.2); *Hodge–Tate specialization* (§AI.4.1); *Cotangent description of the first Hodge–Tate truncation* (§AI.4.1); *De Rham specialization* (§AI.4.3); *Bounded divided-power coefficient subrings* (§AI.4.3); *Toric décalage after crystalline coefficient change* (§AI.4.3); *Crystalline logarithmic coordinate change* (§AI.4.3); *Absolute A_crys comparison* (§AI.4.3); *Mu-inverted étale specialization* (§AI.4.4); DerivedDeRhamCohomology, §PD.6 (base-compatible divided power envelopes); DerivedDeRhamCohomology, §PD.7 (*The crystalline period ring A_cris of a p-adically complete ring*).

**Checks.**

- `Semistable.finiteLevelAcris.relative_theta`: For `R=O_C⟨T^{±1}⟩`, `θ` sends the relative lifted coordinate `X` to `T` in `R`, and its tower lift to the compatible coordinate in `R_∞`. The target is the whole relative ring `R` (respectively `R_∞`), rather than evaluation at an `O_C-valued` point.
- `Semistable.finiteLevelAcris.below_p`: For `m<p` every generator `ξ^s/s!` with `s≤m` lies in `A_inf`, since s! is a unit of `ℤ_p`; hence `A_cris^{0,(m)}=A_inf`.
- `Semistable.finiteLevelAcris.first_divided_power`: `ξ^p/p!` lies in `A_cris^{0,(p)}` but not in `A_inf`: `A_inf/p=O_C^♭` is a domain in which the image of `ξ` is nonzero, so `ξ^p` is not divisible by `p` in `A_inf`. Moreover `A_cris^{0,(p)}≅A_inf[T]/(p!·T−ξ^p)` via `T↦ξ^p/p!`.
- `Semistable.finiteLevelAcris.mu_divided_power`: For `m≥p`: `μ=ξ·φ_A⁻¹(μ)` gives `μ^p/p!=(ξ^p/p!)·φ_A⁻¹(μ)^p∈A_cris^{0,(m)}`, hence `μ^p∈p·A_cris^(m)`.
- `Semistable.finiteLevelAcris.frobenius_xi`: For `m≥p`: `ξ̃=φ_A(ξ)` is congruent to `ξ^p` modulo `p·A_inf` and `ξ^p=p!·(ξ^p/p!)`, so `ξ̃/p∈A_cris^{0,(m)}` and `φ_A(ξ^s/s!)=(p^s/s!)·(ξ̃/p)^s∈A_cris^{0,(m)}` for every `s`.
- `Semistable.finiteLevelAcris.mod_p_torsion`: `A_cris^(p)/p≅O_C^♭[T]/(ξ̄^p)`, with `ξ̄=(ε^{1/p}−1)^{p−1}` the image of `ξ`; the image `μ̄=(ε^{1/p}−1)^p` of `μ` satisfies `μ̄^{p−1}=ξ̄^p=0`, so `A_cris^(p)/p` has nonzero `μ`-torsion (the class of 1 if `p=2`, of `μ̄^{p−2}` if `p>2`), while `A_cris^(p)` itself is `μ`-torsion-free.
- `Semistable.finiteLevelAcris.small_not_p_adic`: For `m<p` the p-adic and `(p,μ)`-adic topologies of `A_cris^(m)=A_inf` differ: no power of `μ` is divisible by `p`, because the image `ε−1` of `μ` in the domain `O_C^♭` is nonzero. So the statements made for `m≥p` with p-adic completions do not extend to `m<p` without replacing them by `(p,μ)`-adic ones.
- For `m<p` the construction returns `A_inf`, A(R) and `A_inf(R_∞)`.
- For `m≥p` the p-adic and `(p,μ)`-adic topologies of `A_cris^(m)` agree, and `A_cris^(m)/p` has nonzero `μ`-torsion although `A_cris^(m)` is `μ`-torsion-free; this is why (3.26.2) is needed to pass to the limit.

**Finite PD décalage base change** (`Semistable.finitePDBaseChange`). Let `A_cris^(m)`, `A_cris^(m)(R)` and `A_cris^(m)(R_∞)=A_inf(R_∞)⊗̂_{A_inf}A_cris^(m)` be as in *Finite-level crystalline period rings A_cris^(m)* (§AI.6.4). For every `m≥p`: (a) the base change `e⊗̂^L A_cris^(m)`: `RΓ_cont(Δ,A_cris^(m)(R_∞))→RΓ_proét(X_C^ad,A_inf,X)⊗̂^L_{A_inf}A_cris^(m)` of the edge map (CK (3.28.1)) becomes an isomorphism after `Lη_μ` (CK Theorem 3.34); `(b)` the natural map `(Lη_μRΓ_cont(Δ,A_inf(R_∞)))⊗̂^L_{A_inf}A_cris^(m)→Lη_μRΓ_cont(Δ,A_cris^(m)(R_∞))` is an isomorphism, and both sides are the Koszul complex `K_{A_cris^(m)(R)}((δ₁−1)/μ,…,(δ_d−1)/μ)` (proof of CK Proposition 5.6); (c) consequently `Lη_μ(RΓ_proét(X_C^ad,A_inf,X))⊗̂^L_{A_inf}A_cris^(m)≃Lη_μ(RΓ_proét(X_C^ad,A_inf,X)⊗̂^L_{A_inf}A_cris^(m))` (CK Proposition 5.6). The target of (a) is a completed tensor product of the cohomology of `A_inf,X`, not the cohomology of a sheaf of rings `A_cris^(m)` on the pro-étale site.

Standing hypotheses (SS). `X=Spf(R)` with an étale coordinate map as in CK (3.1.1) (CK §5.5 moreover assumes `X` connected); `m≥p`; `⊗̂^L` is the derived p-adic completion of the derived tensor product, as in CK (1.7.1); no unrestricted `Lη/tensor` commutation is asserted.

Base change of the edge map (CK §3.28): for `m≥p` the projection formula (Stacks Project 0944) with CK Lemmas 3.7 and 3.13 gives `RΓ_cont(Δ,A_inf(R_∞))⊗̂^L_{A_inf}A_cris^(m)≅RΓ_cont(Δ,A_cris^(m)(R_∞))`, whence the map (3.28.1); the completed tensor products are formed with EnhancedDerivedSheaves, E4 (*Completed sheaf tensor product*) in the topos of sets. `[m^♭]` kills the cohomology of `Cone(e)⊗^L A_cris^(m)/p^n`, hence of the completed cone (Stacks Project 0D6K), and CK Lemma 3.17 upgrades this to `W(m^♭)` ((3.28.2)). CK Lemmas 3.30 and 3.31: for `A_inf`-modules satisfying the Mittag-Leffler condition (⋆) on the systems `Tor_j^{A_inf}(−,A_cris^(m)/p^n)`, cohomology of a bounded complex commutes with `−⊗̂_{A_inf}A_cris^(m)`; (⋆) holds for `A_inf(R_∞)` and `A_inf(R_∞)/μ` (CK Lemma 3.13), and for `H^i_cont(Δ,A_inf(R_∞)/μ)` and `H^i_cont(Δ,N_∞)` by *Nonintegral cohomology annihilation* (§AI.6.2) (a)–(c), Lazard's theorem and the intertwining property (3.26.2) of *Finite-level crystalline period rings A_cris^(m)* (§AI.6.4). This gives CK Proposition 3.32 `(μ kills H^i_cont(Δ,N_∞⊗̂A_cris^(m)))` and the identifications of CK Proposition 3.33. CK Proposition 3.33, torsion: using (3.19.1), the decomposition (3.22.1), CK Corollary 3.23 and Proposition 3.29 (*Finite-level crystalline period rings A_cris^(m)* (§AI.6.4)), and approximation over `ℤ_p[[T]]` with `T↦[ε^{1/p^j}]−1`, `H^i_cont(Δ,A_cris^(m)(R_∞)/μ)` has no nonzero `W(m^♭)`-torsion. With (3.28.2) and the projection formula ((3.27.2)), the almost-to-integral criterion CK Lemma 3.18 (Layer AI.1) gives (a). `(b)` and (c), CK Proposition 5.6: the map of (c) exists because its target is derived p-adically complete (BMS1 Lemma 6.19; Layer AI.1). By *Integral semistable local edge comparison* (§AI.6.2) and (a) it suffices to prove `(b)`. By *Nonintegral cohomology annihilation* (§AI.6.2) (a) and CK Proposition 3.32 the summand `N_∞` contributes to neither side. On the summand A(R), `Δ` acts trivially modulo `μ` on A(R) and on `A_cris^(m)(R)` (*Integral A_inf chart lift* (§AI.6.1), *Finite-level crystalline period rings A_cris^(m)* (§AI.6.4)), so by CK Lemma 3.7 both sides are Koszul complexes on the `(δᵢ−1)/μ`; the completed tensor product is termwise because each `(p^n,μ^{n′})` is A(R)-regular with `A(R)/(p^n,μ^{n′})` flat over `A_inf/(p^n,μ^{n′})` (CK Lemma 3.13), and the two complexes agree termwise (CK §3.27). (ČK (arXiv v3), §3.28, (3.28.1), p.21; its display follows; ČK (arXiv v3), Proposition 3.32, p.23; ČK (arXiv v3), Proposition 3.32 (last sentence), p.23; ČK (arXiv v3), Proposition 3.33, p.23; ČK (arXiv v3), Proposition 3.33 (last sentence), p.23; ČK (arXiv v3), Theorem 3.34, p.24; ČK (arXiv v3), Proposition 5.6, p.34; ČK (arXiv v3), Proposition 5.6 (proof), p.34; ČK (arXiv v3), §5.5, p.34). *Needs:* *Integral semistable local edge comparison* (§AI.6.2); *Nonintegral cohomology annihilation* (§AI.6.2); *Finite-level crystalline period rings A_cris^(m)* (§AI.6.4); *Integral A_inf chart lift* (§AI.6.1); *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); DerivedDeRhamCohomology, §§PD.6–PD.7; *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2); EnhancedDerivedSheaves, E4 (*Completed sheaf tensor product*); *Completed extension of scalars along a map of adic rings* (§AI.1.5); *Derived p-completion on a site that is not replete* (§AI.1.5).

**Checks.**

- For `m<p`, `A_cris^(m)=A_inf` and (a)–(c) reduce to *Integral semistable local edge comparison* (§AI.6.2); for `m≥p` the p-adic and `(p,μ)`-adic topologies of `A_cris^(m)` agree, which is what makes the completed tensor product of the A(R)-Koszul complex termwise.
- For `R=O_C (d=0, Δ trivial)` the three maps are the identity of `A_cris^(m)`, which is p-adically complete and `μ`-torsion-free.
- The statement is for the rings `A_cris^(m)` with `m≥p` and derived p-completed tensor products; CK does not prove the analogue of (a) for `A_cris` itself, the `W(m^♭)`-torsion of the cohomology modulo `μ` being out of reach for `A_cris/μ`.

**Local logarithmic derivations** (`Semistable.logDerivations`). On the chart polynomial ring, for a branch direction `1≤i≤r` let `D_i=X_i∂_i−X₀∂₀`; for each torus pair `Y_j,Z_j` let `D_j=Y_j∂_{Y_j}−Z_j∂_{Z_j}`. These derivations kill `∏X_i−a` (a in the coefficient ring) and `Y_jZ_j−1`, hence preserve the chart ideal, and they commute. On A(R□) they are the `(p,μ)`-adically continuous extensions of these derivations. On A(R) they are the basis `∂/∂log(X_i)`, `i=1,…,d (d=r+s)`, dual to the basis dlog X₁,…,dlog `X_d` of the free A(R)-module `Ω¹_{A(R)/A_inf,log}` (CK (5.10.1)–(5.10.2)); equivalently, the unique `A_inf-derivations` of A(R) extending those of A(R□) along the `(p,μ)`-adically formally étale map `A(R□)→A(R)`. By base change they give `A_cris^(m)-derivations` of `A_cris^(m)(R)=A(R)⊗̂_{A_inf}A_cris^(m)` and `A_cris-derivations` of `A_cris(R)`. The log de Rham complex `Ω•_{A(R)/A_inf,log}` is their Koszul complex (CK (5.10.3)), with degree-j Frobenius `p^jφ`. The derivations of the *All-coordinates root covers* (§AI.6.4) envelopes (CK §5.31) are constructed in *All-coordinates log PD envelope* (§AI.6.4), not here.

Standing hypotheses (SS). Spf `R→Spf` R□ is an étale coordinate map as in *Integral A_inf chart lift* (§AI.6.1) (CK (5.5.1)), with Spf `R` connected (the local setting of CK §5.5). Indices distinguish the `r` branch directions from the `s=d−r` torus directions. The PD extensions are `A_cris^(m)(R)` of CK §3.27 `(m≥1; A_cris^(m)=A_inf for m<p)` and `A_cris(R)` of CK §5.8 and §5.11, not arbitrary completions.

The API:

- `Semistable.logDerivations.generators`: `D_i(X_i)=X_i`, `D_i(X₀)=−X₀` and all other branch values are zero; torus direction sends `Y` to `Y` and `Z` to −Z.
- `Semistable.logDerivations.relations`: Each `D` annihilates `∏X_i−a` and `Y_jZ_j−1`, hence descends to the quotient.
- `Semistable.logDerivations.frobenius`: `D_iφ=pφD_i`; on the log differential complex the degree-j lift is `p^jφ`.
- `Semistable.logDerivations.dual_basis`: On A(R) the derivations `∂/∂log(X_i)`, `i=1,…,d`, are the basis dual to dlog X₁,…,dlog `X_d` of `Ω¹_{A(R)/A_inf,log}`; they restrict on A(R□) to the continuous extensions of the `D_i` and commute with each other.

Use Mathlib MvPolynomial.pderiv and the Leibniz rule to check the two defining relations: `D_i(∏_{k≤r}X_k)=∏X_k−∏X_k=0` and `D_j(Y_jZ_j)=0`. Each derivation is diagonal on monomials `(D_i(X^a)=(a_i−a₀)X^a)`, so the derivations preserve the chart ideal and commute. By CK §5.9 (Kato, Logarithmic structures of Fontaine–Illusie, 3.5–3.6; supplied by CR.5:log-algebra) A(R□) is `(p,μ)`-adically formally log smooth over `A_inf` for the chart `ℕ→ℕ^{r+1}` of *Divisorial semistable log structure* (§AI.6.1), and A(R) is formally étale over A(R□) (*Integral A_inf chart lift* (§AI.6.1)). Hence `Ω¹_{A(R)/A_inf,log}`, formed as in CK §5.10 as the inverse limit of the log differentials modulo `(p^n,μ^{n′})` (Ogus, Lectures on Logarithmic Algebraic Geometry, V.2.1.1; CR.5), is free on dlog X₁,…,dlog `X_d`. Define `∂/∂log(X_i)` as the dual basis; the relation dlog X₀+…+dlog `X_r=0` gives CK (5.10.2), which are the formulas of the first step. That these are the unique extensions of the polynomial derivations is not stated in CK; it follows from the density of the polynomial ring in A(R□) and the formal étaleness of `A(R□)→A(R)`. Form the Koszul complex with Layer AI.1’s Koszul carrier and identify it with `Ω•_{A(R)/A_inf,log}` as in CK (5.10.3). Frobenius multiplies each dlog `X_i` by `p` (CK §5.9), so it acts as `p^jφ` in degree `j`; equivalently `∂/∂log(X_i)∘φ=p·φ∘∂/∂log(X_i)`. Base change along `A_inf→A_cris^(m)` (*Finite-level crystalline period rings A_cris^(m)* (§AI.6.4)) and `A_inf→A_cris` (CR.0) gives the derivations of CK Proposition 5.13 and the complex of CK §5.11. (ČK (arXiv v3), §5.9, p.36; ČK (arXiv v3), §5.10, (5.10.1), p.36; ČK (arXiv v3), §5.10, (5.10.2), p.37; ČK (arXiv v3), §5.10, (5.10.3), p.37; ČK (arXiv v3), Proposition 5.13, p.38). *Needs:* *Integral A_inf chart lift* (§AI.6.1); *Divisorial semistable log structure* (§AI.6.1); Mathlib `MvPolynomial.pderiv`; CrystallineCohomology, CR.5; *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2); CrystallineCohomology, CR.5:log-algebra; DerivedDeRhamCohomology, §§PD.6–PD.7; *Finite-level crystalline period rings A_cris^(m)* (§AI.6.4); CrystallineCohomology, CR.1 (*Differentials of a smooth envelope*).

**Checks.**

- `Semistable.logDerivations.node`: On Z[X₀,X₁], `(X₁∂₁−X₀∂₀)(X₀X₁−a)=0` for every integer a.
- `Semistable.logDerivations.torus`: On Z[Y,Z], `(Y∂_Y−Z∂_Z)(YZ−1)=0`.
- `Semistable.logDerivations.zero_rank`: For `r=s=0` there are no log directions, and the Koszul complex has only degree 0.
- `Semistable.logDerivations.monomial`: On Z[X₀,X₁], `(X₁∂₁−X₀∂₀)(X₀^aX₁^b)=(b−a)X₀^aX₁^b` for all `a,b≥0`; in particular `D(X₁)=X₁` and `D(X₀)=−X₀`, which fixes the normalisation.
- The branch sum relation is killed; degree-one Frobenius multiplies by p.

**Base change for log crystalline cohomology of Cartier type** (`Semistable.log_crystalline_base_change`). For a quasi-compact quasi-separated fine log smooth log scheme `Y` of Cartier type over a log divided power base `(S, J, M_S)` killed by a power of `p`, and a map of such bases `(S, J, M_S) → (S′, J′, M_{S′})`, `RΓ_logcrys(Y/S) ⊗^L_{O_S} O_{S′} ≅ RΓ_logcrys(Y_{S′}/S′)`; in the p-adic limit the tensor product is p-completed. Instances: base change along the log-base morphism whose chart map is `ℕ→ℚ_{≥0}`, `1↦v(π_K)`, over `W(k̄)`, with the arithmetic model specified in *Arithmetic Hyodo–Kato interface* (§AI.6.4), and the base change along W(k₀) `→` W(k̄) for a model over k₀ (completed in general, uncompleted for proper models).

`Y` fine log smooth of Cartier type; bases as stated.

Compute both sides by the log de Rham complex of a log smooth lift on an affine cover (log Poincaré lemma) and compare the Čech–de Rham complexes, which are compatible with base change because the terms are flat over `S`. (ČK (arXiv v3), §5.24, (5.24.1), and Remark 5.44, (5.44.1), printed pp.44 and 59). *Needs:* CrystallineCohomology, CR.5 (*Log PD Poincaré lemma*); CrystallineCohomology, CR.6 (*Standard log Witt bases*).

**Checks.**

- For the chart `ℕ→ℚ_{≥0}`, `1↦v(π_K)`, positive integers have positive image; every additive map in the reverse direction is zero.
- For the identity log-base map, the exchange is the identity on log crystalline cohomology.
- For a proper arithmetic model over `k₀`, Witt extension to `W(k̄)` uses the given model; an unspecified `k̄`-scheme supplies no `k₀`-descent datum.


**Local logarithmic crystalline comparison** (`Semistable.localCrystalline`). Let `m≥p²`. On `A_cris^(m)(R)` each generator `δ_i` of `Δ (i=1,…,d)` acts as `exp(log([ε])·D_i)=∑_{n≥0}(log([ε]))^n/n!·D_i^n`, where `D_i=∂/∂log(X_i)` is the derivation of *Local logarithmic derivations* (§AI.6.4) and `log([ε])=μ−μ²/2+μ³/3−…∈A_cris^(m)`. Hence `(δ_i−1)/μ=D_i·U_i`, where `U_i=∑_{n≥1}(log([ε]))^n/(μ·n!)·D_i^{n−1}` is an `A_cris^(m)`-linear automorphism of `A_cris^(m)(R)` (CK Lemma 5.15). The maps (id, `∑_{n≥1}(log([ε]))^n/n!·D_i^{n−1}`) from `[D_i]` to `[δ_i−1]` induce an isomorphism of complexes `K_{A_cris^(m)(R)}(D_1,…,D_d)≅η_μK_{A_cris^(m)(R)}(δ_1−1,…,δ_d−1)` and a quasi-isomorphism onto `η_μK_{A_cris^(m)(R_∞)}(δ_1−1,…,δ_d−1)`; they intertwine `p^jφ` in degree `j` of the source with `φ` (CK Proposition 5.16). After the termwise colimit over `m` and termwise p-adic completion this gives a Frobenius-equivariant identification `RΓ_logcrys((Spf R)_{O_C/p}/A_cris)≅AΩ_R⊗̂^L_{A_inf}A_cris` (CK (5.16.3)), where `AΩ_R=Lη_μRΓ_proét((Spf R)_C^ad,A_inf)` is the value on Spf `R` of the presheaf `AΩ^psh` of CK §4.1.

Standing hypotheses (SS). The local setting of CK §5.5: Spf `R` is connected with an étale chart `R□→R`; `A_cris^(m)(R)=A(R)⊗̂_{A_inf}A_cris^(m)` and `A_cris^(m)(R_∞)=A_inf(R_∞)⊗̂_{A_inf}A_cris^(m)` (CK §3.27). `m≥p²` for `log([ε])` and the exponential argument (CK §5.14); the smaller bound `m≥p` of *Finite PD décalage base change* (§AI.6.4) is distinct. The colimit over `m≥p` is computed over the cofinal range `m≥p²`.

Use *Finite-level crystalline period rings A_cris^(m)* (§AI.6.4) (CK §§3.26–3.27; the vanishing (3.26.2) is BMS1 Lemma 12.8(ii)): `A_cris^(m)(R)` is p- and `μ`-torsion free, `Δ` acts trivially on `A_cris^(m)(R)/μ`, and `A_cris^(m)(R)` is formally étale over `A_cris^(m)(R□)`. Use CK §5.14 (the proof of BMS1 Lemma 12.2, compare BMS1 Lemma 12.8(i); Layer AI.4): for `m≥p²` the elements `μ^n/(n+1)!` lie in `A_cris^(m)`, are topologically nilpotent and tend to 0 p-adically, so `log([ε])` is defined, is a unit multiple of `μ`, and `φ(log([ε]))=p·log([ε])`. Use CK Lemma 5.15 to factor `(δ_i−1)/μ=D_i·U_i` with `U_i` a convergent unit operator: the series `exp(log([ε])·D_i)` is a ring endomorphism by the Leibniz rule; for `R=R□` it agrees with `δ_i` on the generators `X_j` by CK (5.10.2); for general `R` both sides are trivial modulo `(p,ξ)`, so they agree by formal étaleness; dividing by `μ` uses `μ-torsion-freeness`. Apply CK Proposition 5.16: since `Δ` acts trivially modulo `μ`, the j-th term of `η_μK_{A_cris^(m)(R)}(δ_i−1)` consists of the `μ^j-multiples`, and the maps (id, `μ·U_i`) give the isomorphism (5.16.4); Frobenius-equivariance follows from `D_i∘φ=p·φ∘D_i` and `φ(log([ε]))=p·log([ε])`. By CK Proposition 3.32 with Lemma 3.7 (*Finite PD décalage base change* (§AI.6.4); Koszul cochains from Layer AI.1) the inclusion into `η_μK_{A_cris^(m)(R_∞)}(δ_i−1)` is a quasi-isomorphism. Identify the source with log crystalline cohomology by CK Proposition 5.13: `A_cris(R)/p^n` is a PD smooth log PD thickening of R/p over `A_cris/p^n` (CK Lemma 5.12; Beilinson, On the crystalline period map (arXiv:1111.3316v4), §1.4, Remarks (ii)), so its log de Rham complex computes `RΓ_logcrys` (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.8.1), for quasi-coherent integral log structures; supplied by CR.5). Identify the target by CK Corollary 5.7 (*Finite PD décalage base change* (§AI.6.4), i.e. CK Proposition 5.6 and Theorem 3.34, with aomega for `AΩ^psh`). Then pass to the termwise colimit over `m` and the termwise p-adic completion (EnhancedDerivedSheaves, E4 (*Colimits of complete sheaves*)). (ČK (arXiv v3), §5.14, p.38; BMS1 (Publ. IHÉS), Lemma 12.8, p.364; ČK (arXiv v3), §3.27, (3.27.2), p.20; ČK (arXiv v3), Lemma 5.15, pp.38–39; ČK (arXiv v3), Lemma 5.15, proof, p.39; ČK (arXiv v3), Proposition 5.16, (5.16.1)–(5.16.2), pp.39–40; ČK (arXiv v3), Proposition 5.16, proof, p.40; ČK (arXiv v3), Proposition 5.13, proof, p.38; ČK (arXiv v3), Corollary 5.7, p.35). *Needs:* *Finite PD décalage base change* (§AI.6.4); *Local logarithmic derivations* (§AI.6.4); *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2); EnhancedDerivedSheaves, E4 (*Colimits of complete sheaves*); *Integral A_inf chart lift* (§AI.6.1); *Semistable perfectoid root tower* (§AI.6.1); *Semistable AΩ complex* (§AI.6.2); *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); DerivedDeRhamCohomology, §§PD.6–PD.7; *Finite-level crystalline period rings A_cris^(m)* (§AI.6.4); *Hodge–Tate specialization* (§AI.4.1); *Cotangent description of the first Hodge–Tate truncation* (§AI.4.1); *De Rham specialization* (§AI.4.3); *Bounded divided-power coefficient subrings* (§AI.4.3); *Toric décalage after crystalline coefficient change* (§AI.4.3); *Crystalline logarithmic coordinate change* (§AI.4.3); *Absolute A_crys comparison* (§AI.4.3); *Mu-inverted étale specialization* (§AI.4.4); *Acyclicity of quasi-coherent sheaves on affine formal schemes* (§AI.6.2); *Base change for log crystalline cohomology of Cartier type* (§AI.6.4); CrystallineCohomology, CR.5 (*PD smooth log thickenings*); CrystallineCohomology, CR.5 (*Log PD Poincaré lemma*).

**Checks.**

- The scaling in degree `j` is part of the map; an unscaled differential comparison fails Frobenius compatibility.
- For `R=R□` both sides of `δ_i=exp(log([ε])·D_i)` send `X_i` to `[ε]X_i`, fix `X_j` for `0<j≠i`, and send X₀ to `[ε]^{-1}X₀` if `i≤r` and to X₀ if `i>r`.

**All-coordinates root covers** (`Semistable.allCoordinates.rootCovers`). For the indices of *All-coordinates presentation indices* (§AI.6.1), form `A□_{Σ,Λ}=A(R□_Σ)⊗̂_{A_inf}⊗̂_{λ∈Λ}A(R□_λ)`, completed `(p,μ)`-adically, and form the adic product and pullback of the corresponding root covers to the generic fibre of `R`. Its integral ring `R_{Σ,Λ,∞}` is the p-completed integral closure of the image of the integral tensor/base-change algebra in the generic-fibre algebra, as in *Perfectoidness of products of root towers* (§AI.6.1). The latter is a perfectoid pro-(finite étale) cover of the generic fibre with group `Δ_{Σ,Λ}=Δ_Σ×∏_{λ∈Λ}Δ_λ`. Its topological generators are `δ_σ` for `σ∈Σ` and `δ_{λ,i}` for `λ∈Λ`, `1≤i≤d`. Each chart tower is a subcover.

Standing hypotheses (SS), with an eligible index `(Σ,Λ)` and its specified chart maps.

The API:

- `Semistable.allCoordinates.maps`: For `(Σ,Λ)⊂(Σ′,Λ′)` the projections give maps `A□_{Σ,Λ}→A□_{Σ′,Λ′}` and `R_{Σ,Λ,∞}→R_{Σ′,Λ′,∞}`, compatible with Frobenius and with `Δ_{Σ′,Λ′}→Δ_{Σ,Λ}`, satisfying identity and composition. For a p-adically formally étale `R→R′` with index `(Σ′,Λ′)`, the `(Σ,Λ)-objects` of `R` map to the `(Σ∪Σ′,Λ∪Λ′)-objects` of `R′`.
- `Semistable.allCoordinates.single`: For each `λ∈Λ` the chart tower `R_{λ,∞}` is a subcover of `R_{Σ,Λ,∞}`, compatibly with the projection `Δ_{Σ,Λ}→Δ_λ`. The presentation does not reduce to that chart and its tower: `Σ` must by itself give a closed immersion, and the group is `Δ_Σ×∏_λΔ_λ`.

Form the tower products and apply *Perfectoidness of products of root towers* (§AI.6.1). Form the completed tensor product of the integral lifts; projection maps give the transition and chart maps, with identity, composition and étale restriction compatibilities. (ČK (arXiv v3), §5.18, (5.18.1), p.41; §5.21, p.42; §5.22, (5.22.1), p.43). *Needs:* *All-coordinates presentation indices* (§AI.6.1); *Perfectoidness of products of root towers* (§AI.6.1); *Semistable perfectoid root tower* (§AI.6.1); *Integral A_inf chart lift* (§AI.6.1).

**Checks.**

- For a smooth framed torus with index `(Σ,{λ})`, quotienting the product cover by `Δ_λ` gives the cover adjoining roots of `Σ`; the full cover retains both group factors.
- Adding a new torus coordinate gives unbounded finite-level degrees, so the infinite tower is pro-finite-étale rather than finite étale.
- For nested triples of indices, both composites of coefficient maps and both composites of group projections equal the direct transition.

**Unique lifting of units along log divided power thickenings** (`Semistable.log_unit_lift`). Let T₀ ↪ `T` be a log divided power thickening whose log structure `N_T` is integral and quasi-coherent. For `t`, `t′ ∈ Γ(T, N_T)` and a unit u₀ of `O_{T₀}` with `t|_{T₀} = u₀·t′|_{T₀}`, there is a unique unit `u` of `O_T` lifting u₀ with `t =` u·t′.

T₀ ↪ `T` a log divided power thickening; `N_T` integral and quasi-coherent (not necessarily fine).

The kernel of `N_T → N_{T₀}` on units is 1 + `J` for the divided power ideal `J`; integrality of `N_T` makes the action of `O_T^×` on the fibre of `N_T` over a section of `N_{T₀}` free and transitive, which gives existence and uniqueness of `u`. (ČK (arXiv v3), proof of Lemma 5.29, printed p.48). *Needs:* CrystallineCohomology, CR.5 (*Fine log PD envelopes*); CrystallineCohomology, CR.5:log-algebra (*Prelog rings*).

**Log exactification of all-coordinates charts** (`Semistable.logExactification`). Fix the unique `q∈Q_{>0}` with `Z·q=∑_{λ∈Λ}Z·q_λ`, and give `O_C/p` and `A_inf` the fine log structures `ℕ→O_C/p`, `1↦p^q` and `ℕ→A_inf`, `1↦[(p^{1/p^∞})^q]`. Let Q be the fine monoid of CK §5.25, the product of the monoids `Q_λ` with their diagonal elements identified; it is a chart of `A□_{Σ,Λ}`. Choose `λ₀∈Λ` and let `P_{λ₀}` be the monoid (5.26.1) if `R⊗k̄` is smooth, or the monoid (5.27.2), indexed by the generic points `Y` of the special fibre, if it is not. The fine version of the log closed immersion `Spec(R/p)→Spec(A□_{Σ,Λ})` factors Frobenius-equivariantly as an exact log closed immersion `j_{λ₀}` into `Spec(A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}])`, followed by the log étale projection `q_{λ₀}` (CK (5.26.5), (5.27.5)). The algebra `A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]` is the initial `A□_{Σ,Λ}`-algebra with units satisfying the relations (5.26.3), respectively (5.27.3), and `R` is an algebra over it. The canonical changes `λ₀→λ₀′`, isomorphisms over `A□_{Σ,Λ}` compatible with the maps from Spec(R/p) (CK (5.26.6)–(5.26.7)), commute with Frobenius and satisfy the cocycle law.

Standing hypotheses (SS). `(Σ,Λ)` is an index of *All-coordinates presentation indices* (§AI.6.1) for Spf `R` (CK §5.17). The fine versions of the log structures are used. No PD envelope is formed here; in particular the log PD envelope of the nonexact immersion, with `p` not nilpotent, is not used (CK footnote 11).

The API:

- `Semistable.logExactification.factor`: The displayed factorization is exact-closed followed by log étale and commutes with the map to R/p.
- `Semistable.logExactification.units`: Nonsmooth case (CK (5.27.3)): `X_{λ,i}` is a unit for `i∉i_λ(Y)`; `X_{λ,i_λ(y)}=U_{λ,λ₀,y}·X_{λ₀,i_{λ₀}(y)}`; `U_{λ₀,λ₀,y}=1`; and `∏_{y∈Y}U_{λ,λ₀,y}=∏_{i∉i_{λ₀}(Y)}X_{λ₀,i}/∏_{i∉i_λ(Y)}X_{λ,i}`. Smooth case (CK (5.26.3)): `X_{λ,i}=[((p^{1/p^∞})^q)^{n_{λ,i}}]·V_{λ,i}` with units `V_{λ,i}` and `∏_{0≤i≤r_λ}V_{λ,i}=1`, where `n_{λ,i_λ}=q_λ/q` and `n_{λ,i}=0` for `i≠i_λ`.
- `Semistable.logExactification.change`: Changing `λ₀` uses the displayed ratios and composes by the cocycle law, preserving log charts and Frobenius.
- `Semistable.logExactification.algebra`: `R` is an algebra over `A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]`, with `V_{λ,i}↦v_{λ,i}` in the smooth case and `U_{λ,λ₀,y}↦u_{λ,λ₀,y}` in the nonsmooth case, compatibly with change of `λ₀` (CK (5.26.4), (5.27.4)).

Use the chart and log-étale criteria from CrystallineCohomology, CR.5:log-algebra and CR.5. Following CK §5.25, build `Q_λ⊂(q/q_λ)·ℕ^{r_λ+1}`, generated by `ℕ^{r_λ+1}` and the diagonal element `(q/q_λ,…,q/q_λ)`, with the chart `Q_λ→A(R□_λ)` sending the standard generators to the `X_{λ,i}` and the diagonal element to `[(p^{1/p^∞})^q]`; Q is obtained by identifying the diagonal elements. Smooth case (CK §5.26): for each `λ` there is a unique `i_λ` with `t_{λ,i_λ}∉R^×`; write `t_{λ,i}=(p^q)^{n_{λ,i}}·v_{λ,i}` with `v_{λ,i}∈R^×`, `n_{λ,i_λ}=q_λ/q` and `n_{λ,i}=0` otherwise. Then `P_{λ₀}→R/p`, `1↦p^q`, `1_{(λ,i)}↦v_{λ,i}`, is a chart, `Q→P_{λ₀}` is a Frobenius-equivariant chart of the immersion, and `A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]` has the universal property (5.26.3). Nonsmooth case (CK §5.27): `q_λ=q` for all `λ`, and by *All-coordinates root covers* (§AI.6.4) each generic point `y` determines an index `i_λ(y)` with `t_{λ,i_λ(y)}=u_{λ,λ₀,y}·t_{λ₀,i_{λ₀}(y)}` for a unique `u_{λ,λ₀,y}∈R^×` (5.27.1). The chart `P_{λ₀}→R/p` sends `1_y` to `t_{λ₀,i_{λ₀}(y)}`, `1_{(λ,i)}` to `t_{λ,i}` for `i∉i_λ(Y)` and to `u_{λ,λ₀,y}` for `i=i_λ(y)`; this gives the universal property (5.27.3) with branch ratios `U_{λ,λ₀,y}` and their product relations. `j_{λ₀}` is exact by construction and `q_{λ₀}` is log étale by Kato, Logarithmic structures of Fontaine–Illusie, 3.5 (CR.5:log-algebra). For the change maps: in the smooth case the relations (5.26.3) do not involve `λ₀`; in the nonsmooth case use `U_{λ,λ₀′,y}=U_{λ,λ₀,y}/U_{λ₀′,λ₀,y}`. The cocycle law is not stated in CK; it follows from this formula, since `U_{λ,λ₀″,y}=U_{λ,λ₀′,y}/U_{λ₀″,λ₀′,y}=U_{λ,λ₀,y}/U_{λ₀″,λ₀,y}`, and from the universal properties. (ČK (arXiv v3), §5.25, p.45; ČK (arXiv v3), §5.26, (5.26.3), p.46; ČK (arXiv v3), §5.26, (5.26.5), p.46; ČK (arXiv v3), §5.26, (5.26.6)–(5.26.7), p.46; ČK (arXiv v3), §5.27, (5.27.2), p.47; ČK (arXiv v3), §5.27, (5.27.3), p.47; ČK (arXiv v3), §5.27, (5.27.5), p.47; ČK (arXiv v3), §5.25, footnote 11, p.45). *Needs:* *All-coordinates root covers* (§AI.6.4); CrystallineCohomology, CR.5; *Unique lifting of units along log divided power thickenings* (§AI.6.4); CrystallineCohomology, CR.5:log-algebra (*Kato chart criterion*); CrystallineCohomology, CR.5:log-algebra (*Integral morphisms*).

**Checks.**

- `Semistable.logExactification.single`: For `Λ={λ₀}` in the nonsmooth case the units `U_{λ₀,λ₀,y}` are 1 and `A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]` is the localization of `A□_{Σ,Λ}` inverting `X_{λ₀,i}` for those `i` with `t_{λ₀,i}∈R^×`; it equals `A□_{Σ,Λ}` exactly when every `t_{λ₀,i}`, `0≤i≤r_{λ₀}`, is a nonunit of `R`.
- `Semistable.logExactification.node`: For two node charts `x′=ax`, `y′=a⁻¹y` of the same `R` with `a∈R^×` (for instance `a∈O_C^×`), with branches y₁: `x=0` and y₂: `y=0`, the images in `R` of the ratio units are `u_{λ,λ₀,y₁}=a` and `u_{λ,λ₀,y₂}=a⁻¹`, and the product relation reads `U_{λ,λ₀,y₁}·U_{λ,λ₀,y₂}=1`.
- `Semistable.logExactification.nonexact_pd`: For the two node charts of the previous test, when the node `x=y=0` lies in Spf `R` the immersion `Spec(R/p)→Spec(A□_{Σ,Λ})` is not exact: there is no `V∈A□_{Σ,Λ}` with `X′=V·X` (modulo (X,Y,Y′) the element `X′` is nonzero), although `x′=ax` in `R`. The exactified algebra adjoins exactly the unit `U` with `X′=U·X` and `Y=U·Y′`.
- `Semistable.logExactification.smooth`: For `R=O_C{t^{±1}}`, `Σ={t}` and `Λ={λ₀,λ₁}`, where `λ₀` has `r=0`, `q_{λ₀}=1 (t_{λ₀,0}=p, t_{λ₀,1}=t)` and `λ₁` has `r=1`, `q_{λ₁}=1/2 (t_{λ₁,0}=p^{1/2}t, t_{λ₁,1}=t^{-1})`: `q=1/2`, `n_{λ₀,0}=2`, `n_{λ₁,0}=1`, `n_{λ₁,1}=0`, `v_{λ₀,0}=1`, `v_{λ₁,0}=t`, `v_{λ₁,1}=t^{-1}`, and the exactified algebra is `A□_{Σ,Λ}[X_{λ₁,1}^{-1}]` with `V_{λ₁,1}=X_{λ₁,1}`, `V_{λ₁,0}=X_{λ₁,1}^{-1}`, `V_{λ₀,0}=1`.
- The envelope computation is independent of `λ₀` through actual change maps.

**All-coordinates log PD envelope** (`Semistable.allCoordinatesPD`). Let `D_{jλ₀}` be DerivedDeRhamCohomology §PD.6’s ordinary divided power envelope over `(ℤ_p,pZ_p)` of the exact closed immersion `j_{λ₀}`: `Spec(R/p)→Spec(A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}])` of *Log exactification of all-coordinates charts* (§AI.6.4) (CK §5.28); by the universal property of the uncompleted `A_cris^0` it is equally the divided power envelope of `j_{λ₀,cris}` over `Spec(O_C/p)→Spec(A_cris^0)`. Let `D_{Σ,Λ}=lim_nD_{Σ,Λ,n}`, where `D_{Σ,Λ,n}` is the log PD envelope of `Spec(R/p)→Spec(A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n)` over `Spec(O_C/p)→Spec(A_cris/p^n)` (CK §5.22); it is the completed log PD envelope used for R/p, with an `A_cris-semilinear` Frobenius, a `Δ_{Σ,Λ}-action` and a map `D_{Σ,Λ}→R`. The map `q_{λ₀}` induces isomorphisms `D_{Σ,Λ,n}≅D_{jλ₀}/p^n` and `D_{Σ,Λ}≅(D_{jλ₀})^∧` (p-adic completion), `A_cris`-linear and compatible with divided powers, Frobenius, `Δ_{Σ,Λ}`, the maps to `R` and change of `λ₀` (CK Lemma 5.29). For `m≥1` let `D^{(m)}_{jλ₀}⊂D_{jλ₀}` be the subalgebra generated by the divided powers of degree `≤m` of elements of the ideal of `j_{λ₀}`, and `D^{0,(m)}_{Σ,Λ}` its image in `D_{Σ,Λ}`, which is independent of `λ₀`. For `m≥p` let `D^{(m)}_{Σ,Λ}` be the p-adic completion of `D^{0,(m)}_{Σ,Λ}`; it is an `A_cris^(m)`-algebra with Frobenius and `Δ_{Σ,Λ}-action`, and `D_{Σ,Λ}≅(colim_{m≥p}D^{(m)}_{Σ,Λ})^∧` over `A_cris` (CK (5.30.1)). The derivations `∂/∂log(X_τ)` of *Local logarithmic derivations* (§AI.6.4) (`τ=σ∈Σ` or `τ=(λ,i)`, `1≤i≤d`) extend to divided power derivations of `D_{jλ₀}` and `D_{Σ,Λ}` and to `A_cris^(m)-derivations` of `D^{(m)}_{Σ,Λ}` (CK §5.31). All of this is functorial under enlarging `(Σ,Λ)`. No p-torsion-freeness of `D_{Σ,Λ}` is assumed, and `D^{(m)}_{Σ,Λ}→D_{Σ,Λ}` is not asserted to be injective.

Standing hypotheses (SS). `(Σ,Λ)` is an index of *All-coordinates presentation indices* (§AI.6.1) for Spf `R` and `λ₀∈Λ`. `D^{(m)}_{Σ,Λ}` is defined for `m≥p`.

The API:

- `Semistable.allCoordinatesPD.universal`: For each `n`, `D_{Σ,Λ,n}=D_{Σ,Λ}/p^n` is the log PD envelope of `Spec(R/p)→Spec(A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n)` over `Spec(O_C/p)→Spec(A_cris/p^n)`: for a log PD thickening `T₀→T` over `A_cris/p^n` with integral quasi-coherent log structure, compatible log maps `T₀→Spec(R/p)` and `T→Spec(A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n)` factor uniquely through a log PD map `T→Spec(D_{Σ,Λ,n})`.
- `Semistable.allCoordinatesPD.refine`: Refinement and change of `λ₀` commute with PD structure, Frobenius and log derivations.
- `Semistable.allCoordinatesPD.finite`: `D_{Σ,Λ}≅(colim_{m≥p}D^{(m)}_{Σ,Λ})^∧` over `A_cris` (CK (5.30.1)), where `D^{(m)}_{Σ,Λ}` is the p-adic completion of the subalgebra `D^{0,(m)}_{Σ,Λ}⊂D_{Σ,Λ}`; `D^{(m)}_{Σ,Λ}→D_{Σ,Λ}` is not asserted to be injective, and termwise completion alone is not substituted for a derived comparison.
- `Semistable.allCoordinatesPD.exact`: `q_{λ₀}` induces `D_{Σ,Λ,n}≅D_{jλ₀}/p^n` for `n>0` and `D_{Σ,Λ}≅(D_{jλ₀})^∧`, `A_cris`-linearly and compatibly with divided powers, Frobenius, the `Δ_{Σ,Λ}-action`, the maps to `R/p^n` and `R`, and change of `λ₀` (CK Lemma 5.29).
- `Semistable.allCoordinatesPD.toR`: There is a map `D_{Σ,Λ}→R` lifting `D_{Σ,Λ}→R/p`, induced by the factorization `Spec(R/p)→Spf R→Spf D_{Σ,Λ}` (CK (5.22.3)) and agreeing with `D_{jλ₀}→R` of CK (5.28.2).
- `Semistable.allCoordinatesPD.derivations`: The commuting derivations `∂/∂log(X_τ)` act on `D_{jλ₀}` and `D_{Σ,Λ}` as divided power derivations `(∂(x^{[n]})=x^{[n−1]}∂(x))` and on `D^{(m)}_{Σ,Λ}`, `m≥p`, as `A_cris^(m)-derivations`, compatibly with each other and with those of `A□_{Σ,Λ}` (CK §5.31).

CK §5.22: for `n,n′>0` the `A_inf/(p^n,μ^{n′})-base` change of `Spec(R/p)→Spf(A□_{Σ,Λ})` has a log PD envelope `D_{Σ,Λ,n,n′}` over `(ℤ/p^n,pZ/p^n)` (Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.3, Theorem; for the fine version Kato, Logarithmic structures of Fontaine–Illusie, 5.4; supplied by CR.5). For `n′` large it is the log PD envelope over `Spec(O_C/p)→Spec(A_cris/p^n)` and does not depend on `n′`; put `D_{Σ,Λ}=lim_nD_{Σ,Λ,n}`. Frobenius and `Δ_{Σ,Λ}` act by functoriality, and the universal property gives `Spec(R/p)→Spf R→Spf D_{Σ,Λ}` (CK (5.22.3)). Apply the universal divided power envelope of DerivedDeRhamCohomology, §§PD.6–PD.7 after *Log exactification of all-coordinates charts* (§AI.6.4): `D_{jλ₀}` is the envelope of `j_{λ₀}` over `(ℤ_p,pZ_p)`; by the universal property of `A_cris^0` (Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, A2.8; CR.0) it is the envelope of `j_{λ₀,cris}` over `A_cris^0`, and because `j_{λ₀}` is exact it is also the log PD envelope (Kato, Logarithmic structures of Fontaine–Illusie, 5.5.1; CR.5). Use CK Lemma 5.29, p.48: in an integral quasi-coherent log PD thickening `T₀→T`, let t,t′ be sections of the log structure on `T` and let u₀ be a unit on T₀ relating their restrictions. There is a unique unit `u` on `T` restricting to u₀ and satisfying `t=u·t′` (Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.1, Exercises (iii); CR.5). Uniqueness concerns this prescribed log-section relation; an ordinary unit can have many lifts. Applying this lifting property to the ratios in (5.26.3) and (5.27.3) gives the unique lift through `q_{λ₀}` of a log morphism `T→Spec(A□_{Σ,Λ}⊗A_cris/p^n)` compatible with `T₀→Spec(R/p)`. Thus the two log PD envelopes agree, `D_{Σ,Λ,n}≅D_{jλ₀}/p^n`; pass to the limit over `n`. Use CK §§5.30–5.31 for the finite PD approximants and the `Δ_{Σ,Λ}-action` and log derivations: `D_{jλ₀}→D^0_{Σ,Λ}→D_{Σ,Λ}` are isomorphisms modulo `p^n`, which gives (5.30.1); the derivations of *Local logarithmic derivations* (§AI.6.4) extend uniquely to `A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]` because `q_{λ₀}` is log étale, then to divided power derivations of `D_{jλ₀}` (Stacks Project 07HW), compatibly with those of `D_{Σ,Λ}`. Functoriality under enlarging `(Σ,Λ)` is CK §5.32. The comparison with the ordinary envelope of the nonexact immersion is not in CK, which only notes that the uncompleted log PD envelope is unavailable (footnote 11). It follows by reducing modulo (X,Y): there the exactified algebra becomes a Laurent polynomial ring in `U` over the image of `A□_{Σ,Λ}`, and its divided power envelope is a divided power polynomial algebra in `U−α` over the envelope of that image. All completions here are classical, termwise p-adic completions of rings and of complexes, as in CK (5.30.1), (5.32.1) and (5.38.4). No derived completion is used on the divided power side: p-torsion-freeness of `D_{Σ,Λ}` is not known (CK §5.22), so the derived completion could differ. (ČK (arXiv v3), §5.22, p.43; ČK (arXiv v3), §5.22, (5.22.2), p.43; ČK (arXiv v3), §5.22, p.44; ČK (arXiv v3), §5.28, p.47; ČK (arXiv v3), §5.28, p.48; ČK (arXiv v3), Lemma 5.29, (5.29.1), p.48; ČK (arXiv v3), Lemma 5.29, proof, p.48; ČK (arXiv v3), §5.30, p.49; ČK (arXiv v3), §5.30, (5.30.1), p.49; ČK (arXiv v3), §5.31, (5.31.3), p.49; ČK (arXiv v3), §5.31, (5.31.4), p.50; ČK (arXiv v3), §5.32, p.50). *Needs:* *Log exactification of all-coordinates charts* (§AI.6.4); *Local logarithmic derivations* (§AI.6.4); *All-coordinates root covers* (§AI.6.4); *Finite-level crystalline period rings A_cris^(m)* (§AI.6.4); *Unique lifting of units along log divided power thickenings* (§AI.6.4); DerivedDeRhamCohomology, §PD.6 (base-compatible divided power envelopes); CrystallineCohomology, CR.5 (*Quasi-coherent log PD envelopes*); CrystallineCohomology, CR.5 (*Fine log PD envelopes*).

**Checks.**

- `Semistable.allCoordinatesPD.single`: For each `λ∈Λ` and `m≥p` there is a unique map of `A_cris^(m)(R□_λ)-algebras A_cris^(m)(R)_λ→D^{(m)}_{Σ,Λ}` lifting the identity of R/p (CK (5.39.1)); it is `Δ_{Σ,Λ}`-equivariant through `Δ_{Σ,Λ}→Δ_λ` and commutes with `∂/∂log(X_{λ,i})`. `D_{Σ,Λ}` is not identified with the lift `A_cris(R)_λ` used in *Local logarithmic crystalline comparison* (§AI.6.4).
- `Semistable.allCoordinatesPD.ratio`: For two node charts differing by a unit a, under `D_{jλ₀}→R` the ratio units `U_{λ,λ₀,y}` map to a and `a⁻¹` on the two branches, and the constructions for the two choices of `λ₀` are canonically isomorphic (CK (5.28.1)).
- `Semistable.allCoordinatesPD.point`: For `R=O_C` and the index `Σ=∅`, `Λ={λ}` with `d=0`, `A□_{Σ,Λ}=A_inf` and `D_{Σ,Λ}=A_cris` with its divided powers.
- `Semistable.allCoordinatesPD.torus_coordinate`: For `R=O_C`, `Σ={σ}` with `t_σ↦u∈O_C^×` and `Λ={λ}` with `d=0`, `A□_{Σ,Λ}=A_inf{X_σ^{±1}}` and `D_{Σ,Λ}` is the p-adically completed divided power polynomial algebra over `A_cris` in the variable `X_σ−[u^♭]`; in particular `D_{Σ,Λ}≠A_cris`, and `∂/∂log(X_σ)` sends `X_σ−[u^♭]` to `X_σ`.
- For two node charts (x,y) and `(ax,a⁻¹y)` with `a∈O_C^×` and `α=[a^♭]`, `D_{Σ,Λ}` contains the unit `U` with `X′=U·X` and the divided powers of `U−α`. When the node lies in Spf `R`, the ordinary PD envelope of the kernel of `A□_{Σ,Λ}→R/p` maps to `D_{Σ,Λ}` by `(X′−αX)^{[n]}↦X^n·(U−α)^{[n]}`, and this map is not surjective: modulo (X,Y) its image does not contain `U−α`.

**All-coordinates AΩ comparison model** (`Semistable.allCoordinatesAOmega`). For an index `(Σ,Λ)` of *All-coordinates root covers* (§AI.6.4) and `m≥p` let `A_cris^(m)(R_{Σ,Λ,∞})=A_inf(R_{Σ,Λ,∞})⊗̂_{A_inf}A_cris^(m)`, and form `η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1)`, where `τ` runs over `σ∈Σ` and `(λ,i)` with `λ∈Λ`, `1≤i≤d`. Take the filtered *All-coordinates root covers* (§AI.6.4) colimit of the p-completed filtered colimit, `m≥p`, of these complexes; the colimits and the completion are termwise (CK (5.21.1)). The result carries an `A_cris-semilinear` Frobenius. For each `(Σ,Λ)` and `m≥p` the edge map of the cover `R_{Σ,Λ,∞}` identifies the m-th complex, Frobenius-equivariantly, with `AΩ_R⊗̂^L_{A_inf}A_cris^(m)`, where `AΩ_R=Lη_μRΓ_proét((Spf R)_C^ad,A_inf)` is the value on Spf `R` of the presheaf `AΩ^psh` (CK Proposition 5.20). Hence in the shared derived enhancement the model is canonically and Frobenius-equivariantly identified with `AΩ_R⊗̂^L_{A_inf}A_cris`, compatibly with enlarging `(Σ,Λ)` and functorially in `R` for p-adically formally étale maps `R→R′` (CK §5.21). The termwise completion agrees with the derived one because `A_cris^(m)(R_{Σ,Λ,∞})` is p-torsion free. No multiplicative structure on the model or on this identification is asserted.

Standing hypotheses (SS). Spf `R` and the indices `(Σ,Λ)` are as in *All-coordinates root covers* (§AI.6.4) (CK §5.17); `m≥p` throughout.

The API:

- `Semistable.allCoordinatesAOmega.edge`: For `m≥p` the edge map of the cover `R_{Σ,Λ,∞}` induces a Frobenius-equivariant identification of `η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1)` with `AΩ_R⊗̂^L_{A_inf}A_cris^(m)` (CK (5.20.1)), and of the model with `AΩ_R⊗̂^L_{A_inf}A_cris`; it is compatible with p-adically formally étale maps `R→R′`.
- `Semistable.allCoordinatesAOmega.refine`: Refinement maps commute with cochain differentials and the completed colimit structure.
- `Semistable.allCoordinatesAOmega.frobenius`: The model’s Frobenius agrees with *Semistable AΩ Frobenius* (§AI.6.2) after PD base change.
- `Semistable.allCoordinatesAOmega.chart`: For `λ∈Λ` and `m≥p` the map `η_μK_{A_cris^(m)(R_{λ,∞})}((δ_{λ,i}−1)_{1≤i≤d})→η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1)` induced by the subcover `R_{λ,∞}` and the projection `Δ_{Σ,Λ}→Δ_λ` is a quasi-isomorphism (CK Lemma 3.7 and Remark 3.35).
- `Semistable.allCoordinatesAOmega.torsion_free`: `A_cris^(m)(R_{Σ,Λ,∞})` is p-torsion free and `μ`-torsion free, and its quotient by `μ` is p-adically complete (CK §5.19); so `η_μ` of the Koszul complex computes `Lη_μ` and the termwise p-adic completion is the derived one.

Use the combined root covers from *All-coordinates root covers* (§AI.6.4) and Layer AI.3 continuous Koszul cochains. By CK §5.19, `A_inf(R_{Σ,Λ,∞})=W(R_{Σ,Λ,∞}^♭)` (Layer AI.0) and, by CK Lemma 3.13, `(p^n,μ^{n′})` is a regular sequence on it with flat quotient over `A_inf/(p^n,μ^{n′})`; so `A_cris^(m)(R_{Σ,Λ,∞})` is p-torsion free, and by CK (3.26.2)–(3.26.3) (*Finite-level crystalline period rings A_cris^(m)* (§AI.6.4), API item intertwined) it is `μ`-torsion free with `A_cris^(m)(R_{Σ,Λ,∞})/μ` p-adically complete. `Δ_{Σ,Λ}` acts continuously and Frobenius-equivariantly. Prove CK Proposition 5.20. For one chart `λ∈Λ`, *Finite PD décalage base change* (§AI.6.4) (CK Proposition 5.6) gives `AΩ_R⊗̂^L_{A_inf}A_cris^(m)≅Lη_μ(RΓ_proét((Spf R)_C^ad,A_inf)⊗̂^L_{A_inf}A_cris^(m))`, with `AΩ_R` from aomega (CK (4.1.3)). Since `R_{Σ,Λ,∞}` contains `R_{λ,∞}` as a subcover, CK Remark 3.35 applies: by almost purity (Layer AI.3) and CK Lemma 3.17 the ideal `W(𝔪^♭)` kills the cohomology of the cone of `RΓ_cont(Δ_λ,A_cris^(m)(R_{λ,∞}))→RΓ_cont(Δ_{Σ,Λ},A_cris^(m)(R_{Σ,Λ,∞}))`, and CK Lemma 3.18 with Proposition 3.33 (*Finite PD décalage base change* (§AI.6.4)) shows that `Lη_μ` of this map is an isomorphism. CK Lemma 3.7 (BMS1 Lemma 7.3(ii); Layer AI.1) replaces continuous cochains by Koszul complexes, which gives (5.20.1). Follow CK §5.21: the identifications are compatible with enlarging `(Σ,Λ)` and with p-adically formally étale `R→R′` (using the index `(Σ∪Σ′,Λ∪Λ′)` for `R′`). Take the termwise colimit over `m`, the termwise p-adic completion (equal to the derived one by p-torsion-freeness) and the filtered colimit over `(Σ,Λ)` through EnhancedDerivedSheaves, E4 (*Colimits of complete sheaves*) and E1, retaining actual coherent maps. (ČK (arXiv v3), §5.19, p.42; ČK (arXiv v3), Proposition 5.20, (5.20.1), p.42; ČK (arXiv v3), Proposition 5.20, proof, p.42; ČK (arXiv v3), Remark 3.35, p.24; ČK (arXiv v3), §5.21, (5.21.1), p.42; ČK (arXiv v3), §5.21, p.43; ČK (arXiv v3), §4.1, (4.1.3), p.25). *Needs:* *All-coordinates root covers* (§AI.6.4); *Semistable perfectoid root tower* (§AI.6.1); *Finite PD décalage base change* (§AI.6.4); *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2); EnhancedDerivedSheaves, E4 (*Colimits of complete sheaves*); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); *Semistable AΩ complex* (§AI.6.2); *Semistable AΩ Frobenius* (§AI.6.2); *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); AdicEtaleGeometry, A1; *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); DerivedDeRhamCohomology, §§PD.6–PD.7; *Finite-level crystalline period rings A_cris^(m)* (§AI.6.4).

**Checks.**

- `Semistable.allCoordinatesAOmega.point`: For `R=O_C` and the index `Σ=∅`, `Λ={λ}` with `d=0`, the group `Δ_{Σ,Λ}` is trivial, `R_{Σ,Λ,∞}=O_C` and the complex is `A_cris` in degree 0.
- `Semistable.allCoordinatesAOmega.single`: For one node chart `λ (d=1)` and `m≥p`, the rank-one complex `η_μK_{A_cris^(m)(R_{λ,∞})}(δ_{λ,1}−1)` maps quasi-isomorphically to the `(Σ,{λ})-term`, which is the Koszul complex on the `|Σ|+1` operators `δ_σ−1`, `δ_{λ,1}−1`; the two are not equal unless `Σ=∅`.
- `Semistable.allCoordinatesAOmega.refinement`: The two chart embeddings into a common refinement induce the same equivalence with the intrinsic `AΩ` target.
- `Semistable.allCoordinatesAOmega.torus_point`: For `R=O_C`, `Σ={σ}` with `t_σ↦u∈O_C^×` and `Λ={λ}` with `d=0`, the group is `Δ_{Σ,Λ}=Δ_σ≅ℤ_p` and the m-th term is `η_μ` of the two-term complex `δ_σ−1` on `A_cris^(m)(R_{Σ,Λ,∞})`; for `m≥p` it is quasi-isomorphic to `A_cris^(m)` in degree 0, although it is not concentrated in degree 0.
- The maps agree for two different chart families under their union.

**All-coordinates log crystalline model** (`Semistable.allCoordinatesLogCrystalline`). For an index `(Σ,Λ)` and `m≥p` form the Koszul complex `K_{D_{Σ,Λ}^{(m)}}(D_τ)` of the derivations `D_τ=∂/∂log(X_τ)` of *All-coordinates log PD envelope* (§AI.6.4), where `τ` runs over `σ∈Σ` and `(λ,i)` with `λ∈Λ`, `1≤i≤d`. Take the filtered *All-coordinates root covers* (§AI.6.4) colimit of the p-completed filtered colimit, `m≥p`, of these complexes; the colimits and the completion are termwise (CK (5.32.1)). Degree-j Frobenius is `p^jφ`. For each `(Σ,Λ)` the completed colimit over `m` is `K_{D_{Σ,Λ}}(D_τ)`, the log PD de Rham complex `Ω•_{D_{Σ,Λ}/A_cris,log,PD}`, which is canonically and Frobenius-equivariantly identified in the derived category with `RΓ_logcrys((Spf R)_{O_C/p}/A_cris)` (CK Proposition 5.23, (5.31.5)). The identification is compatible with enlarging `(Σ,Λ)` and functorial in `R` for p-adically formally étale maps `R→R′`, and under it the map to `RΓ_logdR(Spf R/O_C)` is induced by `D_{Σ,Λ}→R` (CK (5.23.2)). After sheafification on `𝔛_ét` the model represents `Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}`.

Standing hypotheses (SS). Spf `R` and `(Σ,Λ)` are as in *All-coordinates root covers* (§AI.6.4); `m≥p`. The log crystalline site is that of `𝔛_{O_C/p}` over `A_cris` with quasi-coherent integral log structures (CK §5.3).

The API:

- `Semistable.allCoordinatesLogCrystalline.poincare`: For each `(Σ,Λ)`, `K_{D_{Σ,Λ}}(D_τ)=Ω•_{D_{Σ,Λ}/A_cris,log,PD}` is identified with `RΓ_logcrys((Spf R)_{O_C/p}/A_cris)` by the log PD de Rham comparison for the PD smooth envelope (CK (5.23.1), (5.23.3)); after sheafification the model identifies with the log crystalline pushforward of CrystallineCohomology, CR.5, `Ru_*O`.
- `Semistable.allCoordinatesLogCrystalline.refine`: Envelope refinement gives coherent maps of these complexes and composes with chart restriction.
- `Semistable.allCoordinatesLogCrystalline.frobenius`: On degree `j` forms the map is `p^jφ`, agreeing with log crystalline Frobenius.
- `Semistable.allCoordinatesLogCrystalline.de_rham`: Under the identification, the map `RΓ_logcrys((Spf R)_{O_C/p}/A_cris)→RΓ_logdR(Spf R/O_C)` is the map `Ω•_{D_{Σ,Λ}/A_cris,log,PD}→Ω•_{Spf(R)/O_C,log}` induced by `D_{Σ,Λ}→R` (CK (5.23.2)).

Use the log derivations and the rings `D^{(m)}_{Σ,Λ}` of *All-coordinates log PD envelope* (§AI.6.4). Prove CK Proposition 5.23 with CR.5’s log PD Poincaré lemma: `A□_{Σ,Λ}⊗_{A_inf}A_cris/p^n` is a log smooth thickening of R/p over `A_cris/p^n` (CK §5.11), so its log PD envelope `D_{Σ,Λ,n}` is PD smooth over `A_cris/p^n` (Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.4, Remarks (ii)); hence the log PD de Rham complex of `D_{Σ,Λ,n}` computes log crystalline cohomology over `A_cris/p^n` (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.8.1)) and equals `Ω•_{(A□_{Σ,Λ}⊗A_cris/p^n)/(A_cris/p^n),log}⊗D_{Σ,Λ,n}` (Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.7, Exercises, `(i)`); all three for quasi-coherent integral log structures, supplied by CR.5. The limit over `n` gives (5.23.1), and CK (5.10.3) (*Local logarithmic derivations* (§AI.6.4)) gives the Koszul form (5.23.3). The same argument for the log smooth thickenings `R/p^n` over `O_C/p^n` gives (5.23.2). By CK (5.30.1) and §5.31 rewrite (5.23.3) as (5.31.5). By CK §5.32 the formation is compatible with enlarging `(Σ,Λ)` and with p-adically formally étale `R→R′` (through the universal properties (5.26.3), (5.27.3)); take the filtered colimit, using E1 for the coherent filtered colimit. All completions here are classical, termwise p-adic completions of rings and of complexes, as in CK (5.30.1), (5.32.1) and (5.38.4). No derived completion is used on the divided power side: p-torsion-freeness of `D_{Σ,Λ}` is not known (CK §5.22), so the derived completion could differ. (ČK (arXiv v3), Proposition 5.23, (5.23.1), p.44; ČK (arXiv v3), Proposition 5.23, proof, p.44; ČK (arXiv v3), Proposition 5.23, (5.23.2), proof, p.44; ČK (arXiv v3), §5.31, (5.31.5), p.50; ČK (arXiv v3), §5.32, (5.32.1), p.50; ČK (arXiv v3), §5.32, p.50). *Needs:* *All-coordinates log PD envelope* (§AI.6.4); *Local logarithmic derivations* (§AI.6.4); CrystallineCohomology, CR.5; *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); *All-coordinates root covers* (§AI.6.4).

**Checks.**

- `Semistable.allCoordinatesLogCrystalline.point`: For `R=O_C` and the index `Σ=∅`, `Λ={λ}` with `d=0`, the term is `A_cris` in degree 0.
- `Semistable.allCoordinatesLogCrystalline.node`: For one node chart the degree-one forms have the relation `dlogX₀+dlogX₁=0`.
- `Semistable.allCoordinatesLogCrystalline.smooth`: If `R` is smooth and every `λ∈Λ` has `r_λ=0`, then the exactification is trivial (`Q→P_{λ₀}` is an isomorphism), `A□_{Σ,Λ}` is a `(p,μ)`-completed torus over `A_inf`, `D_{Σ,Λ}` is the p-completed divided power envelope of R/p in it over `A_cris`, and `K_{D_{Σ,Λ}}(D_τ)` is its PD de Rham complex in the coordinates `X_τ∂/∂X_τ`. For `Σ` as in BMS1 §12.2 the projection to the torus on `Σ` maps the corresponding complex for `Σ` alone into it. This is a comparison map, not an identification with the smooth *All-coordinates root covers* (§AI.6.4) complex, and it is not a statement of CK.
- `Semistable.allCoordinatesLogCrystalline.torus_point`: For `R=O_C`, `Σ={σ}` with `t_σ↦u∈O_C^×` and `Λ={λ}` with `d=0`, the complex `K_{D_{Σ,Λ}}(∂/∂log X_σ)` is the two-term complex `D_{Σ,Λ}→D_{Σ,Λ}` with `D_{Σ,Λ}` the completed divided power polynomial algebra over `A_cris` in `X_σ−[u^♭]`; it is quasi-isomorphic to `A_cris` in degree 0 but not concentrated in degree 0.
- Frobenius on one log direction multiplies its differential by p.

**All-coordinates comparison morphism** (`Semistable.allCoordinatesComparisonMap`). Use the canonical map `D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞})` of CK §5.38, including its logarithmic ratio variables: it is the p-adic completion of the divided power morphism `D_{jλ₀}→A_cris^0(R_{Σ,Λ,∞})` of CK Lemma 5.37, which sends the exactification units to Teichmüller units of `A_inf(R_{Σ,Λ,∞})`; it does not depend on `λ₀`, is `Δ_{Σ,Λ}-` and Frobenius-equivariant, is compatible with `D_{Σ,Λ}→R` and `θ`, and restricts to maps `D^{(m)}_{Σ,Λ}→A_cris^(m)(R_{Σ,Λ,∞})` for `m≥p` (CK (5.38.1)–(5.38.3)). For `m≥p²` the maps (id, `∑_{n≥1}(log([ε]))^n/n!·D_τ^{n−1}`), `D_τ=∂/∂log(X_τ)`, define a Frobenius-equivariant morphism `K_{D^{(m)}_{Σ,Λ}}(D_τ)→η_μK_{D^{(m)}_{Σ,Λ}}(δ_τ−1)`, where the target is the subcomplex given by formula (1.7.3) of CK (CK Proposition 5.34). Composing with `η_μ` of the maps of Koszul complexes induced by (5.38.3), and passing to the termwise colimit over `m`, the termwise p-adic completion and the filtered colimit over `(Σ,Λ)`, gives the comparison map from the *All-coordinates root covers* (§AI.6.4) log crystalline model to the *All-coordinates root covers* (§AI.6.4) `AΩ` model (CK (5.38.4)). It is a map of complexes that commutes with `φ`, with refinements and with p-adically formally étale maps `R→R′`. It is not a map of differential graded algebras, and no multiplicativity is asserted.

Standing hypotheses (SS). Spf `R` and `(Σ,Λ)` are as in *All-coordinates root covers* (§AI.6.4). The ring maps (5.38.3) exist for `m≥p`; the exponential maps of CK Proposition 5.34 require `m≥p²`; the colimits over `m≥p` are computed over the cofinal range `m≥p²`.

The API:

- `Semistable.allCoordinatesComparisonMap.coefficients`: The degree-zero map is the ring map `D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞})` of CK (5.38.1), the p-adic completion of the divided power morphism `D_{jλ₀}→A_cris^0(R_{Σ,Λ,∞})`; it is independent of `λ₀`, `Δ_{Σ,Λ}-` and Frobenius-equivariant, compatible with `D_{Σ,Λ}→R` and `θ`, and restricts to `D^{(m)}_{Σ,Λ}→A_cris^(m)(R_{Σ,Λ,∞})` for `m≥p`.
- `Semistable.allCoordinatesComparisonMap.frobenius`: The comparison intertwines `p^jφ` on j-forms with the `AΩ` Frobenius.
- `Semistable.allCoordinatesComparisonMap.natural`: The map commutes with *All-coordinates root covers* (§AI.6.4) refinement and with p-adically formally étale maps `R→R′`.
- `Semistable.allCoordinatesComparisonMap.units`: Under `D_{jλ₀}→A_cris^0(R_{Σ,Λ,∞})` each `X_τ` maps to the Teichmüller lift `[t_τ^♭]` of the system of p-power roots of `t_τ` and, in the nonsmooth case, `U_{λ,λ₀,y}` maps to `[u^♭_{λ,λ₀,y}]`, where `u^♭_{λ,λ₀,y}` is the system of units `t_{λ,i_λ(y)}^{1/p^m}/t_{λ₀,i_{λ₀}(y)}^{1/p^m}` of `R_{Σ,Λ,∞}` (CK Lemma 5.37).
- `Semistable.allCoordinatesComparisonMap.exponential`: For `m≥p²`, `δ_τ=∑_{n≥0}(log([ε]))^n/n!·D_τ^n` as endomorphisms of `D^{(m)}_{Σ,Λ}` (CK Lemma 5.33).

CK §5.35 and Proposition 5.36 (*Finite-level crystalline period rings A_cris^(m)* (§AI.6.4), API item injective; `A_cris⁰(R′_∞)` from DerivedDeRhamCohomology §PD.7): for an affinoid perfectoid `R′_∞` over `O_C`, `A_cris^0(R′_∞)≅A_inf(R′_∞)[T^n/n!]_{n≥1}/(T−ξ)` is the divided power envelope of `(A_inf(R′_∞),Ker θ+p)` over `(ℤ_p,pZ_p)` (Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, proof of A2.8); `A_cris^{0,(m)}(R′_∞)≅A_inf(R′_∞)⊗_{A_inf}A_cris^{0,(m)}` with completion `A_cris^(m)(R′_∞)` ((5.35.1)–(5.35.2)); and the maps `A_cris^{0,(m)}(R′_∞)→A_cris^(m)(R′_∞)→A_cris(R′_∞)→B_dR⁺(R′_∞)` are injective (using Tsuji, p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case, A2.9 (2), for the filtration by divided powers of `ξ`). CK Lemma 5.37: make `A_inf(R_{Σ,Λ,∞})` an algebra over `A□_{Σ,Λ}⊗_{Z[Q]}Z[P_{λ₀}]` (*Log exactification of all-coordinates charts* (§AI.6.4)), `Δ_{Σ,Λ}-` and Frobenius-equivariantly and compatibly with change of `λ₀`. Smooth case: `X_{λ,i}` is a unit when `t_{λ,i}∈R^×`, because `A_inf(R_{Σ,Λ,∞})` is `ξ`-adically complete, so (5.26.3) has a unique solution. Nonsmooth case: `t_{λ,i_λ(y)}^{1/p^m}/t_{λ₀,i_{λ₀}(y)}^{1/p^m}` is a unit of `R_{Σ,Λ,∞}` for every `m`, because `R_{Σ,Λ,∞}` is integrally closed in `R_{Σ,Λ,∞}[1/p]` (perfectoid input, PerfectoidSpaces, P3); the compatible system defines `u^♭_{λ,λ₀,y}`, and `[u^♭_{λ,λ₀,y}]` solves (5.27.3) because the `X_{λ,i}` are nonzerodivisors in `A_inf(R_{Σ,Λ,∞})`. The universal property of the PD envelope `D_{jλ₀}` (CR.0, *All-coordinates log PD envelope* (§AI.6.4)) then gives (5.37.1). CK §5.38: complete p-adically to get (5.38.1), using CK Lemma 5.29; by the first step its restriction to `D^{0,(m)}_{Σ,Λ}` lands in `A_cris^{0,(m)}(R_{Σ,Λ,∞})⊂A_cris(R_{Σ,Λ,∞})`, and completion gives (5.38.3). Apply *Local logarithmic crystalline comparison* (§AI.6.4)’s exponential operator in the form of CK Lemma 5.33 and Proposition 5.34: for `m≥p²`, `δ_τ` acts on `D^{(m)}_{Σ,Λ}` as `∑_{n≥0}(log([ε]))^n/n!·D_τ^n` (from CK Lemma 5.15, the universal properties (5.26.3), (5.27.3) and that of `D_{jλ₀}`); since `(log([ε]))^n/(μ·n!)` lies in `A_cris^(m)`, the degree-one components land in `μ·D^{(m)}_{Σ,Λ}`, which gives the morphism to the subcomplex (1.7.3). `D^{(m)}_{Σ,Λ}` is not known to be `μ`-torsion free, so this subcomplex is not asserted to compute `Lη_μ`. Frobenius-equivariance is as in CK Proposition 5.16. Compose and pass to the colimits; passage to *All-coordinates root covers* (§AI.6.4) colimits preserves the specified maps (CK §5.38, last two paragraphs). That (5.38.4) is not a map of differential graded algebras is CK’s remark in the proof of Proposition 5.41: it would be one only if the terms with `n≥1` of the degree-one component `log([ε])·∑_{n≥0}(log([ε]))^n/(n+1)!·D_τ^n` could be disregarded. All completions here are classical, termwise p-adic completions of rings and of complexes, as in CK (5.30.1), (5.32.1) and (5.38.4). No derived completion is used on the divided power side: p-torsion-freeness of `D_{Σ,Λ}` is not known (CK §5.22), so the derived completion could differ. (ČK (arXiv v3), Lemma 5.33, p.51; ČK (arXiv v3), Proposition 5.34, (5.34.1), p.51; ČK (arXiv v3), §1.7, (1.7.3), p.7; ČK (arXiv v3), §5.35, (5.35.2), p.52; ČK (arXiv v3), Proposition 5.36, (5.36.1), p.52; ČK (arXiv v3), Lemma 5.37, (5.37.1), p.53; ČK (arXiv v3), Lemma 5.37, proof, p.54; ČK (arXiv v3), §5.38, (5.38.1), p.54; ČK (arXiv v3), §5.38, (5.38.3), p.54; ČK (arXiv v3), §5.38, (5.38.4), p.55; ČK (arXiv v3), §5.38, p.55; ČK (arXiv v3), Proposition 5.41, proof, p.58). *Needs:* *All-coordinates log PD envelope* (§AI.6.4); *All-coordinates AΩ comparison model* (§AI.6.4); *All-coordinates log crystalline model* (§AI.6.4); *Local logarithmic crystalline comparison* (§AI.6.4); DerivedDeRhamCohomology, §§PD.6–PD.7; *All-coordinates root covers* (§AI.6.4); *Log exactification of all-coordinates charts* (§AI.6.4); PerfectoidSpaces, P3; *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); *Finite-level crystalline period rings A_cris^(m)* (§AI.6.4); *Perfectoidness of products of root towers* (§AI.6.1).

**Checks.**

- `Semistable.allCoordinatesComparisonMap.point`: For `R=O_C` and the index `Σ=∅`, `Λ={λ}` with `d=0`, both models are `A_cris` in degree 0 and the map is the identity of `A_cris`.
- `Semistable.allCoordinatesComparisonMap.node`: For `λ∈Λ` and `m≥p²` the square (5.39.2) commutes: the comparison map precomposed with the map of Koszul complexes induced by `A_cris^(m)(R)_λ→D^{(m)}_{Σ,Λ}` equals the unit-operator exponential comparison (5.16.2) of *Local logarithmic crystalline comparison* (§AI.6.4) followed by the map induced by the subcover `R_{λ,∞}⊂R_{Σ,Λ,∞}`.
- `Semistable.allCoordinatesComparisonMap.de_rham`: The square formed by `D_{Σ,Λ}→R` (CK (5.22.3)), the degree-zero map `D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞})`, `θ`: `A_cris(R_{Σ,Λ,∞})→R_{Σ,Λ,∞}` and `R→R_{Σ,Λ,∞}` commutes (CK (5.38.2)). The agreement of the whole map with the log de Rham specialization, including its differential, is the content of *Log crystalline and de Rham agreement* (§AI.6.4) and is not part of this construction.
- `Semistable.allCoordinatesComparisonMap.torus_generator`: For `σ∈Σ` the degree-zero map sends `X_σ` to `[t_σ^♭]∈A_inf(R_{Σ,Λ,∞})`, on which `δ_σ` acts by multiplication by `[ε]`; correspondingly `∑_{n≥0}(log([ε]))^n/n!·D_σ^n(X_σ)=[ε]·X_σ` in `D^{(m)}_{Σ,Λ}` for `m≥p²`.
- In degree 0 the map is the ring map `D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞})` of (5.38.1), and the square formed with `D_{Σ,Λ}→R`, `R→R_{Σ,Λ,∞}` and `θ`: `A_cris(R_{Σ,Λ,∞})→R_{Σ,Λ,∞}` commutes (CK (5.38.2)); an arbitrary quasi-isomorphism is insufficient.
- In degree 1 the component for `τ` is `log([ε])·∑_{n≥0}(log([ε]))^n/(n+1)!·D_τ^n` followed by the ring map; the terms with `n≥1` are what prevents the map from being a map of differential graded algebras.

**Absolute log crystalline comparison** (`Semistable.absoluteCrystallineComparison`). The *All-coordinates root covers* (§AI.6.4) comparison morphism is a quasi-isomorphism: for every index `(Σ,Λ)` the map (5.38.4) of *All-coordinates comparison morphism* (§AI.6.4) is a quasi-isomorphism (CK Proposition 5.39). It sheafifies to a Frobenius-equivariant isomorphism `Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}≃AΩ_𝔛⊗̂^L_{A_inf}A_cris` in the derived category of sheaves of `A_cris`-modules on `𝔛_ét` (CK Theorem 5.4, (5.40.1)), where `u` is the projection from the log crystalline topos of `𝔛_{O_C/p}` over `A_cris`. The tensor is derived p-completed: `AΩ_𝔛⊗̂^L_{A_inf}A_cris=Rlim_n(AΩ_𝔛⊗^L_{A_inf}A_cris/p^n)`. By construction the isomorphism is compatible with étale localisation on `𝔛`. Multiplicativity, and functoriality for morphisms of semistable formal schemes that are not étale, are not asserted.

Standing hypotheses (SS). `𝔛` is as in CK §1.5; neither properness nor quasi-compactness is needed for the sheaf statement. In the proof the ring maps use `m≥p` and the single-chart comparison of *Local logarithmic crystalline comparison* (§AI.6.4) uses `m≥p²`.

Prove CK Proposition 5.39 by reduction to *Local logarithmic crystalline comparison* (§AI.6.4). Fix `λ∈Λ`. Let `B=A□_{Σ,Λ}⊗_{ℤ[Q]}ℤ[P_λ]` be the original exactified chart algebra and `I=ker(B→R/p)`, with `s` generators, including `p`. In `D_m=D^{(m)}_{Σ,Λ}` put `I_m=I D_m`. For `m≥p`, the degree-`p` divided powers of these original generators give `I_m^{s(p−1)+1}⊆pD_m⊆I_m`. Thus the `I_m`-adic and `p`-adic topologies are equivalent and `D_m` is complete for both. The map `B/I=R/p→D_m/I_m` specifies a reduction map from `A(R)_λ`, over `A(R□_λ)`, by its reduction to `R/p`. Formal étaleness of the underlying `A_inf`-algebra `A(R□_λ)→A(R)_λ` gives its unique continuous lift to `D_m` with this specified reduction. Extend this map over `A_cris^(m)` and complete to obtain (5.39.1). Uniqueness applies to the underlying formally étale lift with that reduction, rather than an arbitrary lift from the full augmentation quotient. It gives compatibility as `m` varies, with `Δ_{Σ,Λ}→Δ_λ` and with the maps to `A_cris^(m)(R_{Σ,Λ,∞})`; uniqueness of extending derivations gives compatibility with `∂/∂log(X_{λ,i})`. The full augmentation kernel of `D_m→R/p` need not be a divided-power or topologically nilpotent ideal. In the resulting commutative square (5.39.2) the top map is the quasi-isomorphism (5.16.2) of *Local logarithmic crystalline comparison* (§AI.6.4) for `m≥p²` (CK Proposition 5.16); the right map is a quasi-isomorphism by CK Lemma 3.7 and Remark 3.35 (*All-coordinates AΩ comparison model* (§AI.6.4)); and the left map becomes a quasi-isomorphism after the colimit over `m` and termwise p-adic completion, because both sides then compute `RΓ_logcrys((Spf R)_{O_C/p}/A_cris)` (CK Proposition 5.13 and (5.31.5); *All-coordinates log crystalline model* (§AI.6.4), CR.5). Hence the bottom map (5.38.4) is a quasi-isomorphism. Take the filtered colimit over `(Σ,Λ)`: the comparison map between the two models is a quasi-isomorphism, functorially in `R` for p-adically formally étale maps (CK §5.38). Sheafify by CK §5.40 in E1; the explicit map remains the map of *All-coordinates comparison morphism* (§AI.6.4). The two models are complexes of presheaves on the basis of `𝔛_ét` formed by the Spf `R` of *All-coordinates root covers* (§AI.6.4), with values `AΩ_R⊗̂^L_{A_inf}A_cris` and `RΓ_logcrys((Spf R)_{O_C/p}/A_cris)`. The sheafification of the second represents `Ru_*O` (CR.5). For the first CK refers to §5.21; in detail, by CK Corollary 4.6 (*Derived completeness and sheaf property of AΩ* (§AI.6.3)) `AΩ_R=RΓ(Spf R,AΩ_𝔛)`, and by the argument at the start of the proof of CK Corollary 5.43 (affine opens are quasi-compact and quasi-separated) `RΓ(Spf R,AΩ_𝔛)⊗̂^L_{A_inf}A_cris=RΓ(Spf R,AΩ_𝔛⊗̂^L_{A_inf}A_cris)`, so the sheafification is `AΩ_𝔛⊗̂^L_{A_inf}A_cris` (EnhancedDerivedSheaves, E4 (*Completed sheaf tensor product*)). (ČK (arXiv v3), Theorem 5.4, (5.4.1), p.33; nothing more is claimed; ČK (arXiv v3), Theorem 5.4, p.33; ČK (arXiv v3), Proposition 5.39, p.55; ČK (arXiv v3), Proposition 5.39, proof, p.55; ČK (arXiv v3), Proposition 5.39, proof, p.56; ČK (arXiv v3), §5.38, p.55; ČK (arXiv v3), §5.40, p.56; ČK (arXiv v3), §5.40, (5.40.1), p.56; ČK (arXiv v3), Corollary 4.6, (4.6.1), p.26). *Needs:* *All-coordinates comparison morphism* (§AI.6.4); *Local logarithmic crystalline comparison* (§AI.6.4); *All-coordinates log crystalline model* (§AI.6.4); CrystallineCohomology, CR.5; EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); EnhancedDerivedSheaves, E4 (*Completed sheaf tensor product*); *Semistable AΩ complex* (§AI.6.2); *All-coordinates AΩ comparison model* (§AI.6.4); *All-coordinates log PD envelope* (§AI.6.4); *All-coordinates root covers* (§AI.6.4); *Derived completeness and sheaf property of AΩ* (§AI.6.3); *Completed extension of scalars along a map of adic rings* (§AI.1.5); *Derived p-completion on a site that is not replete* (§AI.1.5).

**Checks.**

- For a node chart the degree-one term of the log crystalline model is free on dlog X₁, with dlog X₀+dlog `X₁=0`, and on the single-chart complex the comparison is `μ·U₁` in degree one, with U₁ the unit operator of *Local logarithmic crystalline comparison* (§AI.6.4).
- For `𝔛=Spf O_C` the isomorphism is the identity of `A_cris`.
- For the point with `Σ=∅`, `Λ={λ}`, `d=0` and `p=m=2`, `D_m=(A_inf[T]/(2T−ξ²))^∧_2` and `D_m/2=O_C^♭[T]/(ξ̄²)`. The augmentation kills `T`, but every `T^n` survives in `k[T]`. In contrast, `I_m=(2,ξ)D_m` satisfies `I_m³⊆2D_m⊆I_m`; the surviving variable is retained in the specified reduction modulo `I_m`.
- For smooth `𝔛` the agreement of this isomorphism with that of BMS1 Theorem 12.1 along the comparison of presentations of *All-coordinates root covers* (§AI.6.4) is not proved in CK and is not asserted here.

**Log crystalline and de Rham agreement** (`Semistable.crystallineDeRhamSquare`). The triangle formed by the isomorphism `Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}→AΩ_𝔛⊗̂^L_{A_inf}A_cris` of *Absolute log crystalline comparison* (§AI.6.4), the de Rham specialization `AΩ_𝔛⊗̂^L_{A_inf}A_cris→Ω•_{𝔛/O_C,log}` of *Log de Rham specialization* (§AI.6.3) (CK (4.17.1)) and the map `Ru_*O_{𝔛_{O_C/p}/A_cris,logcrys}→Ω•_{𝔛/O_C,log}` induced by CR.5’s log crystalline-to-log de Rham comparison `Ru_*O⊗̂^L_{A_cris,θ}O_C≅Ω•_{𝔛/O_C,log}` commutes in the derived category of sheaves on `𝔛_ét` (CK Proposition 5.41). Equivalently, after `A_cris→O_C`, *Absolute log crystalline comparison* (§AI.6.4) agrees with *Log de Rham specialization* (§AI.6.3) and CR.5’s comparison. This is an equality of maps of complexes, rather than only an equality of cohomology ranks. On the presheaf complexes of *All-coordinates root covers* (§AI.6.4) both composites are the unique map of differential graded algebras `Ω•_{D_{Σ,Λ}/A_cris,log,PD}→Ω•_{Spf(R)/O_C,log}` that is `D_{Σ,Λ}→R` in degree 0; the comparison isomorphism of *Absolute log crystalline comparison* (§AI.6.4) itself is not asserted to be multiplicative.

Standing hypotheses (SS). `𝔛` is as in CK §1.5. The statement concerns maps in the derived category of sheaves on `𝔛_ét` and is proved on the functorial presheaf complexes attached to the Spf `R` and indices `(Σ,Λ)` of *All-coordinates root covers* (§AI.6.4).

Work on the functorial presheaf complexes over the Spf `R` of *All-coordinates root covers* (§AI.6.4): CK writes that the claim is local, and since commutativity in a derived category of sheaves is not a local property in general, the argument is run on chain maps that are functorial in `R`. By CK Proposition 5.23 (*All-coordinates log crystalline model* (§AI.6.4), API `de_rham`) the map from CR.5 (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.8.1) and (1.11.1); CK Remark 5.24) is the map of differential graded algebras `Ω•_{D_{Σ,Λ}/A_cris,log,PD}→Ω•_{Spf(R)/O_C,log}` induced by `D_{Σ,Λ}→R`. Uniqueness (CK (5.41.2)): the dlog `X_σ` and dlog `X_{λ,i}` generate `Ω•_{D_{Σ,Λ}/A_cris,log,PD}` as a differential graded algebra over `D_{Σ,Λ}`, the terms of `Ω•_{Spf(R)/O_C,log}` are p-torsion free, and the `t_σ` and `t_{λ,i}` are units in R[1/p]; so there is at most one map of differential graded algebras lying over `D_{Σ,Λ}→R`. Describe the de Rham specialization of *Log de Rham specialization* (§AI.6.3) on the complexes `η_μK_{A_cris^(m)(R_{Σ,Λ,∞})}(δ_τ−1)` of *All-coordinates AΩ comparison model* (§AI.6.4), as in the proof of CK Theorem 4.17: apply Frobenius (*Semistable AΩ Frobenius* (§AI.6.2)), reduce modulo `φ(ξ)` to `H•(η_μK/φ(ξ))` with its Bockstein differential (BMS1 Proposition 6.12; *Reduction to the Bockstein complex* (§AI.1.4)), and map by `θ∘φ^{-1}` to `H•(η_{ζ_p−1}K_{R_{Σ,Λ,∞}}(δ_τ−1))≅Ω•_{Spf(R)/O_C,log}` (*Log Hodge–Tate reduction* (§AI.6.3): CK Theorem 4.11, Remark 4.5, (4.2.2), with Remarks 3.10 and 3.21 for the cover `R_{Σ,Λ,∞}`). The Bockstein differentials agree because the cohomology is p-torsion free and the comparison can be made after inverting p. By BMS1 Lemma 6.13 and the differential graded algebra structure of BMS1 Lemma 7.5 on Koszul complexes (Layer AI.1), the resulting map (5.41.4) is a map of differential graded algebras that is `θ` in degree 0. Reduce the exponential operators of *All-coordinates comparison morphism* (§AI.6.4) along `θ`: the degree-one component of the comparison map is `log([ε])·∑_{n≥0}(log([ε]))^n/(n+1)!·(∂/∂log X_τ)^n`, and in the composite with (5.41.4) the terms with `n≥1` can be ignored because `log([ε])` is a unit multiple of `μ` and `θ(μ^n/(n+1)!)=0` for `n≥1`. So the composite is a map of differential graded algebras, equal to `D_{Σ,Λ}→R` in degree 0 by CK (5.38.2), hence the unique one of the second step. (ČK (arXiv v3), Proposition 5.41, (5.41.1), p.56; ČK (arXiv v3), Proposition 5.41, p.56; ČK (arXiv v3), Remark 5.24, (5.24.1), p.44; ČK (arXiv v3), Proposition 5.41, proof, (5.41.2), p.56; ČK (arXiv v3), Proposition 5.41, proof, p.57; ČK (arXiv v3), Proposition 5.41, proof, (5.41.4), p.58; ČK (arXiv v3), Proposition 5.41, proof, p.58). *Needs:* *Absolute log crystalline comparison* (§AI.6.4); *All-coordinates comparison morphism* (§AI.6.4); *Log de Rham specialization* (§AI.6.3); CrystallineCohomology, CR.5; *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); *Log Hodge–Tate reduction* (§AI.6.3); *Semistable AΩ Frobenius* (§AI.6.2); *All-coordinates AΩ comparison model* (§AI.6.4); *All-coordinates log crystalline model* (§AI.6.4); *All-coordinates log PD envelope* (§AI.6.4); *Reduction to the Bockstein complex* (§AI.1.4); *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2).

**Checks.**

- On a node chart the composite carries dlog X₁ to dlog t₁, with the relation dlog t₀+dlog `t₁=0` and the log de Rham differential.

- For `Spf O_C`, the square reduces to the coefficient map `A_cris→O_C` on degree-zero rings.
- On a node chart, both routes carry the logarithmic branch relation to `dlog x+dlog y=0`; ordinary singular differentials do not give this comparison.


**Rational normalization of Hyodo–Kato monodromy** (`Semistable.pNormalizedMonodromy`). Let `K` be complete discretely valued of mixed characteristic `(0,p)` with perfect residue field `k₀`, uniformizer `π_K` and `e_K=ord_(π_K)(p)>0`. For the CR.6 Hyodo–Kato complex `C_HK=RΓ_logcrys(Y_(k₀)/W(k₀))[1/p]` of a proper fine log smooth Cartier-type `Y/O_K/p`, use its existing carrier and signed boundary `N_raw` at the uniformizer log point. Define `N_HK,p=e_K⁻¹N_raw` on `C_HK`. This operator is nilpotent, satisfies `N_HK,p φ=pφN_HK,p`, and is preserved by rational ramified base change. It is the operator paired with `N_p=−d/dT` on CK’s p-normalized `B_st⁺`. The integral CR.6 operator remains `N_raw`; an integral division by `e_K` is not part of the construction.

The log structure on `O_K/p` is induced by `O_K∖{0}→O_K/p`; its special log point has the chart `ℕ→k₀`, `1↦0`, with generator the class of `π_K`. The normalization is on the rational complex and its cohomology.

The log class of `p` is `e_K` times the uniformizer class, up to a unit. Beilinson’s log-parameter rescaling identifies its monodromy with `e_K⁻¹N_raw`, compatibly with the p-torsor used by CK. Reuse CR.6’s ramified base change: under ramification index `d`, raw monodromy scales by `d` and `e_L=d e_K`, so the normalized operators agree. Rational scalar multiplication preserves nilpotence and the Frobenius–monodromy relation. (Beilinson, *On the crystalline period map*, §1.15(ii), pp.21–22, and §1.16, pp.24–25; [Nekovář–Nizioł, *Syntomic cohomology and p-adic regulators*](https://msp.org/ant/2016/10-8/ant-v10-n8-p04-s.pdf), §3A, p.1722, and Example 3.5(3), equation (29), pp.1727–1728; ČK, §9.1, p.75.) *Needs:* CrystallineCohomology, CR.6 (*Hyodo–Kato monodromy*, *Frobenius–monodromy relation*, *Nilpotence of Hyodo–Kato monodromy*, *Ramified Hyodo–Kato base change*); PadicPeriodRings, §4.1 (`generalBasePeriodRings`).

**Checks.**

- For `e_K=1`, `N_HK,p=N_raw`; the relative log point has both operators zero.
- For `K=ℚ₅(√5)`, `π_K=√5` and the split Tate curve `E_(π_K)` with a proper semistable model, CR.6’s geometric Tate basis has `N_raw(e₁)=e₀` but `N_HK,p(e₁)=e₀/2`. For the p-normalized period comparison `c`, `(1⊗N_p)c(e₁⊗1)=c(e₀⊗1)/2`; using `N_raw` on the first factor gives the wrong coefficient. Both monodromy matrices satisfy `Nφ=5φN` with Frobenius `diag(1,5)`.
- For `K=ℚ_p(p^(1/p))` and the Tate curve with parameter `π_K=p^(1/p)`, the coefficient is `1/p`. Thus the normalized operator need not preserve the integral geometric Tate lattice.
- Under a finite ramified extension of index `d`, `N_raw,L/e_L=(dN_raw,K)/(d e_K)` on the compared rational complexes, including when `p` divides `d`.

**Rational finiteness of log crystalline cohomology over A_cris** (`Semistable.rational_log_crystalline_finiteness`). For a proper fine log smooth log scheme `Y` of Cartier type over O/p, where `O` is the ring of integers of a finite extension of W(k̄)[1/p] in `C`, the cohomology modules of `RΓ_logcrys(Y_{O_C/p}/A_cris)[1/p]` are finite free over `A_cris[1/p]`; over `B_st⁺` there is a Frobenius-equivariant identification `RΓ_logcrys(Y_{k̄}/W(k̄)) ⊗^L_{W(k̄)} B_st⁺ ≅ RΓ_logcrys(Y_{O_C/p}/A_cris) ⊗^L_{A_cris} B_st⁺`. It intertwines `N_left=(e_O⁻¹N_raw)⊗1+1⊗N_p` with `N_right=1⊗N_p`, where `e_O=ord_(π_O)(p)` and `Nφ=pφN`.

`Y` as stated; `Y_{k̄}` uses the uniformizer log point and its raw CR.6 boundary `N_raw`, with rational normalization from *Rational normalization of Hyodo–Kato monodromy* (§AI.6.4); descent to `k₀` requires the model of *Arithmetic Hyodo–Kato interface* (§AI.6.4); `B_st⁺` is the semistable period ring of PadicPeriodRings, §§1.5, 4.1.

Apply the rational normalization adapter for `K=Frac(O)` before the Hyodo–Kato isomorphism over the divided power base of `A_st`. Construct this isomorphism from Frobenius and its contracting action on the divided power ideal (Beilinson, 1.16–1.18). The p-torsor identifies the normalized boundary on the first factor with the period derivation `N_p`, giving the stated total monodromy. (ČK (arXiv v3), Corollary 5.43 and its proof, printed pp.58–59; ČK (arXiv v3), §9.1 and Proposition 9.2, (9.2.2), printed pp.75–76). *Needs:* *Base change for log crystalline cohomology of Cartier type* (§AI.6.4); PadicPeriodRings, §4.1 (*generalBasePeriodRings*: `B_st`, Frobenius, monodromy and action); CrystallineCohomology, CR.6 (*Standard log Witt bases*); *Rational normalization of Hyodo–Kato monodromy* (§AI.6.4).

**Checks.**

- For `O` finite over `W(k̄)`, the reduction of `Y` is over `k̄`; it has no implicit `k₀`-model.
- For the relative log point over `O/p`, the comparison in degree zero is the coefficient identification and monodromy is zero.
- For the proper Tate model over `O=W(k̄)[√5]` at `p=5`, with parameter `√5`, the geometric Tate basis has raw coefficient `1` and normalized coefficient `1/2`. The `B_st⁺` comparison carries total normalized monodromy to coefficient monodromy; the Frobenius relation alone holds for both scalings.


**Descent of the semistable special fibre to a finite level**. For `𝔛` as in (SS), quasi-compact and quasi-separated, there is the ring of integers `O` of a finite extension of W(k̄)[1/p] in `C` and a quasi-compact quasi-separated fine log smooth log scheme `Y` of Cartier type over O/p with `Y ⊗_{O/p} O_C/p ≅ 𝔛 ⊗ O_C/p` compatibly with log structures; `Y` is proper when `𝔛` is.

Standing hypotheses (SS).

Write `O_C/p` as the filtered colimit of the O/p over finite extensions and descend the finitely presented log scheme by limit arguments; Cartier type is checked on the semistable charts (Kato 4.8). (ČK (arXiv v3), proof of Corollary 5.43 and Remark 5.44, printed pp.58–59). *Needs:* *Algebraization and descent of semistable charts* (§AI.6.1); SchemeAndStackFoundations, §0.9 (`noetherian_approximation`, `finite_presentation_limits`); CrystallineCohomology, CR.5 (*Morphisms of Cartier type*).

**Global crystalline and Witt specializations** (`Semistable.globalCrystallineComparison`). For qcqs `𝔛` there are Frobenius-equivariant identifications `RΓ_Ainf(𝔛)⊗̂^L_{A_inf}A_cris≃RΓ_logcrys(𝔛_{O_C/p}/A_cris)` and `RΓ_Ainf(𝔛)⊗̂^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄))`, where W(k̄) carries the pullback of the log structure of `A_cris`, associated to `Q≥0→W(k̄)`, `0≠q↦0`, `0↦1`. If `𝔛` is proper over `O_C` the same identifications hold with the ordinary derived tensors, and `H^i_logcrys(𝔛_{O_C/p}/A_cris)[1/p]` is finite free over `A_cris[1/p]` for every `i` (CK Corollary 5.43). The W(k̄) log base first uses `Q≥0→W(k̄)`; the arithmetic normalization is the next node.

Standing hypotheses (SS). qcqs for the completed form; properness over `O_C` for dropping completion and the p-inverted freeness assertion.

Globalize *Absolute log crystalline comparison* (§AI.6.4) using E1/E4: for qcqs `𝔛` and an `A_inf/p^n-module M` one has `RΓ(𝔛_ét,AΩ_𝔛⊗^L_{A_inf}M)≅RΓ(𝔛_ét,AΩ_𝔛)⊗^L_{A_inf}M`, because `M` is a filtered colimit of perfect `A_inf`-modules (BMS1 Lemma 4.9(i)) and cohomology of a qcqs site commutes with filtered colimits (Stacks Project 0739). With `M=A_cris/p^n` and the limit over `n` this gives the first identification (aomega for `RΓ_Ainf`). Descend `𝔛_{O_C/p}`: using the étale charts and CK Claims 1.6.1 and 1.6.3 (*Divisorial semistable log structure* (§AI.6.1)), a limit argument gives the ring of integers `O` of a finite extension of W(k̄)[1/p] in `C` and a quasi-compact quasi-separated, fine, log smooth log scheme `𝒳` over O/p of Cartier type (Kato, Logarithmic structures of Fontaine–Illusie, 4.8) with `𝒳⊗_{O/p}O_C/p≅𝔛_{O_C/p}`. CK gives no details of the limit argument. The base change theorem (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.11.1), in the quasi-separated form of CK footnote 17; CR.5 log crystalline base change) gives `RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗̂^L_{A_cris}W(k̄)≅RΓ_logcrys(𝔛_{k̄}/W(k̄))`, hence the second identification. Use *Perfect semistable A_inf cohomology* (§AI.6.3) (CK Corollary 4.20) to remove the extra completion in the proper case. For the p-inverted freeness, `𝒳` can then be taken proper over O/p, and Beilinson, On the crystalline period map (arXiv:1111.3316v4), 1.18, Theorem (supplied by CR.6) shows that the cohomology groups of `RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}A_cris[1/p]` are finite free over `A_cris[1/p]`. (ČK (arXiv v3), §5.42, p.58; ČK (arXiv v3), Corollary 5.43, (5.43.1), p.58; ČK (arXiv v3), Corollary 5.43, (5.43.2), p.58; ČK (arXiv v3), Corollary 5.43, p.58; ČK (arXiv v3), Corollary 5.43, proof, p.58; ČK (arXiv v3), Corollary 5.43, proof, (5.43.3), p.59; ČK (arXiv v3), Corollary 5.43, proof, footnote 17, p.59; ČK (arXiv v3), Corollary 5.43, proof, p.59; ČK (arXiv v3), Corollary 4.20, p.31). *Needs:* *Absolute log crystalline comparison* (§AI.6.4); *Perfect semistable A_inf cohomology* (§AI.6.3); CrystallineCohomology, CR.6; *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); EnhancedDerivedSheaves, E4 (*Completed sheaf tensor product*); *Semistable AΩ complex* (§AI.6.2); *Divisorial semistable log structure* (§AI.6.1); *Completed extension of scalars along a map of adic rings* (§AI.1.5); *Derived p-completion on a site that is not replete* (§AI.1.5); *Base change for log crystalline cohomology of Cartier type* (§AI.6.4); *Rational finiteness of log crystalline cohomology over A_cris* (§AI.6.4); *Descent of the semistable special fibre to a finite level* (§AI.6.4); CrystallineCohomology, CR.5 (*Morphisms of Cartier type*).

**Checks.**

- The proper and qcqs formulas must not be interchanged; finite freeness is after p-inversion here.
- For `𝔛=Spf O_C` both sides of the first identification are `A_cris` and both sides of the second are W(k̄).

**Arithmetic Hyodo–Kato interface** (`Semistable.hyodoKatoInterface`). Let `𝔛₀` be a proper arithmetic semistable model over `O_K`, with perfect residue field k₀, and `𝔛=𝔛₀⊗̂_{O_K}O_C`. There are Frobenius-equivariant identifications: (i) `RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄))` for the log base `Q≥0→W(k̄)` (CK (5.43.2)); (ii) `RΓ_logcrys(𝔛_{k̄}/W(k̄))≃RΓ_logcrys((𝔛₀)_{k̄}/W(k̄))` for the log base `ℕ→W(k̄)`, `1↦0` (CK Remark 5.44, (5.44.1)), the change of log structure being `ℕ→Q≥0`, `1↦v(π_K)` for a uniformizer `π_K` of `K`; (iii) `RΓ_logcrys((𝔛₀)_{k̄}/W(k̄))≃RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}W(k̄)`, where the arithmetic log base is `ℕ→W(k₀)`, `1↦0`. Identification (iii) is not stated in CK, which has only its consequence (8.8.1) for the Galois invariants of one cohomology group under the freeness hypotheses of Theorem 8.7; it is base change of log crystalline cohomology of a fine, log smooth log scheme of Cartier type along the map of log divided power bases `W(k₀)→W(k̄)`. So the W(k̄) specialization identifies with `RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}W(k̄)`. If `𝔛₀` is only quasi-compact and quasi-separated, (i)–(iii) hold with p-completed tensor products throughout. (iv) (CK Proposition 9.2, (9.2.2)) For proper `𝔛₀`: `RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}B_st⁺≃RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_st⁺`, compatibly with `φ`, which acts on both factors on each side, and with monodromy `N_left=(e_K⁻¹N_raw)⊗1+1⊗N_p` and `N_right=1⊗N_p`, where `e_K=ord_(π_K)(p)` and `Nφ=pφN`; the identification is `G_K`-equivariant (CK §9.4). The rational comparison with étale cohomology over `B_st` (CK Theorem 9.5) is not part of this statement.

Standing hypotheses (SS). `K⊂C` is a complete discretely valued subfield with perfect residue field k₀, and `C` is the completion of an algebraic closure of `K` (CK §9.4). `𝔛₀` is a proper p-adic formal `O_K-scheme` with an étale cover by affines étale over `Spf(O_K{t₀,…,t_d}/(t₀⋯t_r−π))` for nonunits `π∈O_K∖{0}` (CK Theorem 9.5), with the log structure `O_{𝔛₀,ét}∩(O_{𝔛₀,ét}[1/p])^×`. Properness is used for the uncompleted tensor products. The base extension `W(k₀)→W(k̄)` is explicit; `N_raw` is CR.6’s integral boundary on the descended Hyodo–Kato object `RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))`; clause (iv) uses `N_HK,p=e_K⁻¹N_raw` on its rationalization and `N_p` on `B_st⁺`. No monodromy on `AΩ` itself is asserted.

By *Global crystalline and Witt specializations* (§AI.6.4) (CK (5.43.2)), `RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄))` with the log base `Q≥0→W(k̄)`. Apply CK Remark 5.44 to compare the rational-monoid and standard log-point cohomology. Let K̆ be the completion of the maximal unramified extension of `K` in `C`; it is a finite extension of W(k̄)[1/p]. By CK Claims 1.6.1 and 1.6.3 (*Divisorial semistable log structure* (§AI.6.1)) and Kato, Logarithmic structures of Fontaine–Illusie, 4.8, the reduction of `𝔛₀` over `O_K/p`, hence over `O_{K̆}/p`, is fine, log smooth and of Cartier type, and it descends `𝔛_{O_C/p}`. The base change theorem (Beilinson, On the crystalline period map (arXiv:1111.3316v4), (1.11.1); CR.5/CR.6) gives (5.44.1). Base change along `W(k₀)→W(k̄)`: `RΓ_logcrys((𝔛₀)_{k̄}/W(k̄))≃RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))⊗^L_{W(k₀)}W(k̄)`, p-completed in general. This step is not written out in CK, which uses it in Remark 8.8 to pass to Galois invariants; it is base change of log crystalline cohomology for the map of log divided power bases `W(k₀)→W(k̄)` (CR.6), identification (iii) of the statement. For proper `𝔛₀` the complex `RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))` is perfect (proper finiteness from CR.5), so no completion is needed; the last Check shows that it is needed otherwise. CK Proposition 9.2: the ring `A_st`, initial among `A_cris`-algebras trivialising the Fontaine–Hyodo–Kato torsor, is `A_cris[T]` for a choice of trivialisation, with `N_p=−d/dT` and `φ(T)=pT`, and `B_st⁺=A_st[1/p]` (CK §9.1); by Beilinson, On the crystalline period map (arXiv:1111.3316v4), §1.17, it agrees with Fontaine’s ring (PadicPeriodRings, §4.1 (*generalBasePeriodRings*: `B_st`, Frobenius, monodromy and action), where `B_st⁺=B_cris⁺[u]`, `N_p=−d/du` and `φ(u)=pu`). The descent `Y=(𝔛₀)_{O_K/p}` of `𝔛_{O_C/p}` is fine, log smooth and of Cartier type (second step), and (9.2.2) is Beilinson, (1.16.2) and (1.18.5) (CR.6); transport its Hyodo–Kato operator by *Rational normalization of Hyodo–Kato monodromy* (§AI.6.4). Beilinson’s `p` log parameter acts on the uniformizer chart with index `e_K`, so its operator is `e_K⁻¹N_raw`. Consequently the tensor operator is `(e_K⁻¹N_raw)⊗1+1⊗N_p` on the left and `1⊗N_p` on the right, and `G_K-equivariance` holds because `G_K` acts on both sides by functoriality (CK §9.4). (ČK (arXiv v3), Corollary 5.43, (5.43.2), p.58; ČK (arXiv v3), Remark 5.44, p.59; the descent is over the same algebraically closed field; ČK (arXiv v3), Remark 5.44, (5.44.1), p.59; ČK (arXiv v3), Remark 8.8, (8.8.1), p.74; ČK (arXiv v3), §9.1, p.75; ČK (arXiv v3), Proposition 9.2, (9.2.2), p.76; ČK (arXiv v3), Proposition 9.2, proof, p.76; ČK (arXiv v3), §9.4, p.76; ČK (arXiv v3), Theorem 9.5, p.76; ČK (arXiv v3), Theorem 9.5, (9.5.1), p.76; ČK (arXiv v3), Theorem 9.5, proof, p.76; ČK (arXiv v3), Remark 9.6, p.77). *Needs:* *Global crystalline and Witt specializations* (§AI.6.4); CrystallineCohomology, CR.5; *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); *Divisorial semistable log structure* (§AI.6.1); PadicPeriodRings, §4.1 (*generalBasePeriodRings*: `B_st`, Frobenius, monodromy and action); *Base change for log crystalline cohomology of Cartier type* (§AI.6.4); *Rational finiteness of log crystalline cohomology over A_cris* (§AI.6.4); CrystallineCohomology, CR.6 (*Standard log Witt bases*); *Rational normalization of Hyodo–Kato monodromy* (§AI.6.4).

**Checks.**

- For `K=ℚ₅(√5)` and the split Tate curve `E_(√5)`, clause (iv)’s comparison `c` satisfies `(1⊗N_p)c(e₁⊗1)=c(e₀⊗1)/2` in CR.6’s geometric basis. It does not satisfy the formula with coefficient `1`.
- For k₀ finite, retain its nontrivial Witt Frobenius; a coefficient identity on W(k̄) alone is insufficient.
- For `φ=diag(1,p)` and `N=[[0,1],[0,0]]` on `Q²` one has `Nφ=pφN`, `N≠0` and `N²=0`, while for the transposed `N` the relation fails; this fixes the orientation of the monodromy relation.
- For `𝔛₀=Spf O_K{T^{±1}}`, which is not proper, and k₀ not algebraically closed: `RΓ_logcrys((𝔛₀)_{k₀}/W(k₀))` is computed by `W(k₀){T^{±1}}→W(k₀){T^{±1}}·dlog T`, and its uncompleted base change to W(k̄) does not surject on `H¹` onto the cohomology of `W(k̄){T^{±1}}→W(k̄){T^{±1}}·dlog T`: the class of `∑_j p^{⌊j/2⌋}[x_j]T^{p^j}dlog T`, with `x_j∈k̄` linearly independent over k₀, is not in the image. So the completed tensor product is needed without properness.

### AI.6.5 The canonical `B_dR⁺` deformation of the generic fibre

**Finite infinitesimal Tate thickenings** (`AInf.finite_infinitesimal_tate_thickenings`). For `n≥1` a complete Tate `B_dR⁺/ξ^n-algebra B` is topologically of finite type iff `B/ξ` is topologically of finite type over `C`. Such `B` is strongly noetherian and every ideal is closed. A p-complete p-torsion-free `A_inf/ξ^n-algebra B_0` of topologically finite type is coherent; any ideal I with `B_0/I` p-torsion-free is finitely generated. Its p-localization is a topologically finite-type Tate algebra, and every `B` as above admits such a ring of definition. Strong noetherianity means noetherianity after adjoining each finite set of Tate variables.

Standing hypotheses (C). Standing hypotheses (dR). `n≥1`; finite type always means topological finite type for the displayed Tate or p-adic topology.

Induct on `n` through square-zero `ξ-extensions` of the Tate C-algebra. Adjoining more Tate variables proves the strong form. For integral rings use coherent square-zero extension and bounded `ξ`-torsion. Construct a ring of definition as the image of `A_inf/ξ^n⟨X_i⟩`, then use finite generation of `I∩B_0` to prove closedness of I. (BMS1 (arXiv v3), Lemma 13.4(i–iv) and proof, printed pp.105–106; ČK (arXiv v3), §6.2, p.60, application of BMS1 Lemma 13.4(ii)). *Needs:* *Finite de Rham coefficient quotients and flatness* (§AI.0:period-comparison.1); *Coherence of a square-zero extension* (§AI.0.3); *Finite-presentation devissage over Witt rings* (§AI.0.3); AdicSpacesPartII, R0 (*Maximal ideals of Tate algebras are generated by polynomials*); AdicSpacesPartII, R0 (*A noetherian ring of definition stays noetherian under completion*).

**Checks.**

- `n=1` recovers the finite-type Tate C-algebra theorem.
- Noetherianity is asserted for the rational finite-level Tate rings, not for `A_inf` or `O_C`.

**Infinitesimal envelope of a very small affinoid**. For very small `R` and `Σ` put `P_Σ=lim_n(B_dR⁺/ξ^n)⟨X_u^{±1}:u∈Σ⟩`, with `e_Σ:P_Σ→R` sending `X_u` to `u`. Define `D_Σ(R)=lim_m P_Σ/(ker e_Σ)^m` with the induced inverse-limit topology. The commuting logarithmic derivations `∂_u=X_u∂/∂X_u` extend continuously; their cohomological Koszul complex is denoted `Ω^•_{D_Σ(R)/B_dR⁺}`. This is completion at the full embedding ideal, including the relations between the coordinates. It is not merely `ξ`-completion of `P_Σ`.

Standing hypotheses (C). Standing hypotheses (dR). Standing hypotheses (VS).

The API:

- `AInf.bdr_infinitesimal_envelope.coordinates`: The continuous coordinate map `P_Σ→D_Σ(R)` followed by augmentation gives `X_u↦u`.
- `AInf.bdr_infinitesimal_envelope.universal_map`: A continuous `P_Σ`-algebra map into a separated complete target for the image embedding ideal extends uniquely to `D_Σ(R)`, compatibly with all quotient projections.
- `AInf.bdr_infinitesimal_envelope.enlarge`: For `Σ⊂Σ′` satisfying the same very-small conditions, adjoining the additional coordinates gives the compatible envelope and de Rham-complex map.
- `AInf.bdr_infinitesimal_envelope.derivations`: `∂_u(X_v)=δ_uv X_v`, the `∂_u` commute, and their Koszul differential squares to zero.

Closedness of all finite-level embedding ideals gives a complete separated topological algebra after taking both limits. A derivation carries the m-th power of the embedding ideal into its (m−1)-st power, so it extends continuously. Use the generic commuting-endomorphism Koszul signs from DerivedModuleAlgebra §0.K.1. (BMS1 (arXiv v3), Definition 13.5 and Construction 13.6, printed p.106). *Needs:* *Finite infinitesimal Tate thickenings* (§AI.6.5); Mathlib `AdicCompletion`; DerivedModuleAlgebra, §0.K.1 (*The Koszul complex*); AdicSpacesPartII, R0.

**Checks.**

- `bdr_infinitesimal_envelope_point`: For `R=C` and `Σ` empty, `P_Σ=B_dR⁺`, ker `e=(ξ)`, `D_Σ(C)=B_dR⁺` and the complex is concentrated in degree zero.
- `bdr_infinitesimal_envelope_extra_coordinate`: For `R=C` and an added unit a, the embedding ideal includes `X_a−a_lift` as well as `ξ`; `ξ`-completion alone does not complete that direction.
- `bdr_infinitesimal_envelope_torus`: For the d-dimensional torus with its standard coordinates, `∂_i(X_j)=δ_ij X_j` and the degree-one differential is the usual sum of logarithmic derivatives.
- `bdr_infinitesimal_envelope_transition`: The augmentations for `Σ⊂Σ′` commute with the coordinate map and the common residue projection to `R`.
- The coordinate relation ideal is part of the completion.
- The complex uses logarithmic derivatives indexed by all `Σ`; embedding independence uses *Embedding independence and de Rham reduction* (§AI.6.5).

**Pure integral models are free over the valuation base** (`AInf.pure_integral_model_freeness`). Let `V` be a henselian rank-one valuation ring of mixed characteristic, and `B` a finitely presented `V`-algebra with smooth generic fibre. Assume the `p`-power torsion is bounded. Let `B₀` be the quotient by this torsion with the direct factors supported only on the generic fibre removed, and assume `B₀` is finitely presented. Then `B₀` is `V`-flat and pure over `V`, hence projective and therefore free as an ordinary `V`-module. More generally, for a finitely presented algebra `B` over any ring `A` and a finitely presented `B`-module `M` flat over `A`, projectivity over `A` is equivalent to purity: after henselization at each base point, the closure of every relative associated point of `M` meets that closed fibre.

For the integral models here, `V=O_C` in BMS1 Lemma 13.11, or `V=O` a complete discrete valuation ring in ČK §6.3. For the algebraic models in these two families, the `p`-power torsion is finitely generated and killed by one `p^N`, and the torsion-free quotient is finitely presented. These assertions concern the algebraic models before completion.

Prove the projectivity/purity criterion by the étale local projective neighbourhoods of RG I.3.3.2 and the universally injective localization criterion of I.3.2.6, descending projectivity as in I.3.3.5. For the models, torsion-freeness over the valuation base gives flatness. Over the henselian rank-one base, relative associated points on the smooth generic fibre are its component generic points. The finitely many generic components are disjoint there; one whose closure misses the special fibre is a generic-only open and closed factor. After removing these factors all closures meet the special fibre, verifying purity; at the generic base point purity is automatic. Apply I.3.3.5 and then local-ring freeness (Stacks Project, Tag 0593). For BMS1's intermediate ring `S_n`, finite presentation of `S_n/ξ` over the rank-one valuation ring gives the finite generation and boundedness of its torsion as in Lemma 13.11; for ČK's `A₀` the corresponding finiteness follows from noetherianness of `O`. Apply the purity argument to `(S_n/ξ)/(p-power torsion)` over `O_C`; lift its basis to `S_n`, use generic flatness to prove independence, and bounded torsion to bound the cokernel before completion. (Raynaud–Gruson, Première partie, Definition 3.3.3, Theorem 3.3.5 and proof, printed pp.20–22; BMS1 (arXiv v3), Lemma 13.11 and proof, pp.109–110; ČK (arXiv v3), §6.3, footnote 19, p.62; Stacks Project, Tag 0593). *Needs:* Mathlib `Module.Flat`; Mathlib `Module.Projective`; SchemeAndStackFoundations, §0.9 (finite presentation and limits); AdicSpacesPartIII, R2 (*Saturated submodules of finite free modules over tft algebras are finitely generated*).

**Checks.**

- `V[x,y]/(xy−a)`, `0≠a∈𝔪_V`, is flat and generically smooth, with special fibre `k[x,y]/(xy)`; its generic component meets the special fibre. It is free on `1,x,x²,…,y,y²,…`, despite its nonsmooth special fibre.
- `V[T]` is free on its monomials as an algebraic module; completion gives the restricted series ring, rather than the same direct sum.
- `V[1/p]` is finitely presented and flat with smooth generic fibre, but its only component misses the special fibre. It is not projective over `V`; the removal condition is necessary.

**Smooth noetherian approximation of very small affinoids**. For `R` satisfying (VS), after enlarging `Σ` there are: a smooth adic space `S =` Spa(A, A°) of finite type over W(k′)[1/p] for a perfect subfield `k′ ⊂ k`, with a W(k′)-algebra map A `→ C`; a smooth morphism `Spa(R_A, R_A°) → S` with `R ≅ R_A ⊗̂_A C`; and finite subsets `Σ_A ⊂ (R_A°)^×` containing the `T_i`, carried into `Σ`, such that `A⟨X_u^{±1}` : `u ∈ Σ_A⟩ → R_A` is surjective. Choose a continuous lift `A→B_dR⁺` of the specified map `A→C`, using smoothness of A and successive lifting along the square-zero quotients `B_dR⁺/ξ^{n+1}→B_dR⁺/ξ^n`. With this chosen A-algebra structure, `R_A ⊗̂_A B_dR⁺` is `ξ`-adically complete and flat over `B_dR⁺`, with reduction `R` modulo `ξ` and topologically free reductions modulo `ξ^n`.

Standing hypotheses (VS).

Descend the finitely many equations and étale maps by noetherian approximation (BMS1, Lemma 13.7), using an algebraic model of `R_A` étale over a torus after inverting `p` (Huber 1.7.3(iii)). For the `B_dR⁺-statement`, reduce to topological freeness of `R_A ⊗̂_A B_dR⁺/ξ^n`, which uses the Raynaud–Gruson free model of the integral algebra (BMS1, Lemma 13.11). (BMS1 (arXiv v3), Lemma 13.7 and Lemma 13.11, printed pp.106 and 109). *Needs:* SchemeAndStackFoundations, §0.9 (`noetherian_approximation`, `finite_presentation_limits`); AdicSpacesPartII, R0 (*Algebraic models of affinoid étale maps (Huber 1.7.3(iii))*); *Pure integral models are free over the valuation base* (§AI.6.5).

**Checks.**

- For the torus, the algebraic Laurent monomials give the integral basis before completion.
- The model `V[x,y]/(xy−a)` is covered by the free-model input although its special fibre is reducible; smoothness is required only after inverting `p`.
- For the point, the completed coefficient extension is `B_dR⁺`, and reduction modulo `ξ^n` gives `B_dR⁺/ξ^n`.

**Smooth lifts and envelope normal form** (`AInf.smooth_envelope_normal_form`). After enlarging `Σ`, choose a smooth affinoid base A over W(k′)[1/p], a smooth Tate A-algebra `R_A` and `R≅R_A⊗̂_A C` as in BMS1 Lemma 13.7, with torus coordinates and the chosen units descending. Lift `A→C` to `A→B_dR⁺`. Then `R_A⊗̂_A B_dR⁺` is `ξ`-complete, flat over `B_dR⁺`, and its `ξ^n` quotient is `R_A⊗̂_A(B_dR⁺/ξ^n)`, topologically free over `B_dR⁺/ξ^n`. For sufficiently large `Σ` there is an augmented topological isomorphism `D_Σ(R)≅(R_A⊗̂_A B_dR⁺)[[X_u−ũ`: `u∈Σ∖{T_1,…,T_d}`]], where ũ are chosen lifts of `u` and `X_{T_i}` maps to `T_i`. In particular the envelope is `ξ`-torsion-free and `ξ`-complete. The isomorphism depends on the lift; the final cohomology does not.

Standing hypotheses (C). Standing hypotheses (dR). Standing hypotheses (VS). The approximation data have all properties of Lemma 13.7, including a descent of sufficiently large unit sets and compatibility of the torus coordinates.

Approximate the finitely many equations, étale presentation and units to obtain Lemma 13.7 data. The lift exists by smoothness of A and `ξ`-adic completeness. For Lemma 13.11, remove bounded p-torsion in an algebraic model, choose a valuation-ring basis, then complete; the free algebraic model is supplied by *Pure integral models are free over the valuation base* (§AI.6.5), applied in *Smooth noetherian approximation of very small affinoids* (§AI.6.5). Extend the formally étale torus lift into the completed envelope. Its inverse is the coordinate map in the displayed power series ring. Check both compositions on the algebraic model and by continuity. (BMS1 (arXiv v3), Lemma 13.7, printed pp.106–108; Lemmas 13.11–13.12, pp.109–111). *Needs:* *Infinitesimal envelope of a very small affinoid* (§AI.6.5); AdicEtaleGeometry, A1; AdicSpacesPartII, R0; *Flat cyclotomic power-series specialization* (§AI.0.2); *Smooth noetherian approximation of very small affinoids* (§AI.6.5).

**Checks.**

- The normal form retains the relative `ξ`-complete coefficient lift, not just R[[variables]].
- Choice independence comes from the common-envelope contraction, rather than claimed for these lifts.
- At the point with one redundant unit coordinate, the normal form is `B_dR⁺[[X−ũ]]`, retaining both `ξ` and the coordinate direction in the completion.

**Embedding independence and de Rham reduction** (`AInf.envelope_embedding_independence`). The natural maps `Ω^•_{D_Σ(R)/B_dR⁺}⊗^L C→Ω^•_{D̃_Σ(R)/C}←Ω^{•,cont}_{R/C}` are quasi-isomorphisms, where `D̃_Σ(R)` completes `(D_Σ(R)/ξ)⊗̂_C R` at its augmentation to `R`. For a smooth lift `R_A` the analogous common-envelope maps identify `Ω^•_{D_Σ(R)/B_dR⁺}` with `Ω^{•,cont}_{R_A/A}⊗̂_A B_dR⁺`. Consequently an enlargement `Σ⊂Σ′` of sufficiently large unit sets induces a quasi-isomorphism of the envelope de Rham complexes. The comparison for two different lifts uses a common further envelope; it does not make the normal-form isomorphism canonical.

Standing hypotheses (C). Standing hypotheses (dR). Standing hypotheses (VS). Use the lift and the `ξ`-torsion-free complete envelopes of *Smooth lifts and envelope normal form* (§AI.6.5); `Σ` and `Σ′` are sufficiently large for Lemmas 13.12–13.13.

The common envelope has two power-series presentations. Contract each redundant formal de Rham direction in characteristic zero; all divisions are by nonzero integers in `C` or `B_dR⁺`. Reduction modulo `ξ` proves the maps are equivalences. Derived `ξ-completeness` upgrades the reduction to the coefficient lift. Use the same comparison diagram for enlargements or two lifts. (BMS1 (arXiv v3), Lemma 13.13 and proof, printed pp.111–112). *Needs:* *Smooth lifts and envelope normal form* (§AI.6.5); EnhancedDerivedSheaves, E4 (*Equivalences detected modulo the ideal*); DerivedModuleAlgebra, §0.K.1 (*The Koszul complex*).

**Checks.**

- For a point with an extra unit coordinate the extra formal de Rham direction is contractible.
- The local `mod-ξ` target has the ordinary de Rham differential; it is not just a graded direct sum of forms.

**Canonical B_dR⁺ cohomology of the generic fibre**. For a smooth adic X/C, define the presheaf on very small smooth affinoids by `R↦colim_Σ Ω^•_{D_Σ(R)/B_dR⁺}`. Take its hypercohomology `K_dR⁺(X)` in the shared enhancement. For proper `X` this is the BMS1 `RΓ_crys(X/B_dR⁺)`; it is derived `ξ`-complete, perfect, and `K_dR⁺(X)⊗^L C≃RΓ_dR(X/C)`. Its definition uses no choice of a lift of `X` to `B_dR⁺`. The analytic-site construction agrees with the étale-site and non-unit-coordinate extension of *B_dR⁺-cohomology in the étale topology and with non-unit coordinates* (§AI.6.6).

Standing hypotheses (C). Standing hypotheses (dR). For construction `X` is smooth; properness is imposed for perfectness and finiteness. Use the very-small analytic basis and hyperdescent. Coherent proper cohomology and topology comparison come from AdicSpacesPartIII R3.

The API:

- `AInf.canonical_bdr_deformation.local_model`: On a very small affine, the presheaf is the colimit of the envelope complexes, and each sufficiently large `Σ` maps by a quasi-isomorphism to that colimit.
- `AInf.canonical_bdr_deformation.pullback`: A morphism of smooth C-spaces induces the cohomological pullback compatible with the common-envelope coordinate maps.
- `AInf.canonical_bdr_deformation.reduction`: Derived extension along `B_dR⁺→C` gives `RΓ_dR(X/C)`. The degreewise identification requires the freeness theorem.
- `AInf.canonical_bdr_deformation.products`: The wedge products and unit on the completed envelope de Rham complexes induce the compatible multiplication on hypercohomology.

Take the strictly functorial filtered colimit over embeddings and compute hypercohomology on a basis. Glue the de Rham reduction. Derived `ξ-completeness` and finite-dimensional bounded proper de Rham cohomology give a perfect lift; finite freeness is a further theorem. (BMS1 (arXiv v3), Definitions 13.14 and 13.18, printed pp.112,114; ČK (arXiv v3), §6.2, (6.2.4)–(6.2.7), pp.60–61). *Needs:* *Embedding independence and de Rham reduction* (§AI.6.5); AdicEtaleGeometry, A1; AdicSpacesPartIII, R3; EnhancedDerivedSheaves, E2 (*Unbounded hypercover descent*); EnhancedDerivedSheaves, E4 (*Equivalences detected modulo the ideal*).

**Checks.**

- `canonical_bdr_deformation_point`: The zero-dimensional point gives `B_dR⁺`, not `C`, before residue reduction.
- `canonical_bdr_deformation_torus_reduction`: The local torus complex reduces to the logarithmic de Rham complex with differential `d(T^n)=nT^n` dlog `T`.
- `canonical_bdr_deformation_redundant_embedding`: Adding a redundant unit coordinate induces an equivalent local complex by the common-envelope contraction.
- `canonical_bdr_deformation_cohomology_not_graded`: For a nonproper torus one retains its de Rham complex; the definition does not replace it by a sum of its forms or assert proper finite freeness.
- `K_dR⁺(Spa(C,O_C))=B_dR⁺` in degree zero.
- Perfectness alone is not used as a proof that every cohomology group is free.

**Versal deformations of proper schemes**. For a complete noetherian local ring `W` with residue field `k` and a proper `k`-scheme `X`, construct a complete noetherian local `W`-algebra `R` with residue field `k` and a proper flat formal deformation whose classifying map `h_R→Def_X` is formally smooth. `Def_X` records deformations with an identification of the special fibre, modulo compatible isomorphism.

Verify Schlessinger's conditions `H1`, `H2` and finite-dimensional tangent space `H3` for this geometric functor, then apply the abstract hull theorem. Construct compatible proper flat artinian deformations and take their inverse limit as an adic formal scheme; no algebraization to a scheme is asserted. (Schlessinger, Functors of Artin rings, Proposition 3.10; Stacks tag 0ET6, applied to `X→Spec k` with target fixed; BMS1 (arXiv v3), proof of Proposition 13.15, pp.112–113). *Needs:* SchemeAndStackFoundations, §§4.3–4.4 (`schlessinger_hull`) and §0.9 (finite-presentation limits); AdicSpacesPartIII, F0 (formal schemes and inverse systems).

**Checks.**

- For `X=Spec k`, the trivial deformation over `W` is versal and the tangent space is zero.
- For a smooth proper curve of genus `g≥2`, the tangent space is `H¹(X,T_X)` of dimension `3g−3`, finite by proper coherent cohomology.
- A proper nodal curve is allowed: the local smoothing `xy=t` contributes a tangent direction; no smooth presentation of a moduli stack is assumed.

**Descent of proper flat formal deformations to a noetherian base**. (a) Let `(W, 𝔪)` be a complete noetherian local ring with residue field `k` and `O` an `𝔪`-adically complete local W-algebra such that `O/𝔪O` is zero-dimensional with residue field `k`. For a proper flat adic formal scheme `𝔛_O` over `O` there are a complete noetherian local W-algebra `R` with residue field `k`, a proper flat adic formal scheme `𝔛_R` over `R`, a W-algebra map `η` : `R → O` and an isomorphism `η^*𝔛_R ≅ 𝔛_O`. `(b)` (Conrad–Gabber) For an extension C/K of complete nonarchimedean fields with the same residue field and a proper rigid space `X` over `C`, there is a proper flat morphism of rigid spaces over `K` whose fibre at a C-point is `X`; for `X` smooth it can be taken smooth after shrinking the base.

`W`, `O` as in (a); C/K as in `(b)`.

(a) Use *Versal deformations of proper schemes* (§AI.6.5). Extend the formally smooth classifying map to local zero-dimensional rings by filtered colimits and lift compatibly to `O/𝔪^nO`. Form the compatible proper formal deformation by taking the inverse limit of its artinian deformations and the compatible isomorphisms. `(b)` Apply (a) to a formal model and pass to generic fibres; shrink to the smooth locus of the family. (BMS1 (arXiv v3), Proposition 13.15 and Corollary 13.16, printed pp.112–113). *Needs:* *Versal deformations of proper schemes* (§AI.6.5); AdicSpacesPartIII, F0 (inverse systems of formal schemes); AdicSpacesPartIII, R2 (*Conrad's Berthelot-type generic fibre preserves finiteness, smoothness, flatness, properness and fibre dimension (Conrad genpaper Theorem 3.1.6)*).

**Checks.**

- A proper flat scheme already over `W` gives the constant formal family with `R=W`.
- For a formal nodal smoothing `xy=t`, retain `t` as a parameter on `R`; descent does not assert a constant family.
- A local `O/𝔪O` with a nonzero-dimensional spectrum is outside the formal descent hypothesis.

**Proper smooth spreading out for the deformation** (`AInf.proper_smooth_spreading_out`). A proper smooth rigid X/C is a C-valued fibre of a proper smooth morphism of smooth rigid spaces over a complete discretely valued subfield `K⊂C` with the same residue field. More generally a proper rigid X/C spreads to a proper flat family. The formal input is: for complete noetherian local (W,m), an m-complete local W-algebra `O` with zero-dimensional O/mO and residue `k`, every proper flat adic formal `X_O/O` descends to a proper flat adic formal `X_R` over a complete noetherian local W-algebra `R` with residue `k` and a map `R→O`. For a smooth fibre, first restrict to the locus where the family is smooth, then replace the parameter base by a smooth locally closed stratum through the image of the C-point and base-change the family.

C/K complete nonarchimedean fields with equal residue field; `C` as above for the discretely valued-subfield choice. The formal input uses m-adic topology on `O` and maximal-ideal topology on `R`, and proper flatness, not only a proper special fibre.

Use the versal deformation of the proper special fibre, extend its formally smooth classifying functor from artinian rings to local zero-dimensional rings by filtered colimits, and lift compatible maps `R→O/m^nO`. The deformation input is *Descent of proper flat formal deformations to a noetherian base* (§AI.6.5). Take the inverse limit of the compatible isomorphisms; use proper formal models and generic fibres for rigid spreading. Properness allows restriction to an open neighbourhood of the parameter point over which the family is smooth. Over the characteristic-zero field `K`, stratify the reduced parameter base by smooth locally closed rigid subspaces, choose the stratum containing the image of the C-point, and base-change the family to it. The base and total space are then smooth over `K`, as required for the Gauss–Manin argument. (BMS1 (arXiv v3), Proposition 13.15 and Corollary 13.16 with proofs, printed pp.112–113). *Needs:* AdicSpacesPartIII, R2 (*Raynaud's theorem: quasi-compact admissible formal schemes localised at admissible blow-ups are quasi-compact quasi-separated rigid spaces*); AdicSpacesPartIII, R2 (*Admissible formal blow-ups and strict transforms*); AdicSpacesPartIII, R3; *Descent of proper flat formal deformations to a noetherian base* (§AI.6.5).

**Checks.**

- Retain the zero-dimensional residue-level hypothesis in the formal statement.
- The family need not descend to a single K-variety; its base may have positive dimension.
- For `P¹_K×S→S` with `S` a cusp and the point at its singularity, the morphism is already proper smooth, but no open base neighbourhood is smooth over `K`. The closed cusp-point stratum is smooth in characteristic zero, and its pullback retains the chosen fibre.

**Coherent modules with integrable connection in characteristic zero** (`AInf.integrable_connection_locally_free`). For a proper smooth rigid morphism `f:Y→S` with `S` smooth over a characteristic-zero complete nonarchimedean field `K`, construct `Rf_*Ω^•_{Y/S}`, prove coherence and derived analytic base change, and construct the integrable Gauss–Manin connection on its cohomology from the filtration of `Ω^•_{Y/K}` by base forms. Prove horizontality of the base-change identifications, including along a chosen parameter map `A→B_dR⁺/ξ^n` and for the compatible family of these maps. On a smooth rigid space `S` over a field `K` of characteristic zero, a coherent module with an integrable connection is locally free. In particular, for a proper smooth morphism `f:Y→S`, the coherent Gauss–Manin modules `H^i(Rf_*Ω^•_{Y/S})` are locally free. On `S=Spa(A,A°)`, their finite projective A-modules remain finite projective after a chosen continuous lift `A→B_dR⁺` of `A→C`; over the local ring `B_dR⁺` they are finite free, and their reductions modulo `ξ^n` are free over `B_dR⁺/ξ^n`. This applies to the proper smooth family in §AI.6.5.

`S` is smooth over `K` of characteristic zero; `f` is proper smooth, and the lift `A→B_dR⁺` is part of the data.

Use Kiehl proper coherence termwise and finite affinoid Čech complexes of the relative continuous de Rham complex. For smooth `f`, these terms are flat over the base, so the Čech model gives the derived base-change theorem. The first differential of the filtration by base forms gives the connection; its square-zero identity gives integrability. Identify the construction with the pullback family on each nilpotent coefficient thickening. On the smooth characteristic-zero base, derivation stability of the Fitting ideals makes the modules locally free; then extend the finite projective modules along `A→B_dR⁺`. A coherent module on the nonreduced thickening `B_dR⁺/ξ^n` is not automatically locally free: for `n=2` the quotient module `B_dR⁺/ξ` is not flat over `B_dR⁺/ξ²`. The characteristic-zero argument is applied on `S` before extension of scalars. (BMS1 (arXiv v3), proof of Theorem 13.19, printed pp.114–115). *Needs:* *Vector bundles and change of site* (§AI.3.1); AdicSpacesPartIII, R3.6 (`proper-affinoid-cohomology-finite`, Kiehl coherence, `relativeDifferentials.deRhamComplex`); EnhancedDerivedSheaves, E1 (derived direct image and tensor).

**Checks.**

- For the identity `S→S`, the pushforward is `O_S` in degree zero with its usual differential connection; every parameter pullback recovers the coefficient ring.
- For `P¹_S→S`, the cohomology ranks are `1,0,1`; base change to `B_dR⁺/ξ^n` gives free modules of those ranks.
- For `n=2`, the module `B_dR⁺/ξ` over `B_dR⁺/ξ²` is not flat; freeness is proved on the smooth parameter base before scalar extension.


**Finite freeness of the canonical deformation** (`AInf.canonical_deformation_free`). For proper smooth X/C, every `H^i(K_dR⁺(X))` is finite free over `B_dR⁺` and vanishes outside a bounded range. Base change to `C` commutes with cohomology and recovers `H^i_dR(X/C)`. If `X=X_0⊗̂_K C` with `X_0/K` proper smooth and `K` complete discretely valued with perfect residue field, the canonical identification is `H^i(K_dR⁺(X))≃H^i_dR(X_0/K)⊗_K B_dR⁺` through the continuous lift `K→B_dR⁺`.

Standing hypotheses (C). Standing hypotheses (dR). `X` proper smooth; the descended identification has the additional hypotheses on `X_0` and `K`.

Spread `X` over a smooth affinoid base A and lift the C-valued point into `B_dR⁺`. Relative proper de Rham cohomology has an integrable connection and is locally free on the smooth characteristic-zero base. Use the horizontal derived base-change maps of *Coherent modules with integrable connection in characteristic zero* (§AI.6.5) to compare its coefficient extensions with `K_dR⁺` modulo every `ξ^n`, and pass to the complete limit. Finite projective modules over the DVR `B_dR⁺` are free. The descended `K` case is the same construction through its unique continuous lift. (BMS1 (arXiv v3), Theorem 13.19 and Remark 13.20, printed p.114). *Needs:* *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5); *Proper smooth spreading out for the deformation* (§AI.6.5); *Embedding independence and de Rham reduction* (§AI.6.5); AdicSpacesPartIII, R3; *Smooth noetherian approximation of very small affinoids* (§AI.6.5); *Coherent modules with integrable connection in characteristic zero* (§AI.6.5); *Descent of proper flat formal deformations to a noetherian base* (§AI.6.5).

**Checks.**

- For the point the rank is one in degree zero.
- A general perfect complex over a DVR can have torsion cohomology; the connection/spreading argument is required.

- For a constant proper smooth family over the parameter base, every reduction modulo `ξ^n` is the scalar extension of its de Rham cohomology, compatibly in `n`.


**Canonical deformation-to-étale map**. For very small `R` and `Σ`, adjoin compatible p-power roots of all its unit coordinates. The resulting perfectoid pro-finite-étale tower has `Γ=∏_{u∈Σ}ℤ_p(1)`. The degree-zero map `D_Σ(R)→B_dR⁺(R_∞,Σ)` sends `X_u` to `[u^♭]`. Comparing the logarithmic de Rham and continuous `Γ-Koszul` complexes with the normalized logarithmic operators defines a map `K_dR⁺(X)→RΓ_proét(X,B_dR,X⁺)`. It is independent of `Σ` and the chosen roots after the common-envelope maps; for proper `X` the target is `RΓ_et(X,ℤ_p)⊗^L B_dR⁺` by the early primitive comparison.

Standing hypotheses (C). Standing hypotheses (dR). Standing hypotheses (VS). The root tower and the comparison of continuous cochains with Koszul complexes are those of Layers Layer AI.3 and AI.1. The local operator normalization uses `t=log([ε])` in `B_dR⁺`, a unit multiple of `ξ`. Rational period-sheaf acyclicity is proved in *Rational pro-étale de Rham period sheaves* (§AI.3.1), not used to construct the integral Layer AI.3 sheaf.

The API:

- `AInf.canonical_bdr_etale_map.degree_zero`: The degree-zero comparison on coordinates is `X_u↦[u^♭]`, compatible with augmentation to the untilt `u`.
- `AInf.canonical_bdr_etale_map.normalization`: For `γ_u=exp(t∂_u)`, the degree-one correction is `t∑t^n∂_u^n/(n+1)!`, satisfying `F_u∂_u=γ_u−1`. All degree-indexed products use the exterior/Koszul signs.
- `AInf.canonical_bdr_etale_map.enlarge`: Coordinate enlargements and tower refinements commute with the chain map, so it descends to the canonical presheaf and hypercohomology.
- `AInf.canonical_bdr_etale_map.primitive_target`: For proper smooth `X`, the target agrees with `RΓ_et(X,ℤ_p)⊗^L B_dR⁺` via the early primitive period-sheaf comparison.

Extend the coordinate Teichmüller map through the embedding-ideal completion. On the common envelope, `Γ` acts by `exp(t∂_u)`. The divided operator `(exp(t∂_u)−1)/∂_u` is interpreted as `t∑_{n≥0}t^n∂_u^n/(n+1)!`, with no inverse derivation. Products of these commuting operators give the degree-indexed Koszul chain map. Use the all-coordinate transition maps to glue. The local map identifies the de Rham complex with `η_ξ` of the period Koszul complex; after `ξ`-inversion décalage is the identity. (BMS1 (arXiv v3), Theorem 13.1 proof, printed p.115; comparison with §12.2 and Proposition 12.9, pp.98–103). *Needs:* *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5); *Infinitesimal envelope of a very small affinoid* (§AI.6.5); *Crystalline logarithmic coordinate change* (§AI.4.3); *Continuous cochains and Koszul complexes* (§AI.1.7); *Rational pro-étale de Rham period sheaves* (§AI.3.1); AdicEtaleGeometry, A1; *The primitive comparison over A_inf* (§AI.5.1).

**Checks.**

- `canonical_bdr_etale_map_point`: For the point, the comparison is the identity `B_dR⁺→B_dR⁺` in degree zero.
- `canonical_bdr_etale_map_coordinate`: For one torus coordinate, its residue under `θ` is `u` and its tower generator acts on `[u^♭]` by multiplication by `[ε]`.
- `canonical_bdr_etale_map_chain_condition`: On `X_u^n`, `n≠0`, `F_u∂_u` acts by `exp(nt)−1=[ε]^n−1`, the group-Koszul differential.
- `canonical_bdr_etale_map_inversion`: After inverting `ξ` the local `η_ξ` comparison becomes an equivalence with the entire period-cochain complex.
- The degree-zero coordinate map and all higher normalizations belong to the same comparison.
- An isomorphism of abstract free modules is not a substitute for this canonical map.

**Canonical rational comparison and descended map agreement** (`AInf.canonical_rational_comparison`). For proper smooth X/C, the canonical map `K_dR⁺(X)→RΓ_et(X,ℤ_p)⊗^L B_dR⁺` becomes an equivalence after `ξ`-inversion. In the descended `K` case of *Finite freeness of the canonical deformation* (§AI.6.5), this `B_dR` comparison agrees with Scholze’s de Rham comparison through the common structural-period-sheaf envelope. The CK §6.7 use includes the filtered descended de Rham identification; the general filtered enhancement over `C` is left to the CohomologyComparisons roadmap.

Standing hypotheses (C). Standing hypotheses (dR). `X` proper smooth; descended comparison requires `K` complete discretely valued with perfect residue field. For the filtered descended statement use *Constant-coefficient rational de Rham comparison* (§AI.3.1) with its filtration.

The local `η_ξ` identification proves equivalence after `ξ`-inversion; use proper finite étale cohomology for the target. Compare the descended lift and the structural period sheaf through `D̃_Σ(R_K)`. The diagram in Theorem 13.1 proves equality of maps. Preserve the filtrations in the descended structural comparison rather than asserting a general filtered theorem not stated in BMS1. (BMS1 (arXiv v3), Theorem 13.1, printed p.104; proof and comparison diagram, p.115; Remark 13.20, p.114; ČK (arXiv v3), §6.7, (6.7.1)–(6.7.2), pp.65–66). *Needs:* *Canonical deformation-to-étale map* (§AI.6.5); *Finite freeness of the canonical deformation* (§AI.6.5); *Rational pro-étale de Rham period sheaves* (§AI.3.1); *The primitive comparison over A_inf* (§AI.5.1); *Constant-coefficient rational de Rham comparison* (§AI.3.1).

**Checks.**

- The point comparison is the canonical `B_dR` identity.
- Integral equality of two `B_dR⁺` lattices is not concluded from their equality after `ξ`-inversion.

**Smooth integral and canonical deformation agreement** (`AInf.integral_deformation_agreement`). For proper smooth formal `𝔛/O_C` with `Y=𝔛_{O_C/p}` and generic fibre `X`, the natural map `RΓ_crys(Y/A_crys)⊗^L_{A_crys}B_dR⁺→K_dR⁺(X)` is an equivalence. After `B_dR` extension, the `AΩ→A_crys` comparison and the canonical deformation-to-étale map agree on the common all-coordinate tower. Passage to degreewise crystalline lattices uses the rational crystalline-freeness bridge, not an unproved flat degreewise specialization. Map agreement is checked on the explicit normalized complexes; the agreement is checked on degree-zero Teichmüller coordinates, logarithmic Koszul corrections, transition maps and descent.

Standing hypotheses (C). Standing hypotheses (dR). `𝔛` proper smooth, not merely semistable; the semistable version is ČK, Theorem 6.6.

Use the same all-coordinate envelopes in the `A_crys` and `B_dR⁺` theories and extend their canonical coordinate maps. Proposition 13.23 identifies the two complexes locally with the smooth-lift de Rham complex. For agreement after inversion compare `X_u↦[u^♭]` and the logarithmic operator factors, as required in the proof of Theorem 14.5(i). (BMS1 (arXiv v3), Proposition 13.23, printed p.117; Theorem 14.5(i) proof, p.121). *Needs:* *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5); *Canonical deformation-to-étale map* (§AI.6.5); *Absolute A_crys comparison* (§AI.4.3); *Primitive rational crystalline Frobenius input* (§AI.5.1).

**Checks.**

- In degree zero of the point all maps are the common coefficient maps.
- Neither equality of dimensions nor generic finite freeness proves agreement of the comparison maps.

### AI.6.6 `B_dR⁺` and étale comparisons

**Integral models and power-bounded elements for B_dR⁺-thickenings** (`Semistable.bdr_integral_models`). For an affinoid in the refined semistable étale basis of ČK §6.3, choose a finite extension `K⊂C` of W(k̄)[1/p], its valuation ring `O`, and a normal O-flat algebra A₀ of finite type over the algebraic semistable O-chart, étale over that chart after inverting p. Let Â₀ be its p-adic completion and `A=Â₀[1/p]⊗̂_K C`. (a) After a finite extension of `K` and replacement of the integral model using the reduced fibre theorem, choose A₀ so that `A₀⊗̂_O O_C≅A°`. `(b)` After discarding the connected components of Spec(A₀) on which `p` is invertible, A₀ is free as an ordinary O-module. (c) For the complete finite type K-affinoid nilpotent thickenings `D_{0,n}→Â₀[1/p]` of ČK §6.4, `D_{0,n}°` is the preimage of (Â₀[1/p])°.

A₀ is an algebraic finite type O-algebra, with the model choices and the exclusion of p-invertible components stated above; it is not the completed topologically finite type ring Â₀.

Use the reduced fibre theorem (Stacks Project, Tag 09IL) for (a). The base change is to `O_C`, as used in ČK (6.3.7), p.62; W(k̄) cannot serve as an O-algebra for a ramified `K`. For `(b)`, the finite type algebraic model satisfies Raynaud–Gruson I.3.3.5, as applied in ČK footnote 19, p.62; freeness then follows from Stacks Project, Tag 0593. For (c), apply the square-zero case successively through the nilpotent kernel filtration: in the arXiv v3 of Gabber–Ramero this is Claim 7.3.14, p.203 (ČK cites the published numbering 7.3.15). For `O=ℤ_p` and `A₀=O[T]`, the monomials `T^j` give the free algebraic basis. The assertion does not identify that direct sum with the completed ring O⟨T⟩. (ČK (arXiv v3), §§6.3–6.4, printed pp.61–63). *Needs:* *Pure integral models are free over the valuation base* (§AI.6.5); AdicSpacesPartIII, R2 (*Saturated submodules of finite free modules over tft algebras are finitely generated*).

**Checks.**

- The nodal algebra `O[x,y]/(xy−π)` has reducible special fibre and the algebraic free basis of *Pure integral models are free over the valuation base* (§AI.6.5).
- `O[T]` is an ordinary direct sum on monomials, whereas its completion is `O⟨T⟩`; freeness is asserted before completion.
- For a square-zero thickening, a lift of a power-bounded element remains power-bounded because its powers differ by terms in a square-zero ideal; successive square-zero quotients give the nilpotent case.

**B_dR⁺-cohomology in the étale topology and with non-unit coordinates** (`Semistable.bdrCohomologyEtaleEmbeddings`). Let `X` be a smooth adic space over `C`. (1) Étale topology (CK §6.2). The analytic, respectively étale, topology of `X` has a basis of affinoids Spa(A,A°) that admit a map to a torus `Spa(C⟨T_1^{±1},…,T_d^{±1}⟩,O_C⟨T_1^{±1},…,T_d^{±1}⟩)` which is a composite of a rational embedding, a finite étale map and a rational embedding, and a finite set `Ψ⊂(A°)^×` with `C⟨(X_u^{±1})_{u∈Ψ}⟩→A`, `X_u↦u`, surjective. For such data put `B_dR⁺⟨(X_u^{±1})_{u∈Ψ}⟩=lim_n (B_dR⁺/ξⁿ)⟨(X_u^{±1})_{u∈Ψ}⟩`, let `s` be its surjection onto A, `D_Ψ(A)=lim_n B_dR⁺⟨(X_u^{±1})_{u∈Ψ}⟩/(Ker s)ⁿ`, let `Ω^•_{D_Ψ(A)/B_dR⁺}` be the Koszul complex of the commuting derivations ∂/∂log `X_u=X_u·∂/∂X_u` of `D_Ψ(A)`, and `Ω^•_{A/B_dR⁺}=colim_Ψ Ω^•_{D_Ψ(A)/B_dR⁺}`. Let `RΓ_crys(X/B_dR⁺)`, respectively `RΓ_crys(X_ét/B_dR⁺)`, be the hypercohomology of the associated complex of sheaves for the analytic, respectively étale, topology; the first agrees with the complex of BMS1 §13 supplied by *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5). Then both are derived `ξ`-adically complete (6.2.5); their reductions modulo `ξ` are canonically and compatibly identified with `RΓ(X,Ω^{•,cont}_{X/C})=RΓ_dR(X/C)` and `RΓ(X_ét,Ω^{•,cont}_{X/C})` (6.2.6); and pullback is an isomorphism `RΓ_crys(X/B_dR⁺)≃RΓ_crys(X_ét/B_dR⁺)` (6.2.7). (2) Non-unit coordinates (CK §§6.3–6.4). The étale topology of `X` has a basis of affinoids Spa(A,A°) with the following data: an étale map (6.3.1) to `Spa(C⟨T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}⟩/(T_0⋯T_r−p^q), O_C⟨T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}⟩/(T_0⋯T_r−p^q))` for some `d≥r≥0` and `q∈Q_{>0}`; a finite extension `K` of W(k̄)[1/p] in `C` with ring of integers `O∋p^q` and a finite type `O[T_0,…,T_r,T_{r+1}^{±1},…,T_d^{±1}]/(T_0⋯T_r−p^q)-algebra A_0`, étale after inverting `p`, O-flat, normal, with no connected component of Spec `A_0` on which `p` is a unit, such that (6.3.1) is the base change to `C` of an étale map (6.3.2) from `Spa(Â_0[1/p],Â_0)` and `A_0⊗̂_O O_C≃A°` (6.3.3); and finite sets `Ψ_0⊂(Â_0)^×`, `Ξ_0⊂Â_0∩(Â_0[1/p])^×` with `K⟨(x_u^{±1})_{u∈Ψ_0},(x_a)_{a∈Ξ_0}⟩→Â_0[1/p]` surjective (6.3.4). For finite `Ψ⊂(A°)^×` and `Ξ⊂A°∩A^×` with `C⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩→A` surjective (6.3.5), let `D_{Ψ,Ξ,n}(A)=B_dR⁺⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩/(Ker s)ⁿ`, `D_{Ψ,Ξ}(A)=lim_n D_{Ψ,Ξ,n}(A)`, and let `Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}` be the Koszul complex of the derivations ∂/∂log `X_a`, `a∈Ψ∪Ξ`. Let `B_dR⁺⊗̂_K A_0[1/p]=lim_n(((B_dR⁺/ξⁿ)_0⊗̂_O A_0)[1/p])`, where `(B_dR⁺/ξⁿ)_0` is the `A_inf/ξⁿ-subalgebra` of `B_dR⁺/ξⁿ` generated by the image of `O`; it has no `ξ`-torsion, is `ξ`-adically complete and reduces to A modulo `ξ` (6.3.6). (a) Lemma 6.3.8: suppose that `Ψ`, respectively `Ξ`, contains the images of the `T_i` for `r+1≤i≤d`, respectively `1≤i≤r`, under a coordinate map (6.3.1), and that `Ψ` and `Ξ` are large enough in the sense of CK §6.4, namely: for some choice of `(Ψ_0,Ξ_0)` as in (6.3.4) such that `Ψ_0`, respectively `Ξ_0`, contains the images of the `T_i` for `r+1≤i≤d`, respectively `1≤i≤r`, under (6.3.2), `Ψ` contains the image of `Ψ_0` in A° and `Ξ` contains the image of `Ξ_0`. Then `D_{Ψ,Ξ}(A)≃(B_dR⁺⊗̂_K A_0[1/p])[[(X_a−ã)_{a∈(Ψ∪Ξ)∖{T_1,…,T_d}}]]` (6.3.9), where ã is a fixed lift of a in `lim_n((B_dR⁺/ξⁿ)_0⊗̂_O A_0)`; in particular `D_{Ψ,Ξ}(A)` has no nonzero `ξ`-torsion and is `ξ`-adically complete. `(b)` For such `Ψ` and `Ξ`, `Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}/ξ≃Ω^{•,cont}_{A/C}` in the derived category, compatibly with enlarging `Ψ` and `Ξ` (6.3.10), and for `Ψ′⊇Ψ`, `Ξ′⊇Ξ` the map `Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}→Ω^•_{D_{Ψ′,Ξ′}(A)/B_dR⁺}` is a quasi-isomorphism. (c) If Spa(A,A°) also belongs to the basis of (1), the map `Ω^•_{A/B_dR⁺}→colim_{Ψ,Ξ}Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}` is a quasi-isomorphism, functorial in Spa(A,A°) (6.3.11). Such affinoids form a basis of `X_ét`, so the hypercohomology of the sheafification of `Spa(A,A°)↦colim_{Ψ,Ξ}Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}` is `RΓ_crys(X_ét/B_dR⁺)≃RΓ_crys(X/B_dR⁺)`, and under this identification the maps (6.3.10) recover (6.2.6) ((6.3.12)). No multiplicative structure on these complexes is asserted.

Standing hypotheses (SS). `X` is a smooth adic space over `C`; it is not assumed proper and is not assumed to be the generic fibre of a formal model. In part (2), `K` runs over finite extensions of W(k̄)[1/p] inside `C`; `B_dR⁺` is a K-algebra through Layer AI.0’s canonical lift, and its `ξ`-adic topology and the rings `B_dR⁺/ξⁿ=(A_inf/ξⁿ)[1/p]` are Layer AI.0’s.

Bases for part (1): by Huber, Étale cohomology of rigid analytic varieties and adic spaces, 1.6.10 and 2.2.8, the analytic and the étale topology of `X` have bases of affinoids with coordinate maps (6.2.1); localising further gives the surjections (6.2.2). Huber’s results are those of AdicEtaleGeometry, A1. By BMS1 Lemma 13.12(ii) and Lemma 13.13 (*Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5)), for fixed Spa(A,A°) and `Ψ` large, `D_Ψ(A)` is `ξ`-torsion-free and `ξ`-adically complete, `Ω^•_{D_Ψ(A)/B_dR⁺}→Ω^•_{A/B_dR⁺}` is a quasi-isomorphism and `Ω^•_{D_Ψ(A)/B_dR⁺}/ξ≃Ω^{•,cont}_{A/C}`. By BMS1 Lemma 9.15 (*Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5); for the étale site its analogue, as in the proof of CK Corollary 4.6), the definition with sheafification agrees with that of BMS1 §13, both complexes are derived `ξ`-complete (6.2.5), and their reductions modulo `ξ` are the de Rham complexes (6.2.6). (6.2.7): by the Hodge-to-de Rham spectral sequence and Scholze, p-adic Hodge theory for rigid-analytic varieties, Proposition 9.2(ii) (coherent cohomology is the same in the analytic and in the étale topology; AdicSpacesPartIII, R3), `RΓ(X,Ω^{•,cont}_{X/C})→RΓ(X_ét,Ω^{•,cont}_{X/C})` is an isomorphism. Both sides of (6.2.7) are derived `ξ`-complete and the pullback map is an isomorphism modulo `ξ`, hence an isomorphism. Descent for part (2): by Huber 1.7.3 iii) and limit arguments, (6.3.1) descends to (6.3.2) over a finite extension `K` of W(k̄)[1/p]; by the reduced fibre theorem (Stacks Project 09IL) `K` can be enlarged so that (6.3.3) holds. By BMS1 Lemma 13.4(ii) (*Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5)) each `D_{Ψ,Ξ,n}(A)` is a complete strongly noetherian Tate ring, with the image of `(A_inf/ξⁿ)⟨(X_u^{±1})_{u∈Ψ},(X_a)_{a∈Ξ}⟩` as a ring of definition. By the proof of BMS1 Lemma 13.11, which simplifies here because `A_0` is a free O-module (Raynaud–Gruson, Critères de platitude et de projectivité, I.3.3.5, and Stacks Project 0593), the ring `B_dR⁺⊗̂_K A_0[1/p]` is `ξ`-torsion-free and `ξ`-adically complete with reduction A, and `lim_n((B_dR⁺/ξⁿ)_0⊗̂_O A_0)` surjects onto A° ((6.3.6), (6.3.7)). The K-algebra structure of `B_dR⁺` is Layer AI.0:period-comparison’s. Lemma 6.3.8 (CK §6.4, adapting BMS1 Lemma 13.12(ii)): put `D_{0,n}=K⟨(x_u^{±1})_{u∈Ψ_0},(x_a)_{a∈Ξ_0}⟩/(Ker s_0)ⁿ` and `D_0=lim_n D_{0,n}`. Since `A_0[1/p]` is étale over `K[T_1,…,T_r,T_{r+1}^{±1},…,T_d^{±1}]`, the map `A_0[1/p]→Â_0[1/p]` lifts to `A_0[1/p]→D_0` with `T_i↦x_{T_i}` ((6.4.1)). By Gabber–Ramero, arXiv v3, Claim 7.3.14, p.203, the power-bounded elements of `D_{0,n}` are the preimage of those of `Â_0[1/p]`, so `A_0` maps into a ring of definition; composing with `D_{0,n}→D_{Ψ,Ξ,n}(A)` gives a continuous map `y` from the right side of (6.3.9) to `D_{Ψ,Ξ}(A)`. A continuous map `z` in the other direction is defined from `X_{T_i}↦T_i`, the expansion `X_u^{−1}=ũ^{−1}(1−ũ^{−1}(X_u−ũ)+…)` for `u∈Ψ` and `ξ`-adic completeness. Then `y∘z=id` by construction and `z∘y=id` by étaleness, so `z` is the isomorphism (6.3.9). (6.3.10) and enlargement: every `a∈Ψ∪Ξ` is a unit of A, so the proof of BMS1 Lemma 13.13 gives `Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}/ξ≃Ω^{•,cont}_{A/C}`, compatibly with enlarging `Ψ` and `Ξ`; by the `ξ-completeness` and `ξ-torsion-freeness` of Lemma 6.3.8 the enlargement maps are quasi-isomorphisms. (6.3.11) and (6.3.12): for Spa(A,A°) in both bases, `D_Ψ(A)=D_{Ψ,∅}(A)`, and the map from `colim_Ψ` to `colim_{Ψ,Ξ}` is a quasi-isomorphism because for large indices both sides are computed by `ξ`-torsion-free, `ξ`-complete terms with the same reduction modulo `ξ` (CK state (6.3.11) as a consequence without further argument). The affinoids with `r=0` already form a basis of `X_ét`, so sheafifying gives `RΓ_crys(X_ét/B_dR⁺)`, and (6.2.7) gives (6.3.12). (ČK (arXiv v3), §6.2, p.60; ČK (arXiv v3), §6.2, (6.2.1), p.60; ČK (arXiv v3), §6.2, (6.2.5), p.61; ČK (arXiv v3), §6.2, (6.2.7), p.61; ČK (arXiv v3), §6.3, p.61; ČK (arXiv v3), §6.3, (6.3.2), p.61; ČK (arXiv v3), §6.3, (6.3.3), p.61; ČK (arXiv v3), §6.3, (6.3.5), p.62; ČK (arXiv v3), Lemma 6.3.8, p.62; ČK (arXiv v3), Lemma 6.3.8, last sentence, p.62; ČK (arXiv v3), §6.4, p.63; ČK (arXiv v3), §6.4, proof of Lemma 6.3.8, p.63; ČK (arXiv v3), §6.3, (6.3.10), p.62; ČK (arXiv v3), §6.3, (6.3.11)–(6.3.12), p.63; BMS1 (Publ. IHÉS), Lemma 13.12(ii), p.378; BMS1 (Publ. IHÉS), Lemma 13.4, p.370; BMS1 (Publ. IHÉS), Lemma 13.11, p.376; BMS1 (Publ. IHÉS), Lemma 9.15, p.331). *Needs:* *Finite infinitesimal Tate thickenings* (§AI.6.5); *Infinitesimal envelope of a very small affinoid* (§AI.6.5); *Smooth lifts and envelope normal form* (§AI.6.5); *Embedding independence and de Rham reduction* (§AI.6.5); *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5); *Proper smooth spreading out for the deformation* (§AI.6.5); *Finite freeness of the canonical deformation* (§AI.6.5); *Canonical deformation-to-étale map* (§AI.6.5); *Canonical rational comparison and descended map agreement* (§AI.6.5); *Smooth integral and canonical deformation agreement* (§AI.6.5); *Comparison with rational period rings* (§AI.0:period-comparison.1); *Finite de Rham coefficient quotients and flatness* (§AI.0:period-comparison.1); PadicPeriodRings, §§3, 4.1 (principal PD envelope and `A_cris→B_dR⁺`); PadicPeriodRings, §§1.5, 4.1 (*generalBasePeriodRings*: de Rham DVR and residue); PadicPeriodRings, §§1.5, 4.3 (canonical algebraic constants and the fixed embedding `K→B_dR⁺`); AdicEtaleGeometry, A1; AdicSpacesPartIII, R3; *Integral models and power-bounded elements for B_dR⁺-thickenings* (§AI.6.6); AdicSpacesPartII, R0 (*Étale toric charts on smooth affinoids (Scholze 2013, Lemma 5.2)*); ClassicalAdicEtaleCohomology, §1.3 (*Étale acyclicity of vector bundles on strongly sheafy affinoids*).

**Checks.**

- Node chart: for `A=C⟨T_0,T_1⟩/(T_0T_1−p^q)`, `A°=O_C⟨T_0,T_1⟩/(T_0T_1−p^q)`, the coordinate `T_1` lies in `A°∩A^×` (its inverse is `T_0/p^q`) but not in `(A°)^×` (its image in `A°/𝔪A°=k̄[T_0,T_1]/(T_0T_1)` is a zero divisor). So `T_1` cannot belong to any `Ψ`, while `Ψ=∅`, `Ξ={T_0,T_1}` satisfy (6.3.5) and the hypotheses of Lemma 6.3.8 with `K=W(k̄)`[1/p](p^q), `O` its ring of integers, `A_0=O[T_0,T_1]/(T_0T_1−p^q)`, `Ψ_0=∅` and `Ξ_0={T_0,T_1}`; then (6.3.9) reads `D_{∅,{T_0,T_1}}(A)≃(B_dR⁺⊗̂_K A_0[1/p])[[X_{T_0}−T̃_0]]`.
- Case `r=0`, `Ξ=∅`: the chart (6.3.1) is an étale map to a torus, `D_{Ψ,∅}(A)=D_Ψ(A)`, and (6.3.9) has the form of BMS1 Lemma 13.12(ii), with the `B_dR⁺-lift B_dR⁺⊗̂_K A_0[1/p]` of A, obtained by descent to a discretely valued `K`, in place of the lift used in BMS1; in particular `D_Ψ(A)` is again `ξ`-torsion-free and `ξ`-adically complete for `Ψ` large.
- Both parts hold for every smooth adic space over `C`; properness is not used. For `X=Spa(C,O_C)` all the complexes are `B_dR⁺` in degree 0 and (6.2.6) is reduction modulo `ξ`.
- The reduction (6.3.10) for the data `(Ψ,Ξ)` agrees with (6.2.6) under (6.3.11); a complex with the right cohomology but a different identification modulo `ξ` does not satisfy (6.3.12).

**Canonical semistable B_dR⁺ comparison map** (`Semistable.bdrComparisonMap`). Let `𝔛` be as in CK §1.5; its adic generic fibre `X_C^ad` is then smooth over `C`. Let `RΓ_crys(X_C^ad/B_dR⁺)` be *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5)’s `B_dR⁺`-cohomology (BMS1 §13), computed in the étale topology with the rings `D_{Ψ,Ξ}(A)` of *B_dR⁺-cohomology in the étale topology and with non-unit coordinates* (§AI.6.6). For an affine Spf `R` in `𝔛_ét` with *All-coordinates presentation indices* (§AI.6.1) data `(Σ,Λ)` as in CK §5.17, put `A=R[1/p]`, `Ξ=⋃_{λ∈Λ}{t_{λ,1},…,t_{λ,r_λ}}` and `Ψ={t_σ}_{σ∈Σ}∪⋃_{λ∈Λ}{t_{λ,r_λ+1},…,t_{λ,d}}`, enlarged by the images of the units `Ψ₀` obtained by descending the closed immersion (5.17.2) to a finite extension of W(k̄)[1/p]; the coordinates `t_{λ,0}` are omitted. CK §6.5 constructs continuous ring maps `D_{Σ,Λ}→D_{Ψ,Ξ}(A)` over `A_cris→B_dR⁺` (6.5.5), independent of the auxiliary chart `λ₀` and compatible with the maps to `R[1/p]`. These maps induce functorial maps on logarithmic differentials and their exterior powers, identifying the degree-one generators of coordinate occurrences with the same value in `R`. The induced maps of Koszul complexes (6.5.6) are compatible with enlarging `(Σ,Λ)` and `(Ψ,Ξ)` and with replacing `R` by a p-adically formally étale R-algebra; after sheafification they give the map (6.5.1) `RΓ_logcrys(𝔛_{O_C/p}/A_cris)→RΓ_crys(X_C^ad/B_dR⁺)` over `A_cris→B_dR⁺`, hence a `B_dR⁺`-linear map `RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_dR⁺→RΓ_crys(X_C^ad/B_dR⁺)`. It sits in the commutative square (6.5.7) with the reduction `RΓ_logcrys(𝔛_{O_C/p}/A_cris)→RΓ_logdR(𝔛/O_C)` of (5.23.2), the reduction modulo `ξ` of (6.2.6) and the map `RΓ_logdR(𝔛/O_C)→RΓ_dR(X_C^ad/C)` to the generic fibre. If `𝔛` is proper, compose with *Global crystalline and Witt specializations* (§AI.6.4)’s `RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris≃RΓ_logcrys(𝔛_{O_C/p}/A_cris)` to obtain the `A_inf-to-B_dR⁺` map `RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺→RΓ_crys(X_C^ad/B_dR⁺)`. This is a comparison to *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5)’s object, not its construction. Naturality for arbitrary morphisms of models, Galois equivariance and multiplicativity of the map are not asserted.

Standing hypotheses (SS). `𝔛` is as in CK §1.5 (étale-locally étale over a chart R□). No properness is needed for the map (6.5.1) or the square (6.5.7); properness of `𝔛` over `O_C` is assumed only for the composite with the uncompleted identification of *Global crystalline and Witt specializations* (§AI.6.4). The maps `A_inf→A_cris→B_dR⁺` are Layer AI.0’s.

The API:

- `Semistable.bdrComparisonMap.reduce`: The square (6.5.7) commutes: (6.5.1) followed by the reduction modulo `ξ`, `RΓ_crys(X_C^ad/B_dR⁺)→RΓ_dR(X_C^ad/C)` of (6.2.6), equals the reduction `RΓ_logcrys(𝔛_{O_C/p}/A_cris)→RΓ_logdR(𝔛/O_C)` of (5.23.2) followed by the map `RΓ_logdR(𝔛/O_C)→RΓ_dR(X_C^ad/C)` to the generic fibre.
- `Semistable.bdrComparisonMap.natural`: The local maps (6.5.5) and (6.5.6) are compatible with enlarging `(Σ,Λ)` and `(Ψ,Ξ)` and with replacing `R` by a p-adically formally étale R-algebra `R′` with data as in CK §5.17; this is what makes them glue to (6.5.1). Compatibility with arbitrary morphisms of models, and with the semilinear action of Gal(K̄/K) on a model defined over `O_K`, is not asserted.
- `Semistable.bdrComparisonMap.coefficients`: The map is induced by the common `A_inf→A_cris→B_dR⁺` coefficient maps, not an arbitrary isomorphism of equal-rank modules.
- `Semistable.bdrComparisonMap.local`: For data `(Σ,Λ)` on Spf `R` and `(Ψ,Ξ)` as in (6.5.2), the map `D_{Σ,Λ}→D_{Ψ,Ξ}(R[1/p])` of (6.5.5) is a continuous `A_cris`-algebra map sending the images of `X_σ`, `X_{λ,i} (1≤i≤d)` and `X_{λ,0}` to `X_{t_σ}`, `X_{t_{λ,i}}` and `[(p^{1/p^∞})^{q_λ}]/(X_{t_{λ,1}}⋯X_{t_{λ,r_λ}})`; it commutes with the maps `D_{Σ,Λ}→R` and `D_{Ψ,Ξ}(R[1/p])→R[1/p]` and induces the following chain rule. Let `I=Σ ⊔ {(λ,i):λ∈Λ,1≤i≤d}` be the set of coordinate occurrences, let `v:I→Ψ∪Ξ` send an occurrence to its value in `R`, write `D_τ=∂/∂log X_τ` and `D′_a=∂/∂log X_a`, and denote the ring map by `f`. For every `a∈Ψ∪Ξ`,

  `D′_a ∘ f = ∑_{τ∈I, v(τ)=a} f ∘ D_τ`.

  The degree-one map is `f¹(b·dlog X_τ)=f(b)·dlog X_{v(τ)}`; degree `j` uses its `j`-th exterior power over `f`, and degree zero is `f`. These maps intertwine the Koszul differentials. In particular `dlog X_{λ,0}=−∑_{i=1}^{r_λ}dlog X_{λ,i}` maps to `−∑_{i=1}^{r_λ}dlog X_{t_{λ,i}}`, consistently with the formula for `f(X_{λ,0})`. Empty fibres of `v` contribute zero, and repeated values add their source coefficients. The maps on forms commute with refinement of both presentations and with the formally étale restrictions in `Semistable.bdrComparisonMap.natural`.

The adic generic fibre `X_C^ad` is smooth over `C` by the charts (1.5.1) and Huber, Étale cohomology of rigid analytic varieties and adic spaces, 3.5.1 (CK §1.5). Use `RΓ_crys(X_C^ad/B_dR⁺)` from *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5) and, from *B_dR⁺-cohomology in the étale topology and with non-unit coordinates* (§AI.6.6), its computation in the étale topology by the complexes `Ω^•_{D_{Ψ,Ξ}(A)/B_dR⁺}` ((6.2.7), (6.3.11), (6.3.12)). Local data (CK (6.5.2)): for Spf `R` with data `(Σ,Λ)` as in CK §5.17 (*All-coordinates root covers* (§AI.6.4)) set `A=R[1/p]`, so that `A°≃R`, and `Ψ`, `Ξ` as in the statement. Descend the étale maps (5.17.3) to the ring of integers of a finite extension `K` of W(k̄)[1/p] in `C` (CK (1.5.2)) to obtain the descended coordinate map (6.3.2); after enlarging `K`, descend the closed immersion (5.17.2) to a surjection (6.3.4) with `Ξ₀=∅` and adjoin the image of the resulting `Ψ₀` to `Ψ`. Then Spa(A,A°) lies in the refined basis and Lemma 6.3.8 applies to `Ψ` and `Ξ` (*B_dR⁺-cohomology in the étale topology and with non-unit coordinates* (§AI.6.6)). By the descent and Gabber–Ramero, arXiv v3, Claim 7.3.14, p.203, the elements `[(p^{1/p^∞})^{q_λ}]/(X_{t_{λ,1}}⋯X_{t_{λ,r_λ}})` of `D_{Ψ,Ξ,n}(A)` are power-bounded. Hence `(D_{Ψ,Ξ,n}(A))°` is an algebra over the ring `A□_{Σ,Λ}` of (5.22.1), with `X_σ↦X_{t_σ}`, `X_{λ,i}↦X_{t_{λ,i}}` for `1≤i≤d` and `X_{λ,0}↦[(p^{1/p^∞})^{q_λ}]/(X_{t_{λ,1}}⋯X_{t_{λ,r_λ}})` (CK leave the formulas implicit; they follow from the presentation (5.19.2)). Since `D_{Ψ,Ξ,n}(A)` is a Q-algebra in which `ξ^m=0` for `m≥n` and each `X_a` is a unit of `D_{Ψ,Ξ}(A)`, the universal relations (5.26.3) and (5.27.3) of *Log exactification of all-coordinates charts* (§AI.6.4) make it an algebra over `(A□_{Σ,Λ}⊗_{A_inf}A_cris⁰)⊗_{Z[Q]}Z[P_{λ₀}]`, compatibly with the maps to `R` ((6.5.3)) and with the `change-of-λ₀` isomorphisms (5.26.7). The kernel of `(D_{Ψ,Ξ,n}(A))°→R/p` has a unique divided power structure (Stacks Project 07GM), so the universal property of the divided power envelope `D_{j_{λ₀}}` of CK §5.28 (*All-coordinates log PD envelope* (§AI.6.4)) gives `D_{j_{λ₀}}→(D_{Ψ,Ξ,n}(A))°` (6.5.4), which factors through a p-adically complete ring of definition. By Lemma 5.29, (5.29.1), `D_{Σ,Λ}` is the p-adic completion of `D_{j_{λ₀}}`; this gives continuous maps `D_{Σ,Λ}→D_{Ψ,Ξ,n}(A)`, compatible in `n` and independent of `λ₀`, hence `D_{Σ,Λ}→D_{Ψ,Ξ}(A)` (6.5.5). For each target direction `a`, compare `D′_a∘f` with the sum of `f∘D_τ` over occurrences with value `a`. They agree on the coordinate generators of `A□_{Σ,Λ}`, including the formula for each omitted `X_{λ,0}`. Uniqueness of extension through the log étale exactification and the divided power envelope gives the same identity on `D_{j_{λ₀}}` (CK §5.31, *All-coordinates log PD envelope* (§AI.6.4)); continuity and density give it on `D_{Σ,Λ}`. Thus `d_target∘f=f¹∘d_source`, and exterior powers give the Koszul chain map. The coordinate-value maps and their exterior powers commute with enlargement and formally étale restriction, yielding (6.5.6), including presentations with repeated coordinate values. The source computes `RΓ_logcrys(𝔛_{O_C/p}/A_cris)` by CK Proposition 5.23, (5.23.3), and §5.32 (*All-coordinates log crystalline model* (§AI.6.4)); the target computes `RΓ_crys(X_C^ad/B_dR⁺)` by (6.3.12). Sheafify on `𝔛_ét` and apply `RΓ(𝔛_ét,−)` to obtain (6.5.1). Square (6.5.7): by construction and Lemma 5.29 the map (6.5.5) is compatible with the maps to R[1/p]; BMS1 Lemma 13.13, as used for (6.3.10), then shows that (6.5.6) is compatible with the maps to `Ω^{•,cont}_{R[1/p]/C}` given by (5.23.2) (last display of CK §5.32) and by (6.3.10). For proper `𝔛`, compose with the identification (5.43.2) of *Global crystalline and Witt specializations* (§AI.6.4) (CK Corollary 5.43). (ČK (arXiv v3), §6.5, map (6.5.1), p.64; properness is not assumed; ČK (arXiv v3), §6.5, (6.5.2), p.64; ČK (arXiv v3), §6.5, (6.5.4)–(6.5.5), p.65; ČK (arXiv v3), §6.5, (6.5.6), p.65; ČK (arXiv v3), §6.5, square (6.5.7), p.65; ČK (arXiv v3), Corollary 5.43, (5.43.2), p.58). *Needs:* *Global crystalline and Witt specializations* (§AI.6.4); *All-coordinates root covers* (§AI.6.4); *Log exactification of all-coordinates charts* (§AI.6.4); *All-coordinates log PD envelope* (§AI.6.4); *All-coordinates log crystalline model* (§AI.6.4); *B_dR⁺-cohomology in the étale topology and with non-unit coordinates* (§AI.6.6); *Finite infinitesimal Tate thickenings* (§AI.6.5); *Infinitesimal envelope of a very small affinoid* (§AI.6.5); *Smooth lifts and envelope normal form* (§AI.6.5); *Embedding independence and de Rham reduction* (§AI.6.5); *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5); *Proper smooth spreading out for the deformation* (§AI.6.5); *Finite freeness of the canonical deformation* (§AI.6.5); *Canonical deformation-to-étale map* (§AI.6.5); *Canonical rational comparison and descended map agreement* (§AI.6.5); *Smooth integral and canonical deformation agreement* (§AI.6.5); *Comparison with rational period rings* (§AI.0:period-comparison.1); *Finite de Rham coefficient quotients and flatness* (§AI.0:period-comparison.1); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); PadicPeriodRings, §§3, 4.1 (principal PD envelope and `A_cris→B_dR⁺`); PadicPeriodRings, §§1.5, 4.1 (*generalBasePeriodRings*: de Rham DVR and residue); PadicPeriodRings, §§1.5, 4.3 (canonical algebraic constants and the fixed embedding `K→B_dR⁺`); AdicEtaleGeometry, A1; *Algebraization and descent of semistable charts* (§AI.6.1); *Integral models and power-bounded elements for B_dR⁺-thickenings* (§AI.6.6).

**Checks.**

- `Semistable.bdrComparisonMap.point`: For `𝔛=Spf O_C (d=0, Σ=∅, one chart` with `r=0`) both sides are concentrated in degree 0: `RΓ_logcrys(Spec(O_C/p)/A_cris)=A_cris` and `RΓ_crys(Spa(C,O_C)/B_dR⁺)=B_dR⁺`. The map (6.5.1) is the inclusion `A_cris→B_dR⁺` of CK §6.1, and its `B_dR⁺-linearisation` is the identity of `B_dR⁺`.
- `Semistable.bdrComparisonMap.good_reduction`: For `𝔛` proper and smooth over `O_C` (the log structure is then pulled back from the base, so `Ω^j_{𝔛/O_C,log}=Ω^j_{𝔛/O_C}`), the reduction modulo `ξ` of the `B_dR⁺`-linear map is identified by (5.23.2) and (6.2.6) with the canonical isomorphism `RΓ_dR(𝔛/O_C)⊗_{O_C}C≃RΓ_dR(X_C^ad/C)`; hence the map is an isomorphism, as in BMS1 Proposition 13.23. For the p-adic completion of `P¹_{O_C}` both sides have cohomology `B_dR⁺`, 0, `B_dR⁺` in degrees 0, 1, 2. Equality with the map of BMS1 Proposition 13.23 is not asserted: BMS1 does not write that map down.
- Repeated-coordinate torus: take `R=O_C⟨t^{±1}⟩`, `Σ={σ}` with `t_σ=t` and one chart with `r_λ=0`, `d=1`, `q_λ=1`, `t_{λ,0}=p`, `t_{λ,1}=t`. The torus immersion and chart étale map are identities and the special fibre is connected, so this is an all-coordinates index. With `Ψ={t}`, `Ξ=∅`, put `X=X_σ`, `Y=X_{λ,1}`, `Z=X_t`. Then `f(X)=f(Y)=Z`, `f(D_σY)=0` and `D′_t(f(Y))=Z≠0` (its augmentation is the unit `t`). The valid identity is `D′_t∘f=f∘(D_σ+D_{λ,1})`. Both `dlog X` and `dlog Y` map to `dlog Z`; their wedge maps to zero. On the polynomial coordinate subalgebras this is the chain rule for `MvPolynomial.rename`, without an injectivity hypothesis on the map of variables.
- `Semistable.bdrComparisonMap.node`: On the chart `R□=O_C{t_0,t_1}/(t_0t_1−p^q)`, with `A=R□[1/p]`: `Ω¹_{R□/O_C,log}` is free on dlog `t_1=−dlog t_0`, `Ω^{1,cont}_{A/C}` is free on `dT_1/T_1=−dT_0/T_0`, and the lower arrow of (6.5.7) is in degree 1 the R□-linear map dlog `t_1↦dT_1/T_1`. So the relation dlog `t_0+dlog t_1=0` goes to `dT_0/T_0+dT_1/T_1=0`, and the arrow becomes an isomorphism after inverting p. On the `B_dR⁺` side `t_1` is a coordinate in `Ξ` and `t_0` is omitted.
- The square (6.5.7) commutes in the derived category: the map followed by the reduction modulo `ξ` of (6.2.6) equals the reduction (5.23.2) to `RΓ_logdR(𝔛/O_C)` followed by the map `RΓ_logdR(𝔛/O_C)→RΓ_dR(X_C^ad/C)`.
- The map and the square are constructed without properness; properness enters only in the composite with `RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris`.
- On a node chart the coordinate `t_{λ,1}` is placed in `Ξ` (it is invertible in R[1/p] but not in `R`) and `t_{λ,0}` is omitted; the target is therefore one of the rings `D_{Ψ,Ξ}(A)` with `Ξ≠∅` of *B_dR⁺-cohomology in the étale topology and with non-unit coordinates* (§AI.6.6).

**Semistable B_dR⁺ comparison** (`Semistable.bdrComparison`). For proper `𝔛`, *Canonical semistable B_dR⁺ comparison map* (§AI.6.6) is an equivalence `RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}B_dR⁺≃RΓ_crys(X_C^ad/B_dR⁺)`, and hence `RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺≃RΓ_crys(X_C^ad/B_dR⁺)`. In every degree it gives `H^i_Ainf(𝔛)⊗_{A_inf}B_dR⁺≃H^i_crys(X_C^ad/B_dR⁺)`, a finite free `B_dR⁺`-module. Modulo `ξ` the second equivalence is compatible with the identifications of both sides with `RΓ_dR(X_C^ad/C)`: on the source the log de Rham specialization (4.18.1) of *Log de Rham specialization* (§AI.6.3) followed by `RΓ_logdR(𝔛/O_C)⊗_{O_C}C≃RΓ_dR(X_C^ad/C)`, on the target the reduction (6.2.6).

Standing hypotheses (SS). `𝔛` is as in CK §1.5 and proper over `O_C`.

By *Perfect semistable A_inf cohomology* (§AI.6.3) (CK Corollary 4.20) and *Global crystalline and Witt specializations* (§AI.6.4) (CK Corollary 5.43, whose freeness assertion rests on Beilinson, On the crystalline period map (arXiv:1111.3316v4), §1.18, Theorem), `RΓ_logcrys(𝔛_{O_C/p}/A_cris)` is a perfect complex over `A_cris` whose cohomology modules are finite free after inverting p. Hence its base change to `B_dR⁺` is derived `ξ`-complete with finite free cohomology. The finite freeness is proved here, not deduced from the canonical deformation. By CK Remark 5.24, (5.24.1) (Beilinson, (1.11.1); CR.5), the map (5.23.2) is an isomorphism after `⊗^L O_C/p`; both `RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}O_C` and `RΓ_logdR(𝔛/O_C)` are perfect over `O_C`, hence derived p-complete, so `RΓ_logcrys(𝔛_{O_C/p}/A_cris)⊗^L_{A_cris}O_C≃RΓ_logdR(𝔛/O_C)`. By *B_dR⁺-cohomology in the étale topology and with non-unit coordinates* (§AI.6.6) ((6.2.5), (6.2.6)), `RΓ_crys(X_C^ad/B_dR⁺)` is derived `ξ`-complete with reduction `RΓ_dR(X_C^ad/C)`. By the square (6.5.7) of *Canonical semistable B_dR⁺ comparison map* (§AI.6.6), the reduction modulo `ξ` of the map is `RΓ_logdR(𝔛/O_C)⊗_{O_C}C→RΓ_dR(X_C^ad/C)`. This is an isomorphism: coherent cohomology of the proper formal scheme and of its adic generic fibre agree after inverting `p`, and `Ω^j_{𝔛/O_C,log}[1/p]` is the sheaf of continuous differentials of the generic fibre. CK use this without citation; it is the statement taken from AdicSpacesPartIII, R3. By derived Nakayama for `ξ` (EnhancedDerivedSheaves, E4 (*Equivalences detected modulo the ideal*), Layer AI.5) the map is an isomorphism; this is (6.6.1), and the freeness of the `H^i_crys(X_C^ad/B_dR⁺)` follows from the first step. Combine with (5.43.2) of *Global crystalline and Witt specializations* (§AI.6.4) to obtain (6.6.2). The degreewise form is not in the statement of CK Theorem 6.6; it follows from the flatness of `B_dR⁺` over `A_inf` (CK §6.1, by Raynaud–Gruson, Critères de platitude et de projectivité, II.1.4.2.1; Layer AI.0:period-comparison), which gives `H^i(RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR⁺)=H^i_Ainf(𝔛)⊗_{A_inf}B_dR⁺`. CK use it in this form in the proof of Theorem 8.7. The compatibility modulo `ξ` with (4.18.1) follows from *Log crystalline and de Rham agreement* (§AI.6.4) (CK Proposition 5.41) and the commutativity of (6.5.7) (CK Theorem 6.6). (ČK (arXiv v3), Theorem 6.6, p.66; ČK (arXiv v3), Theorem 6.6, `mod-ξ` clause, p.66; ČK (arXiv v3), Theorem 6.6, proof, p.66; ČK (arXiv v3), Corollary 5.43, p.58; ČK (arXiv v3), Remark 5.24, (5.24.1), p.44; ČK (arXiv v3), Proposition 5.41, p.56; ČK (arXiv v3), §6.1, p.60). *Needs:* *Canonical semistable B_dR⁺ comparison map* (§AI.6.6); *Perfect semistable A_inf cohomology* (§AI.6.3); *Log de Rham specialization* (§AI.6.3); *Global crystalline and Witt specializations* (§AI.6.4); *Log crystalline and de Rham agreement* (§AI.6.4); *B_dR⁺-cohomology in the étale topology and with non-unit coordinates* (§AI.6.6); *Finite infinitesimal Tate thickenings* (§AI.6.5); *Infinitesimal envelope of a very small affinoid* (§AI.6.5); *Smooth lifts and envelope normal form* (§AI.6.5); *Embedding independence and de Rham reduction* (§AI.6.5); *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5); *Proper smooth spreading out for the deformation* (§AI.6.5); *Finite freeness of the canonical deformation* (§AI.6.5); *Canonical deformation-to-étale map* (§AI.6.5); *Canonical rational comparison and descended map agreement* (§AI.6.5); *Smooth integral and canonical deformation agreement* (§AI.6.5); CrystallineCohomology, CR.5; *Comparison with rational period rings* (§AI.0:period-comparison.1); *Finite de Rham coefficient quotients and flatness* (§AI.0:period-comparison.1); *Perfectness of finitely presented A_inf modules* (§AI.2.1); *A_inf module structure theorem* (§AI.2.1); *Primitive rational crystalline Frobenius input* (§AI.5.1); *Length increase under Witt specialization* (§AI.5.2); *Rank and torsion-length comparison* (§AI.5.2); *Finite presentation and adjacent-degree freeness* (§AI.5.2); *p-local freeness from two period realizations* (§AI.2.1); *Cohomology finiteness from period realizations* (§AI.5.2); EnhancedDerivedSheaves, E4 (*Equivalences detected modulo the ideal*); PadicPeriodRings, §§3, 4.1 (principal PD envelope and `A_cris→B_dR⁺`); PadicPeriodRings, §§1.5, 4.1 (*generalBasePeriodRings*: de Rham DVR and residue); PadicPeriodRings, §§1.5, 4.3 (canonical algebraic constants and the fixed embedding `K→B_dR⁺`); AdicSpacesPartIII, R3; *Finiteness and base change for proper formal schemes over O_C* (§AI.6.3); ClassicalAdicEtaleCohomology, §1.3 (*Étale acyclicity of vector bundles on strongly sheafy affinoids*).

**Checks.**

- The complex comparison and the degreewise finite-free statement are both required.
- The reduction modulo `ξ` of the equivalence is the isomorphism `RΓ_logdR(𝔛/O_C)⊗_{O_C}C≃RΓ_dR(X_C^ad/C)`; for the p-adic completion of `P¹_{O_C}`, the unreduced complexes have cohomology `B_dR⁺,0,B_dR⁺`, and their reductions have cohomology `C,0,C` in degrees 0,1,2.

- For `Spf O_C`, comparison is the identity on `B_dR⁺`, reducing to the identity on `C`.


**Semistable étale specialization** (`Semistable.etaleComparison`). If `𝔛` is proper over `O_C`, then `RΓ_Ainf(𝔛)⊗^L_{A_inf}A_inf[1/μ]≃RΓ_ét(X_C^ad,ℤ_p)⊗^L_{ℤ_p}A_inf[1/μ]` (CK Theorem 2.3); both tensor products are ordinary derived tensor products. The identification is induced by the map `RΓ_ét(X_C^ad,ℤ_p)⊗^L_{ℤ_p}A_inf→RΓ_proét(X_C^ad,A_inf,X)` coming from the inclusion of `ℤ_p` in `A_inf,X`, whose cone has cohomology killed by `W(m^♭)`, and by `AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]`; it is compatible with Frobenius, acting through `A_inf,X` on the left and through `A_inf` on the right. It is natural for isomorphisms lying over continuous automorphisms of `O_C` (aomega, API item semilinear); in particular for `𝔛=𝔛₀⊗̂_{O_K}O_C` it is `G_K`-equivariant, `G_K` acting on the right side through both factors, which CK use in the proof of Theorem 8.7. Compatibility with products is not asserted. For non-proper `𝔛` it fails in general. It is generic-fibre p-adic étale cohomology, not special-fibre étale cohomology and not mere p-inversion.

Standing hypotheses (SS). `𝔛` is proper over `O_C`; then `X_C^ad` is smooth and proper over `C` (CK §1.5).

By aomega (CK (2.2.7)), `AΩ_𝔛⊗^L A_inf[1/μ]≅Rν_*(A_inf,X)⊗^L A_inf[1/μ]`; `𝔛` being quasi-compact and quasi-separated, `RΓ(𝔛_ét,−)` commutes with inverting `μ`, so `RΓ_Ainf(𝔛)⊗^L A_inf[1/μ]≅RΓ_proét(X_C^ad,A_inf,X)⊗^L A_inf[1/μ]`. Primitive comparison (Scholze; BMS1 Theorem 5.7, cited by CK as [BMS18, 5.6]; Layer AI.3): `X_C^ad` is a proper smooth adic space over the algebraically closed field `C` (Huber, Étale cohomology of rigid analytic varieties and adic spaces, 3.5.1 and 1.3.18 ii)), so the cone of the map CK (2.3.2) has cohomology killed by `W(m^♭)` (almost purity gives `[m^♭]`; derived p-completeness, as in CK Lemma 3.17, gives `W(m^♭)`). `μ` lies in `W(m^♭)`, so (2.3.2) becomes an isomorphism after inverting `μ`; with the first step this is (2.3.1). Frobenius compatibility is read off from the construction, as CK does when it uses (2.3.1) in §9. Naturality for isomorphisms over automorphisms of `O_C`: the maps (2.2.7) and (2.3.2) are induced by maps of sheaves on the pro-étale site of the generic fibre that are defined for every pair `(C,X_C^ad)`, hence commute with the pullback isomorphisms of aomega. (ČK (arXiv v3), §1.5, p.5; ČK (arXiv v3), §2.2, p.9; ČK (arXiv v3), Theorem 2.3, p.9; the display (2.3.1) follows; ČK (arXiv v3), Theorem 2.3 (sketch of proof), p.9; ČK (arXiv v3), Theorem 9.5 (proof), p.76; BMS1 (Publ. IHÉS), Theorem 5.7, p.287; it requires a proper smooth adic space; ČK (arXiv v3), Theorem 8.7 (proof), p.74). *Needs:* *Semistable AΩ complex* (§AI.6.2); *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); AdicEtaleGeometry, A1; *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); *The primitive comparison over A_inf* (§AI.5.1).

**Checks.**

- For `𝔛=Spf O_C` both sides are `A_inf[1/μ]` and the map is the identity.
- Properness is necessary. For `𝔛=Spf O_C{t^{±1}}`, base change of both sides along `A_inf[1/μ]→A_inf[1/μ]/ξ̃=C` gives `H⁰=C⟨t^{±1}⟩` on the left (by *Log Hodge–Tate reduction* (§AI.6.3), `H⁰(Ω̃_𝔛)=O_𝔛`) and `H⁰=C` on the right (the generic fibre is connected and `C` is flat over `ℤ_p`), so the two sides are not isomorphic.
- After inverting only `p` there is no natural, Frobenius-compatible comparison: it would specialise along `A_inf[1/p]→W(k̄)[1/p]` to a Frobenius-equivariant isomorphism of `H^i_logcris(𝔛_k̄/W(k̄))[1/p]` with `H^i_ét(X_C^ad,ℤ_p)⊗W(k̄)[1/p]`, on which Frobenius acts through W(k̄) only, forcing all slopes to be 0; for `𝔛=P¹_{O_C}` and `i=2` the slope is 1. (A non-canonical isomorphism of complexes does exist after inverting `p`, both sides then having finite free cohomology of equal ranks by CK Theorem 7.4 and Corollary 7.5.)

**Étale and B_dR comparison agreement** (`Semistable.etaleBdrAgreement`). Let `𝔛` be proper. Let c: `RΓ_crys(X_C^ad/B_dR⁺)→RΓ_ét(X_C^ad,ℤ_p)⊗_{ℤ_p}B_dR⁺` be the map of BMS1 (proof of Theorem 13.1) supplied by *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5); it becomes an isomorphism after `⊗_{B_dR⁺}B_dR`, the identification (6.7.1), and is not asserted to be an isomorphism over `B_dR⁺`. Then the diagram of CK Proposition 6.8 commutes: the composite of *Canonical semistable B_dR⁺ comparison map* (§AI.6.6)’s (6.5.1), of c and of the isomorphism `RΓ_ét(X_C^ad,ℤ_p)⊗^L_{ℤ_p}B_dR⁺≃RΓ_proét(X_C^ad,A_inf,X)⊗^L_{A_inf}B_dR⁺` induced by (2.3.2) equals the composite of the isomorphism `RΓ_logcrys(𝔛_{O_C/p}/A_cris)≃RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris` ((5.43.2) of *Global crystalline and Witt specializations* (§AI.6.4), the global form of *Absolute log crystalline comparison* (§AI.6.4)’s (5.40.1), which is the label in CK’s diagram) and the map to `RΓ_proét(X_C^ad,A_inf,X)⊗^L_{A_inf}B_dR⁺` induced by `Lη_μ→id` (BMS1 Lemma 6.10). Consequently, after base change to `B_dR`, the identification `RΓ_Ainf(𝔛)⊗^L_{A_inf}B_dR≃RΓ_ét(X_C^ad,ℤ_p)⊗^L_{ℤ_p}B_dR` obtained from *Semistable étale specialization* (§AI.6.6) equals the one obtained from *Semistable B_dR⁺ comparison* (§AI.6.6) and (6.7.1). If moreover `X_C^ad≃X₀⊗̂_K C` for a proper smooth adic space X₀ over `K`, with `K` as in the hypotheses, then under `RΓ_crys(X_C^ad/B_dR⁺)≃RΓ_dR(X₀/K)⊗_K B_dR⁺` ((6.2.8), using the canonical `K→B_dR⁺`) the identification (6.7.1) becomes the de Rham comparison (6.7.2) `RΓ_ét(X_C^ad,ℤ_p)⊗_{ℤ_p}B_dR≃RΓ_dR(X₀/K)⊗_K B_dR`; when `C` is the completion of K̄ it is Gal(K̄/K)-equivariant, recovers Scholze’s comparison isomorphism and is compatible with filtrations (the valuation filtration of `B_dR`, the Hodge filtration on `RΓ_dR(X₀/K)` and the trivial filtration on étale cohomology).

Standing hypotheses (SS). `𝔛` is as in CK §1.5 and proper over `O_C`. For the last sentence only: `K⊂C` is a complete discretely valued subfield with perfect residue field and X₀ is a proper smooth adic space over `K` with `X_C^ad≃X₀⊗̂_K C` (CK (6.2.8)); for Galois equivariance, agreement with Scholze’s isomorphism and compatibility with filtrations, `C` is the completion of K̄ (CK §6.7).

`(2.3.2)⊗B_dR⁺` is an isomorphism: the cohomology of the cone of (2.3.2) is killed by `W(𝔪^♭)` (*Semistable étale specialization* (§AI.6.6); discussion after CK Theorem 2.3), and `φ⁻¹(μ)∈W(𝔪^♭)` is a unit of `B_dR⁺`. Recall c from BMS1, proof of Theorem 13.1 (*Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5)): for Spa(A,A°) in the basis of CK §6.2 and `Ψ` large, the perfectoid `∏_Ψ ℤ_p(1)-cover Spa(A_{Ψ,∞},A⁺_{Ψ,∞})` gives a continuous `B_dR⁺-map D_Ψ(A)→B_dR⁺(A⁺_{Ψ,∞})`, `X_u↦[u^{1/p^∞}]` (6.8.2), which intertwines `exp(log([ε])·∂/∂log X_u)` with the generator `γ_u` of the u-th copy of `ℤ_p(1)`. The formula of (5.16.1) then gives maps of complexes `Ω^•_{D_Ψ(A)/B_dR⁺}→K_{B_dR⁺(A⁺_{Ψ,∞})}((γ_u−1)_{u∈Ψ})` (6.8.3), whose target computes `RΓ_proét(X_C^ad,A_inf,X)⊗^L_{A_inf}B_dR⁺` by the almost purity theorem (Layer AI.3). Passing to the colimit over `Ψ`, sheafifying and taking cohomology gives the composite `f` of c with (2.3.2). Extend the construction of (6.8.3) to the étale basis of CK §6.2 and to the data `(Ψ,Ξ)` of CK §6.3, with the cover that adjoins p-power roots of the `X_u (u∈Ψ)` and of the `X_a (a∈Ξ)`. By (6.2.7) and (6.3.12) of *B_dR⁺-cohomology in the étale topology and with non-unit coordinates* (§AI.6.6) both variants give the same `f`. CK say that the remaining modifications are mild; they have to be carried out here, so a local comparison for non-unit coordinates is constructed here. Since `f` is now built in the setting of CK §6.3 by the same pattern as (5.40.1) (*Absolute log crystalline comparison* (§AI.6.4); the map of (5.16.1)), the proposition reduces to the commutativity of the square of rings (6.8.4): `D_{Σ,Λ}→D_{Ψ,Ξ}(A)→B_dR⁺(A⁺_{Ψ,Ξ,∞})`, by (6.5.5) of *Canonical semistable B_dR⁺ comparison map* (§AI.6.6) and (6.8.2), equals `D_{Σ,Λ}→A_cris(R_{Σ,Λ,∞})→B_dR⁺(A⁺_{Ψ,Ξ,∞})`, by (5.38.1) of *All-coordinates comparison morphism* (§AI.6.4) and (5.36.1). Check it modulo `ξⁿ`, then on `D_{j_{λ₀}}`, then, the target being a Q-algebra, on `(A□_{Σ,Λ}⊗_{A_inf}A_cris⁰)⊗_{Z[Q]}Z[P_{λ₀}]`: both maps send `X_τ` to the unit `[X_τ^{1/p^∞}]` for `τ=σ∈Σ` and `τ=(λ,i)`, `1≤i≤d` (CK Proposition 6.8). The statement over `B_dR` follows by inverting `ξ`, using *Semistable B_dR⁺ comparison* (§AI.6.6) ((6.6.2)) and *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5)’s (6.7.1). Descended case (CK §6.7): (6.2.8) is BMS1 Remark 13.20 (*Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5)), with the unique continuous lift `K→B_dR⁺` of `K→C`; combined with (6.7.1) it gives (6.7.2). If `C` is the completion of K̄, then (6.7.2) is Galois equivariant by transport of structure and, by BMS1 Theorem 13.1, recovers the isomorphism of Scholze, p-adic Hodge theory for rigid-analytic varieties, Theorem 8.4; hence it is compatible with filtrations. (ČK (arXiv v3), Proposition 6.8, p.66 (proof pp.67–68); ČK (arXiv v3), Proposition 6.8, conclusion, p.66; ČK (arXiv v3), Proposition 6.8, proof, p.67; ČK (arXiv v3), §6.7, (6.7.1), p.66; ČK (arXiv v3), §6.7, (6.7.2), p.66; ČK (arXiv v3), §6.2, (6.2.8), p.61; BMS1 (Publ. IHÉS), Theorem 13.1, p.368; BMS1 (Publ. IHÉS), Remark 13.20, p.384; BMS1 (Publ. IHÉS), Lemma 6.10, p.292). *Needs:* *Semistable étale specialization* (§AI.6.6); *Semistable B_dR⁺ comparison* (§AI.6.6); *Canonical semistable B_dR⁺ comparison map* (§AI.6.6); *B_dR⁺-cohomology in the étale topology and with non-unit coordinates* (§AI.6.6); *All-coordinates comparison morphism* (§AI.6.4); *Absolute log crystalline comparison* (§AI.6.4); *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); AdicEtaleGeometry, A1; *Rational pro-étale de Rham period sheaves* (§AI.3.1); *Finite infinitesimal Tate thickenings* (§AI.6.5); *Infinitesimal envelope of a very small affinoid* (§AI.6.5); *Smooth lifts and envelope normal form* (§AI.6.5); *Embedding independence and de Rham reduction* (§AI.6.5); *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5); *Proper smooth spreading out for the deformation* (§AI.6.5); *Finite freeness of the canonical deformation* (§AI.6.5); *Canonical deformation-to-étale map* (§AI.6.5); *Canonical rational comparison and descended map agreement* (§AI.6.5); *Smooth integral and canonical deformation agreement* (§AI.6.5); *Finite-level crystalline period rings A_cris^(m)* (§AI.6.4); *Connective comparison and localization* (§AI.1.2); *Composition of décalage* (§AI.1.2); *Reduction to the Bockstein complex* (§AI.1.4); *Base-change criterion for décalage* (§AI.1.6); *Preservation of derived completeness* (§AI.1.5); *Continuous cochains and Koszul complexes* (§AI.1.7); *Koszul products and integral cohomology* (§AI.1.7); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Nonflat quotient base change for décalage* (§AI.1.6); *Derived-reduction almost-to-integral criterion* (§AI.1.6); *Continuous cohomology of completed coefficient sums* (§AI.1.7); *Almost-to-honest décalage criterion* (§AI.3.2); *Comparison with rational period rings* (§AI.0:period-comparison.1); *Finite de Rham coefficient quotients and flatness* (§AI.0:period-comparison.1); *Global crystalline and Witt specializations* (§AI.6.4).

**Checks.**

- Equality of these actual maps, rather than existence of some isomorphism, is the lattice input.
- The map c is an isomorphism only after inverting `ξ`: for `X_C^ad=P¹_C` in degree 2 its image is `ξ·(H²_ét(P¹_C,ℤ_p)⊗_{ℤ_p}B_dR⁺)`.

### AI.6.7 Breuil–Kisin–Fargues structure, torsion and lattices

**Semistable cohomological BKF modules** (`Semistable.cohomologicalBKF`). For proper `𝔛`, each `H^i_Ainf(𝔛)` is finitely presented over `A_inf` and finite free after p-inversion, with the Frobenius isomorphism after `ξ̃`-inversion required by AI.2. If `𝔛_k̄` has dimension at most `d` the module is zero outside 0,…,2d (*Perfect semistable A_inf cohomology* (§AI.6.3); CK Theorem 7.4 assumes pure dimension `d`). If `𝔛=𝔛₀⊗̂_{O_K}O_C` for a formal `O_K-scheme 𝔛₀`, with `K` as in CK §8.1, the semilinear action of `G_K` on `H^i_Ainf(𝔛)` (aomega, API item semilinear) commutes with the Frobenius isomorphism (CK §8.3). These are finitely presented BKF modules, with possible p-torsion, not automatically finite free BKF lattices.

Standing hypotheses (SS). `𝔛` is as in CK §1.5 and proper over `O_C`. Pure dimension `d` of the special fibre `𝔛_{k̄}` (CK §7.1) is assumed only for the vanishing outside 0,…,2d.

By *Perfect semistable A_inf cohomology* (§AI.6.3) (CK Corollary 4.20), `RΓ_Ainf(𝔛)` is a perfect complex. By *Semistable étale specialization* (§AI.6.6) (CK Theorem 2.3) and flatness of `A_inf→A_inf[1/μ]`, `H^i_Ainf(𝔛)[1/pμ]≃H^i_ét(X_C^ad,ℤ_p)⊗_{ℤ_p}A_inf[1/pμ]` is free over `A_inf[1/pμ]`. By *Global crystalline and Witt specializations* (§AI.6.4) (CK Corollary 5.43), the cohomology modules of `RΓ_Ainf(𝔛)⊗^L_{A_inf}A_cris[1/p]` are free over `A_cris[1/p]`. Apply BMS1 Corollary 4.20 (Layer AI.5; its proof uses BMS1 Lemma 4.19, Corollary 4.17 and Lemma 4.9): each `H^i_Ainf(𝔛)` is finitely presented and `H^i_Ainf(𝔛)[1/p]` is free over `A_inf[1/p]`. The Frobenius of *Semistable AΩ Frobenius* (§AI.6.2) (CK (2.2.5), (2.2.6)) is an isomorphism after inverting `ξ̃=φ(ξ)` and passes to cohomology because `φ` is an automorphism of `A_inf`. Hence each `H^i_Ainf(𝔛)` is a Breuil–Kisin–Fargues module in the sense of BMS1 Definition 4.22 (Layer AI.2) (CK §7.3, Theorem 7.4). Vanishing outside 0,…,2d is part of *Perfect semistable A_inf cohomology* (§AI.6.3) (CK Theorem 7.4). Galois action (CK §8.1, §8.3): the Frobenius of *Semistable AΩ Frobenius* (§AI.6.2) is induced by the Frobenius of the period sheaf `A_inf,X`, which commutes with the pullback isomorphisms of aomega; so the action of `G_K` on `H^i_Ainf(𝔛)` commutes with the Frobenius isomorphism. (ČK (arXiv v3), Theorem 7.4 with proof, p.69; ČK (arXiv v3), §7.3, p.69; ČK (arXiv v3), §7.2, Frobenius, p.68; ČK (arXiv v3), §7.1, p.68; BMS1 (Publ. IHÉS), Corollary 4.20, pp.275–276; ČK (arXiv v3), §8.3, p.72). *Needs:* *Perfect semistable A_inf cohomology* (§AI.6.3); *Semistable étale specialization* (§AI.6.6); *Global crystalline and Witt specializations* (§AI.6.4); *Log de Rham specialization* (§AI.6.3); *Semistable AΩ Frobenius* (§AI.6.2); *Perfectness of finitely presented A_inf modules* (§AI.2.1); *A_inf module structure theorem* (§AI.2.1); *Primitive rational crystalline Frobenius input* (§AI.5.1); *Length increase under Witt specialization* (§AI.5.2); *Rank and torsion-length comparison* (§AI.5.2); *Finite presentation and adjacent-degree freeness* (§AI.5.2); *p-local freeness from two period realizations* (§AI.2.1); *Cohomology finiteness from period realizations* (§AI.5.2); *Breuil–Kisin–Fargues module* (§AI.2.2); *Operations in valid BKF subcategories* (§AI.2.2); *Étale realization of BKF modules* (§AI.2.2); *Fargues classification of finite free BKF modules* (§AI.2.3); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Semistable AΩ complex* (§AI.6.2).

**Checks.**

- A p-torsion cohomology module remains allowed; the finite-free Fargues classification is not applied to it.

**Degreewise semistable specialization sequences** (`Semistable.degreewiseSpecializations`). For proper `𝔛` and every `i`, `H_A^i⊗_{A_inf}W(C^♭)≃H_ét^i(X_C,ℤ_p)⊗_{ℤ_p}W(C^♭)`. There are exact sequences `0→H_A^i⊗_{θ}O_C→H_logdR^i→H_A^{i+1}[ξ]→0` and, Frobenius-equivariantly, `0→H_A^i⊗W(k̄)→H_logcrys^i→Tor₁^{A_inf}(H_A^{i+1},W(k̄))→0`. Here `H_logcrys^i=H_logcrys^i(𝔛_{k̄}/W(k̄))` is taken over W(k̄) with the log structure associated with `Q≥0→W(k̄)`, `0≠q↦0`, `0↦1`, of CK §5.42, as in *Global crystalline and Witt specializations* (§AI.6.4); the passage to the `ℕ` log point is *Arithmetic Hyodo–Kato interface* (§AI.6.4) and is not used here.

Standing hypotheses (SS). Standing hypotheses (SS-prop); the proof does not use that the special fibre is equidimensional, which ČK §7.1 also assume.

Étale: by *Semistable étale specialization* (§AI.6.6) and flatness of `A_inf→A_inf[1/μ]`, `H_A^i[1/μ]≃H_ét^i(X_C,ℤ_p)⊗_{ℤ_p}A_inf[1/μ]` ((7.6.1)). Since `μ` is a unit of `W(C^♭)` and `W(C^♭)` is `A_inf-flat` (the localisation of `A_inf` at `(p)` is a discrete valuation ring with completion `W(C^♭)`), base change gives (7.6.2). De Rham: apply the universal-coefficient sequence (Stacks Project 0662; Layer AI.5) to `RΓ_Ainf(𝔛)⊗^L_{A_inf,θ}O_C≃RΓ_logdR(𝔛/O_C)` (*Log de Rham specialization* (§AI.6.3), CK Corollary 4.18). Since `O_C=A_inf/ξ` with `ξ` a nonzerodivisor, `Tor₁^{A_inf}(M,O_C)=M[ξ]` and the higher Tor groups vanish; this gives (7.6.3). Crystalline: apply the same to `RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄)≃RΓ_logcrys(𝔛_{k̄}/W(k̄))` (*Global crystalline and Witt specializations* (§AI.6.4), CK (5.43.2), Frobenius-equivariant). By *Semistable cohomological BKF modules* (§AI.6.7) (CK Theorem 7.4) each `H_A^j` is finitely presented with `H_A^j[1/p]` free, so by BMS1 Lemma 4.9(iii) (Layer AI.5) it has Tor-dimension at most 2 and `Tor₂^{A_inf}(H_A^j,W(k̄))=0`. The spectral sequence therefore has only the Tor₀ and Tor₁ columns and gives (7.6.4). The adjacent-degree terms are retained, not collapsed (CK §7.6). (ČK (arXiv v3), §7.6, (7.6.1)–(7.6.2), p.69; ČK (arXiv v3), §7.6, (7.6.3), p.69; ČK (arXiv v3), §7.6, (7.6.4), p.69; ČK (arXiv v3), §7.6, top degree, p.69; ČK (arXiv v3), §5.42, p.58; BMS1 (Publ. IHÉS), Lemma 4.9(iii), p.269). *Needs:* *Semistable cohomological BKF modules* (§AI.6.7); *Semistable étale specialization* (§AI.6.6); *Log de Rham specialization* (§AI.6.3); *Global crystalline and Witt specializations* (§AI.6.4); *Perfectness of finitely presented A_inf modules* (§AI.2.1); *A_inf module structure theorem* (§AI.2.1); *Primitive rational crystalline Frobenius input* (§AI.5.1); *Length increase under Witt specialization* (§AI.5.2); *Rank and torsion-length comparison* (§AI.5.2); *Finite presentation and adjacent-degree freeness* (§AI.5.2); *p-local freeness from two period realizations* (§AI.2.1); *Cohomology finiteness from period realizations* (§AI.5.2).

**Checks.**

- `H_A^{i+1}[ξ]` and Tor₁ must appear explicitly when no adjacent freeness is assumed.
- If `𝔛_{k̄}` is purely d-dimensional, then in the top degree both error terms vanish: `H_A^{2d}⊗_{θ}O_C≃H_logdR^{2d}` and `H_A^{2d}⊗W(k̄)≃H_logcrys^{2d}`.

**One-degree semistable freeness criterion** (`Semistable.freenessCriterion`). For proper `𝔛` and fixed `i`, `H_logdR^i(𝔛/O_C)` is `O_C-free` iff `H_logcrys^i(𝔛_{k̄}/W(k̄))` is W(k̄)-free. Under either condition `H_A^i` is `A_inf-free` and `H_ét^i(X_C,ℤ_p)` is `ℤ_p-free`. This alone does not remove the adjacent-degree terms from *Degreewise semistable specialization sequences* (§AI.6.7).

Standing hypotheses (SS). Standing hypotheses (SS-prop); the proof does not use that the special fibre is equidimensional, which ČK §7.1 also assume.

By *Perfect semistable A_inf cohomology* (§AI.6.3) and *Semistable cohomological BKF modules* (§AI.6.7) (CK Theorem 7.4), `RΓ_Ainf(𝔛)` is a perfect complex all of whose cohomology modules are free after inverting p. BMS1 Lemma 4.18 (Layer AI.5) then says, for the fixed `i`, that `H^i(RΓ_Ainf(𝔛)⊗^L_{A_inf}W(k̄))` is p-torsion-free if and only if `H^i(RΓ_Ainf(𝔛)⊗^L_{A_inf}O_C)` is. By the specializations (7.2.1) (*Global crystalline and Witt specializations* (§AI.6.4), *Log de Rham specialization* (§AI.6.3)) these groups are `H_logcrys^i(𝔛_{k̄}/W(k̄))` and `H_logdR^i(𝔛/O_C)`. Both are finitely presented modules over valuation rings, so p-torsion-free is equivalent to free. When these conditions hold, BMS1 Corollary 4.17 (Layer AI.5; it uses BMS1 Proposition 4.13 and Lemma 4.16) gives that `H_A^i` is finite free and that `H_A^i⊗_{A_inf}W(C^♭)` is p-torsion-free; by (7.6.1), (7.6.2) of *Degreewise semistable specialization sequences* (§AI.6.7) this module is `H_ét^i(X_C,ℤ_p)⊗_{ℤ_p}W(C^♭)`, so `H_ét^i(X_C,ℤ_p)` is `ℤ_p-free`. No hypothesis on degree i+1 is used (CK Proposition 7.7). The last sentence of the statement is a caution, not part of CK Proposition 7.7: the terms `H_A^{i+1}[ξ]` and `Tor₁^{A_inf}(H_A^{i+1},W(k̄))` of *Degreewise semistable specialization sequences* (§AI.6.7) depend on degree i+1, and CK §7.6 notes that they vanish when `H_A^{i+1}` is `A_inf-free`. Alternative route for the equivalence, not used here (CK Remark 7.8): the derived reductions to k̄ of `RΓ_logdR(𝔛/O_C)` and `RΓ_logcrys(𝔛_{k̄}/W(k̄))` agree, the ranks agree by CK Corollary 7.5, and universal coefficients over the two valuation rings show by descending induction on the degree that the two modules have the same number of cyclic torsion summands. (ČK (arXiv v3), Proposition 7.7, p.70; ČK (arXiv v3), Proposition 7.7, proof, p.70; ČK (arXiv v3), §7.6, p.70; basis of the caution in the last sentence; ČK (arXiv v3), Remark 7.8, p.70; BMS1 (Publ. IHÉS), Lemma 4.18, p.274; BMS1 (Publ. IHÉS), Corollary 4.17, p.274). *Needs:* *Degreewise semistable specialization sequences* (§AI.6.7); *Semistable cohomological BKF modules* (§AI.6.7); *Perfect semistable A_inf cohomology* (§AI.6.3); *Log de Rham specialization* (§AI.6.3); *Global crystalline and Witt specializations* (§AI.6.4); *Perfectness of finitely presented A_inf modules* (§AI.2.1); *A_inf module structure theorem* (§AI.2.1); *Primitive rational crystalline Frobenius input* (§AI.5.1); *Length increase under Witt specialization* (§AI.5.2); *Rank and torsion-length comparison* (§AI.5.2); *Finite presentation and adjacent-degree freeness* (§AI.5.2); *p-local freeness from two period realizations* (§AI.2.1); *Cohomology finiteness from period realizations* (§AI.5.2).

**Checks.**

- For full degree-i specialization identities additionally impose the required adjacent-degree freeness.

**Semistable cohomology rank equality** (`Semistable.rankEquality`). For proper `𝔛`, the generic ranks of `H_A^i`, `H_ét^i(X_C,ℤ_p)`, `H_logdR^i` and `H_logcrys^i` over `A_inf`, `ℤ_p`, `O_C` and W(k̄), respectively, are equal. Rank is computed after the relevant fraction-field or p-inverted free specialization; it does not assert equality of torsion.

Standing hypotheses (SS). Standing hypotheses (SS-prop); the proof does not use that the special fibre is equidimensional, which ČK §7.1 also assume.

By *Semistable cohomological BKF modules* (§AI.6.7) (CK Theorem 7.4) every `H_A^j[1/p]` is finite free over `A_inf[1/p]`. Hence, after inverting `p`, each base change of the perfect complex `RΓ_Ainf(𝔛)` is computed degree by degree. The maps `θ`: `A_inf→O_C` and `A_inf→W(k̄)` are not flat; freeness of the `H_A^j[1/p]`, not flatness, is what is used. Apply this to the three specializations (7.2.1): *Semistable étale specialization* (§AI.6.6) (over `A_inf[1/μ]`), *Log de Rham specialization* (§AI.6.3) (along `θ`, CK (4.18.1)) and *Global crystalline and Witt specializations* (§AI.6.4) (over W(k̄), CK (5.43.2)). They give `H_ét^i(X_C,ℤ_p)⊗_{ℤ_p}A_inf[1/pμ]≃H_A^i[1/pμ]`, `H_logdR^i[1/p]≃H_A^i[1/p]⊗_{A_inf[1/p],θ}C` and `H_logcrys^i[1/p]≃H_A^i[1/p]⊗_{A_inf[1/p]}W(k̄)[1/p]`, so all the ranks equal the rank of the free `A_inf[1/p]-module H_A^i[1/p]` (CK Corollary 7.5). The rank of `H_A^i` itself is not in the statement of Corollary 7.5; it is in its proof. Finite presentation of `H_ét^i`, `H_logdR^i` and `H_logcrys^i`, needed to speak of their ranks, follows from the perfectness of `RΓ_Ainf(𝔛)`, (7.2.1) and the coherence of `O_C` (CK Corollary 7.5, proof). (ČK (arXiv v3), Corollary 7.5, p.69; ČK (arXiv v3), Corollary 7.5, proof, p.69; the proof uses Theorem 7.4 and (7.2.1) only; ČK (arXiv v3), §7.2, (7.2.1), p.68; the printed '(2.3)' is a misprint for (2.3.1)). *Needs:* *Semistable cohomological BKF modules* (§AI.6.7); *Semistable étale specialization* (§AI.6.6); *Log de Rham specialization* (§AI.6.3); *Global crystalline and Witt specializations* (§AI.6.4); *Perfectness of finitely presented A_inf modules* (§AI.2.1); *A_inf module structure theorem* (§AI.2.1); *Primitive rational crystalline Frobenius input* (§AI.5.1); *Length increase under Witt specialization* (§AI.5.2); *Rank and torsion-length comparison* (§AI.5.2); *Finite presentation and adjacent-degree freeness* (§AI.5.2); *p-local freeness from two period realizations* (§AI.2.1); *Cohomology finiteness from period realizations* (§AI.5.2).

**Checks.**

- A torsion summand changes lengths while leaving these ranks unchanged.

**Normalized length over a rank-one valuation ring**. For a rank-one mixed-characteristic valuation ring `V` with additive valuation `val(p)=1` and a finitely presented torsion V-module `M≃⊕_i V/(a_i)`, `a_i≠0`, define `val_V(M)=Σ_i val(a_i)`. Equivalently take the valuation of a generator of `Fitt_0(M)`. This is independent of presentation, additive on short exact sequences of finitely presented torsion modules, and invariant under valuation-preserving scalar extension. For `V` a DVR with `p` uniformizer it is ordinary module length. A free summand is outside this finite-length domain.

`V` rank one, characteristic zero, residue characteristic `p`; val is additive and normalized at p. `M` finitely presented and torsion; scalar extensions preserve the normalized valuation.

The API:

- `AInf.normalized_valuation_length.cyclic`: For nonzero `a∈V`, `val_V(V/(a))=val(a)`; if a is a unit this is zero.
- `AInf.normalized_valuation_length.exact`: An exact sequence `0→M_1→M_2→M_3→0` in the stated domain gives `val_V(M_2)=val_V(M_1)+val_V(M_3)`.
- `AInf.normalized_valuation_length.base_change`: For a valuation-preserving extension `V→V′`, `val_V′(M⊗V′)=val_V(M)`.
- `AInf.normalized_valuation_length.fitting`: If `Fitt_0(M)=(a)`, then `val_V(M)=val(a)`, so the definition is intrinsic.

Apply the elementary-divisor structure theorem over a valuation ring. Relate the product of the `a_i` to `Fitt_0(M)`. The Fitting-ideal multiplicativity theorem for these torsion presentations proves additivity; extending the diagonal presentation proves scalar-extension invariance. Both algebraic results are *Finitely presented modules over a valuation ring and their Fitting ideals* (§AI.1.3). (ČK (arXiv v3), §7.10 and (7.10.1)–(7.10.2), printed p.71). *Needs:* PerfectoidSpaces, P1; Mathlib `ValuationRing`; *Finitely presented modules over a valuation ring and their Fitting ideals* (§AI.1.3).

**Checks.**

- `normalized_valuation_length_zero`: The zero module has normalized length zero.
- `normalized_valuation_length_p_power`: `V/(p^n)` has normalized length `n`.
- `normalized_valuation_length_ramified`: If `π^e` is a unit multiple of `p`, `V/(π^a)` has normalized length a/e.
- `normalized_valuation_length_free`: The free rank-one V-module is not in the finitely presented torsion domain and has no finite normalized length assigned here.
- Use the same normalization on `O_C`, `W(C^♭)` and `ℤ_p`.
- An ordinary integer-valued composition length over nondiscrete `O_C` is not substituted.

**Finite-Witt valuation-length specialization identity** (`Semistable.witt_valuation_length`). For `n≥1` and `M` finitely presented over `W_n(O_C^♭)`, `val_{W(C^♭)}(M⊗_{A_inf}W(C^♭))=val_{O_C}(M/ξ M)−val_{O_C}(M[ξ])`. Both right-hand modules are finitely presented torsion modules. The target over `W(C^♭)` uses `p` normalized to one. This identity includes the `ξ-Tor` correction and underlies the semistable de Rham torsion inequalities.

Standing hypotheses (C). `M` finitely presented over the indicated finite Witt ring; all valuation lengths use *Normalized length over a rank-one valuation ring* (§AI.6.7).

Coherence gives finite presentation of the `ξ`-torsion. Both expressions are additive on finite-p-level short exact sequences by the snake lemma and normalized length. Reduce to `n=1` and a cyclic valuation-ring module. For the free cyclic module both sides are one; for a nonzero relation the localization vanishes and the Tor exact sequence cancels the two `O_C` lengths. (ČK (arXiv v3), Lemma 7.11 and proof, printed p.71). *Needs:* *Normalized length over a rank-one valuation ring* (§AI.6.7); *Coherence of Witt vectors of perfectoid integers* (§AI.0.3); *Finite-presentation devissage over Witt rings* (§AI.0.3); *Regularity of integral periods* (§AI.0.2); *Finitely presented modules over a valuation ring and their Fitting ideals* (§AI.1.3).

**Checks.**

- `M=O_C^♭` gives `1=val(O_C/p)−0`.
- Dropping `M[ξ]` would give a false formula for torsion cyclic modules.

**Étale cohomology over K̄ and over C**. For `X` proper smooth over a complete discretely valued field `K` of characteristic 0, the map `H^i_ét(X_{K̄}, ℤ_p) → H^i_ét(X_C^{ad}, ℤ_p)` is a `G_K`-equivariant isomorphism, and `RΓ_ét(X_C^{ad}, ℤ_p) ⊗^L ℤ/p^n ≅ RΓ_ét(X_C^{ad}, ℤ/p^n)`; likewise `RΓ_logcrys ⊗^L W_n(k̄)` and `RΓ_logdR ⊗^L O_C/p^n` compute the cohomology of the reductions for proper semistable `𝔛`.

`X` proper smooth over `K`; `𝔛` as in (SS-prop) for the last clause.

Invariance of étale cohomology under extension of algebraically closed base field for proper spaces (Huber), and the comparison of algebraic and analytic étale cohomology. The reductions are derived base change of perfect complexes. (ČK (arXiv v3), §8.5, (8.7.4), and the proofs of Theorems 7.9 and 7.12, printed pp.70–74). *Needs:* ClassicalAdicEtaleCohomology, §1.3 (*Descent and the étale–pro-étale comparison*); CrystallineCohomology, CR.3 (*Derived crystalline base change*); CrystallineCohomology, CR.3 (*Proper smooth crystalline perfectness and reductions*).

**Étale–log crystalline torsion inequalities** (`Semistable.crystallineTorsion`). For proper `𝔛`, all `i` and `n≥0`, `length_{ℤ_p}(H_ét^i(ℤ_p)_tors/p^n)≤length_{W(k̄)}(H_logcrys^i(W(k̄))_tors/p^n)`, and `length_{ℤ_p}H_ét^i(ℤ/p^n)≤length_{W(k̄)}H_logcrys^i(W_n(k̄))`. These are length inequalities, not a canonical injection or a subquotient assertion.

Standing hypotheses (SS). `𝔛` is as in CK §1.5 and proper over `O_C`. CK §7.1 also assumes that the special fibre `𝔛_{k̄}` is purely d-dimensional; the proof does not use this. The log crystalline cohomology of `𝔛_{k̄}` is taken over W(k̄), resp. `W_n(k̄)`, with the log structure of CK §5.42, as in *Degreewise semistable specialization sequences* (§AI.6.7).

By *Semistable cohomology rank equality* (§AI.6.7) (CK Corollary 7.5), `H_ét^i(X_C^ad,ℤ_p)` and `H_logcrys^i(𝔛_{k̄}/W(k̄))` have the same rank `r`; for a finitely generated module `H` over a discrete valuation ring with uniformizer `p`, `length(H/p^n)=nr+length(H_tors/p^n)`, so the torsion subscripts may be dropped. By *Semistable cohomological BKF modules* (§AI.6.7) (CK Theorem 7.4), `M=H_A^i` is finitely presented with M[1/p] free. BMS1 Corollary 4.15(ii) (Layer AI.5; deduced from BMS1 Lemma 4.14) gives `length((M⊗_{A_inf}W(C^♭))/p^n)≤length_{W(k̄)}((M⊗_{A_inf}W(k̄))/p^n)`, and by (7.6.2) of *Degreewise semistable specialization sequences* (§AI.6.7) the left side is `length_{ℤ_p}(H_ét^i(X_C^ad,ℤ_p)/p^n)`. This is (7.9.2). In the sequence (7.6.4) of *Degreewise semistable specialization sequences* (§AI.6.7), `0→M⊗W(k̄)→H_logcrys^i→Q→0`, the module `Q=Tor₁^{A_inf}(H_A^{i+1},W(k̄))` is finite and torsion. The exact sequence `Tor₁^{W(k̄)}(Q,W(k̄)/p^n)→(M⊗W(k̄))/p^n→H_logcrys^i/p^n→Q/p^n→0` and the equality `length(Q/p^n)=length(Tor₁^{W(k̄)}(Q,W(k̄)/p^n))` give `length((M⊗W(k̄))/p^n)≤length(H_logcrys^i/p^n)`. This proves the first inequality. Second inequality: the universal-coefficient sequences (Stacks Project 0662) `0→H^i/p^n→H^i(−,ℤ/p^n)`, resp. `H_logcrys^i(𝔛_{k̄}/W_n(k̄))`, `→H^{i+1}[p^n]→0` hold on both sides, and `length(T[p^n])=length(T/p^n)` for a torsion module `T` of finite length. So the second inequality follows from the first in degrees `i` and i+1 together with *Semistable cohomology rank equality* (§AI.6.7) (CK Theorem 7.9). The identification of the finite-coefficient groups with the derived reductions modulo `p^n` is *Étale cohomology over K̄ and over C* (§AI.6.7). (ČK (arXiv v3), Theorem 7.9, p.70; ČK (arXiv v3), Theorem 7.9, proof, p.70; ČK (arXiv v3), Theorem 7.9, end of proof, p.70; BMS1 (Publ. IHÉS), Corollary 4.15, p.272; BMS1 (Publ. IHÉS), Theorem 14.5(ii), p.393). *Needs:* *Degreewise semistable specialization sequences* (§AI.6.7); *Semistable cohomology rank equality* (§AI.6.7); *Semistable cohomological BKF modules* (§AI.6.7); *Perfectness of finitely presented A_inf modules* (§AI.2.1); *A_inf module structure theorem* (§AI.2.1); *Primitive rational crystalline Frobenius input* (§AI.5.1); *Length increase under Witt specialization* (§AI.5.2); *Rank and torsion-length comparison* (§AI.5.2); *Finite presentation and adjacent-degree freeness* (§AI.5.2); *p-local freeness from two period realizations* (§AI.2.1); *Cohomology finiteness from period realizations* (§AI.5.2); *Étale cohomology over K̄ and over C* (§AI.6.7).

**Checks.**

- At `n=1` distinguish torsion quotients from finite-coefficient cohomology.

**Étale–log de Rham torsion inequalities** (`Semistable.deRhamTorsion`). For proper `𝔛`, all `i` and `n≥0`, `v_{ℤ_p}(H_ét^i(ℤ_p)_tors/p^n)≤v_{O_C}(H_logdR^i(O_C)_tors/p^n)`, and `v_{ℤ_p}H_ét^i(ℤ/p^n)≤v_{O_C}H^i(𝔛_{O_C/p^n},Ω^•_{𝔛_{O_C/p^n}/(O_C/p^n),log})`, the logarithmic de Rham cohomology of the reduction of `𝔛` modulo `p^n`. Here `v(p)=1` and `v(⊕O_C/(a_j))=Σv(a_j)`; this normalized valuation length is not ordinary `O_C`-module length. Over `O_K` it is `length_{O_K}/length_{O_K}(O_K/p)`.

Standing hypotheses (SS). Standing hypotheses (SS-prop); the proof does not use that the special fibre is equidimensional, which ČK §7.1 also assume.

Use, from Layer AI.5, the normalized length of CK §7.10 for a valuation ring `𝔬` of rank 1 and mixed characteristic (0,p): finitely presented `𝔬`-modules are direct sums of cyclic modules (Stacks Project 0ASP; Gabber–Ramero, Almost ring theory, 6.1.14), `v_𝔬` of a finitely presented torsion module is the valuation of a generator of its zeroth Fitting ideal, and `v_𝔬` is additive in short exact sequences (Gabber–Ramero 6.3.1 and 6.3.5(i)). Use also CK Lemma 7.11: for a finitely presented `W_n(O_C^♭)-module M`, `v_{W(C^♭)}(M⊗_{A_inf}W(C^♭))=v_{O_C}(M/ξM)−v_{O_C}(M[ξ])`; its proof uses the coherence of `W_n(O_C^♭)` (BMS1 Proposition 3.24). By *Semistable cohomology rank equality* (§AI.6.7) (CK Corollary 7.5) the torsion subscripts may be dropped. By *Semistable cohomological BKF modules* (§AI.6.7) (CK Theorem 7.4), `M=H_A^i/p^n` is a finitely presented `W_n(O_C^♭)`-module; Lemma 7.11 and (7.6.2) of *Degreewise semistable specialization sequences* (§AI.6.7) give `v_{ℤ_p}(H_ét^i(X_C^ad,ℤ_p)/p^n)≤v_{O_C}(H_A^i/(p^n,ξ))`. In the sequence (7.6.3) of *Degreewise semistable specialization sequences* (§AI.6.7) the module `Q=H_A^{i+1}[ξ]` is finitely presented and torsion, and `v_{O_C}(Q/p^n)=v_{O_C}(Tor₁^{O_C}(Q,O_C/p^n))` by the presentation (7.10.1). Hence `v_{O_C}(H_A^i/(p^n,ξ))≤v_{O_C}(H_logdR^i(𝔛/O_C)/p^n)`, which proves the first inequality. The second inequality follows from the first in degrees `i` and i+1 by the universal-coefficient sequences (Stacks Project 0662), as in CK Theorem 7.9. Here `RΓ_logdR(𝔛/O_C)⊗^L_{O_C}O_C/p^n≃RΓ(𝔛_{O_C/p^n},Ω^•_log)` because `𝔛` is `O_C-flat` and the sheaves `Ω^j_{𝔛/O_C,log}` are locally free (CK Theorem 7.12). The proof is parallel to that of CK Theorem 7.9 and does not use its conclusion. The formula over `O_K` is not in CK. It follows from CK §7.10: for a discrete valuation ring `O_K` with `e=length_{O_K}(O_K/p)`, `v_{O_K}(O_K/π^m)=m/e`, and both `v_{O_K}` and length are additive. (ČK (arXiv v3), §7.10, p.71; ČK (arXiv v3), §7.10, Fitting ideal, p.71; ČK (arXiv v3), Lemma 7.11, p.71; ČK (arXiv v3), Theorem 7.12, p.71; ČK (arXiv v3), Theorem 7.12, proof, p.71; Theorem 7.9 is not used; BMS1 (Publ. IHÉS), Proposition 3.24, p.258). *Needs:* *Degreewise semistable specialization sequences* (§AI.6.7); *Semistable cohomology rank equality* (§AI.6.7); *Semistable cohomological BKF modules* (§AI.6.7); *Perfectness of finitely presented A_inf modules* (§AI.2.1); *A_inf module structure theorem* (§AI.2.1); *Primitive rational crystalline Frobenius input* (§AI.5.1); *Length increase under Witt specialization* (§AI.5.2); *Rank and torsion-length comparison* (§AI.5.2); *Finite presentation and adjacent-degree freeness* (§AI.5.2); *p-local freeness from two period realizations* (§AI.2.1); *Cohomology finiteness from period realizations* (§AI.5.2); *Normalized length over a rank-one valuation ring* (§AI.6.7); *Finite-Witt valuation-length specialization identity* (§AI.6.7); *Étale cohomology over K̄ and over C* (§AI.6.7).

**Checks.**

- For `O_K/(π)`, normalized length is 1/e, not 1 when `e>1`.

**The de Rham lattice attached to an étale lattice** (`Semistable.deRhamLatticeFunctor`). Let `K`, `C` and `G` be as in the hypotheses. (a) A Breuil–Kisin–Fargues G-module is a Breuil–Kisin–Fargues module `(M,φ_M)` (Layer AI.2) with an `A_inf-semilinear` G-action on `M` for which `φ_M` is G-equivariant; morphisms are the G-equivariant morphisms of Breuil–Kisin–Fargues modules. Its étale realization `M_ét=(M⊗_{A_inf}W(C^♭))^{φ_M⊗φ=1}` carries the induced `ℤ_p`-linear G-action. `(b)` (CK Proposition 8.4) The functor `(M,φ_M)↦(M_ét, M⊗_{A_inf}B_dR⁺)` is an equivalence from the category of `A_inf-free` Breuil–Kisin–Fargues G-modules to the category of pairs `(T,Ξ)`, where `T` is a finite free `ℤ_p`-module with a G-action and `Ξ⊂T⊗_{ℤ_p}B_dR` is a G-stable `B_dR⁺`-lattice. (c) Let `T` be a finite free `ℤ_p`-module with a continuous G-action such that T[1/p] is de Rham, and `D_dR(T)=(T⊗_{ℤ_p}B_dR)^G`, so that `T⊗_{ℤ_p}B_dR≃D_dR(T)⊗_K B_dR` G-equivariantly. Then `D_dR(T)⊗_K B_dR⁺` is a G-stable `B_dR⁺`-lattice in `T⊗_{ℤ_p}B_dR`, and M(T) is the `A_inf-free` Breuil–Kisin–Fargues G-module corresponding under `(b)` to the pair `(T, D_dR(T)⊗_K B_dR⁺)`. It depends functorially on `T`. `(d)` The de Rham realization `M(T)_dR=M(T)⊗_{A_inf,θ}O_C` is an `O_C`-lattice in `(M(T)⊗_{A_inf}B_dR⁺)/ξ≃(D_dR(T)⊗_K B_dR⁺)/ξ≃D_dR(T)⊗_K C`, and `L_dR(T)=(M(T)_dR)^G` is an `O_K`-lattice in the K-vector space `D_dR(T)`, functorial in `T`. `(e)` (CK Example 8.6) For `X` proper and smooth over `K`, a K-scheme or a rigid space over `K` viewed as an adic space, put `L^i_ét(X)=H^i_ét(X_{K̄},ℤ_p)/torsion≃H^i_ét(X_C,ℤ_p)/torsion` for `i≥0`. Then `L^i_ét(X)[1/p]` is de Rham and `D_dR(L^i_ét(X))≃H^i_dR(X/K)` by the de Rham comparison (6.7.2), functorially in `X` ((8.6.1)); `L^i_dR(X)=L_dR(L^i_ét(X))⊂H^i_dR(X/K)` is an `O_K`-lattice, functorial in `X`; and for a finite Galois extension K′/K, `L^i_dR(X)=(L^i_dR(X_{K′}))^{Gal(K′/K)}` inside `H^i_dR(X/K)=(H^i_dR(X_{K′}/K′))^{Gal(K′/K)}`. Continuity of the G-action on M(T) and the equality `L_dR(T)⊗_{O_K}O_C=M(T)_dR` are not asserted.

Standing hypotheses (SS). `K` is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀; `C` is the completion of K̄ and `G=Gal(K̄/K)` acts continuously on `C` and on `A_inf`; `φ` and `θ` are G-equivariant and the ideals `(ξ)`, `(φ(ξ))` and `(μ)` of `A_inf` are G-stable (CK §8.1). In (c) and `(d)`: `T` is a finite free `ℤ_p`-module with a continuous G-action whose rationalisation T[1/p] is a de Rham representation of `G` (CK §8.5). In `(e)`: `X` is proper and smooth over `K` (CK Example 8.6).

The API:

- `Semistable.deRhamLatticeFunctor.equivalence`: `(M,φ_M)↦(M_ét, M⊗_{A_inf}B_dR⁺)` is an equivalence between `A_inf-free` Breuil–Kisin–Fargues G-modules and pairs `(T,Ξ)` of a finite free `ℤ_p`-module with G-action and a G-stable `B_dR⁺-lattice Ξ⊂T⊗_{ℤ_p}B_dR`; morphisms of pairs are the G-equivariant `ℤ_p`-linear maps carrying `Ξ` into `Ξ′` (CK Proposition 8.4).
- `Semistable.deRhamLatticeFunctor.bkfModule`: For a finite free `ℤ_p-module T` with continuous G-action and T[1/p] de Rham, M(T) is the `A_inf-free` Breuil–Kisin–Fargues G-module corresponding to the pair `(T, D_dR(T)⊗_K B_dR⁺)`.
- `Semistable.deRhamLatticeFunctor.map`: A G-equivariant `ℤ_p`-linear map `f:T→T′` between such lattices induces a morphism `M(f):M(T)→M(T′)` of Breuil–Kisin–Fargues G-modules, with `M(id)=id` and `M(g∘f)=M(g)∘M(f)`; its étale realization is `f`.
- `Semistable.deRhamLatticeFunctor.etale_realization`: `M(T)_ét=(M(T)⊗_{A_inf}W(C^♭))^{φ⊗φ=1}` is identified with `T` G-equivariantly, and `M(T)⊗_{A_inf}A_inf[1/μ]≃T⊗_{ℤ_p}A_inf[1/μ]`.
- `Semistable.deRhamLatticeFunctor.bdr_lattice`: Inside `M(T)⊗_{A_inf}B_dR≃T⊗_{ℤ_p}B_dR` one has `M(T)⊗_{A_inf}B_dR⁺=D_dR(T)⊗_K B_dR⁺`. Conversely an `A_inf-free` Breuil–Kisin–Fargues G-module `M` with a G-equivariant isomorphism `M_ét≃T` under which `M⊗_{A_inf}B_dR⁺=D_dR(T)⊗_K B_dR⁺` is isomorphic to M(T) by a unique isomorphism inducing `M_ét≃T`.
- `Semistable.deRhamLatticeFunctor.deRhamRealization`: `M(T)_dR=M(T)⊗_{A_inf,θ}O_C` is a G-stable free `O_C`-module of rank `rank_{ℤ_p}T` and an `O_C`-lattice in `D_dR(T)⊗_K C`, through `(M(T)⊗_{A_inf}B_dR⁺)/ξ≃(D_dR(T)⊗_K B_dR⁺)/ξ≃D_dR(T)⊗_K C`.
- `Semistable.deRhamLatticeFunctor.lattice`: `L_dR(T)=(M(T)_dR)^G=M(T)_dR∩D_dR(T)` is a free `O_K`-module of rank `rank_{ℤ_p}T` with `L_dR(T)[1/p]=D_dR(T)`. CK assert this; the proof (`C^G=K, commensurability` with `L_0⊗_{O_K}O_C`, `O_C∩K=O_K`) is in the proof steps. One has `L_dR(T)⊗_{O_K}O_C⊂M(T)_dR`, and equality is not asserted.
- `Semistable.deRhamLatticeFunctor.lattice_map`: For a G-equivariant `ℤ_p`-linear map `f:T→T′`, the K-linear map `D_dR(f):D_dR(T)→D_dR(T′)` carries `L_dR(T)` into `L_dR(T′)`.
- `Semistable.deRhamLatticeFunctor.finite_extension`: For a finite Galois extension K′/K in K̄ and `G′=Gal(K̄/K′)`: `M(T|_{G′})` is M(T) with the action restricted to `G′`, `D_dR` for `G′` is `K′⊗_K D_dR(T)`, and `L_dR(T)=(L_dR(T|_{G′}))^{Gal(K′/K)}`. CK state this for `L^i_dR(X)` in Example 8.6; for general `T` it follows in the same way.
- `Semistable.deRhamLatticeFunctor.tate_twist`: `M(T(n))≃M(T){n}=M(T)⊗_{A_inf}A_inf{1}^{⊗n}` as Breuil–Kisin–Fargues G-modules, and `L_dR(T(n))=L_dR(T)·(t^{−n}⊗ε^{⊗n})` inside `D_dR(T(n))=D_dR(T)·(t^{−n}⊗ε^{⊗n})`, where `ε` is a basis of `ℤ_p(1)` and `t=log[ε]`; the element `t^{−n}⊗ε^{⊗n}` does not depend on `ε`. This is not in CK; it is derived in the proof steps.
- `Semistable.deRhamLatticeFunctor.geometric`: For `X` proper and smooth over `K` and `i≥0`, `L^i_ét(X)=H^i_ét(X_{K̄},ℤ_p)/torsion` is a lattice in a de Rham representation with `D_dR(L^i_ét(X))≃H^i_dR(X/K)` by (6.7.2), and `L^i_dR(X)=L_dR(L^i_ét(X))⊂H^i_dR(X/K)`; a morphism `X→Y` over `K` induces `H^i_dR(Y/K)→H^i_dR(X/K)` carrying `L^i_dR(Y)` into `L^i_dR(X)` (CK Example 8.6).

From Layer AI.2 (CK §8.2): for a Breuil–Kisin–Fargues module `M`, the étale realization `M_ét` is a finitely generated `ℤ_p`-module with `M⊗_{A_inf}W(C^♭)≃M_ét⊗_{ℤ_p}W(C^♭)` and `M⊗_{A_inf}A_inf[1/μ]≃M_ét⊗_{ℤ_p}A_inf[1/μ]` (BMS1 Lemma 4.26); hence `M⊗_{A_inf}B_dR≃M_ét⊗_{ℤ_p}B_dR`, and `M⊗_{A_inf}B_dR⁺` is a `B_dR⁺`-lattice in it because M[1/p] is free. Fargues’ theorem (BMS1 Theorem 4.28): `(M,φ_M)↦(M_ét, M⊗_{A_inf}B_dR⁺)` is an equivalence from `A_inf-free` Breuil–Kisin–Fargues modules to pairs `(T,Ξ)`. Equivariant form (CK §8.3, Proposition 8.4): `G` acts on `A_inf`, `W(C^♭)` and `B_dR⁺` compatibly with `φ` and `θ` (CK §8.1). A semilinear G-action on `M` commuting with `φ_M` is a compatible family of isomorphisms between `M` and its twists by the elements of `G`; Fargues’ equivalence is compatible with these twists by transport of structure, so it gives the equivalence with pairs carrying a G-action. CK’s proof is the one sentence that the claim follows from §8.2. Construction of M(T) (CK §8.5): `D_dR(T)` and the G-equivariant isomorphism `T⊗_{ℤ_p}B_dR≃D_dR(T)⊗_K B_dR` for de Rham T[1/p] come from *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5) in the geometric case (6.7.2); the formalism of de Rham representations is that of PadicPeriodRings, §§4.2–4.3). With the canonical G-equivariant map `K→B_dR⁺` of Layer AI.0:period-comparison, `D_dR(T)⊗_K B_dR⁺` is a G-stable `B_dR⁺`-lattice; define M(T) by Proposition 8.4. Functoriality: a G-equivariant `ℤ_p`-linear map `T→T′` induces `D_dR(T)→D_dR(T′)`, so it carries the lattice into the lattice and is a morphism of pairs. De Rham realization (CK §8.5): M(T) is `A_inf-free`, so `M(T)⊗_{A_inf,θ}O_C` is a free `O_C`-module and an `O_C`-lattice in `M(T)⊗_{A_inf,θ}C=(M(T)⊗_{A_inf}B_dR⁺)/ξ`; this is identified with `D_dR(T)⊗_K C` through `B_dR⁺/ξ=C` and `K→B_dR⁺→C`. All maps are G-equivariant because `θ` is G-equivariant and `(ξ)` is G-stable. `L_dR(T)` is an `O_K`-lattice. CK state the functorial `O_K`-lattice conclusion without an argument. Argument: `(D_dR(T)⊗_K C)^G=D_dR(T)` because `C^G=K` (Ax–Sen–Tate; PadicPeriodRings, §§1.2, 2 (*tateSen*: general-base fixed points)), so `L_dR(T)=M(T)_dR∩D_dR(T)`. Choose an `O_K-lattice L_0` of `D_dR(T)`. Two `O_C`-lattices of one finite-dimensional C-vector space are commensurable, so `p^N(L_0⊗_{O_K}O_C)⊂M(T)_dR⊂p^{−N}(L_0⊗_{O_K}O_C)` for some `N`, and `(L_0⊗_{O_K}O_C)∩D_dR(T)=L_0` because `O_C∩K=O_K`. Hence `p^N L_0⊂L_dR(T)⊂p^{−N}L_0`; as `O_K` is a discrete valuation ring, `L_dR(T)` is a free `O_K`-module of rank `dim_K D_dR(T)=rank_{ℤ_p}T`. The inclusion `L_dR(T)⊗_{O_K}O_C⊂M(T)_dR` can be strict (see the tests). Example 8.6: the de Rham comparison (6.7.2) for `X` proper and smooth over `K`, functorial in `X`, G-equivariant and compatible with filtrations, comes from *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5) (Scholze; BMS1 Theorem 13.1 and Remark 13.20). It shows that `L^i_ét(X)[1/p]` is de Rham and gives (8.6.1). Define `L^i_dR(X)=L_dR(L^i_ét(X))`; functoriality in `X` follows from that of (6.7.2) and of `T↦L_dR(T)`. The identification of the étale cohomology of `X_{K̄}` and of `X_C` is used as in CK. Finite Galois extensions: for K′/K finite Galois inside K̄ and `G′=Gal(K̄/K′)`, `D_dR` for `G′` is `K′⊗_K D_dR(T)` (Galois descent for K′/K), so the lattice `D_dR(T)⊗_K B_dR⁺` and the Breuil–Kisin–Fargues module M(T) are the same for `G` and for `G′`, the G′-action being the restriction. Taking invariants in two stages gives `L_dR(T)=(L_dR(T|_{G′}))^{Gal(K′/K)}`. CK state this consequence of the definition for `L^i_dR(X)`. Tate twists (not in CK; they follow from the above): the functor to pairs and `D_dR` on de Rham representations are compatible with tensor products, so `M(T⊗T′)≃M(T)⊗_{A_inf}M(T′)` by Proposition 8.4. For `T=ℤ_p(1)` with basis `ε` and `t=log[ε]`, `D_dR=K·(t^{−1}⊗ε)` and the lattice is `ξ^{−1}(ℤ_p(1)⊗B_dR⁺)`, which is the pair of `A_inf{1}=μ^{−1}(A_inf⊗ℤ_p(1))` (BMS1 Example 4.24 and the sentence after Remark 4.29; Layer AI.2). Hence `M(T(n))≃M(T){n}`. Since `t/μ=1−μ/2+μ²/3−…` in `B_dR⁺` and `θ(μ)=0`, the generator `μ^{−1}⊗ε` reduces to `t^{−1}⊗ε` in `D_dR(ℚ_p(1))⊗_K C`; so `L_dR(ℤ_p(1))=O_K·(t^{−1}⊗ε)`, and `L_dR(T(n))=L_dR(T)·(t^{−n}⊗ε^{⊗n})` because `t^{−n}⊗ε^{⊗n}` is G-invariant. (ČK (arXiv v3), §8.1, p.72; ČK (arXiv v3), §8.1, Galois action, p.72; ČK (arXiv v3), §8.2, étale realization, p.72; ČK (arXiv v3), §8.2, Fargues’ theorem, p.72; ČK (arXiv v3), §8.3, p.72; ČK (arXiv v3), Proposition 8.4, p.73; ČK (arXiv v3), Proposition 8.4, proof, p.73; ČK (arXiv v3), §8.5, hypotheses on `T`, p.73; ČK (arXiv v3), §8.5, M(T), p.73; ČK (arXiv v3), §8.5, de Rham realization, p.73; ČK (arXiv v3), §8.5, the `O_K`-lattice, p.73; no argument is given there; ČK (arXiv v3), Example 8.6, p.73; ČK (arXiv v3), Example 8.6, (8.6.1), p.73; ČK (arXiv v3), Example 8.6, finite Galois extensions, p.73; BMS1 (Publ. IHÉS), Lemma 4.26, p.278; BMS1 (Publ. IHÉS), Theorem 4.28, p.279; BMS1 (Publ. IHÉS), Example 4.24, p.276; BMS1 (Publ. IHÉS), §4.3, sentence after Remark 4.29, p.280). *Needs:* *Breuil–Kisin–Fargues module* (§AI.2.2); *Operations in valid BKF subcategories* (§AI.2.2); *Étale realization of BKF modules* (§AI.2.2); *Fargues classification of finite free BKF modules* (§AI.2.3); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Finite infinitesimal Tate thickenings* (§AI.6.5); *Infinitesimal envelope of a very small affinoid* (§AI.6.5); *Smooth lifts and envelope normal form* (§AI.6.5); *Embedding independence and de Rham reduction* (§AI.6.5); *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5); *Proper smooth spreading out for the deformation* (§AI.6.5); *Finite freeness of the canonical deformation* (§AI.6.5); *Canonical deformation-to-étale map* (§AI.6.5); *Canonical rational comparison and descended map agreement* (§AI.6.5); *Smooth integral and canonical deformation agreement* (§AI.6.5); *Comparison with rational period rings* (§AI.0:period-comparison.1); *Finite de Rham coefficient quotients and flatness* (§AI.0:period-comparison.1); *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); PadicPeriodRings, §§3, 4.1 (principal PD envelope and `A_cris→B_dR⁺`); PadicPeriodRings, §§1.5, 4.1 (*generalBasePeriodRings*: de Rham DVR and residue); PadicPeriodRings, §§1.5, 4.3 (canonical algebraic constants and the fixed embedding `K→B_dR⁺`); PadicPeriodRings, §§1.2, 2 (*tateSen*: general-base fixed points); PadicPeriodRings, §§1.4, 2 (*tateSen*: twists and continuous cohomology); PadicPeriodRings §2 (`tateSen_H0`, `tateSen_character`); *Étale cohomology over K̄ and over C* (§AI.6.7); PadicPeriodRings, §§4.2–4.3 (general-base invariant functors and de Rham predicate); PadicPeriodRings, §§4.2–4.3 (invariant comparison maps and regularity).

**Checks.**

- `Semistable.deRhamLatticeFunctor.trivial`: For `T=ℤ_p` with trivial action: `D_dR(T)=K`, the pair is `(ℤ_p,B_dR⁺)`, `M(T)=A_inf` with `φ` the Frobenius of `A_inf` and the natural G-action, `M(T)_dR=O_C⊂C`, and `L_dR(T)=(O_C)^G=O_K⊂K`.
- `Semistable.deRhamLatticeFunctor.cyclotomic`: For `T=ℤ_p(1)` with basis `ε` and `t=log[ε]`: `D_dR(T)=K·(t^{−1}⊗ε)`, the lattice is `ξ^{−1}(T⊗_{ℤ_p}B_dR⁺)`, `M(T)=A_inf{1}=μ^{−1}(A_inf⊗_{ℤ_p}ℤ_p(1))`, `M(T)_dR=O_C·(t^{−1}⊗ε)` because `θ(t/μ)=1`, and `L_dR(ℤ_p(1))=O_K·(t^{−1}⊗ε)`; dually `L_dR(ℤ_p(−1))=O_K·(t⊗ε^∨)`. The generator does not depend on the choice of `ε`. A definition using the lattice `T⊗_{ℤ_p}B_dR⁺` instead of `D_dR(T)⊗_K B_dR⁺` would give `M=A_inf⊗T` and no G-invariants at all.
- `Semistable.deRhamLatticeFunctor.ramified_quadratic`: Let `π` be a uniformizer of `K`, `K′=K(√π)` and `T=ℤ_p·e` with `G` acting through the quadratic character `η` of K′/K. Then `D_dR(T)=K·(√π⊗e)`, `D_dR(T)⊗_K B_dR⁺=T⊗_{ℤ_p}B_dR⁺` because `√π` is a unit of `B_dR⁺`, `M(T)=A_inf⊗_{ℤ_p}T` with the diagonal action, `M(T)_dR=O_C⊗T`, and `L_dR(T)=O_K·(√π⊗e)`. So `L_dR(T)⊗_{O_K}O_C=√π·M(T)_dR` is strictly smaller than `M(T)_dR`, and `L_dR(T)=(O_{K′}⊗T)^{Gal(K′/K)}` as the compatibility with K′/K predicts.
- `Semistable.deRhamLatticeFunctor.not_de_rham`: If T[1/p] is not de Rham then `dim_K(T⊗_{ℤ_p}B_dR)^G<rank_{ℤ_p}T`, so `D⊗_K B_dR⁺` is a `B_dR⁺`-lattice of `T⊗_{ℤ_p}B_dR` for no K-subspace `D` of `(T⊗_{ℤ_p}B_dR)^G`, and M(T) is not defined. Example: `K` contains the 2p-th roots of unity, `s∈ℤ_p` is not an integer and `T=ℤ_p(χ^s)` for the cyclotomic character `χ`; then `χ^{s+n}` has infinite image on inertia for every integer `n`, so `(T⊗_{ℤ_p}B_dR)^G=0` by the theorem of Tate and Sen on the invariants of `C(η)`.
- M(T) is determined up to unique isomorphism by three properties: it is an `A_inf-free` Breuil–Kisin–Fargues G-module, its étale realization is `T` G-equivariantly, and `M(T)⊗_{A_inf}B_dR⁺=D_dR(T)⊗_K B_dR⁺` inside `T⊗_{ℤ_p}B_dR`. This is the form in which CK Theorem 8.7 uses it.
- The lattice property of `L_dR(T)` is proved, not only asserted; the proof uses `C^G=K`.
- The construction is defined only when T[1/p] is de Rham, and `L_dR(T)⊗_{O_K}O_C=M(T)_dR` is not part of it: it fails for the ramified quadratic character of the tests.
- The pair uses the covariant `D_dR(T)=(T⊗_{ℤ_p}B_dR)^G` and the lattice `D_dR(T)⊗_K B_dR⁺`, and the de Rham realization is taken along `θ`, not along `θ̃=θ∘φ_A⁻¹`; with these conventions `L_dR(ℤ_p(1))=O_K·(t^{−1}⊗ε)`.

**Model-independent logarithmic de Rham lattice** (`Semistable.modelIndependentLattice`). Let `𝔛₀/O_K` be proper, flat, p-adic, with its divisorial log structure and with an étale cover by affines, each étale over Spf `O_K{t_0,…,t_d}/(t_0⋯t_r−π′)` for a nonzero nonunit `π′∈O_K`, where `d`, `r` and `π′` may depend on the affine. If `H_logdR^i(𝔛₀/O_K)` and `H_logdR^{i+1}(𝔛₀/O_K)` are both `O_K-free`, then `T=H_ét^i(X_C,ℤ_p)` is `ℤ_p-free`. Let M(T) and `L_dR(T)` be the Breuil–Kisin–Fargues `G_K`-module and the `O_K`-lattice of *The de Rham lattice attached to an étale lattice* (§AI.6.7), attached to the pair `(T, D_dR(T)⊗_K B_dR⁺⊂T⊗_{ℤ_p}B_dR)`, where `D_dR(T)=(T⊗_{ℤ_p}B_dR)^{G_K}` is identified with `H_dR^i(X_K/K)` by the de Rham comparison (6.7.2). Then M(T) identifies with `H_A^i(𝔛₀⊗̂O_C)` as a Breuil–Kisin–Fargues `G_K`-module, and `L_dR(T)=(M(T)⊗_{A_inf,θ}O_C)^{G_K}` equals `H_logdR^i(𝔛₀/O_K)` inside `H_dR^i(X_K/K)`; in the notation of *The de Rham lattice attached to an étale lattice* (§AI.6.7), `L^i_dR(X_K)=H_logdR^i(𝔛₀/O_K)`. Two models of the same generic fibre satisfying these hypotheses therefore give the same lattice.

Standing hypotheses (SS). `K` is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀; `C` is the completion of K̄ and `G_K=Gal(K̄/K)` acts continuously on `C` and on `A_inf` (CK §8.1). Both adjacent degrees `i` and i+1 are free; M(T) and `L_dR(T)` are those of *The de Rham lattice attached to an étale lattice* (§AI.6.7).

Working locally one may replace `t_i` by `t_i^{±1}` for `r<i≤d`, so `𝔛=𝔛₀⊗̂_{O_K}O_C` satisfies the chart hypotheses of CK §1.5. By the Grothendieck comparison theorem and flat base change (CK Remark 4.19; CR.5), `H_logdR^j(𝔛/O_C)≃H_logdR^j(𝔛₀/O_K)⊗_{O_K}O_C` for `j=i` and `j=i+1`, hence `H_logdR^j(𝔛₀/O_K)=(H_logdR^j(𝔛/O_C))^{G_K}` ((8.7.4)). The passage to invariants uses `(O_C)^{G_K}=O_K`, that is, the theorem of Ax–Sen–Tate `C^{G_K}=K` (PadicPeriodRings, §§1.2, 2 (*tateSen*: general-base fixed points), supplied in §2 for every `K` in these hypotheses), which CK do not cite. By *One-degree semistable freeness criterion* (§AI.6.7) (CK Proposition 7.7) in degrees `i` and i+1, `H_A^i(𝔛)` and `H_A^{i+1}(𝔛)` are `A_inf-free`; by *Semistable cohomological BKF modules* (§AI.6.7), with the semilinear action of `G_K` of aomega and its compatibility with Frobenius stated there, they are Breuil–Kisin–Fargues `G_K`-modules in the sense of *The de Rham lattice attached to an étale lattice* (§AI.6.7) (CK §§8.1, 8.3). By (7.6.2) of *Degreewise semistable specialization sequences* (§AI.6.7) and the Frobenius-compatibility and `G_K-equivariance` of *Semistable étale specialization* (§AI.6.6), the étale realization of `H_A^i(𝔛)` is `H_ét^i(X_C,ℤ_p)`, `G_K-equivariantly`; so `T` is `ℤ_p-free`. By *Étale and B_dR comparison agreement* (§AI.6.6) (CK Proposition 6.8), the `B_dR-base` change of this identification equals the composite of *Semistable B_dR⁺ comparison* (§AI.6.6) ((6.6.2)), *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5)’s identification (6.2.8) (BMS1 Remark 13.20) and the de Rham comparison (6.7.2). Hence the `B_dR⁺-lattice H_A^i(𝔛)⊗_{A_inf}B_dR⁺` of `T⊗_{ℤ_p}B_dR` is `D_dR(T)⊗_K B_dR⁺`, with `D_dR(T)≃H_dR^i(X_K/K)` ((8.6.1)). So `H_A^i(𝔛)` is an `A_inf-free` Breuil–Kisin–Fargues `G_K`-module with étale realization `T` and `B_dR⁺-lattice D_dR(T)⊗_K B_dR⁺`, and the characterisation of M(T) in *The de Rham lattice attached to an étale lattice* (§AI.6.7) (CK Proposition 8.4 and §8.5) gives `M(T)≃H_A^i(𝔛)`, which is (8.7.3). Under this identification, by the compatibility modulo `ξ` in *Semistable B_dR⁺ comparison* (§AI.6.6) (CK Theorem 6.6) and the sentence after (6.2.8), the identifications of `M(T)⊗_{A_inf,θ}C` and of `H_A^i(𝔛)⊗_{A_inf,θ}C` with `H_dR^i(X_C^ad/C)` agree. Since `H_A^{i+1}(𝔛)` is free, (7.6.3) gives `H_A^i(𝔛)⊗_{A_inf,θ}O_C=H_logdR^i(𝔛/O_C)` inside `H_dR^i(X_C^ad/C)`. Taking `G_K-invariants` and using the first step gives (8.7.2) (CK Theorem 8.7). Model independence: by *The de Rham lattice attached to an étale lattice* (§AI.6.7), `L_dR(T)=L^i_dR(X_K)` depends only on `T` with its `G_K-action`, hence only on the generic fibre (CK Example 8.6, (8.6.2)). (ČK (arXiv v3), Theorem 8.7, p.74; ČK (arXiv v3), Theorem 8.7, freeness hypothesis, p.74; `d`, `r` and `π` may vary with the chart; ČK (arXiv v3), §8.1, p.72; ČK (arXiv v3), Example 8.6, (8.6.2), p.73; ČK (arXiv v3), §8, introduction, p.72). *Needs:* *Degreewise semistable specialization sequences* (§AI.6.7); *One-degree semistable freeness criterion* (§AI.6.7); *Semistable cohomological BKF modules* (§AI.6.7); *Semistable étale specialization* (§AI.6.6); *Semistable B_dR⁺ comparison* (§AI.6.6); *Étale and B_dR comparison agreement* (§AI.6.6); *The de Rham lattice attached to an étale lattice* (§AI.6.7); CrystallineCohomology, CR.5; *Finite infinitesimal Tate thickenings* (§AI.6.5); *Infinitesimal envelope of a very small affinoid* (§AI.6.5); *Smooth lifts and envelope normal form* (§AI.6.5); *Embedding independence and de Rham reduction* (§AI.6.5); *Canonical B_dR⁺ cohomology of the generic fibre* (§AI.6.5); *Proper smooth spreading out for the deformation* (§AI.6.5); *Finite freeness of the canonical deformation* (§AI.6.5); *Canonical deformation-to-étale map* (§AI.6.5); *Canonical rational comparison and descended map agreement* (§AI.6.5); *Smooth integral and canonical deformation agreement* (§AI.6.5); *Semistable AΩ complex* (§AI.6.2); PadicPeriodRings, §§1.2, 2 (*tateSen*: general-base fixed points); *Finiteness and base change for proper formal schemes over O_C* (§AI.6.3); PadicPeriodRings §2 (`tateSen_H0`, `tateSen_character`); *Étale cohomology over K̄ and over C* (§AI.6.7).

**Checks.**

- Model independence is not asserted for arbitrary torsion models or for arbitrary torsion-free quotients.

**Log differentials of a semistable curve**. For a proper flat semistable curve 𝒞 over `O_K` with smooth generic fibre, the sheaf `Ω¹_log` of 𝒞 relative to `O_K` with the standard log structures is invertible and isomorphic to the relative dualizing sheaf `ω_{𝒞/O_K}`; for a special fibre with two smooth rational components meeting in one node, the normalization sequence 0 `→ O_{𝒞_k} → O_{P¹} ⊕ O_{P¹} → k →` 0 gives `H⁰(O) = k`, `H¹(O) =` 0.

𝒞 proper flat semistable over `O_K`; the special fibre as stated for the second clause.

Locally at a node xy `= π`, `Ω¹_log` is generated by dlog `x =` −dlog `y`, and `ω` is generated by the residue form dx/x; at smooth points both are `Ω¹`. The normalization sequence of the special fibre and `H⁰`, `H¹` of `P¹` give the cohomology; cohomology and base change lift it to `O_K`. (Stacks, Stacks Project, Section 53.19 (Tag 0C46, nodal curves) and Lemma 53.4.6 (Tag 0E34, dualizing sheaves of reduced Gorenstein curves and their components); ČK (arXiv v3), §1.5, (1.5.3), printed p.4). *Needs:* SchemeAndStackFoundations, §§2.20, 3.3 (`cm_serre_duality`, `curve_serre_duality_ext_hom`); SchemeAndStackFoundations, §2.18 (`torIndependent_baseChange`); CrystallineCohomology, CR.5 (*Semistable chart differential formula*).

**Nodal conic and good reduction model test** (`Semistable.nodalConic`). For a uniformizer `π` of `O_K`, the proper conic `𝔛₀=Proj O_K[X,Y,Z]/(XY−πZ²)`, p-adically completed, is flat and semistable. Its special fibre is two projective lines meeting at one node; its generic fibre is a smooth rational curve. The log de Rham groups are `O_K,0,O_K` in degrees 0,1,2 and zero otherwise. Its `A_inf` groups are `A_inf,0,A_inf{−1}`, with the corresponding logarithmic/Witt specializations. The degree-0 and degree-2 lattices agree with a smooth `P¹` model under a fixed generic-fibre identification, by *Model-independent logarithmic de Rham lattice* (§AI.6.7). This nodal genus-zero example has `N=0`; the separate rank-two monodromy algebra test does not claim to be its `H¹`.

Standing hypotheses (SS). `K` is a complete discretely valued field of mixed characteristic (0,p) with perfect residue field k₀, `π` is a uniformizer of `O_K` and `C` is the completion of K̄ (CK §8.1), as *Model-independent logarithmic de Rham lattice* (§AI.6.7) requires.

Check the node chart `x y=π` on `Z≠0` and the two smooth charts at infinity using chart-ring/divisorial-log. Compute the log de Rham cohomology directly. `Ω¹_log` of `𝔛₀` over `O_K` is an invertible sheaf, generated at the node by dlog `x=−dlog y` and on the two smooth charts by the differential of the coordinate; it is the relative dualizing sheaf `ω` (CR.5). The special fibre is the union of two lines L₁, L₂ over k₀ meeting in one point: the sequence `0→O→O_{L₁}⊕O_{L₂}→k₀→0` gives `H⁰(O)=k₀` and `H¹(O)=0`, and `ω` restricts to O(−1) on each line, so `H⁰(ω)=0` and, by duality, `H¹(ω)=k₀`. The generic fibre is `P¹_K` and has the same dimensions, so by cohomology and base change for the proper flat curve `H⁰(O)=O_K`, `H¹(O)=0`, `H⁰(ω)=0` and `H¹(ω)≅O_K`. The Hodge–de Rham spectral sequence then has `E₁^{0,1}=E₁^{1,0}=0`, and the log de Rham groups are `O_K`, 0, `O_K` in degrees 0, 1, 2. The inputs of this step are *Log differentials of a semistable curve* (§AI.6.7) and Serre duality for curves (SchemeAndStackFoundations, §§2.20, 3.3). Apply *One-degree semistable freeness criterion* (§AI.6.7) and *Degreewise semistable specialization sequences* (§AI.6.7) for the freeness and the ranks of the `A_inf` groups. Apply *Model-independent logarithmic de Rham lattice* (§AI.6.7), (8.7.3), in degrees 0 and 2, and the cases `M(ℤ_p)=A_inf` and `M(ℤ_p(−1))=A_inf{−1}` of *The de Rham lattice attached to an étale lattice* (§AI.6.7) (its trivial and Tate-twist computations; `A_inf{−1}` is Layer AI.2’s Tate twist) to identify the Breuil–Kisin–Fargues structures; degree 3 vanishes, so the hypothesis on degree i+1 holds for `i=2`. The common lattices are `L⁰_dR(P¹_K)=O_K` and `L²_dR(P¹_K)=L_dR(ℤ_p(−1))=O_K·(t⊗ε^∨)`. (ČK (arXiv v3), §1.5, (1.5.1), p.4; the example itself is not in CK; ČK (arXiv v3), §1.5, (1.5.3), p.4; ČK (arXiv v3), Proposition 7.7, p.70; applied to this example; ČK (arXiv v3), Theorem 8.7, p.74; BMS1 (Publ. IHÉS), §4.3, sentence after Remark 4.29, p.280). *Needs:* *Standard semistable chart ring* (§AI.6.1); *Divisorial semistable log structure* (§AI.6.1); *Degreewise semistable specialization sequences* (§AI.6.7); *One-degree semistable freeness criterion* (§AI.6.7); *Model-independent logarithmic de Rham lattice* (§AI.6.7); *The de Rham lattice attached to an étale lattice* (§AI.6.7); *Breuil–Kisin–Fargues module* (§AI.2.2); *Operations in valid BKF subcategories* (§AI.2.2); *Étale realization of BKF modules* (§AI.2.2); *Fargues classification of finite free BKF modules* (§AI.2.3); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); CrystallineCohomology, CR.5; *Log differentials of a semistable curve* (§AI.6.7).

**Checks.**

- The `H¹` group is zero despite the special-fibre node; no nonzero monodromy is inferred merely from singular reduction.

### Examples

The nodal conic `XY = πZ²` (see *Worked examples*): logarithmic de Rham cohomology `O_K, 0, O_K`,
`A_inf`-cohomology `A_inf, 0, A_inf{−1}`, and the same lattices as a smooth model of `P¹`.

### Dependencies

Earlier layers: AI.0, AI.0:integral, AI.0:period-comparison, AI.1, AI.2, AI.3, AI.4, AI.5. Other roadmaps: AdicEtaleGeometry A1, AdicSpacesPartIII F0, AdicSpacesPartII R0, AdicSpacesPartIII R2, AdicSpacesPartIII R3, ClassicalAdicEtaleCohomology §1.3, ClassicalAdicEtaleCohomology §4.7, DerivedDeRhamCohomology §§PD.6–PD.7, CrystallineCohomology CR.1, CrystallineCohomology CR.3, CrystallineCohomology CR.5, CrystallineCohomology CR.5:log-algebra, CrystallineCohomology CR.6, DerivedModuleAlgebra §§1.1–1.9, DerivedDeRhamCohomology §§1.14–1.22, EnhancedDerivedSheaves E1, EnhancedDerivedSheaves E2, EnhancedDerivedSheaves E4, EnhancedDerivedSheaves E5:abstract, PadicPeriodRings §§1.1–1.5, 2–4, PerfectoidQuotients §§0.3, 0.5, PerfectoidSpaces P1, PerfectoidSpaces P3, PerfectoidSpaces P4, SchemeAndStackFoundations §§0.6, 0.9, SchemeAndStackFoundations §§4.3–4.4, SchemeAndStackFoundations §2.18, SchemeAndStackFoundations §§2.20, 3.3. Mathlib: `AdicCompletion`, `AdicCompletion.evalₐ`, `AdicCompletion.evalₐ_of`, `AdicCompletion.isAdicComplete`, `AdicCompletion.liftRingHom`, `Algebra.Etale`, `Finset.max'`, `Ideal.Quotient.mk`, `IsAdicComplete.liftRingHom`, `MvPolynomial`, `MvPolynomial.pderiv`, `ValuationRing`.

## Layer AI.7: Breuil–Kisin cohomology and relative traces

This layer descends `A_inf`-cohomology of a smooth formal `O_K`-scheme to `𝔖`. It fixes the
Frobenius-shifted Breuil–Kisin coefficient maps first; then builds relative topological
Hochschild homology over `𝕊[z]` and the Frobenius-twisted trace complex, inverts the degree-two
Bott class and descends along Frobenius, and obtains Breuil–Kisin cohomology from that descent. The Nygaard filtration of the twisted complex does not descend; this is a
theorem of the layer.

### AI.7.1 Breuil–Kisin coefficients

**Cohomological Breuil–Kisin coefficient maps** (`CohomologicalBK.coefficientNormalization`). On the R07.4 coefficient ring `𝔖=W(k₀)[[u]]`, use transported aliases of FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.16's `kisinPeriodScalarMaps`: `g=ι₀`, `f=ι₁=φ_A∘g=g∘φ_𝔖`, `constantCoeff=ε₀` and `c=ε₁=φ_W∘constantCoeff`. Here `𝔖^(−1)` is the copy of `𝔖` regarded as an `𝔖`-algebra through `φ_𝔖`, and `g:𝔖^(−1)→A_inf` is `ι₀` transported to that source copy. Thus `g` is W(k₀)-linear with `u↦[π^♭]`, while `f:𝔖→A_inf` uses `φ_W` on coefficients and sends `u↦[π^♭]^p`. The kernel assertions `g(E)A_inf=(ξ)` and `f(E)A_inf=(ξ̃)` are imported from the same interface. Fix the local names `θ̃_𝔖:𝔖→O_K` for the W(k₀)-linear evaluation `u↦π` and `θ_𝔖=θ̃_𝔖∘φ_𝔖`, with `u↦π^p`. Then `θ̃_A∘f=θ̃_𝔖`, `θ_A∘f=θ_𝔖`, `θ_A∘g=θ̃_𝔖` and `c∘φ_𝔖=φ_W∘c`. R07.4.1 calls the evaluation `u↦π` its `θ_𝔖`; this is the present `θ̃_𝔖`. This target fixes the cohomological naming and specialization compatibilities of the supplied maps. The variable `u` is `T` in BMS1 and `z` in BMS2; BMS2 writes `θ^(−1)` for the evaluation on `𝔖^(−1)`.

Standing hypotheses (BK).

The API:

- `CohomologicalBK.coefficientNormalization.frobenius`: For any coefficient endomorphism `F` and `p>0`, the power-series map is `Σa_nu^n↦ΣF(a_n)u^{pn}`; it sends C(a) to C(F(a)) and `u` to `u^p`.
- `CohomologicalBK.coefficientNormalization.theta`: `θ̃_A∘f=θ̃_𝔖` and `θ_A∘f=θ_𝔖` as maps `𝔖→O_C` (through `O_K⊂O_C`), and `θ_A∘g=θ̃_𝔖`; `θ_𝔖(u)=π^p` whereas `θ̃_𝔖(u)=π`.
- `CohomologicalBK.coefficientNormalization.crystalline`: The normalized residue map is F∘constantCoeff: `C(a)↦F(a)`, `u↦0`, and `c∘φ_𝔖=φ_W∘c`.
- `CohomologicalBK.coefficientNormalization.eisenstein`: the transported R07.4.16 kernel statements give `f(E)A_inf=(ξ̃)` and `g(E)A_inf=(ξ)`.

Transport the scalar maps and their Eisenstein-kernel identities from R07.4.16. On coefficients and on `u`, the supplied maps give `θ̃_A(f(a))=a`, `θ̃_A(f(u))=π`, `θ_A(f(a))=φ_W(a)` and `θ_A(f(u))=π^p`; these identify the cohomological `θ_𝔖/θ̃_𝔖` specializations. The residue identity follows from `c(φ_𝔖(Σa_nu^n))=φ_W²(a_0)=φ_W(c(Σa_nu^n))`. The generic power-series calculations use Mathlib's coefficient map, substitution and constant coefficient. (BMS1 (Publ. IHÉS), §4.4, first paragraph, pp.280–281; BMS1 (Publ. IHÉS), Remark 3.11, p.250; BMS2 (Publ. IHÉS), §1.1, p.200; BMS2 (Publ. IHÉS), Notation 11.1, p.298; BMS2 (Publ. IHÉS), §11.2, first two paragraphs, p.302; BMS2 (Publ. IHÉS), §11.2, second paragraph, p.302; BMS2 (Publ. IHÉS), Theorem 1.2(3), p.201). *Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4.1 (*The Breuil–Kisin coefficient rings 𝔖, 𝒪_ℰ, 𝔖^ur, 𝒪 and S*); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4.16 (`kisinPeriodScalarMaps`); *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); Mathlib `PowerSeries.map`; Mathlib `PowerSeries.substAlgHom`; Mathlib `PowerSeries.constantCoeff`; Mathlib `WittVector.frobenius`; Mathlib `PowerSeries`; Mathlib `WittVector`; Mathlib `PowerSeries.expand`; Mathlib `PowerSeries.HasSubst.X_pow`; Mathlib `PowerSeries.coeff_subst_X_pow`; Mathlib `PowerSeries.constantCoeff_subst_X_pow`; Mathlib `PowerSeries.substAlgHom_X`; Mathlib `WittVector.frobeniusEquiv`; Mathlib `WittVector.fontaineTheta`; Mathlib `PreTilt`; Mathlib `PreTilt.untilt`; Mathlib `WittVector.teichmuller`; Mathlib `WittVector.map`.

**Checks.**

- `CohomologicalBK.coefficientNormalization.variable`: At `p=2`, the map with coefficient identity sends `u` to `u²`.
- `CohomologicalBK.coefficientNormalization.twisted_constant`: For an arbitrary coefficient endomorphism `F`, the normalized residue of C(a) is F(a); for `k₀=F_{p²}`, `F=φ_W` and `a=[ζ]` with `ζ∉𝔽_p` this is `[ζ^p]`, which differs from a.
- `CohomologicalBK.coefficientNormalization.constant_identity`: At `F=id`, c is exactly Mathlib PowerSeries.constantCoeff.
- `CohomologicalBK.coefficientNormalization.nonsurjective`: Over `Z` with `p=2`, the coefficient of `u` in every image of `φ` is zero, so `u` is not an image.
- On `k₀=F_{p²}`, c on a Teichmüller coefficient is `[a^p]`, which differs from [a] for `a∉𝔽_p`. A multiplicative generator of `𝔽₄` has `a²≠a`, distinguishing the residue map from its Frobenius composite and the crystalline constant map from evaluation with identity coefficients.
- `φ_𝔖` is an endomorphism and is not surjective onto `u`.

**Flat Breuil–Kisin to A_inf extension** (`CohomologicalBK.flatCoefficientExtension`). The normalized map `f:𝔖→A_inf` is flat (BMS1 Lemma 4.30). It is moreover faithfully flat and topologically free: `A_inf` is isomorphic as an `𝔖`-module to the (p,u)-adic completion of a free `𝔖`-module, with 1 part of a topological basis, so that `f` has an `𝔖`-linear retraction. These two properties are asserted in BMS2 Notation 11.1, with a reference to Lemma 4.30 and its proof, and are proved here. In particular `M⊗^L_𝔖 A_inf` is concentrated in degree 0 for every `𝔖-module M`. Detection: a map that becomes zero, respectively an equivalence, after extension along `f` is zero, respectively an equivalence, in each of three domains: maps of `𝔖`-modules with the ordinary tensor product; maps of perfect complexes of `𝔖`-modules with the derived tensor product; maps of derived (p,u)-complete complexes with the (p,u)-completed derived tensor product. The same holds for `g=φ_A^{-1}∘f`. Finally `f` is p-completely faithfully flat and the p-completed tensor powers of `A_inf` over `𝔖` are flat over `𝔖` (BMS1 Remark 4.31), so the Čech descent of complete-flat-descent applies to derived p-complete `𝔖-complexes`, with the p-completed Čech nerve of `f`.

Standing hypotheses (BK).

Flatness is BMS1 Lemma 4.30: by approximation one may take `M` finitely generated; finite modules over the regular noetherian ring `𝔖` (FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4 (*The Breuil–Kisin coefficient rings 𝔖, 𝒪_ℰ, 𝔖^ur, 𝒪 and S*)) are perfect; Artin–Rees reduces p-complete flatness to the DVR map `k₀[[u]]→O_C^♭`, which is torsion-free. Faithful flatness (asserted in BMS2 Notation 11.1, not proved in the sources): `f` is a local homomorphism of local rings (`A_inf` is local; Layer AI.0:integral), since `f(p)=p` and `f(u)=[π^♭]^p` lie in the maximal ideal of `A_inf`, and a flat local homomorphism is faithfully flat. Topological freeness (asserted in BMS2 Notation 11.1 and used in the proof of BMS2 Corollary 11.12(4) and in Remark 11.17; not proved in the sources): (p,u) is a regular sequence in `𝔖`, and `(p,[π^♭]^p)` is a regular sequence in `A_inf`, which is `(p,[π^♭])`-adically complete. Choose a basis `(e_i)_{i∈I}` of `A_inf/(p,[π^♭]^p)` over k₀, acting through `f`, with `e_{i₀}` the class of 1, and lifts `ẽ_i∈A_inf` with `ẽ_{i₀}=1`. The induced map from the (p,u)-adic completion of `⊕_I𝔖` to `A_inf` is an isomorphism modulo (p,u); both sides are derived (p,u)-complete and (p,u) is a regular sequence on them, so the map is an isomorphism by derived Nakayama (mod-ideal-detection). The coordinate at i₀ is an `𝔖`-linear retraction of `f`. Detection (not in the sources): for modules use faithful flatness; for perfect complexes use `Hom_{D(𝔖)}(P,Q)⊗_𝔖A_inf=Hom_{D(A_inf)}(P⊗^LA_inf,Q⊗^LA_inf)` and faithful flatness; for a derived (p,u)-complete complex `N` the retraction of the previous step makes `N` a retract of `N⊗̂^L_𝔖A_inf`, naturally in `N`, so a map killed by the extension is zero and a cone killed by it is zero. For `g` use that `φ_A` is an automorphism of `A_inf`. p-complete descent: `A_inf⊗^L_𝔖𝔖/p=O_C^♭` is faithfully flat over k₀[[u]] by the first two steps, and `𝔖`, `A_inf` are p-adically complete and p-torsion-free; these are the hypotheses of complete-flat-descent. The p-completed tensor powers of `A_inf` over `𝔖` are p-adically complete, p-torsion-free and flat over k₀[[u]] modulo `p`, hence flat over the noetherian ring `𝔖` by BMS1 Remark 4.31. (BMS1 (Publ. IHÉS), Lemma 4.30, p.281; the lemma states flatness only; BMS1 (Publ. IHÉS), Lemma 4.30, proof, p.281; BMS1 (Publ. IHÉS), Remark 4.31, p.281; BMS2 (Publ. IHÉS), Notation 11.1, p.298; faithful flatness and topological freeness are proved above; BMS2 (Publ. IHÉS), Corollary 11.12, proof of part (4), p.305). *Needs:* *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); EnhancedDerivedSheaves, E4 (*Equivalences detected modulo the ideal*); DerivedModuleAlgebra, §1.9 (*Complete faithful-flat module descent*); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4 (*The Breuil–Kisin coefficient rings 𝔖, 𝒪_ℰ, 𝔖^ur, 𝒪 and S*); *Cyclotomic period elements* (§AI.0.1); *Regularity of integral periods* (§AI.0.2); *Finite Witt coefficient maps* (§AI.0.2); *Flat cyclotomic power-series specialization* (§AI.0.2); *Witt residue specialization* (§AI.0:integral.1); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Regularity of affinoid perfectoid coefficients* (§AI.0:integral.2); Mathlib `Module.FaithfullyFlat.zero_iff_lTensor_zero`; Mathlib `Module.FaithfullyFlat.lTensor_bijective_iff_bijective`.

**Checks.**

- For `M=𝔖/(p,u)=k₀` the derived tensor product `M⊗^L_𝔖A_inf` is `A_inf/(p,[π^♭]^p)` in degree 0: the higher Tor groups vanish because `(p,[π^♭]^p)` is a regular sequence in `A_inf`.
- The retraction `A_inf→𝔖` is only `𝔖`-linear: there is no ring homomorphism `A_inf→𝔖` retracting `f`, since modulo `p` it would make `u=f(u)` the p-th power of the image of `π^♭` in k₀[[u]].

**Finite freeness of the Breuil–Kisin Frobenius**. For a ring `R` and an endomorphism `F` of `R` that is an automorphism (for example the Witt Frobenius of W(k₀)), the map `φ_𝔖` : R[[u]] `→` R[[u]], `F` on coefficients and `u ↦ u^p`, makes R[[u]] a free module of rank `p` over itself with basis 1, `u`, …, `u^{p−1}`.

`R` a ring, `F` an automorphism of `R`, `p ≥` 1.

Every power series is uniquely `Σ_{j<p} u^j φ_𝔖(f_j)`, grouping exponents by residue modulo `p` and using that `F` is bijective on coefficients. (BMS1 (arXiv v3), Definition 4.1 and Proposition 4.3, printed pp.31–32). *Needs:* *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1); Mathlib `PowerSeries`.

Equivalently, every series has a unique expansion `Σ_{j<p} u^j φ_𝔖(f_j)`, for an arbitrary coefficient automorphism.

**Checks.**

- At `p=1` the basis consists of `1` and the map is the coefficient automorphism.
- For `p≥2` over a nonzero `R`, the image has zero coefficient at `u`, so `u` lies outside it even though it is a basis element over it.
- Without bijectivity of `F`, existence or uniqueness can fail already on constant coefficients.

### AI.7.2 Relative cyclotomic traces

**Circle actions, homotopy fixed points and Tate constructions** (`AInf.Trace.tate`). In spectra (Sp), for a spectrum `X` with an action of the circle `𝕋`, define `X^{h𝕋}`, `X_{h𝕋}` and the Tate construction `X^{t𝕋}` as the cofibre of the norm map `Σ X_{h𝕋} → X^{h𝕋}`; for finite groups use the Borel norm and Tate functor of BordismFormalGroups §F6.5, transported to (Sp) by EnhancedDerivedSheaves E5:spectra-comparison. The local name `AInf.Trace.tateFinite` is the supplied functor for `C_p ⊂ 𝕋`, retaining its residual `𝕋/C_p` action. Homotopy fixed points and the Tate constructions are lax symmetric monoidal, including the fixed-point-to-Tate natural transformations; homotopy orbits are the spectral colimit entering the norm triangle. On `E∞`-algebras with circle action, `X^{t𝕋}` receives the canonical map can : `X^{h𝕋} → X^{t𝕋}`, and there are homotopy fixed point and Tate spectral sequences. For bounded-below `X` their `E_2` terms are respectively `H^{−s}(B𝕋,π_tX)` and `Ĥ^{−s}(𝕋,π_tX)=π_tX[t^{±1}]`, with `|t|=(−2,0)`, while the fixed-point term has only nonpositive even `s`. Both abut conditionally to the corresponding `π_{s+t}`; any stronger convergence assertion requires the completeness hypotheses checked in the coefficient calculations below. For `E∞`-algebras these spectral sequences are multiplicative.

For every bounded-below circle spectrum `X`, construct the natural comparison
`X^{t𝕋}→(X^{tC_p})^{h(𝕋/C_p)}` and prove that it exhibits the target as the p-completion
of the source. Thus `(X^{t𝕋})^∧_p≃(X^{tC_p})^{h(𝕋/C_p)}`. It is an equivalence of
lax symmetric monoidal functors on bounded-below inputs and carries circle `can` to the
map obtained by taking residual-circle fixed points of finite `can`. The isomorphism
`𝕋/C_p≅𝕋` is `[t]↦t^p`; the residual action is retained before this transport.

Standing hypotheses (Sp).

The API:

- `AInf.Trace.homotopyFixed`: `X ↦ X^{h𝕋}`, lax symmetric monoidal.
- `AInf.Trace.tate`: `X ↦ X^{t𝕋}` as the cofibre of the norm, lax symmetric monoidal, with can : `X^{h𝕋} → X^{t𝕋}`.
- `AInf.Trace.tateFinite`: the transported alias of BordismFormalGroups §F6.5's finite Tate functor for `C_p`, with its product, `can` and residual action.
- `AInf.Trace.tateOrbit`: for bounded-below `C_{p²}`-spectra, `(X_{hC_p})^{t(C_{p²}/C_p)}≃0`.
- `AInf.Trace.completedTateComparison`: `(X^{t𝕋})^∧_p≃(X^{tC_p})^{h(𝕋/C_p)}` on bounded-below circle spectra, naturally, multiplicatively and compatibly with `can`.
- `AInf.Trace.spectralSequence`: the multiplicative homotopy fixed point and Tate spectral sequences.

Transport the supplied finite-group norms and coherent products through the symmetric monoidal spectral comparison. For the circle use its dualizing spectrum to construct the shifted norm; the induced-object tensor-ideal argument gives the coherent Tate product and `can`. The cellular filtration gives the spectral sequences. Prove the Tate-orbit lemma by Postnikov truncation and the Eilenberg–Mac Lane calculation. It identifies finite-stage `X^{tC_{p^n}}` with `(X^{tC_p})^{h(C_{p^n}/C_p)}`. Pass to the p-power subgroup tower and prove that the circle-to-tower map is p-completion; the norm diagrams and lax monoidal refinements give compatibility with `can` and products. (BMS2 (Publ. IHÉS), §2.3, p.216; NS, Lemma I.2.1, pp.13–18, Theorem I.3.1, p.18, Corollary I.4.3, p.28, and Lemmas II.4.1–II.4.2, pp.47–48.) *Needs:* BordismFormalGroups, §F6.5 (finite-group Borel norm and coherent Tate functor); EnhancedDerivedSheaves, E5:abstract (*Operadic algebras*); EnhancedDerivedSheaves, E5:presentability.2 (`spectra`); EnhancedDerivedSheaves, E5:spectra-comparison (`eilenbergMacLane`, `moduleSpectra_equiv_derived`); EnhancedDerivedSheaves, E2 (*Countable products in a replete topos*).

**Checks.**

- `tate_trivial_Fp`: For `X = H𝔽_p` with trivial action, `π_*X^{h𝕋} = 𝔽_p[t]` with |t| `=` −2 and `π_*X^{t𝕋} = 𝔽_p[t^{±1}]`.
- `tate_induced`: For an induced spectrum `𝕋_+` ∧ `Y`, the Tate construction vanishes.
- `tate_rational`: Before p-completion, for `X = Hℚ` with trivial action, `X^{tC_p} =` 0, whereas `X^{h C_p} = Hℚ`.
- For trivial `X=H𝔽_p`, the completed comparison identifies the residual-fixed finite Tate target with `H𝔽_p^{t𝕋}` and preserves the image of the fixed-point class `t`; the residual action is part of this assertion.
- For trivial `X=Hℚ`, circle Tate has `ℚ[t^{±1}]` as homotopy and is nonzero, whereas `(X^{tC_p})^{h(𝕋/C_p)}=0`. Its p-completion is zero, showing why completion is essential.
- At finite stage `n=1` the comparison is the identity on `X^{tC_p}`; at `n=2` the norm triangle and Tate-orbit vanishing give `X^{tC_{p²}}≃(X^{tC_p})^{h(C_{p²}/C_p)}` for bounded-below `X`.
- For translation on `X=C^*(𝕋;ℚ)`, equivariant duality with the invariant tangent framing gives `X≃Σ⁻¹(Σ∞_+𝕋∧Hℚ)` and `X_{h𝕋}≃Σ⁻¹Hℚ`. This nonzero spectrum has `π₀=0`, so it cannot be unital: its unit would be null and the unit law would force the identity to vanish. Thus spectral homotopy orbits do not inherit the unital algebra structure, even for bounded-below input.

**Spectral Tate diagonal** (`AInf.Trace.tateDiagonal`). For a prime `p`, construct the natural lax symmetric monoidal transformation `X→(X^⊗p)^{tC_p}` on spectra, with cyclic permutation action on the tensor power, and its coherent compatibility with finite tensor products and cyclic realization.

Prove exactness of the Tate tensor-power functor by its filtration whose mixed terms are induced and have zero Tate construction. Determine the transformation by its sphere value, and equip it with the unique lax symmetric monoidal refinement. Use the equivariant finite-set construction in §III.3 for the cyclic realization maps. (Nikolaus–Scholze, Definition III.1.4, p.68; Proposition III.3.1, p.75; §III.3, pp.75–79). *Needs:* *Circle actions, homotopy fixed points and Tate constructions* (§AI.7.2); EnhancedDerivedSheaves, E5:abstract (operadic algebras), E5:presentability.2 (`spectra`) and E5:spectra-comparison (`eilenbergMacLane`, `moduleSpectra_equiv_derived`).

**Checks.**

- At the sphere, the transformation is `𝕊→𝕊^{hC_p}→𝕊^{tC_p}`.
- In the tensor power of `X⊕Y`, every mixed orbit is induced from the trivial subgroup; its Tate construction vanishes.
- For `X=Hℚ`, `(X^⊗p)^{tC_p}=0`: the norm for the finite group is invertible rationally. The uncompleted Tate diagonal is therefore zero.

Perform these computations on the spectral carriers when constructing the Tate diagonal.

**Topological Hochschild homology as a cyclotomic spectrum** (`AInf.Trace.THH`). For a connective `E∞`-ring A, THH(A) is the cyclic bar construction, an `E∞`-ring with a `𝕋-action`, together with the cyclotomic Frobenius `φ_p` : THH(A) `→ THH(A)^{tC_p}`, which is `𝕋 ≅ 𝕋/C_p`-equivariant and `E∞`; then `TC⁻(A) = THH(A)^{h𝕋}`, TP(A) `= THH(A)^{t𝕋}` and the two maps can, `φ` : `TC⁻(A; ℤ_p) →` TP(A; `ℤ_p`) after p-completion. For a discrete commutative ring A, `π_0` THH(A) `=` A and `π_*` THH(A) agrees with Hochschild homology rationally; the HKR filtration on HH(A/k) for smooth A has graded pieces `Ω^i_{A/k}[i]`.

Standing hypotheses (Sp); A a connective `E∞`-ring.

The API:

- `AInf.Trace.THH`: THH(A) with its `𝕋-action` and `E∞` structure, functorial in A.
- `AInf.Trace.frobenius`: the cyclotomic Frobenius THH(A) `→ THH(A)^{tC_p}`.
- `AInf.Trace.TCminus`: `TC⁻(A; ℤ_p) =` THH(A; `ℤ_p)^{h𝕋}`.
- `AInf.Trace.TP`: TP(A; `ℤ_p) =` THH(A; `ℤ_p)^{t𝕋}`, with can and `φ`.
- `AInf.Trace.HKR`: the HKR filtration with graded pieces `Ω^i[i]` for smooth A.

Realize the cyclic bar construction of A in `E∞`-rings; the Tate-valued Frobenius is the composite of the Tate diagonal of A with the identification of the `C_p-Tate` construction of the p-fold smash power. Since `THH(A)` is connective, take homotopy fixed points of its `𝕋≅𝕋/C_p`-equivariant cyclotomic map and then use `AInf.Trace.completedTateComparison` inversely to obtain `φ:TC⁻(A;ℤ_p)→TP(A;ℤ_p)`. The compatibility with `can` is that of this comparison. (BMS2 (arXiv), §1.2, items (1)–(4), printed pp.3–5, and §2.2–2.3, printed pp.13–16). *Needs:* *Spectral Tate diagonal* (§AI.7.2); *Circle actions, homotopy fixed points and Tate constructions* (§AI.7.2); EnhancedDerivedSheaves, E5:abstract (*Operadic algebras*); EnhancedDerivedSheaves, E5:presentability.2 (`spectra`); EnhancedDerivedSheaves, E5:spectra-comparison (`eilenbergMacLane`, `moduleSpectra_equiv_derived`).

**Checks.**

- `thh_pi0`: `π_0` THH(A) `=` A for a discrete commutative ring A.
- `thh_sphere`: `THH(𝕊) = 𝕊` with trivial `𝕋-action`, and `φ_p` is the Segal map `𝕊 → 𝕊^{tC_p}`.
- `thh_Q`: Before p-completion, for A `= ℚ`, `THH(ℚ) = HH(ℚ/ℚ) = ℚ` in degree 0, so `THH(ℚ)^{tC_p} =` 0.

**Relative cyclotomic traces over the sphere polynomial ring**. Let `𝕊[z]=𝕊[ℕ]` be the monoid-algebra sphere spectrum, not the free `E∞`-ring on a degree-zero element. For a connective `E∞-𝕊[z]`-algebra A, define THH(A) by the cyclic bar realization and `THH(A/𝕊[z])=THH(A)⊗_{THH(𝕊[z])}𝕊[z]`. It is a circle-equivariant `E∞`-algebra. The cyclic bar `B^cyℕ` has weight-zero point and positive-weight circles with `t·(s,n)=(t^n s,n)`. The cyclotomic map comes from the edgewise-subdivision lift `B^cyℕ→(B^cyℕ)^{hC_p}`, whose positive-weight formula is `(s,n)↦(s,pn)`, the absolute cyclotomic map and lax monoidality of the finite-group Tate construction. It is semilinear for `z↦z^p`. Define `TC⁻(A/𝕊[z];ℤ_p)=THH(A/𝕊[z];ℤ_p)^{h𝕋}` and `TP(A/𝕊[z];ℤ_p)=THH(A/𝕊[z];ℤ_p)^{t𝕋}`, with canonical map can and cyclotomic Frobenius `φ`. These two maps have different coefficient normalizations.

Standing hypotheses (Sp). A has the specified `𝕊[z]`-algebra structure. The cyclotomic target circle action uses `𝕋≅𝕋/C_p`, not the unchanged residual action.

The API:

- `AInf.relative_cyclotomic_traces.augmentation`: The augmentation `THH(𝕊[z])=𝕊[B^cyℕ]→𝕊[z]` forgets the circle coordinate and preserves the weight `n`.
- `AInf.relative_cyclotomic_traces.base_map`: A map of `E∞-𝕊[z]`-algebras induces the relative trace maps, preserving circle action, can and the `z^p-semilinear φ`.
- `AInf.relative_cyclotomic_traces.relative_tensor`: Relative THH is the indicated tensor pushout, hence the universal circle-equivariant `E∞-𝕊[z]`-algebra receiving a nonequivariant map from A.
- `AInf.relative_cyclotomic_traces.can_phi`: can is `𝔖^(−1)`-linear on relative coefficients; `φ` is `Witt-Frobenius/u^p-semilinear` after the coefficient identification.
- `AInf.relative_cyclotomic_traces.completion`: p-completion and compatible base changes use spectral derived tensor and the stated completed limits; no ordinary ungraded tensor replaces them.

Realize the cyclic bar of an `E∞`-algebra in spectra to obtain THH and its circle action. The spectral operations are those of *Circle actions, homotopy fixed points and Tate constructions* (§AI.7.2) and *Topological Hochschild homology as a cyclotomic spectrum* (§AI.7.2). Compute the monoid cyclic bar weightwise, using its inclusion in the free-loop model for `B^cyℤ`. Precomposition of `γ_{s,n}(z)=sz^n` by `z↦z^p` gives `γ_{s,pn}`. On the weight-`pn` target, `C_p` acts trivially and the residual action is `[λ]·s=λ^{pn}s`; transport through `[λ]↦λ^p` makes it `t·s=t^n s`. This constructs the equivariant lift with unchanged `s`. The square relating its augmentation to `z↦z^p` allows the relative tensor product to inherit the cyclotomic map by Construction 11.5. Take circle homotopy fixed points and the circle Tate construction for `can`. The relative THH spectrum is connective; take residual-circle fixed points of its cyclotomic map and use `AInf.Trace.completedTateComparison` inversely to obtain the p-completed `φ`, with the transported residual action and `z↦z^p` semilinearity. (BMS2 (Publ. IHÉS), §1.2, pp.201–203; Proposition 11.3 and Construction 11.5, pp.299–300, for the monoid model and relative tensor construction; Nikolaus–Scholze, Proposition IV.3.2(ii) and Corollary IV.3.3, printed pp.114–117, for the precomposition lift and its transported circle action). *Needs:* EnhancedDerivedSheaves, E5:abstract (*Operadic algebras*); EnhancedDerivedSheaves, E5:presentability.2 (`spectra`); EnhancedDerivedSheaves, E5:spectra-comparison (`eilenbergMacLane`, `moduleSpectra_equiv_derived`); EnhancedDerivedSheaves, E2 (*Countable products in a replete topos*); *Circle actions, homotopy fixed points and Tate constructions* (§AI.7.2); *Topological Hochschild homology as a cyclotomic spectrum* (§AI.7.2).

**Checks.**

- `relative_cyclotomic_traces_base`: `THH(𝕊[z]/𝕊[z])=𝕊[z]` with trivial circle action and cyclotomic Frobenius `z↦z^p`.
- `relative_cyclotomic_traces_weight_zero`: The cyclic-bar weight-zero component is a single fixed point; it is not a full circle.
- `relative_cyclotomic_traces_weight_p`: On the weight-p component the circle action is `t^p`, whereas the weight-one component has action `t`. They cannot be assigned the same circle action.
- `relative_cyclotomic_traces_frobenius`: Precomposition sends `γ_{s,1}(z)=sz` to `sz^p`, so `(s,1)↦(s,p)`. At weight one the transported target action is `t·s=ts`, and this lift is equivariant. The coordinate-power map would give `F(ts,1)=(t^p s^p,p)` but `t⋆F(s,1)=(t s^p,p)`; for `p=2`, `t=−1`, `s=1` these differ.
- `relative_cyclotomic_traces_free_ring`: The free `E∞`-ring on a degree-zero class has `⊕_n𝕊_{hΣ_n}` as its underlying spectrum; it is not substituted for the monoid algebra `𝕊[ℕ]`.
- The spectral base has `π_*𝕊[z]=π_*𝕊[z]`; a free `E∞` generator would have symmetric-group homotopy and fail this description.
- Relative traces remain circle-equivariant and Frobenius-semilinear for `z^p` throughout base change.

**Bökstedt spectral sequence** (`AInf.Trace.bokstedtSpectralSequence`). For a connective associative ring spectrum `A` and prime `p`, construct the spectral sequence of the skeletal filtration of its cyclic bar, `E²_{s,t}=HH_s(H_*(A;𝔽_p))_t⇒H_{s+t}(THH(A);𝔽_p)`. Prove strong convergence in this first-quadrant setting, naturality and compatibility with the dual Steenrod coaction. For commutative `A`, construct the multiplicative structure and the Hochschild suspension `σ`. Flatness of `E²` over `H_*(A;𝔽_p)` supplies the initial-page coproduct compatible with `d²`. If every `Eʳ` for `r≥2` is flat over `H_*(A;𝔽_p)`, construct the Hopf spectral-sequence structure. If `H_*(THH(A);𝔽_p)` is flat over `H_*(A;𝔽_p)`, construct the abutment Hopf coproduct of AR05 Theorem 4.5(a). Verify these flatness hypotheses in the `H𝔽_p` calculation.

Import DGAInfinity Layer 8's normalized Hochschild chains of the strictly unital graded algebra `Λ=H_*(A;𝔽_p)`, with zero internal differential. Transport its cohomological convention by placing `Λ_t` in degree `−t` and a normalized Hochschild tensor of length `s` and internal homological degree `t` in total cohomological degree `−(s+t)`. Thus `E¹_{s,t}=NC_s(Λ)_t`, `d¹=b:NC_s(Λ)_t→NC_{s−1}(Λ)_t`, and `E²_{s,t}=HH_s(Λ)_t`; use the transported Koszul signs. The field Künneth formula identifies this supplied complex with the skeletal page. AI.7 owns that identification, spectral suspension, products and coactions. Filter cyclic realization, and use subdivision to construct the spectral product and coproduct. (Angeltveit–Rognes, *Hopf algebra structure on topological Hochschild homology*, §4, (4.1), Propositions 4.2–4.3, Theorem 4.5 and Proposition 4.9, pp.1238–1244). *Needs:* DGAInfinity, Layer 8 (normalized algebraic Hochschild chains); TangentialBordism, §B4 items 2 and 7 (actual dual Steenrod Hopf algebras); *Topological Hochschild homology as a cyclotomic spectrum* (§AI.7.2); EnhancedDerivedSheaves, E5:presentability.2 (`spectra`) and E5:spectra-comparison (`symmetricSpectra_equiv_spectra`, `eilenbergMacLane`, `moduleSpectra_equiv_derived`).

**Checks.**

- For `A=𝕊`, normalized Hochschild chains of `𝔽_p` have only filtration zero, giving `H_*THH(𝕊)=𝔽_p`.
- A normalized tensor `a₀⊗[a₁]` of internal homological degree `t` has bidegree `(1,t)` and total homological degree `t+1`, corresponding to cohomological degree `−t−1`; the Hochschild boundary lowers length and preserves internal degree.
- For `A=H𝔽₂`, `H_*A=𝔽₂[ξ₁,ξ₂,…]`, and `E²=H_*A⊗Λ(σξ₁,σξ₂,…)`; collapse of this page does not determine multiplicative extensions.
- For odd `p` and `A=H𝔽_p`, `E²=H_*A⊗Λ(σξ_i:i≥1)⊗Γ(στ_i:i≥0)`; divided powers cannot be replaced by polynomial generators. The successive pages after the Bökstedt differential are free over `H_*A`, as is the abutment `H_*A⊗𝔽_p[u]`; at `p=2` the exterior initial page collapses and the abutment is again free. Thus the pagewise and abutment flatness hypotheses hold here.

**Dyer–Lashof operations and the dual Steenrod input** (`AInf.Trace.dyerLashofInput`). Construct mod-p homology operations on commutative ring spectra from extended powers, including naturality, Cartan and Adem relations, instability and top-power identities. Import TangentialBordism §B4 items 2 and 7's actual computation of `H_*(H𝔽_p;𝔽_p)`, its dual Steenrod coaction, coproduct and conjugation, transported through EnhancedDerivedSheaves E5:spectra-comparison: at `p=2` it is polynomial on generators `ξ_i` of degree `2^i−1`; at odd `p` it is polynomial on `ξ_i` of degree `2p^i−2` tensor exterior on `τ_i` of degree `2p^i−1`. For conjugate generators prove `Q^{2^i}(ξ̄_i)=ξ̄_{i+1}` at `p=2` and `Q^{p^i}(τ̄_i)=τ̄_{i+1}` at odd `p`. Prove `Q^k(σx)=σQ^k(x)` and the odd-primary Bökstedt differential `d^{p−1}(γ_p(σx))=σ(βQ^i(x))` up to a nonzero scalar for `|x|=2i−1`.

Construct extended powers and their homology operations on the supplied spectrum category. Prove the operation values on the supplied Milnor conjugate generators, then use suspension compatibility to resolve the spectral-sequence differentials and multiplicative extensions. (Bruner–May–McClure–Steinberger, *H∞ ring spectra and their applications*, Chapter III §1, Theorem 1.1, and §2, Theorems 2.2–2.4, pp.56–63; Angeltveit–Rognes, §5, (5.1)–(5.5), Propositions 5.6 and 5.9, and Theorem 5.12 at `m=0`, pp.1244–1255). *Needs:* TangentialBordism, §B4 items 2 and 7 (actual dual Steenrod Hopf algebras and conjugation); EnhancedDerivedSheaves, E5:spectra-comparison (`symmetricSpectra_equiv_spectra`); *Bökstedt spectral sequence* (§AI.7.2); EnhancedDerivedSheaves, E5:abstract (operadic algebras) and E5:presentability.2 (`spectra`).

**Checks.**

- At `p=2`, `(σξ̄_i)²=σξ̄_{i+1}`; the exterior associated graded has a nontrivial multiplicative extension.
- At odd `p`, `d^{p−1}(γ_p(στ̄_i))` is a nonzero multiple of `σξ̄_{i+1}`; the latter class cannot survive independently.
- The lowest surviving class `σξ̄₁` at `p=2`, or `στ̄₀` at odd `p`, has degree two and has nonzero successive p-th powers.

**Bökstedt periodicity** (`AInf.Trace.bokstedt_periodicity`). `π_*THH(𝔽_p) = 𝔽_p[u]` with |u| `=` 2, as a ring; more generally, for a perfectoid ring `R`, `π_*THH(R; ℤ_p) =` R[u] with `u` a generator of `ker(θ)/ker(θ)²` in degree 2.

`p` prime; `R` integral perfectoid for the second clause.

Bökstedt's computation through the Bökstedt spectral sequence and Dyer–Lashof operations; the perfectoid case reduces to `𝔽_p` by base change along `ℤ_p → R` and the computation of `HH(R/ℤ_p; ℤ_p)`. (Nikolaus–Scholze, Theorem IV.4.4 and Remark IV.4.5, pp.121–122, for the prime-field calculation; Angeltveit–Rognes, Theorem 5.12 at `m=0`, pp.1252–1255, for its homology calculation and extensions; BMS2 (arXiv), Theorem 6.1 and its proof, printed p.36, for the perfectoid extension). *Needs:* *Bökstedt spectral sequence* (§AI.7.2); *Dyer–Lashof operations and the dual Steenrod input* (§AI.7.2); PerfectoidQuotients, §0.3 (`perfectoid_absolute_cotangent`); *Topological Hochschild homology as a cyclotomic spectrum* (§AI.7.2); PerfectoidSpaces, P1 (*Fontaine's θ: W(S♭+) → S+ is surjective with kernel generated by a primitive nonzerodivisor (ECD Lemma 3.14)*).

**Checks.**

- For `𝔽_p`, the class in degree two is nonnilpotent; `π_*` is polynomial rather than exterior.
- For `R=𝔽_p`, p-completion leaves the result unchanged and the conormal line is `(p)/(p²)` over `W(𝔽_p)`.
- For `R=O_C`, the degree-two module is the conormal line of `ker θ`; choosing a kernel generator trivializes it without producing a canonical basis.


**Perfectoid trace coefficient calculation** (`AInf.Trace.perfectoid_coefficients`). For an integral perfectoid `R` with `A_inf(R)`, one can choose a `θ-kernel` generator `ξ` and compatible degree-two generators, with `ξ̃=φ(ξ)`, such that `π_*THH(R;ℤ_p)=R[b]`, `π_*TC⁻(R;ℤ_p)=A_inf(R)[b,v]/(bv−ξ)`, and `π_*TP(R;ℤ_p)=A_inf(R)[σ^{±1}]`, with `|b|=|σ|=2` and `|v|=−2`. can is `A_inf`-linear with `b↦ξσ`, `v↦σ^−1`; `φ` is semilinear for Witt Frobenius with `b↦σ`, `v↦ξ̃ σ^−1`. For connective `E∞-R`-algebras A, quotient by `v` gives `THH(A;ℤ_p)`, while the TP quotient by `ξ̃` gives `THH(A;ℤ_p)^{tC_p}`. These formulas use a compatible choice of `ξ` as well as the graded generators; they do not assert simultaneous normalization for an arbitrary preassigned `ξ` or a canonical basis of a Tate line.

Standing hypotheses (Sp). `R` integral perfectoid, with its primitive `θ-kernel` generator and the coefficient identification from PerfectoidSpaces P1.

The perfectoid completed cotangent calculation gives the HKR filtration. The Bökstedt calculation for `𝔽_p` and perfectoid base change give the polynomial THH coefficients; the source uses a pseudocoherence/Nakayama induction. Use the homotopy fixed point and Tate spectral sequences to identify the `ξ`-adic thickening with `A_inf` by its universal property. Normalize the generators so `φ(b)=σ`, then multiplicativity determines `φ(v)`. Use the perfect `TC⁻`-module quotient by `v` to identify the connective algebra base-change squares. The `𝔽_p` input is *Bökstedt periodicity* (§AI.7.2). (BMS2 (Publ. IHÉS), Theorem 6.1 and Propositions 6.2–6.4, pp.243–248). *Needs:* PerfectoidQuotients, §0.3 (`perfectoid_absolute_cotangent`); *Relative cyclotomic traces over the sphere polynomial ring* (§AI.7.2); *Finite Witt coefficient maps* (§AI.0.2); *Completed cotangent description of the twist* (§AI.0:integral.1); PerfectoidSpaces, P1 (*Fontaine's θ: W(S♭+) → S+ is surjective with kernel generated by a primitive nonzerodivisor (ECD Lemma 3.14)*); *Circle actions, homotopy fixed points and Tate constructions* (§AI.7.2); *Topological Hochschild homology as a cyclotomic spectrum* (§AI.7.2); *Bökstedt periodicity* (§AI.7.2).

**Checks.**

- The canonical and Frobenius maps send bv to `ξ` and `ξ̃` respectively.
- For characteristic-p perfect `R`, `ξ=p`; the formula reduces to the Witt coefficient calculation.

- At `R=𝔽_p`, can sends the degree-two generator to `pσ` while Frobenius sends it to `σ`; the two maps remain distinct.


**Quasisyntomic unfolding of the trace coefficient sheaf**. For quasiregular semiperfectoid `S` over a perfectoid `R`, put `D̂_S=π_0TC⁻(S;ℤ_p)≃π_0TP(S;ℤ_p)`. The spectral sequences are even; multiplication by `v^i` identifies `π_{2i}TC⁻` with the complete descending Nygaard level `N^{≥i}D̂_S`, with `gr_N^iD̂_S≃π_{2i}THH` for `i≥0`. The cohomology groups form acyclic sheaves on the quasiregular semiperfectoid basis. Unfold these sheaves to the quasisyntomic site and define `gr^0TC⁻=gr^0TP` as `D̂_A`. For a general A this unfolded object is a derived complex, not `π_0TC⁻(A)`. Its coherent multiplicative filtration and coefficient twists are retained.

Standing hypotheses (Sp). `S` quasiregular semiperfectoid; A quasisyntomic and p-complete with bounded p-torsion as in BMS2. The quasisyntomic site, its quasiregular semiperfectoid basis and symmetric monoidal sheaf-unfolding equivalence are supplied by DerivedDeRhamCohomology §§5.1–5.5, 5.23 (§§5.1–5.5) and EnhancedDerivedSheaves E2.

The API:

- `AInf.qrsp_trace_unfolding.basis_value`: Restriction of the unfolded D̂ to a quasiregular semiperfectoid basis object is `π_0TC⁻≃π_0TP`.
- `AInf.qrsp_trace_unfolding.nygaard`: `N^{≥i}` is the `v^i` image of `π_{2i}TC⁻` for `i≥0`, complete, descending and multiplicative, with the stated graded pieces.
- `AInf.qrsp_trace_unfolding.frobenius`: The cyclotomic Frobenius carries `N^{≥i}` to `ξ̃^iD̂` and therefore admits the divided Frobenius in the perfectoid coefficient convention.
- `AInf.qrsp_trace_unfolding.restriction`: Quasisyntomic pullback and Čech descent preserve the unfolded algebra and its complete filtration.

Use the quasiregular cotangent-amplitude calculation and THH/HKR filtration to prove evenness and the p-complete flatness of the homotopy groups. The fixed-point/Tate spectral sequences degenerate; read the `v^i` filtration and use flat descent of derived exterior powers to prove sheaf acyclicity. Apply the symmetric monoidal unfolding equivalence on the basis (BMS2 Proposition 4.31). Recover the complete multiplicative filtered complex, not a chosen cochain model. (BMS2 (Publ. IHÉS), Proposition 4.31, p.230; Theorems 7.1–7.2, Constructions 7.4 and 7.7, and Proposition 7.9, pp.254–257; Corollary 7.10, pp.258–259). *Needs:* EnhancedDerivedSheaves, E5:presentability.2 (`spectra`); EnhancedDerivedSheaves, E5:spectra-comparison (`eilenbergMacLane`, `moduleSpectra_equiv_derived`); *Perfectoid trace coefficient calculation* (§AI.7.2); DerivedDeRhamCohomology, §1.18 (*The Beilinson t-structure*); EnhancedDerivedSheaves, E2 (*Unbounded hypercover descent*); *Topological Hochschild homology as a cyclotomic spectrum* (§AI.7.2); DerivedDeRhamCohomology, §§5.1–5.5, 5.23 (*Quasisyntomic sites, QRSP covers and sheaf unfolding*, §§5.1–5.5).

**Checks.**

- `qrsp_trace_unfolding_perfectoid`: For `S=R` perfectoid, `D̂_R=A_inf(R)` and `N^{≥1}` is `(ξ)`.
- `qrsp_trace_unfolding_grade_zero`: The Nygaard graded piece of index zero identifies with `π_0THH(S;ℤ_p)=S` on the quasiregular semiperfectoid basis.
- `qrsp_trace_unfolding_positive_degree`: For a smooth algebra with nonzero differential forms the unfolded D̂ need not be concentrated in degree zero.
- `qrsp_trace_unfolding_degree_shift`: Multiplication by `v^i` takes homotopy degree 2i to degree zero; multiplying by `b^i` would give the wrong degree and filtration.
- On a quasiregular semiperfectoid basis object D̂ is discrete and agrees with `π_0TP`.
- On a smooth torus the unfolded object has higher cohomology and cannot be replaced by an unproved discrete `π_0` object.

**Absolute trace comparison with AΩ** (`AInf.Trace.absolute_aOmega_comparison`). For A the p-adic completion of a smooth `O_C`-algebra, the unfolded trace algebra `D̂_A` is naturally equivalent to `AΩ_A` as `E∞-A_inf`-algebras, compatibly with Frobenius. The map is obtained from perfectoid A-algebra evaluations, factors through `Lη_μ` using the Nygaard/Frobenius divisibility criterion, and is made integral by quasisyntomic descent and left Kan extension from topologically free covers. It is not an arbitrarily chosen equivalence between the realizations.

Standing hypotheses (Sp). Standing hypotheses (C). A the p-adic completion of a smooth `O_C`-algebra, with the corrected pro-étale `AΩ` definition.

Evaluate on perfectoid algebras to obtain `D̂_A→RΓ_proét(A,A_inf)`. Factor by the Frobenius/Nygaard criterion through `Lη_μ`, first in the almost category. Use topologically free quasiregular covers to remove the almost obstruction, then descend. Compare the de Rham reductions modulo `ξ`. Claim 9.7 checks the identity in degree zero modulo `(p,ξ)`; Lemma 9.9 uses the Bockstein to obtain the identity in every cohomological degree. Derived `ξ-completeness` proves equivalence. (BMS2 (Publ. IHÉS), Theorem 9.6 with proof, pp.286–289; Theorem 1.8, pp.204–205). *Needs:* *Quasisyntomic unfolding of the trace coefficient sheaf* (§AI.7.2); *The AΩ complex* (§AI.3.2); *Framing independence and sheaf descent* (§AI.3.3); *Filtered décalage as Beilinson truncation* (§AI.1.4).

**Checks.**

- At `A=O_C` the comparison is the normalized `A_inf` identity.
- The integral comparison requires the almost-to-integral repair and is not a formal consequence of equal reductions.

**Characteristic-p trace and crystalline comparison** (`AInf.Trace.crystalline_comparison`). For a quasiregular semiperfect `𝔽_p-algebra S`, the trace `D̂_S` is naturally the Nygaard completion of its derived de Rham–Witt/crystalline complex, preserving the Nygaard filtration. Cyclotomic Frobenius agrees with the functorial Frobenius of `S` and lifts the mod-p Frobenius. By descent, for a smooth algebra A over a perfect field `k` this gives the de Rham–Witt/crystalline trace comparison. The separate Segal input is: for A smooth of dimension `d`, `THH(A)→THH(A)^{tC_p}` is the connective truncation in degrees `≥d`, in the precise degree-by-degree form of BMS2 Corollary 8.18; it yields the stable-range Frobenius used by Proposition 11.15. More precisely `gr^iTHH(A)≃(τ^{≤i}Ω^•_{A/k})[2i]` and `gr^iTHH(A)^{tC_p}≃Ω^•_{A/k}[2i]`, and the map is the truncation inclusion; hence the whole map is an equivalence in homotopy degrees `≥d`.

Standing hypotheses (Sp). For the discrete statement `S` is quasiregular semiperfect over `𝔽_p`; for the smooth statement `k` is perfect and A smooth of finite dimension `d`.

Compare the mod-p trace reduction with derived de Rham. Compute the universal semiperfect torus example to make the thickening a PD thickening and identify the two Frobenius maps. Use the universal PD envelope and extend the map to Nygaard completions, then descend to smooth A. Keep the distinction between the cyclotomic and ring-induced Frobenius until agreement is proved. Apply the THH filtration and characteristic-p Frobenius calculation in the range `≥d` to obtain the Segal connective truncation. The exact threshold is checked separately when applying Bott inversion. (BMS2 (Publ. IHÉS), Theorem 8.17 and proof, pp.276–279; Corollary 8.18, pp.279–280; Theorem 1.10, p.205). *Needs:* *Quasisyntomic unfolding of the trace coefficient sheaf* (§AI.7.2); CrystallineCohomology, CR.4 (*Nygaard, conjugate, Hodge and lift filtrations*); CrystallineCohomology, CR.4 (*Relative Frobenius–Verschiebung procomplexes*); DerivedDeRhamCohomology, §1.18 (*The Beilinson t-structure*).

**Checks.**

- For a perfect field `k` the coefficient object is W(k).
- The crystalline comparison is filtered after Nygaard completion; it is not equality of an uncompleted PD envelope with `π_0TP`.

**Relative trace specializations of the sphere polynomial base**. For an `O_K`-algebra A with spectral structure `z↦π`, relative THH base extension along `𝕊[z]→𝕊`, `z↦0`, gives `THH(A⊗^L_{O_K}k)`, preserving the circle action and cyclotomic Frobenius. After base change to `𝕊[z^{1/p^∞}]` and p-completion, relative THH identifies with absolute THH of `A⊗^L_{O_K}O_{K_∞}`, where `O_{K_∞}` is the p-completed union adjoining compatible p-power roots of `π`. For the p-completed smooth flat algebras used in Layer AI.7 the derived base changes agree with the ordinary completed ones. No analogous unrestricted base-change commutation for `TC⁻` or TP is asserted without the completeness and descent arguments.

Standing hypotheses (Sp). Standing hypotheses (BK), with residue field `k`. The Breuil–Kisin conventions for `𝔖`, `𝔖^{(−1)}`, `z`, `u` and `b`. Derived tensor is taken in `E∞`-rings; the ordinary quotient identification needs the indicated flatness.

Use the spectral pushout for `z↦0` and the augmentation square to identify the residue algebra. The p-completed cotangent complex of the monoid algebra with all p-power roots vanishes. Its HKR filtration gives THH of that base equal to the base after p-completion; relative-to-absolute base change follows. Preserve the semilinear Frobenius on the base through both pushouts. (BMS2 (Publ. IHÉS), Lemma 11.6, Proposition 11.7 and Corollary 11.8, p.301). *Needs:* *Relative cyclotomic traces over the sphere polynomial ring* (§AI.7.2); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); PerfectoidSpaces, P1; PerfectoidQuotients, §§1.3–1.4 (`bhattRootExtension`, almost faithful flatness).

**Checks.**

- At `A=O_K` the `z=0` specialization gives THH(k).
- A torsion `O_K`-algebra requires derived residue tensor; silently using its ordinary residue quotient would lose Tor.

**Relative Breuil–Kisin trace coefficients**. For `O_K`, the p-completed relative coefficients are `π_*THH=O_K[b]`, `π_*TC⁻=𝔖^(−1)[b,v]/(bv−E)`, and `π_*TP=𝔖^(−1)[σ^{±1}]`, with `|b|=|σ|=2` and `|v|=−2`. can sends `b↦Eσ` and `v↦σ^−1`, linearly on `𝔖^(−1)`; for a unit `α∈(𝔖^(−1))^×`, `φ` acts by Witt `Frobenius/u^p` on coefficients and sends `b↦ασ`, `v↦φ(E)α^−1σ^−1`. The Tate target of relative THH has coefficients `O_K[π^{1/p}][σ^{±1}]`; its coefficient map evaluates `u` at `π^{1/p}`, rather than `π`. These equalities use the relative sphere-polynomial construction, not absolute `THH(O_K)`.

Standing hypotheses (Sp). Standing hypotheses (BK), with residue field `k`. The Breuil–Kisin conventions for `𝔖`, `𝔖^{(−1)}`, `z`, `u` and `b`; `E` is the fixed monic polynomial from R07.4. The unit `α` belongs to the chosen trace bases, rather than to a normalization of `E`.

Base change along the perfectoid root base reduces the computation to the perfectoid coefficient theorem. Identify `π_0` with the Frobenius-shifted copy of `𝔖`. Start with compatible trace generators and a trace-compatible kernel generator `E_tr=aE` for a unit `a`. Replacing their degree-two TC⁻ generator `b₀` by `a^−1b₀` gives `bv=E` and `can(b)=Eσ`, while `φ(b)=φ(a)^−1σ`; write this unit as `α`. Multiplicativity gives `φ(v)=φ(E)α^−1σ^−1`. In the finite-Tate square, `φ_p(b)=θ̃^(−1)(α)σ` and the coefficient evaluation remains `u↦π^{1/p}`. A further basis change `(b,v,σ)↦(cb,c^−1v,cσ)` gives `α↦φ(c)α/c`. After E-inversion, `can^−1φ` therefore acts on the degree-two line by `α/E`; tensor powers and duals retain the corresponding powers of this factor. (BMS2 (Publ. IHÉS), Proposition 11.10 and diagram, pp.302–303, with its generator choices transported to the fixed monic E; KN22, §4 before Lemma 4.2 and Remark 4.3, p.1693, for the distinction between monic E and the convention E(0)=p.) *Needs:* *Relative trace specializations of the sphere polynomial base* (§AI.7.2); *Perfectoid trace coefficient calculation* (§AI.7.2); *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1).

**Checks.**

- `can(bv)=E`, whereas `φ(bv)=φ(E)` since the factors `α` and `α^−1` cancel.
- The target quotient evaluation `u↦π^{1/p}` distinguishes `θ̃` from `θ` in this trace diagram and sends the finite-Tate Frobenius coefficient to `θ̃^(−1)(α)`.
- At `K=ℚ_p`, `π=p`, `E=u−p`, the cyclotomic residue specialization has `u↦0`, `E↦−p` and `α↦−1`. Thus `can(b̄)=−pσ̄=pφ(b̄)`, in agreement with `TC⁻(𝔽_p)→TP(𝔽_p)`. Setting `α=1` would force `2pσ̄=0` in `ℤ_p[σ̄^{±1}]`, also impossible at `p=2`.
- Under `(b,v,σ)↦(cb,c^−1v,cσ)`, the localized coefficient changes from `α/E` to `φ(c)α/(cE)`, the usual semilinear change of basis; the underlying Frobenius map is unchanged.

**Relative quasiregular evenness and descent**. For `S` a quasiregular semiperfectoid quasisyntomic `O_K`-algebra, the relative THH, `TC⁻` and TP spectra over `𝕊[z]` have no odd homotopy. Each homotopy group is an acyclic sheaf on the quasiregular semiperfectoid basis. `π_0TC⁻≃π_0TP` unfolds to an `E∞-𝔖^(−1)-algebra D̂_{A/𝔖^(−1)}` on `QSyn_{O_K}`, with the complete descending multiplicative Nygaard filtration from the homotopy fixed point spectral sequence. For smooth A this is the twisted trace complex of Layer AI.7; its specializations are those of Corollary 11.12, including the identity Witt map and `u↦π` on `𝔖^(−1)`.

Standing hypotheses (Sp). Standing hypotheses (BK), with residue field `k`. The Breuil–Kisin conventions for `𝔖`, `𝔖^{(−1)}`, `z`, `u` and `b`. `S` is quasiregular semiperfectoid, with bounded p-torsion and quasisyntomic cotangent amplitude; A is in `QSyn_{O_K}`. Smoothness is required for the stated specialization package.

After p-completed base change to `O_{K_∞}`, apply absolute quasiregular evenness and descent; coefficient extension is topologically free and detects the needed assertions. Unfold `π_0` on the relative quasiregular basis. Use residue and root specialization plus the absolute trace comparisons to obtain Corollary 11.12. Read the complete multiplicative filtration and `gr^0` reduction from the fixed-point spectral sequence; its existence on the twisted object does not imply descent of the filtration. (BMS2 (Publ. IHÉS), Proposition 11.11, Corollary 11.12 and Remark 11.14, pp.303–305). *Needs:* *Relative Breuil–Kisin trace coefficients* (§AI.7.2); *Quasisyntomic unfolding of the trace coefficient sheaf* (§AI.7.2); *Absolute trace comparison with AΩ* (§AI.7.2); *Characteristic-p trace and crystalline comparison* (§AI.7.2).

**Checks.**

- At `A=O_K`, `D̂_{A/𝔖^(−1)}=𝔖^(−1)` and its first Nygaard level is (E).
- Replacing the twisted coefficient ring with untwisted `𝔖` changes the de Rham and crystalline coefficient maps.

**Bott inversion and Frobenius descent input**. The relative cyclotomic Frobenius extends naturally from `TC⁻` to `TC⁻[1/b]⊗_{𝕊[z]}𝕊[z^{1/p}]→TP` because `φ(b)=ασ` is invertible. For quasiregular semiperfectoid A, the Bott-localized source remains even with acyclic homotopy sheaves. After unfolding degree zero, the extended map is an equivalence for A the p-adic completion of a smooth `O_K`-algebra. This is the Frobenius-descent input defining the untwisted Breuil–Kisin complex in *Bott-inverted Breuil–Kisin descent* (§AI.7.3). No Bott inversion of the power-series parameter `u` is intended.

Standing hypotheses (Sp). Standing hypotheses (BK), with residue field `k`. The Breuil–Kisin conventions for `𝔖`, `𝔖^{(−1)}`, `z`, `u` and `b`. The map extension exists for any `O_K`-algebra A. Evenness/acyclicity needs quasiregular semiperfectoid A; the unfolded equivalence needs p-completed smooth A.

Invert `b` under `φ` and extend the semilinear `z↦z^p` scalar map to `z^{1/p}`. Evenness and acyclic sheaf conditions survive the filtered colimit for b-localization. For smooth A check the stable range of motivic pieces at indices `≥dim(A)`; after reduction along `z^{1/p}` use the characteristic-p Segal theorem. Completeness gives the unfolded equivalence and descends the Frobenius. (BMS2 (Publ. IHÉS), Proposition 11.15 and proof of Theorem 11.2, pp.305–306). *Needs:* *Relative quasiregular evenness and descent* (§AI.7.2); *Relative Breuil–Kisin trace coefficients* (§AI.7.2); *Characteristic-p trace and crystalline comparison* (§AI.7.2).

**Checks.**

- The inverted `b` has homotopy degree two; it is different from the degree-zero formal parameter `u`.
- The stable-range argument proves the unfolded smooth statement and does not assert `TC⁻[1/b]≃TP` for every input.
- At `K=ℚ_p`, `E=u−p`, the residue unit `α=−1` still makes `φ(b)=ασ` invertible; the Bott extension retains the monic coefficient convention.

### AI.7.3 Breuil–Kisin cohomology and its Frobenius

**Frobenius-twisted relative trace complex** (`CohomologicalBK.twistedTrace`). For a p-completely smooth `O_K-algebra R`, let `𝔖^(−1)` be the copy of `𝔖` containing `𝔖` via `φ_𝔖` and embedded in `A_inf` by `g`. Define `D̂_tw(R)=gr⁰TC⁻(R/𝕊[z];ℤ_p)≃gr⁰TP(R/𝕊[z];ℤ_p)`, by unfolding `π₀` from the quasiregular semiperfectoid site as in BMS2 §§11.1–11.2; here `O_K` is an `𝕊[z]`-algebra through `z↦π`. It is a (p,u)-complete `E∞-𝔖^(−1)`-algebra, the algebra structure coming from `π₀TC⁻(O_K/𝕊[z];ℤ_p)=𝔖^(−1)`, in which the variable `z` of `𝕊[z]` is the coefficient variable `u`; its Frobenius linearization is invertible after `φ(E)`-inversion. The Layer AI.7 relative trace targets supply the relative spectra, filtration, unfolding and coefficient computations.

Standing hypotheses (BK). `𝕊[z]` is the sphere-spectrum monoid algebra; the Bott class `b` of degree 2 is distinct from the coefficient variable `u`.

The API:

- `CohomologicalBK.twistedTrace.coefficients`: For `R=O_K`, with all spectra relative to `𝕊[z]` and p-completed: `π_*THH=O_K[b]`; `π_*TC⁻=𝔖^(−1)[b,v]/(bv−E)` with `b` of degree 2 and `v` of degree −2; `π_*TP=𝔖^(−1)[σ^{±1}]` with `σ` of degree 2; `can(b)=Eσ` and `can(v)=σ^{−1}`; the cyclotomic Frobenius `π_*TC⁻→π_*TP` is `φ_𝔖` on `𝔖^(−1)`, with `φ(b)=ασ` and `φ(v)=φ_𝔖(E)α^−1σ^{−1}`, for the same unit `α` and monic `E` as in *Relative Breuil–Kisin trace coefficients*.
- `CohomologicalBK.twistedTrace.specializations`: BMS2 Corollary 11.12(1)–(3): along `g`, with the (p,u)-completed tensor product, it is `AΩ_{R⊗̂O_C}`; along the W(k₀)-linear map `u↦π` (untwisted coefficients) it is the p-completed de Rham complex of `R` over `O_K`; along constantCoeff (identity on W(k₀), `u↦0`) it is crystalline cohomology of `R⊗_{O_K}k₀` over W(k₀).
- `CohomologicalBK.twistedTrace.frobenius`: Its linearized Frobenius is invertible after `φ(E)`, matching Corollary 11.12(4).

Use the Layer AI.7 relative trace targets’ relative `THH/TC⁻/TP` computation and its quasisyntomic descent, using the map `z↦π`: the cyclotomic structure on `THH(−/𝕊[z])` (BMS2 Construction 11.5), the coefficient computation BMS2 Proposition 11.10, and evenness and the sheaf property on quasiregular semiperfectoid `O_K`-algebras, BMS2 Proposition 11.11, which rests on BMS2 Theorem 7.2. Apply BMS2 Corollary 11.12, with the relative `TC⁻(−/𝕊[z];ℤ_p)` and with `gr⁰` of the filtration obtained by unfolding from quasiregular semiperfectoid algebras; on smooth algebras this is not `π₀`, and absolute `TC⁻` carries no `𝔖`-module structure. Its proof uses, besides §§11.1–11.2, the absolute results BMS2 Theorem 1.17 for part (2), Theorem 1.8 for part (1) and Theorem 1.10 for part (3), with BMS2 Corollary 11.8 and Lemma 11.6 for base change in `𝕊[z]`; all belong to Layer AI.7 relative traces. Part (4) is deduced from part (1) because `𝔖^(−1)→A_inf` is a topological direct summand, which is *Flat Breuil–Kisin to A_inf extension* (§AI.7.1) applied to `g`. (BMS2 (Publ. IHÉS), §11.2, first two paragraphs, p.302; BMS2 (Publ. IHÉS), Proposition 11.10, pp.302–303; BMS2 (Publ. IHÉS), Proposition 11.10, p.303; BMS2 (Publ. IHÉS), Proposition 11.10, p.303, top arrow of the last diagram; BMS2 (Publ. IHÉS), Proposition 11.11, p.303; BMS2 (Publ. IHÉS), paragraph after Proposition 11.11, p.303; BMS2 (Publ. IHÉS), Corollary 11.12, p.304; BMS2 (Publ. IHÉS), Corollary 11.12(3), p.304; BMS2 (Publ. IHÉS), Corollary 11.12, proof of part (4), p.305; BMS2 (Publ. IHÉS), Remark 11.9, p.302). *Needs:* *Relative cyclotomic traces over the sphere polynomial ring* (§AI.7.2); *Perfectoid trace coefficient calculation* (§AI.7.2); *Quasisyntomic unfolding of the trace coefficient sheaf* (§AI.7.2); *Absolute trace comparison with AΩ* (§AI.7.2); *Characteristic-p trace and crystalline comparison* (§AI.7.2); *Relative trace specializations of the sphere polynomial base* (§AI.7.2); *Relative Breuil–Kisin trace coefficients* (§AI.7.2); *Relative quasiregular evenness and descent* (§AI.7.2); *Bott inversion and Frobenius descent input* (§AI.7.2); *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1); *Flat Breuil–Kisin to A_inf extension* (§AI.7.1); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); EnhancedDerivedSheaves, E5:abstract (*Operadic algebras*); EnhancedDerivedSheaves, E5:presentability.2 (`spectra`); EnhancedDerivedSheaves, E5:spectra-comparison (`eilenbergMacLane`, `moduleSpectra_equiv_derived`).

**Checks.**

- `CohomologicalBK.twistedTrace.point`: For `O_K` the `gr⁰` complex is `𝔖^(−1)` in degree 0.
- `CohomologicalBK.twistedTrace.bott`: On `O_K` the cyclotomic map takes the Bott class `b` to `ασ`, which is invertible in TP; can takes `b` to `Eσ`.
- `CohomologicalBK.twistedTrace.relative`: Absolute `TC⁻(R;ℤ_p)` is not substituted for the relative theory: the class `b∈π₂` and the `𝔖^(−1)`-algebra structure of BMS2 Proposition 11.10 belong to `TC⁻(−/𝕊[z];ℤ_p)`, and the absolute theory appears only after base change, as `gr⁰TC⁻(R⊗̂_{O_K}O_{K_∞};ℤ_p)≃D̂_tw(R)⊗̂^L_{𝔖^(−1)}A_inf(O_{K_∞})` (BMS2 Corollary 11.12(1), Remark 11.9).
- For `R=O_K` the complex is `𝔖^(−1)`, and its three specialisations of BMS2 Corollary 11.12(1)–(3), along `g`, `u↦π` and `u↦0`, are `A_inf`, `O_K` and W(k₀).

**Bott-inverted Breuil–Kisin descent** (`CohomologicalBK.traceDescent`). Let `𝔖` act on `TC⁻(R/𝕊[z];ℤ_p)[1/b]` through `π₀(TC⁻(O_K/𝕊[z];ℤ_p)[1/b])=W(k₀)[[z]]`, the variable `z` of `𝕊[z]` being the coefficient variable `u`; the cyclotomic Frobenius makes `π₀TP(O_K/𝕊[z];ℤ_p)=𝔖^(−1)` an `𝔖`-algebra through `φ_𝔖`. `D_𝔖^tr(R)=gr⁰(TC⁻(R/𝕊[z];ℤ_p)[1/b])`, unfolded from the quasiregular semiperfectoid site, has `φ_𝔖^*D_𝔖^tr≃D̂_tw`, the tensor product being the ordinary one since `φ_𝔖` is finite free. The cyclotomic Frobenius extends over b-inversion and `z^{1/p}`; for p-completed smooth `R` the resulting map to `gr⁰TP` is an equivalence. On the coefficient point the graded extension sends `b↦ασ`; after E-inversion its composite with `can^−1` sends `b↦(α/E)b`. On degree zero it remains `φ_𝔖`, independently of the trace bases. The linearised descent Frobenius `φ_𝔖^*D_𝔖^tr→D_𝔖^tr` is the composite of `φ_𝔖^*D_𝔖^tr≃gr⁰TP(R/𝕊[z];ℤ_p)`, the inverse of the canonical equivalence `gr⁰TC⁻≃gr⁰TP` and the localisation `gr⁰TC⁻→gr⁰(TC⁻[1/b])=D_𝔖^tr`. Its base change along `φ_𝔖` is, under the identification above, the linearised Frobenius of `D̂_tw`, so that the pair `(D̂_tw,φ)` descends to `D_𝔖^tr` with this Frobenius; it is invertible after E-inversion.

Standing hypotheses (BK). `R` is the p-adic completion of a smooth `O_K`-algebra for the equivalence with `gr⁰TP` (BMS2 Proposition 11.15, last sentence); the extension of the cyclotomic Frobenius over b-inversion holds for every `O_K`-algebra.

Use the Layer AI.7 relative trace targets’ evenness, acyclicity and cyclotomic extension in BMS2 Proposition 11.15, with Propositions 11.10 and 11.11 and, for the reduction modulo `z^{1/p}`, Lemma 11.6; the source’s Segal input Corollary 8.18 belongs to Layer AI.7 relative traces. Apply the unfolding/descent of the proof of BMS2 Theorem 11.2, retaining its relative base and its canonical Frobenius composite; the first display of that proof must be read with `TC⁻(A/𝕊[z];ℤ_p)`, as in Proposition 11.15 and in the composite display of the same proof. Compatibility with the Frobenius of `D̂_tw`, whose verification BMS2 leaves implicit: let `Φ:D_𝔖^tr→gr⁰TP` be the `φ_𝔖-semilinear` map of Proposition 11.15 and `loc:gr⁰TC⁻→D_𝔖^tr` the b-inversion. By construction `Φ∘loc` is the cyclotomic Frobenius `φ^{hT}:gr⁰TC⁻→gr⁰TP`. The semilinear descent Frobenius is `F=loc∘can^{-1}∘Φ`, so `Φ∘F=φ^{hT}∘can^{-1}∘Φ`, and `φ^{hT}∘can^{-1}` is the Frobenius endomorphism of `gr⁰TP≃D̂_tw`. Invertibility after `E`: the linearized Frobenius of `D̂_tw` is invertible after inverting `φ_𝔖(E)` (*Frobenius-twisted relative trace complex* (§AI.7.3), BMS2 Corollary 11.12(4)); `φ_𝔖` is finite free of rank `p` (FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4 (*The Breuil–Kisin coefficient rings 𝔖, 𝒪_ℰ, 𝔖^ur, 𝒪 and S*)), hence faithfully flat, so the cone of the linearized Frobenius of `D_𝔖^tr` vanishes after inverting `E`. (BMS2 (Publ. IHÉS), Proposition 11.15, p.305; BMS2 (Publ. IHÉS), Proposition 11.15, p.305, last sentence; BMS2 (Publ. IHÉS), Proposition 11.15, proof, p.305; BMS2 (Publ. IHÉS), Proposition 11.15, proof, p.306; BMS2 (Publ. IHÉS), Theorem 11.2, proof, p.306; its first display prints the absolute `TC⁻` and is read with the relative one; proved in step 3; BMS2 (Publ. IHÉS), Theorem 11.2, p.298). *Needs:* *Frobenius-twisted relative trace complex* (§AI.7.3); *Relative cyclotomic traces over the sphere polynomial ring* (§AI.7.2); *Perfectoid trace coefficient calculation* (§AI.7.2); *Quasisyntomic unfolding of the trace coefficient sheaf* (§AI.7.2); *Absolute trace comparison with AΩ* (§AI.7.2); *Characteristic-p trace and crystalline comparison* (§AI.7.2); *Relative trace specializations of the sphere polynomial base* (§AI.7.2); *Relative Breuil–Kisin trace coefficients* (§AI.7.2); *Relative quasiregular evenness and descent* (§AI.7.2); *Bott inversion and Frobenius descent input* (§AI.7.2); EnhancedDerivedSheaves, E1 (*Derived sheaf tensor*); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4 (*The Breuil–Kisin coefficient rings 𝔖, 𝒪_ℰ, 𝔖^ur, 𝒪 and S*).

**Checks.**

- For `R=O_K`: `π_*(TC⁻(O_K/𝕊[z];ℤ_p)[1/b])=𝔖^(−1)[b^{±1}]`, because `v=E·b⁻¹` once `b` is inverted; its degree-zero part is W(k₀)[[z]], in which nothing has been inverted. The class inverted is the degree-two class `b` (written `u` in BMS2), not the coefficient variable `z`.
- The first display of the proof of BMS2 Theorem 11.2 must be read with the relative `TC⁻(A/𝕊[z];ℤ_p)`; with the absolute `TC⁻(A;ℤ_p)`, as printed, the class `b` and the `𝔖`-module structure are not defined.
- For `R=O_K`: `D_𝔖^tr=𝔖`, the map `Φ` is `φ_𝔖:𝔖→𝔖^(−1)`, and the descent Frobenius is `φ_𝔖`.

**Cohomological Breuil–Kisin complex** (`CohomologicalBK.cohomology`). For a p-completely smooth `O_K-algebra R`, define `D_𝔖(R)=D_𝔖^tr(R)` of *Bott-inverted Breuil–Kisin descent*: unfold `gr⁰(TC⁻(−/𝕊[z];ℤ_p)[1/b])` from the quasiregular semiperfectoid basis. The coefficient map is `z↦π`, `b` has degree two, and `𝔖=W(k₀)[[u]]` acts as specified in that target. This is a derived (p,u)-complete `E∞-𝔖`-algebra. Its `φ_𝔖-semilinear` Frobenius is `F=loc∘can⁻¹∘Φ`, with `Φ` the extended cyclotomic map; its linearization becomes an equivalence after E-inversion. For a smooth p-adic formal scheme `𝔛` let `𝒟_𝔖` be the étale sheaf obtained from this affine construction and define `RΓ_𝔖(𝔛)=RΓ(𝔛_ét,𝒟_𝔖)`. Smooth formal algebras here are p-adic completions of smooth finite-type algebras locally; continuity supplies the equivalent p-completely smooth formulation.

Standing hypotheses (BK). The ordinary smooth theory is distinct from the semistable theory of AI.6. Since `E≡u^e` mod `p`, derived (p,E)- and (p,u)-completeness agree.

The API:

- `CohomologicalBK.cohomology.affine`: `D_𝔖(R)` is this unfolded Bott-inverted relative trace object, with `φ_𝔖^*D_𝔖(R)≃D̂_tw(R)`.
- `CohomologicalBK.cohomology.functorial`: pullback preserves the `E∞` structures and `F`, with identity and composition inherited from relative traces and unfolding.
- `CohomologicalBK.cohomology.global`: `RΓ_𝔖` is derived global sections of `𝒟_𝔖` for every smooth `𝔛`. On affine `𝔛` this recovers `D_𝔖(R)`, by étale descent of the trace sheaf.
- `CohomologicalBK.cohomology.frobenius`: on affines the linearized `F` is invertible after `E`. The sheaf-level factorization, the `E^i` bound in degree `i` and the qcqs global isogeny are the next target.

Use the already constructed relative trace sheaves and Bott descent, BMS2 Proposition 11.15 and the proof of Theorem 11.2 (pp.305–306). Their functoriality and multiplicativity give the `E∞` structure and étale descent (BMS2 Remark 10.4, p.290; the extension to formal schemes following Theorem 11.2, p.299). The explicit Frobenius is the one in the displayed composite of that proof. Completeness and the affine isogeny descend along the finite faithfully flat `φ_𝔖`, as in *Bott-inverted Breuil–Kisin descent*. *Needs:* *Frobenius-twisted relative trace complex* (§AI.7.3); *Bott-inverted Breuil–Kisin descent* (§AI.7.3); *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1); DerivedDeRhamCohomology, §§5.1–5.5, 5.23 (§§5.1–5.5, quasisyntomic sites, QRSP basis and unfolding); EnhancedDerivedSheaves, E1, E2, E5:abstract.

**Checks.**

- `CohomologicalBK.cohomology.point`: `D_𝔖(O_K)=𝔖` in degree zero with `F=φ_𝔖`; the inverted `b` does not invert `u`.
- `CohomologicalBK.cohomology.relative`: absolute `TC⁻(R;ℤ_p)` has no specified `𝔖`-algebra structure and cannot replace `TC⁻(R/𝕊[z];ℤ_p)`.
- `CohomologicalBK.cohomology.twist`: `φ_𝔖^*D_𝔖(O_K)=𝔖^(−1)`; its `u↦π` specialization has identity Witt coefficients, whereas the descended map `θ_𝔖` has coefficient Frobenius and `u↦π^p`.
- Two uniformizers give two coefficient maps and two trace constructions. Their `A_inf` extensions are compared by *Uniformizer-choice transport after A_inf extension* (§AI.7.4), not by identifying their coefficient maps.

**Breuil–Kisin Frobenius décalage identity** (`CohomologicalBK.frobeniusDecalage`). For p-completely smooth `R/O_K`, the trace-defined Frobenius factors canonically as `φ_𝔖^*D_𝔖(R)≃Lη_E D_𝔖(R)→D_𝔖(R)`. Its restriction to cohomological degrees `≤i` admits an inverse to the linearized Frobenius up to `E^i`, for `i≥0`. This assertion is about the affine complexes, or their étale sheaves; applying `RΓ` need not commute with `Lη`. For qcqs smooth `𝔛`, the linearized Frobenius on `RΓ_𝔖(𝔛)` is consequently an equivalence after E-inversion. No Nygaard filtration on `D_𝔖` itself is asserted.

Standing hypotheses (BK).

Follow BMS2 Remark 11.17 (pp.307–308). Multiplication by `v^i` gives the Nygaard filtration on `D̂_tw=φ_𝔖^*D_𝔖` (Remark 11.14, p.305). The localization map to the E-adic filtration on `D_𝔖` is divisible by `E^i` because `v^i=E^i/b^i` after b-inversion. On QRSP algebras `E` is a nonzerodivisor on the relative `TC⁻` coefficients. The filtered source is Beilinson connective (BMS2 Corollary 7.10(1), pp.258–259); after the topologically free extension to `A_inf`, its map to the E-adic filtration is the connective cover of BMS2 Proposition 9.10 (pp.289–290). Detection under that extension, supplied by *Flat Breuil–Kisin to A_inf extension*, gives the connective-cover statement over `𝔖`. Layer AI.1's filtered décalage/Beilinson truncation identifies this cover with `Lη_E`. The composite to `D_𝔖` is exactly `loc∘can⁻¹∘Φ` by the construction of `F`, so this identifies the map as well as the object. On a nonnegative E-torsion-free representative, `η_E C` has terms contained in `E^j C^j`; multiplication by `E^i` on `τ^{≤i}C` factors through `η_E C`. This gives the asserted inverse up to `E^i`, with compatible source and target truncations. For qcqs `𝔛`, a finite affine cover supplies a uniform bound on relative dimension, hence on the local cohomological range; the cohomology of the cone of Frobenius is killed by a uniform E-power. Finite Zariski cohomological dimension and its descent spectral sequence then give an E-power bound on the global cone. Thus the global Frobenius becomes an equivalence after E-inversion. *Needs:* *Cohomological Breuil–Kisin complex* (§AI.7.3); *Frobenius-twisted relative trace complex* (§AI.7.3); *Bott-inverted Breuil–Kisin descent* (§AI.7.3); *Relative quasiregular evenness and descent* (§AI.7.2); *Absolute trace comparison with AΩ* (§AI.7.2); *Flat Breuil–Kisin to A_inf extension* (§AI.7.1); *Filtered décalage as Beilinson truncation* (§AI.1.4); *Connective comparison and localization* (§AI.1.2).

**Checks.**

- At `R=O_K` the factorization is `𝔖≃Lη_E𝔖=𝔖→𝔖`; its linearization is the identity.
- The natural map `Lη_E D→D` is part of the assertion; an arbitrary isomorphism of objects does not identify Frobenius.
- The Nygaard filtration remains on `φ_𝔖^*D`, in agreement with the non-descent test below.

**Nygaard filtration non-descent test** (`CohomologicalBK.nygaardNonDescent`). The Nygaard filtration on `φ_𝔖^*D_𝔖^tr≃D̂_tw` has no functorial descent along `φ_𝔖` to a filtration on `D_𝔖^tr` with the same degree-zero projection `D̂_tw(R)→gr⁰≃R`. For `R=O_K` the projection is `𝔖^(−1)→O_K`, and a descent of it is a quotient `𝔖/J` with `φ_𝔖(J)𝔖=(E)`. There are two cases. (i) If (E) is not of the form `φ_𝔖(J)𝔖`, which is so whenever `p` does not divide the degree `e` of `E`, in particular for unramified `K`, no descent exists even for `R=O_K`. (ii) If `(E)=φ_𝔖(J)𝔖`, as for `K=ℚ_p(p^{1/p})` with `π=p^{1/p}` and `J=(u−p)`, then `J=ker θ_𝔖`, the ring `O₀=𝔖/J` is identified by `θ_𝔖` with the subring `W(k₀)[π^p]` of `O_K`, and `O_K=O₀⊗_{𝔖,φ_𝔖}𝔖` is free of rank `p` over O₀. A functorial descent would then canonically descend every smooth formal `O_K-scheme` to O₀, and a good-reduction elliptic curve with `j∈O_K∖O₀` contradicts it.

Standing hypotheses (BK). The negative statement is about functorial descent of the filtration/projection; it does not prohibit accidental descents for individual objects. The elliptic-curve argument of BMS2 Remark 11.16 is complete in case (ii) only; `K=ℚ_p(p^{1/p})` with `π=p^{1/p}`, `E=u^p−p`, `k₀=𝔽_p` is the worked instance.

Use BMS2 Remark 11.16’s degree-zero Nygaard projection and its implied canonical scheme descent: a descent R₀ of the `𝔖^(−1)-algebra R` along `φ_𝔖` satisfies `R≅R₀⊗_{𝔖,φ_𝔖}𝔖` and is killed by ker `θ_𝔖=φ_𝔖^{-1}(E𝔖)`, because `R` is killed by `E` and `φ_𝔖` is faithfully flat. The dichotomy is not in the source. BMS2 Remark 11.16 argues uniformly in `K`: a functorial descent would descend every smooth formal `O_K-scheme` to `W(k₀)[π^p]`, the image of `θ_𝔖`, and an elliptic curve with good reduction and `j∈O_K∖W(k₀)[π^p]` contradicts this. That argument is complete only in case (ii). In case (i) no quotient O₀ of `𝔖` has `O₀⊗_{𝔖,φ_𝔖}𝔖≅O_K`, so there is no ring to which the schemes would descend, and for `K` unramified `W(k₀)[π^p]=O_K`, so that no such elliptic curve exists; there the non-descent is the statement that (E) is not extended along `φ_𝔖`. For `R=O_K` a descent of the surjection `𝔖^(−1)→O_K` is a surjection `𝔖→𝔖/J` with `φ_𝔖(J)𝔖=(E)`, by faithful flatness of `φ_𝔖`. Modulo `p` the ideal `φ_𝔖(J)𝔖` of k₀[[u]] is generated by a power `u^{pm}`, while `E≡u^e`, so `p` divides `e` in case (ii). There `J⊂ker θ_𝔖` and both ideals have the same extension along `φ_𝔖`, so `J=ker θ_𝔖`; and `O_K=𝔖/E=O₀⊗_{𝔖,φ_𝔖}𝔖` is free of rank `p` over O₀ because `φ_𝔖` is finite free of rank p. In particular `O₀≠O_K`. Worked instance of case (ii): `K=ℚ_p(p^{1/p})`, `π=p^{1/p}`, `E=u^p−p`, `θ_𝔖(u)=p`, `J=(u−p)`, `φ_𝔖(u−p)=E`, `O₀=ℤ_p`. Choose `c∈ℤ_p` with c and c−1728 units (any unit c if `p≤3`) and put `j=c+π`; then `j∉ℤ_p` because `[K:ℚ_p]=p>1`. The curve `y²+xy=x³−36x/(j−1728)−1/(j−1728)` over `O_K` has `c₄=j/(j−1728)`, discriminant `j²/(j−1728)³`, which is a unit, and j-invariant `j`; it has good reduction. Functorial scheme descent also descends the origin: apply the descended functor to the section `Spf O_K→𝔈`, where `𝔈` is the p-adic completion of this elliptic curve. The base object descends to `Spf ℤ_p`, and preservation of identity and composition makes the descended morphism a section. The resulting pointed smooth proper genus-one formal curve over `ℤ_p` has the relatively ample line bundle of its origin divisor. Formal GAGA algebraizes it, together with its section, to an elliptic curve over `ℤ_p` with the same j-invariant, forcing `j∈ℤ_p`. (BMS2 (Publ. IHÉS), Remark 11.16, p.307; BMS2 (Publ. IHÉS), Remark 11.14, p.305). *Needs:* *Frobenius-twisted relative trace complex* (§AI.7.3); *Bott-inverted Breuil–Kisin descent* (§AI.7.3); *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1); *Relative cyclotomic traces over the sphere polynomial ring* (§AI.7.2); *Perfectoid trace coefficient calculation* (§AI.7.2); *Quasisyntomic unfolding of the trace coefficient sheaf* (§AI.7.2); *Absolute trace comparison with AΩ* (§AI.7.2); *Characteristic-p trace and crystalline comparison* (§AI.7.2); *Relative trace specializations of the sphere polynomial base* (§AI.7.2); *Relative Breuil–Kisin trace coefficients* (§AI.7.2); *Relative quasiregular evenness and descent* (§AI.7.2); *Bott inversion and Frobenius descent input* (§AI.7.2); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4 (*The Breuil–Kisin coefficient rings 𝔖, 𝒪_ℰ, 𝔖^ur, 𝒪 and S*); AdicSpacesPartIII, F0 (*Grothendieck’s algebraization theorem (formal GAGA)*); Mathlib `WeierstrassCurve.j`.

**Checks.**

- For `K=ℚ_p(p^{1/p})`, `π=p^{1/p}`: `O₀=ℤ_p`, `O_K` is free over `ℤ_p` on `1,π,…,π^{p−1}`, and the elliptic curve of the proof has `j=c+π`, which is not in `ℤ_p`.
- Functorial descent carries the composite of the origin with the structure morphism to the identity of `Spf ℤ_p`; a descent of only the unpointed object would not supply this section.
- For `K=ℚ_p` with `π=p (E=u−p)` case (i) applies: `W(k₀)[π^p]=ℤ_p=O_K`, so no elliptic curve with `j∈O_K∖W(k₀)[π^p]` exists, and the non-descent comes from the fact that (u−p) is not generated by a power series in `u^p`.

### AI.7.4 Specializations of Breuil–Kisin cohomology

**Breuil–Kisin A_inf base change** (`CohomologicalBK.ainfBaseChange`). For qcqs smooth `𝔛/O_K` there is a natural Frobenius-compatible equivalence of `E∞-A_inf-algebras RΓ_𝔖(𝔛)⊗̂^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C)`. The tensor product is (p,u)-completed, and `f` acts by Witt Frobenius and `u↦[π^♭]^p`. On an affine SpfR this is the `AΩ` comparison of the trace construction in BMS2 Theorem 11.2(1). For proper `𝔛` the tensor product is ordinary, by *Perfect complex and cohomological Breuil–Kisin modules* below.

Standing hypotheses (BK); `𝔛` smooth and qcqs.

The twisted comparison is *Frobenius-twisted relative trace complex*, BMS2 Corollary 11.12(1) (pp.304–305). Descend it along `φ_𝔖` using *Bott-inverted Breuil–Kisin descent*: `gφ_𝔖=f` and Witt Frobenius on `A_inf` is an automorphism, so untwisting the same equivalence gives `D_𝔖(R)⊗̂_{𝔖,f}A_inf≃AΩ_{R⊗̂O_C}`, with its specified Frobenius, functoriality and `E∞` products (BMS2 Theorem 11.2(1), p.298, proof p.306). For qcqs `𝔛` use the sheaf construction of cohomology. Here is the boundedness needed for global base change: smooth formal schemes over `O_K` are locally noetherian of finite dimension; a qcqs one has a finite affine cover with finite affine refinements of overlaps. On these affines the complexes are connective, with a uniform finite cohomological bound furnished by smooth dimension and the Hodge–Tate reduction of the twisted trace complex. Modulo `(p,u)^n`, derived reduction has a uniform lower bound −2, since `𝔖` is regular of dimension two. A degreewise finite affine hypercover therefore computes each fixed total degree using only finitely many degrees and finite products. Flat `f` commutes with this computation at each finite coefficient level. Taking the compatible completed inverse limits gives the displayed equivalence, without commuting an arbitrary tensor through an unbounded limit. Frobenius compatibility and multiplicativity hold on the affine maps and descend. *Needs:* *Cohomological Breuil–Kisin complex* (§AI.7.3); *Frobenius-twisted relative trace complex* (§AI.7.3); *Bott-inverted Breuil–Kisin descent* (§AI.7.3); *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1); *Flat Breuil–Kisin to A_inf extension* (§AI.7.1); *Absolute trace comparison with AΩ* (§AI.7.2); *Framing independence and sheaf descent* (§AI.3.3); *Completed extension of scalars along a map of adic rings* (§AI.1.5); EnhancedDerivedSheaves, E2, E4.

**Checks.**

- At `SpfO_K` the equivalence is `𝔖⊗̂_{𝔖,f}A_inf=A_inf` with Witt Frobenius.
- The coefficient identities `θ_Af=θ_𝔖` and `θ̃_Af=θ̃_𝔖` distinguish the de Rham and Hodge–Tate reductions.
- Replacing `f` by `g` without untwisting changes the scalar action: the u-image is `[π^♭]`, rather than `[π^♭]^p`.

**Frobenius-twisted Breuil–Kisin de Rham map** (`CohomologicalBK.deRhamBaseChange`). For every smooth p-adic formal scheme `𝔛/O_K` there is a natural equivalence `RΓ_𝔖(𝔛)⊗^L_{𝔖,θ_𝔖}O_K≃RΓ_dR(𝔛/O_K)`, with `θ_𝔖=θ̃_𝔖φ_𝔖`, coefficient Frobenius and `u↦π^p`. At the sheaf level `𝒟_𝔖⊗^L_{𝔖,θ_𝔖}O_K≃Ω̂^•_{𝔛/O_K}` as commutative algebra objects. This is the ordinary derived tensor, with no quasi-compactness hypothesis.

Standing hypotheses (BK).

Apply BMS2 Corollary 11.12(2) (p.304) to `D̂_tw=φ_𝔖^*D_𝔖` and the untwisted coefficient map `θ̃_𝔖`. Associativity of scalar extension gives `θ̃_𝔖φ_𝔖=θ_𝔖`; this is BMS2 Theorem 11.2(2) (p.298, proof p.306). The construction is natural and multiplicative before unfolding, so it gives the stated sheaf equivalence. `O_K` with this `𝔖-action` is finite as an `𝔖`-module: restrict the finite quotient `𝔖/E` along the finite-free `φ_𝔖`. It is perfect because `𝔖` is regular noetherian of dimension two. Tensor with this perfect coefficient object commutes with all derived global sections, giving the unrestricted global assertion. Its ordinary tensor with a derived (p,u)-complete complex is already p-complete, since the scalar quotient identifies the induced adic topology with the `π`-adic topology. For qcqs `𝔛` its extension along `O_K→O_C` is the de Rham specialization of the trace `A_inf` base change, by `θ_Af=θ_𝔖`; this identifies the scalar maps, without requiring an agreement theorem with a different construction. *Needs:* *Cohomological Breuil–Kisin complex* (§AI.7.3); *Frobenius-twisted relative trace complex* (§AI.7.3); *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1); *Finite freeness of the Breuil–Kisin Frobenius* (§AI.7.1); *Breuil–Kisin A_inf base change* (§AI.7.4); DerivedDeRhamCohomology, Layer 2 (ordinary de Rham complexes); EnhancedDerivedSheaves, E4.

**Checks.**

- At `SpfO_K` both sides are `O_K` in degree zero.
- For `K=ℚ_p(p^{1/p})`, `π=p^{1/p}`, the descended map sends `u` to `p`, while the twisted trace comparison sends it to `π`.
- On `O_K⟨t⟩` the target differential is `t^n↦nt^{n−1}dt`; it is not the zero-differential Hodge–Tate reduction along `θ̃_𝔖`.

**Frobenius-normalized Witt specialization** (`CohomologicalBK.crystallineBaseChange`). For qcqs smooth `𝔛/O_K` there is a natural Frobenius-equivariant equivalence `RΓ_𝔖(𝔛)⊗^L_{𝔖,c}W(k₀)≃RΓ_crys(𝔛_{k₀}/W(k₀))`, where `c=φ_W∘constantCoeff`. This is an ordinary derived tensor. The coefficient identity `(A_inf→W(k̄))f=(W(k₀)→W(k̄))c` identifies its scalar extension with the W(k̄)-specialization of the trace `A_inf` equivalence.

Standing hypotheses (BK); `𝔛` smooth and qcqs.

Use BMS2 Corollary 11.12(3) (p.304) for `D̂_tw` along `e₀=constantCoeff`. With `D̂_tw=φ_𝔖^*D_𝔖` the composite is `e₀φ_𝔖=φ_We₀=c`, giving Theorem 11.2(3) (p.299, proof p.306). The comparison is the characteristic-p trace/crystalline map of AI.7.2, not a new identification of abstract groups. Its Frobenius is compatible because `cφ_𝔖=φ_Wc`. Naturality on affines yields the sheaf map and then global sections; W(k₀) through c is a coefficient twist of `𝔖/u` and hence perfect, so the tensor commutes with `RΓ` and is already p-complete. The last coefficient identity holds on Witt constants and on `u`, whose image `[π^♭]^p` vanishes in W(k̄); crystalline base change gives the k̄ comparison. Agreement of this specified trace map with the independently constructed AI.5 comparison is a downstream comparison problem, rather than an input to this theorem. *Needs:* *Cohomological Breuil–Kisin complex* (§AI.7.3); *Frobenius-twisted relative trace complex* (§AI.7.3); *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1); *Characteristic-p trace and crystalline comparison* (§AI.7.2); *Breuil–Kisin A_inf base change* (§AI.7.4); CrystallineCohomology, CR.3 (smooth crystalline base change); EnhancedDerivedSheaves, E4.

**Checks.**

- At `SpfO_K` the result is W(k₀) with its Witt Frobenius.
- For `a∈𝔽_{p²}∖𝔽_p`, `c([a])=[a^p]` differs from [a]; the prime residue field alone cannot detect the missing `φ_W`.
- `c(u)=0`, while `θ_𝔖(u)=π^p≠0`; the crystalline and de Rham maps are distinct.

**Perfect complex and cohomological Breuil–Kisin modules** (`CohomologicalBK.perfectCohomologicalModules`). For proper smooth `𝔛/O_K`, `RΓ_𝔖` is perfect, and every `H^i_𝔖` is a finitely generated (equivalently finitely presented, `𝔖` being noetherian) `𝔖`-module with an isomorphism `(φ_𝔖^*H^i_𝔖)[1/E]≃H^i_𝔖[1/E]`. These are the broad cohomological Breuil–Kisin modules of BMS2 Definition 1.1, potentially with p-torsion. They are not assigned the finite-free Kisin-module classification of R07.4. Consequently, for proper `𝔛`, the completed tensor product of *Breuil–Kisin A_inf base change* (§AI.7.4) is the ordinary derived tensor product, `RΓ_𝔖(𝔛)⊗^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C)`, and the `A_inf` extension of `H^i_𝔖` is `H^i_Ainf` by flatness.

Standing hypotheses (BK). `𝔛` is a proper smooth p-adic formal scheme over `O_K`.

Perfectness by derived reduction modulo (p,u), as in BMS2 Theorem 11.2, footnote 18 (p.299); here use the de Rham comparison: `RΓ_𝔖(𝔛)` is derived (p,u)-complete (cohomology). By *Frobenius-twisted Breuil–Kisin de Rham map* (§AI.7.4), `RΓ_𝔖(𝔛)⊗^L_{𝔖,θ_𝔖}O_K≃RΓ_dR(𝔛/O_K)`, with no completion since `O_K` is a perfect `𝔖`-module through `θ_𝔖`; reducing modulo `π` gives `(RΓ_𝔖(𝔛)⊗^L_𝔖k₀)⊗_{k₀,Frob}k₀≃RΓ_dR(𝔛_{k₀}/k₀)`, which has finite-dimensional total cohomology because `𝔛_{k₀}` is proper and smooth over k₀ (finiteness of the coherent cohomology of a proper scheme over a field). Frobenius of k₀ is bijective, so `RΓ_𝔖(𝔛)⊗^L_𝔖k₀` is perfect over k₀. A derived (p,u)-complete complex over `𝔖` whose derived reduction modulo (p,u) is perfect is perfect: lift a finite free resolution of its derived residue-field reduction degree by degree, and use derived Nakayama on each successive cone. Once the finite Tor-amplitude interval is exhausted the last cone has zero residue-field reduction and is zero by derived completeness. This produces a bounded finite free representative; no finite-generation assertion about an arbitrary inverse limit is needed (DerivedModuleAlgebra §§1.1–1.9, DerivedDeRhamCohomology §§1.14–1.22, complete Nakayama/perfectness criterion). Use noetherianness of `𝔖` and flatness of `φ_𝔖` (finite free of rank `p`) to pass Frobenius to cohomology: the linearized Frobenius of `RΓ_𝔖(𝔛)` is an equivalence after inverting `E` (cohomology and the trace Frobenius décalage identity), and `φ_𝔖^*` and localisation are exact. This is the statement of BMS2 Theorem 1.2(1) for BMS2’s complex. `A_inf` extension: a perfect complex tensored with the `(p,[π^♭])`-adically complete ring `A_inf` is derived complete, so by *Breuil–Kisin A_inf base change* (§AI.7.4) `RΓ_𝔖(𝔛)⊗^L_{𝔖,f}A_inf≃RΓ_Ainf(𝔛⊗̂O_C)`; by flatness of `f` (*Flat Breuil–Kisin to A_inf extension* (§AI.7.1)) `H^i_𝔖⊗_{𝔖,f}A_inf≃H^i_Ainf`. (BMS2 (Publ. IHÉS), Definition 1.1, p.201; BMS2 (Publ. IHÉS), Theorem 1.2(1), p.201; BMS2 (Publ. IHÉS), Theorem 11.2, footnote 18, p.299). *Needs:* *Breuil–Kisin Frobenius décalage identity* (§AI.7.3); *Breuil–Kisin A_inf base change* (§AI.7.4); *Flat Breuil–Kisin to A_inf extension* (§AI.7.1); *Cohomological Breuil–Kisin complex* (§AI.7.3); *Frobenius-twisted Breuil–Kisin de Rham map* (§AI.7.4); *Perfectness of finitely presented A_inf modules* (§AI.2.1); *A_inf module structure theorem* (§AI.2.1); *Primitive rational crystalline Frobenius input* (§AI.5.1); *Length increase under Witt specialization* (§AI.5.2); *Rank and torsion-length comparison* (§AI.5.2); *Finite presentation and adjacent-degree freeness* (§AI.5.2); *p-local freeness from two period realizations* (§AI.2.1); *Cohomology finiteness from period realizations* (§AI.5.2); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4 (*The Breuil–Kisin coefficient rings 𝔖, 𝒪_ℰ, 𝔖^ur, 𝒪 and S*); *Finite freeness of the Breuil–Kisin Frobenius* (§AI.7.1); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4 (*Breuil–Kisin modules with torsion and their structure*); DerivedDeRhamCohomology, §§5.1–5.5, 5.23 (§§5.1–5.5: the quasisyntomic sites, QRSP objects, elementary covers, refinement and sheaf unfolding; *Proper smooth de Rham perfectness*). Only these early site constructions and proper de Rham perfectness are imported, not the period comparisons of DerivedDeRhamCohomology §§5.11–5.15.

**Checks.**

- The perfect complex `[𝔖→ᵖ𝔖]` has `H¹=𝔖/p` and is an explicit counterexample to perfect implies free cohomology.

**Exact cohomological BK to BKF tensor functor** (`CohomologicalBK.bkfTensorFunctor`). For the broad category of finitely presented `𝔖-modules M` with `(φ_𝔖^*M)[1/E]≃M[1/E]`, extension `M↦M⊗_{𝔖,f}A_inf` is an exact symmetric monoidal functor to Layer AI.2’s finitely presented BKF modules. R07.4 supplies BMS1 Proposition 4.3 that M[1/p] is free; f(E) generates `ξ̃`. This identifies the Frobenius structure on `H^i_𝔖⊗A_inf` with the earlier cohomological BKF module.

Standing hypotheses (BK).

Use, from FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4, the category of finitely generated `𝔖`-modules of BMS1 Definition 4.1, with BMS1 Proposition 4.3 (M[1/p] is finite free over `𝔖[1/p]`). Apply BMS1 Proposition 4.32, using *Flat Breuil–Kisin to A_inf extension* (§AI.7.1), *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1) and Layer AI.2’s `ξ̃-linearized` presentation; specialize to *Perfect complex and cohomological Breuil–Kisin modules* (§AI.7.4). The source writes f(E) for the image of `E` under the map `𝔖→A_inf` fixed before Lemma 4.30, which is the map `f` of *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1). The identification of the Frobenius structures on `H^i` (last sentence of the statement) is not part of Proposition 4.32; it uses the Frobenius compatibility of *Breuil–Kisin A_inf base change* (§AI.7.4). (BMS1 (Publ. IHÉS), Proposition 4.32, p.281; BMS1 (Publ. IHÉS), Proposition 4.32, proof, p.281; BMS1 (Publ. IHÉS), Proposition 4.3, p.263; BMS1 (Publ. IHÉS), Lemma 4.30, p.281; BMS1 (Publ. IHÉS), Definition 4.22, p.276). *Needs:* *Perfect complex and cohomological Breuil–Kisin modules* (§AI.7.4); *Flat Breuil–Kisin to A_inf extension* (§AI.7.1); *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1); *Breuil–Kisin A_inf base change* (§AI.7.4); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4; *Breuil–Kisin–Fargues module* (§AI.2.2); *Operations in valid BKF subcategories* (§AI.2.2); *Étale realization of BKF modules* (§AI.2.2); *Fargues classification of finite free BKF modules* (§AI.2.3); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Finite freeness of the Breuil–Kisin Frobenius* (§AI.7.1).

**Checks.**

- Exactness is scalar extension, not a claim that Kisin’s representation-to-lattice functor is exact.

**Breuil–Kisin twist base change** (`CohomologicalBK.twistCompatibility`). Use the rank-one Breuil–Kisin module `𝔖{1}` supplied by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4.15 (`bkModuleStructure`, BMS1 Example 4.2). Its scalar extension along `f` is canonically `A_inf{1}` as a BKF object, compatibly with Frobenius and `G_{K∞}`; powers and dual twists are preserved. This is the first step in BMS1 Corollary 4.33, whose representation-theoretic conclusion belongs to R07.4.

Standing hypotheses (BK). Write `E_r=Eφ_𝔖(E)⋯φ_𝔖^{r−1}(E)`. Import R07.4.15's conormal lines `E_r𝔖/E_r²𝔖`, their transitions divided by `p`, the projections of `𝔖{1}` to these lines and their Frobenius compatibilities. These are the coefficient-level data of its supplied inverse-limit twist; the comparison here uses this same object.

The API:

- `CohomologicalBK.twistCompatibility.line`: identify the trace degree-two line with the supplied conormal twist after coefficient transport, retaining its basis-change unit. The imported twist is free of rank one with localized Frobenius a unit multiple of `1/E`; trace bases use `α/E` of §AI.7.2, with `α↦φ(c)α/c` under rescaling by `c`. The conormal and trace bases differ by the corresponding unit, which scalar extension sends to its image in `A_inf`.
- `CohomologicalBK.twistCompatibility.baseChange`: the maps on conormal lines induced by `f` give the canonical `φ-compatible` equivalence `𝔖{1}⊗_{𝔖,f}A_inf≃A_inf{1}`.
- `CohomologicalBK.twistCompatibility.powers`: the equivalence preserves tensor powers, duals and evaluation; the zeroth power is the unit.
- `CohomologicalBK.twistCompatibility.galois`: `G_{K∞}` fixes `f(𝔖)`, and the equivalence is equivariant for its action on `A_inf{1}`.

Apply `f` to the imported conormal projections and divided transitions. At every finite level `f(E_r)` generates `ξ̃_r=ξ̃φ_A(ξ̃)⋯φ_A^{r−1}(ξ̃)`, so it identifies the conormal lines and their divided transition maps. Use the supplied rank-one normalized bases to compare the limits: for `r>s`, `E_r/E_s` is `p^{r−s}` times a unit modulo `E_s`. Dividing the conormal transition by `p^{r−s}` therefore identifies the rank-one lines after reduction to `𝔖/E_s` (and to `A_inf/ξ̃_s`). Choose compatible bases through these identifications. The source twist and its conormal projections are those of R07.4.15; the source and target rings are the respective inverse limits of these quotients (BMS1 Examples 4.2 and 4.24), so the bases identify the imported line's scalar extension with the intrinsic target line. Thus this step does not interchange arbitrary inverse limits with tensor. It identifies the completed cotangent-line construction of AI.0:integral with the line of BMS1 Example 4.2, as used in the proof of Corollary 4.33. The displayed conormal maps commute with Frobenius and the `G_{K∞}` action; the latter fixes the compatible roots `π^♭` and Witt coefficients. Powers and duals follow from the symmetric monoidal scalar-extension functor. The étale realization after `W(C^♭)` extension is `ℤ_p(1)`, by `A_inf{1}=μ⁻¹(A_inf⊗ℤ_p(1))`. (BMS1 (Publ. IHÉS), Example 4.2, pp.262–263; Example 4.24, pp.276–277; Corollary 4.33 and proof, pp.281–282.) *Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4.15 (`bkModuleStructure`, the twist and its conormal/Frobenius data); FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.4.16 (`kisinPeriodScalarMaps`); *Relative Breuil–Kisin trace coefficients* (§AI.7.2); *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1); *Exact cohomological BK to BKF tensor functor* (§AI.7.4); *Intrinsic Breuil–Kisin twist* (§AI.0:integral.1); *Completed cotangent description of the twist* (§AI.0:integral.1); *Étale realization of BKF modules* (§AI.2.2).

**Checks.**

- The zeroth tensor power extends to `A_inf` with Frobenius `φ_A`.
- A basis with Frobenius a/E, a a unit, extends to Frobenius f(a)/f(E), a unit multiple of `1/ξ̃`; it is the positive twist. Using `E` instead of 1/E reverses the sign.
- The dual line extends to `A_inf{−1}`; `H²` of the formal projective line is `𝔖{−1}` and extends to `H²_Ainf=A_inf{−1}`.
- Étale realization gives `ℤ_p(1)`, consistent with the invariant `μ⁻¹` in `W(C^♭)`; no Frobenius fixed points are taken in `A_inf[1/ξ̃]`.

**Uniformizer-choice transport after A_inf extension** (`CohomologicalBK.choiceTransport`). For two choices `(π,π^♭)` and `(π′,π′^♭)`, extend their respective `𝔖-valued` complexes along the normalized maps f,f′ to the same `A_inf`. Define the transport as the first *Breuil–Kisin A_inf base change* (§AI.7.4) equivalence followed by the inverse of the second, through the intrinsic `AΩ` complex. It is Frobenius compatible and satisfies identity/cocycle; being defined through `AΩ`, it is compatible with products and natural in `𝔛` as far as *Breuil–Kisin A_inf base change* (§AI.7.4) is, and it identifies the specialisations of the two extensions along `θ_A`, `θ̃_A` and `A_inf→W(k̄)`. Descent of a morphism to either `𝔖` is extra structure for derived objects, not a property: by complete-flat-descent, which applies because `f` is p-completely faithfully flat, the `𝔖`-linear maps between derived p-complete complexes are the points of the totalisation of the mapping spaces of their p-completed base changes to the p-completed Čech nerve of `f`; for perfect complexes, as for proper `𝔛`, these base changes are the ordinary ones. For finitely presented `𝔖`-modules, such as the `H^i_𝔖` of a proper `𝔛`, a morphism of the `A_inf-extensions` comes from a unique `𝔖`-linear morphism exactly when its two pullbacks to the p-completion of `A_inf⊗_𝔖A_inf` agree. No `𝔖`-linear identification of unrelated coefficient rings is asserted. The transport is a consequence of the specified trace comparison maps, not a separate assertion of BMS2.

Standing hypotheses (BK). `(π,π^♭)` and `(π′,π′^♭)` are two choices of a uniformizer of `O_K` with a compatible system of p-power roots in `O_C`; `E`, `E′` are their Eisenstein polynomials, `f`, `f′` the normalized maps of *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1), and the two coefficient data are (W(k₀)[[u]],E) and (W(k₀)[[u]],E′). `𝔛` is smooth, quasi-compact and quasi-separated over `O_K`, as in *Breuil–Kisin A_inf base change* (§AI.7.4).

The API:

- `CohomologicalBK.choiceTransport.identity`: Transport for the same choice is the identity under its fixed comparison.
- `CohomologicalBK.choiceTransport.cocycle`: For three choices `transport₍₂₃₎∘transport₍₁₂₎=transport₍₁₃₎`.
- `CohomologicalBK.choiceTransport.descend`: For a fixed `f` and derived p-complete `𝔖-complexes D`, `D′`, the space of `𝔖`-linear maps `D→D′` is the totalisation of the mapping spaces between the p-completed base changes of `D` and `D′` to the terms of the p-completed Čech nerve of `f` (complete-flat-descent); so for derived objects a morphism over `A_inf` descends only together with coherence data on the higher terms. For finitely presented `𝔖-modules M`, `M′` a morphism `M⊗_𝔖A_inf→M′⊗_𝔖A_inf` comes from a unique `𝔖`-linear morphism precisely when its two pullbacks to the p-completion of `A_inf⊗_𝔖A_inf` agree.

Use the intrinsic AI.3/AI.5 functor and *Breuil–Kisin A_inf base change* (§AI.7.4) for both choices. Compose those canonical equivalences and use their naturality; identity and cocycle hold by construction, the transport from choice `i` to choice `j` being `α_j^{-1}∘α_i` for the equivalences `α_i` of *Breuil–Kisin A_inf base change* (§AI.7.4). The descent statements are complete-flat-descent applied to `f`, whose hypotheses are checked in *Flat Breuil–Kisin to A_inf extension* (§AI.7.1). For finitely presented modules the mapping spaces are discrete, so the totalisation is an equaliser; this uses that the p-completed tensor powers of `A_inf` over `𝔖` are flat over `𝔖` (*Flat Breuil–Kisin to A_inf extension* (§AI.7.1), BMS1 Remark 4.31), so that the base changes of the modules stay discrete. (BMS2 (Publ. IHÉS), §1.1, p.200; the transport between two choices is constructed here and is not in the source; BMS2 (Publ. IHÉS), Notation 11.1, p.298; BMS2 (Publ. IHÉS), Theorem 11.2(1), p.298). *Needs:* *Breuil–Kisin A_inf base change* (§AI.7.4); *Flat Breuil–Kisin to A_inf extension* (§AI.7.1); *Classical integral Witt period sheaf* (§AI.3.1); *Classical-to-derived integral period comparison* (§AI.3.1); *Derived p-completed A_inf sheaf* (§AI.3.1); *Integral period sections and profinite products* (§AI.3.1); *Framed q-de Rham model* (§AI.3.3); *Framing independence and sheaf descent* (§AI.3.3); AdicEtaleGeometry, A1; *Perfectness of finitely presented A_inf modules* (§AI.2.1); *A_inf module structure theorem* (§AI.2.1); *Primitive rational crystalline Frobenius input* (§AI.5.1); *Length increase under Witt specialization* (§AI.5.2); *Rank and torsion-length comparison* (§AI.5.2); *Finite presentation and adjacent-degree freeness* (§AI.5.2); *p-local freeness from two period realizations* (§AI.2.1); *Cohomology finiteness from period realizations* (§AI.5.2); DerivedModuleAlgebra, §1.9 (*Complete faithful-flat module descent*).

**Checks.**

- `CohomologicalBK.choiceTransport.point`: For `SpfO_K` every extension identifies with `A_inf` and the transport is its identity.
- `CohomologicalBK.choiceTransport.root_change`: For the same `π` and two compatible systems of roots, `π′^♭=ε^a·π^♭` with `a∈ℤ_p` and `ε=(1,ζ_p,ζ_{p²},…)`, one has `f′(u)=[ε]^{ap}·f(u)`, so `f≠f′` when `a≠0`, while both extensions are identified with the same `AΩ`; for `𝔛=Spf O_K` the transport is the identity of `A_inf` although the two `𝔖`-algebra structures on `A_inf` differ.
- `CohomologicalBK.choiceTransport.different_uniformizers`: For two uniformizers `π≠π′` one has `θ̃_A(f(u))=π` and `θ̃_A(f′(u))=π′`, so `f(u)≠f′(u)`: the transport is not `𝔖`-linear for the identification of the two copies of W(k₀)[[u]] that sends `u` to `u`.
- Choice-independent transport is on the common `A_inf` extension; the unextended rings have explicitly different maps `u↦[π^♭]^p`.

**De Rham torsion divisibility constraint** (`CohomologicalBK.deRhamTorsionDivisibility`). Let `K=ℚ_p(p^{1/p})` with uniformizer `π=p^{1/p}` and `𝔛/O_K` proper smooth. The map `θ_𝔖` has `u↦π^p=p` and factors through `ℤ_p`. Therefore `RΓ_dR(𝔛/O_K)` is the scalar extension of a perfect `ℤ_p-complex`. Each cyclic indecomposable summand of `H^i_dR(𝔛/O_K)_tors` has `O_K-length` divisible by `p`; equivalently it is `O_K/(π^{pa})` for some `a≥1`. The total torsion length is a multiple of p.

Standing hypotheses (BK). Here `K=ℚ_p(p^{1/p})`, `π=p^{1/p}`, so `k₀=𝔽_p`, `W(k₀)=ℤ_p` and `E=u^p−p`; `𝔛` is proper and smooth over `O_K`.

Use *Frobenius-twisted Breuil–Kisin de Rham map* (§AI.7.4) and the *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1) map; take `RΓ_𝔖⊗^L_{u↦p}ℤ_p`. Use `O_K` finite free of ramification degree `p` over `ℤ_p`, so cohomology commutes with this extension. Apply the structure theorem for finitely generated modules over the principal ideal domain `ℤ_p` (Mathlib) to the cohomology of the perfect `ℤ_p-complex`: `ℤ_p/(p^a)` extends to `O_K/(π^{pa})`; uniqueness of the elementary divisors of a finitely generated torsion module over the discrete valuation ring `O_K` is taken from AI.5. (BMS2 (Publ. IHÉS), Remark 1.4, p.202; BMS2 (Publ. IHÉS), Theorem 1.2(2), p.201; BMS2 (Publ. IHÉS), Remark 11.13, p.305). *Needs:* *Frobenius-twisted Breuil–Kisin de Rham map* (§AI.7.4); *Perfect complex and cohomological Breuil–Kisin modules* (§AI.7.4); *Cohomological Breuil–Kisin coefficient maps* (§AI.7.1); *Perfectness of finitely presented A_inf modules* (§AI.2.1); *A_inf module structure theorem* (§AI.2.1); *Primitive rational crystalline Frobenius input* (§AI.5.1); *Length increase under Witt specialization* (§AI.5.2); *Rank and torsion-length comparison* (§AI.5.2); *Finite presentation and adjacent-degree freeness* (§AI.5.2); *p-local freeness from two period realizations* (§AI.2.1); *Cohomology finiteness from period realizations* (§AI.5.2); Mathlib `Module.equiv_free_prod_directSum`; Mathlib `Module.equiv_directSum_of_isTorsion`.

**Checks.**

- For `p=3` a cyclic summand of length 1 or 2 is excluded, while length 3a is allowed.
- For `K=ℚ_p(p^{1/p})`: `O_K/π` is not of the form `M⊗_{ℤ_p}O_K` for a `ℤ_p-module M`, since its length 1 is not divisible by `p`; so not every finitely generated torsion `O_K`-module can occur.

- For `S=ℤ_p[[u]]`, `a=u−p` and the free complex `C=[S → S² → S]` in degrees `0,1,2` with maps `p(a,−p)` and `(p,a)`, the syzygies of `(p,a)` are generated by `(a,−p)`, so `H¹(C)=S/p`. At `u=p`, the maps become `(0,−p²)` and `(p,0)`, giving `H¹(C⊗^L_Sℤ_p)=ℤ_p/p²`, rather than `(S/p)⊗_Sℤ_p=ℤ_p/p`. Cyclic torsion summands must be taken after derived specialization.

### Examples

The Frobenius shifts of the Breuil–Kisin specializations and the divisibility of de Rham torsion
lengths by `p` for `K = ℚ_p(p^{1/p})` (see *Worked examples*).

### Dependencies

Earlier layers: AI.0, AI.0:integral, AI.1, AI.2, AI.3, AI.4, AI.5, AI.6. Other roadmaps: DGAInfinity Layer 8, BordismFormalGroups §F6.5, TangentialBordism §B4 items 2 and 7, AdicEtaleGeometry A1, AdicSpacesPartIII F0, CrystallineCohomology CR.4, DerivedModuleAlgebra §§1.1–1.9, DerivedDeRhamCohomology §§1.14–1.22, DerivedDeRhamCohomology Layer 2, DerivedDeRhamCohomology §§5.1–5.5, 5.23, EnhancedDerivedSheaves E1, EnhancedDerivedSheaves E2, EnhancedDerivedSheaves E4, EnhancedDerivedSheaves E5:abstract, EnhancedDerivedSheaves E5:presentability.2, EnhancedDerivedSheaves E5:spectra-comparison, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4, PerfectoidQuotients §§0.3, 1.3–1.4, PerfectoidSpaces P1. Mathlib: `Module.FaithfullyFlat.lTensor_bijective_iff_bijective`, `Module.FaithfullyFlat.zero_iff_lTensor_zero`, `Module.equiv_directSum_of_isTorsion`, `Module.equiv_free_prod_directSum`, `PowerSeries`, `PowerSeries.HasSubst.X_pow`, `PowerSeries.coeff_subst_X_pow`, `PowerSeries.constantCoeff`, `PowerSeries.constantCoeff_subst_X_pow`, `PowerSeries.expand`, `PowerSeries.map`, `PowerSeries.substAlgHom`, `PowerSeries.substAlgHom_X`, `PreTilt`, `PreTilt.untilt`, `WeierstrassCurve.j`, `WittVector`, `WittVector.fontaineTheta`, `WittVector.frobenius`, `WittVector.frobeniusEquiv`, `WittVector.map`, `WittVector.teichmuller`.

## Worked examples

### The point and the two coefficient reductions

For `𝔛 = Spf O_C`, `AΩ_𝔛` is `A_inf` in degree `0`. Its reduction along `θ` is `O_C`, its
reduction along `θ̃` is `O_C`, and inverting `μ` gives `A_inf[1/μ]`. The two reductions are told
apart by `θ(μ) = 0` and `θ̃(μ) = ζ_p − 1`; at Witt length one `ξ_1 = ξ` and `ξ̃_1 = ξ̃`, and
exchanging the two conventions fails this point. The canonical `B_dR⁺`-deformation of
`Spa(C, O_C)` is `B_dR⁺` in degree `0` and its comparison map is the identity (BMS1, Definition 5.4,
printed pp.46–47; §§8–9, pp.61–79; Definition 13.18 and Theorem 13.19, p.114).

### A torus coordinate and its divided differential

For `R = O_C⟨T^{±1}⟩` the perfectoid cover adjoins all `T^{1/p^m}`. With `q = [ε]`, the divided
group-Koszul differential on `T^n`, for `n ≥ 0`, has coefficient `[n]_q = Σ_{j<n} q^j`, a polynomial in `q`, so
that `d(T^n) = [n]_q T^n dlog_q T`; at `q = 1` it becomes `n` and recovers `d(T^n) = n T^n dlog T`.
For `n < 0`, use the Laurent expression `[n]_q = −q^n[−n]_q`, so at `n = −1` the coefficient is `−q^(−1)` and specializes to `−1`.
The `q`-model is not a commutative differential graded algebra: in characteristic two the
operation `Sq^0` detects it (BMS1, Remark 7.8 and Lemma 7.9, printed pp.58–59; Theorem 9.4,
pp.70–75).

### A redundant infinitesimal coordinate

For `R = C`, the empty set of coordinates gives the envelope `B_dR⁺`. Adding a unit `a` gives an
embedding ideal containing `ξ` and `X_a − ã` for a lift `ã`; the completed envelope acquires a
formal variable in the extra direction, whose de Rham complex in characteristic zero is
contractible. So the cohomology is still `B_dR⁺` and the transition map is an equivalence.
Completing only along `ξ` would fail this before the contraction is applied (BMS1, Construction
13.6, p.106; Lemmas 13.12–13.13, pp.110–112).

### A nodal semistable conic

For the model `XY = πZ²` of a conic over `O_K` with `π` a uniformizer, the node chart is
`O_K⟨x, y⟩/(xy − π)`. The root tower keeps `xy = π` with compatible roots of both coordinates, and
the integral map at the singular point is not flat. The log differential is generated by
`dlog x = −dlog y`. By *Log differentials of a semistable curve* (§AI.6.7), the logarithmic de
Rham cohomology is `O_K` in degrees `0` and `2` and `0` in degree `1`, and the adjacent-degree
freeness criterion identifies its generic-fibre lattice with that of a smooth model of `P¹`.
The example is not in the sources; it applies ČK, §1.5, (1.5.1) and (1.5.3), p.4, Proposition 7.7,
p.70, and Theorem 8.7, p.74, with the root towers of ČK, §3.2, pp.10–11.

### Breuil–Kisin shifts and the torsion obstruction

At the coefficient point the twisted relative trace object is `𝔖^{(−1)}`. Its de Rham map has
identity Witt coefficients and `u ↦ π`; after Frobenius descent the map is `θ_𝔖`, with Witt
Frobenius and `u ↦ π^p`. The crystalline map changes in the same way from `constantCoeff` to
`φ_W ∘ constantCoeff`. For
`K = ℚ_p(p^{1/p})` and `π = p^{1/p}`, the descended de Rham map factors through `ℤ_p`, so
for a proper smooth formal scheme each torsion summand `ℤ_p/p^a` of `H^i(RΓ_𝔖(𝔛)⊗^L_{𝔖,u↦p}ℤ_p)` gives
`O_K/π^{pa}` in de Rham cohomology, and the `O_K`-length of the de Rham torsion is divisible by
`p` (BMS2, Theorem 1.2 and Remark 1.4, published pp.201–202; Remarks 11.16–11.17, pp.307–308).

## Downstream consumers

- **PrismaticCohomology** consumes AI.1 décalage and Bockstein/Koszul calculations, AI.2 BKF modules and minuscule linear algebra, and AI.3–AI.4 `AΩ` with its integral Hodge–Tate, de Rham and crystalline maps. It owns all comparisons with its sites and crystals: the minuscule BKF/Dieudonné dictionary and its crystalline-realization application; the identification of relative `π₀TP` with the Nygaard-completed Frobenius twist; coordinate crystalline, infinitesimal-period and HKR/divided-Frobenius compatibility; trace/prismatic Breuil–Kisin agreement; and agreement of the smooth specialization maps. The last comparisons consume the explicit trace construction, Frobenius and specializations of AI.7, rather than defining them here. Sources for that downstream interface are ALB §4.3, Proposition 4.3.5 (v4 p.48), and BS22 Proposition 15.7, §17, Theorem 17.2 and §18 (v4 pp.105,117–124).
- **PadicHodgeTheory** consumes the integral twists and coefficient maps of AI.0:integral, the pro-étale sheaves, primitive comparison, geometric structure-sheaf calculation and constant-coefficient rational comparison of AI.3.1, and the proper specializations and lattice statements of AI.4–AI.6. Its general de Rham-local-system theory builds on these exports.
- **CohomologyComparisons**: the specialization dictionary of AI.0, the local and proper comparison
  maps of AI.4–AI.5, the torsion and lattice statements of AI.5 and AI.6, and the lattice recovery
  of AI.2, for the rational and integral comparison theorems of proper smooth rigid spaces.
- **HabiroCohomologyFoundations**: the décalage functor and its Koszul computations (AI.1) and the
  `q`-de Rham model (AI.3).
- **RefinedTraceMethods**: the perfectoid coefficients of AI.0, décalage (AI.1) and the absolute
  trace computations of AI.7.
- **HeckeStacksAndLocalShtukas**: Fargues' classification (AI.2).

## References

- **BMS1**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Integral p-adic Hodge theory*, Publ. Math. IHÉS 128 (2018), 219–397. Cited by the page numbers of [arXiv:1602.03148v3](https://arxiv.org/abs/1602.03148v3) ("arXiv v3") or of the [published version](https://www.numdam.org/item/10.1007/s10240-019-00102-z.pdf) ("Publ. IHÉS").
- **BMS2**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Topological Hochschild homology and integral p-adic Hodge theory*, Publ. Math. IHÉS 129 (2019), 199–310. Cited by the page numbers of [arXiv:1802.03261v2](https://arxiv.org/abs/1802.03261v2) ("arXiv") or of the [published version](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf) ("Publ. IHÉS").
- **ČK**: Kęstutis Česnavičius and Teruhisa Koshikawa, *The A_inf-cohomology in the semistable case*, Compos. Math. 155 (2019); cited from [arXiv:1710.06145v3](https://arxiv.org/abs/1710.06145v3), whose pagination 1–78 is used.
- **BS22**: Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*, Ann. of Math. 196 (2022); cited from [arXiv:1905.08229v4](https://arxiv.org/abs/1905.08229v4).
- **SW20**: Peter Scholze and Jared Weinstein, *Berkeley lectures on p-adic geometry*, Ann. of Math. Stud. 207 (2020); printed page `=` PDF page − 10.
- **Sch13**: Peter Scholze, *p-adic Hodge theory for rigid-analytic varieties*, Forum Math. Pi 1 (2013), e1; [author copy](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeTheory.pdf), and the [corrigendum](https://www.math.uni-bonn.de/people/scholze/pAdicHodgeErratum.pdf) (Sch13-corr), whose corrected pro-étale covering definition (item (1), p.1) and structural de Rham period sheaf, with its integral p-adic tensor completion and strengthened toric computation (item (3), pp.1–2), are used throughout.
- **Zav**: Bogdan Zavyalov, *Mod-p Poincaré duality in p-adic analytic geometry*, [arXiv:2111.01830v3](https://arxiv.org/abs/2111.01830v3).
- **ALB**: Johannes Anschütz and Arthur-César Le Bras, *Prismatic Dieudonné theory*, Forum Math. Pi (2023); [arXiv:1907.10525v4](https://arxiv.org/abs/1907.10525v4), with the [erratum](https://lebras.perso.math.cnrs.fr/Erratum_PDT.pdf) (ALB-err).
- **BLM**: Bhargav Bhatt, Jacob Lurie and Akhil Mathew, *Revisiting the de Rham–Witt complex*, Astérisque 424 (2021); [author copy](https://www.math.ias.edu/~lurie/papers/Crystalline.pdf).
- **KN22**: Achim Krause and Thomas Nikolaus, *Bökstedt periodicity and quotients of DVRs*, Compos. Math. 158 (2022), 1683–1712; [published version](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/34286689D8EC1F3D33AFDEDEC3FAD554/S0010437X22007655a.pdf/bokstedt_periodicity_and_quotients_of_dvrs.pdf).
- **NS**: Thomas Nikolaus and Peter Scholze, *On topological cyclic homology*, [author copy](https://people.mpim-bonn.mpg.de/scholze/CyclotomicSpectra.pdf).
- **AR05**: Vigleik Angeltveit and John Rognes, *Hopf algebra structure on topological Hochschild homology*, Algebraic & Geometric Topology 5 (2005), 1223–1290, [paper](https://msp.org/agt/2005/5-3/agt-v5-n3-p14-s.pdf).
- **BMMS**: Robert Bruner, J. Peter May, James McClure and Mark Steinberger, *H∞ ring spectra and their applications*, LNM 1176 (1986).
- **Stacks**: The Stacks Project Authors, [*The Stacks Project*](https://stacks.math.columbia.edu), cited by tag.

Further works are cited at individual targets through the sources above: A. Beilinson, *On the crystalline period map* (arXiv:1111.3316v4); `K`. Kato, *Logarithmic structures of Fontaine–Illusie* and *Toric singularities*; `O`. Gabber and `L`. Ramero, *Almost ring theory* (LNM 1800); `K`. Fujiwara and `F`. Kato, *Foundations of rigid geometry I*; `R`. Huber, *Étale cohomology of rigid analytic varieties and adic spaces*; `P`. Ullrich, *The direct image theorem in formal and rigid geometry*; `M`. Raynaud and `L`. Gruson, *Critères de platitude et de projectivité*; `T`. Tsuji, *p-adic étale cohomology and crystalline cohomology in the semi-stable reduction case*; A. Grothendieck, *EGA* III and IV; `T`. Nikolaus and `P`. Scholze, *On topological cyclic homology*; `M`. Bökstedt's computation of `THH(𝔽_p)`.
