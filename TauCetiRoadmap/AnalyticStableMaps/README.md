# Roadmap: analytic stable maps and their implicit atlases

**Summary.** This roadmap constructs the analytic moduli theory of stable pseudoholomorphic maps from compact nodal complex curves to a closed symplectic manifold with an arbitrary tame almost complex structure. From the pinned almost-complex, symplectic-form, pseudoholomorphicity and Sobolev carriers and from ComplexCurveModuli's nodal domain families it builds the linear floor (energy and area identities, the local coincidence lemma, determinant lines and the closed Riemann–Roch index; Layer 0), the normalization of every nonconstant closed curve through a simple curve (Layer 0), prestable maps with their retained-arrow groupoid and the map-dependent stability theorem (Layer 1), the moving-domain Sobolev carriers, node matching, anchor slices, index formulas and the generic-J smooth-simple manifold theorems, including their arbitrary-target extension (Layer 2), the Hausdorff second-countable stable-map topology and the all-genus Gromov compactness theorem with its parameter-family version (Layer 3), nodal linearization, weighted ends and finite-dimensional obstruction data (Layer 4), Pardon's thickening data and the topology of the thickened spaces (Layer 5), uniform weighted gluing estimates and the Newton gluing with its topological projection charts (Layers 6–7), canonical orientations (Layer 8), the verification of every implicit-atlas axiom and the rational dual-Čech functional through ImplicitAtlases (Layer 9), families and choice comparisons (Layer 10), evaluation, forgetting and clutching maps (Layer 11), joint reductions for diagonal identities (Layer 12) and the target comparison maps that Gromov–Witten theory consumes (Layer 13). The end theorems are the normalization theorem, the stability theorem, the generic-J smooth-simple manifold theorem, the all-genus compactness theorem, the topological regularity theorem for thickened moduli spaces and the implicit-atlas axioms with their canonical orientation.

## Scope and ownership

Write X for the symplectic target, C for a possibly nodal source, g for arithmetic genus, n for the number of ordered marks and β for an integral class in ordinary degree-two homology. A stable map may have an unstable pointed nonconstant sphere or torus: the finiteness of its map automorphism group, not pointed-domain stability of every component, is the relevant condition. Every automorphism arrow is retained, including ineffective ones. The coarse space of stable maps need not be a manifold, an orbifold, locally contractible or of finite CW type.

This roadmap owns:

- the half-normalized Cauchy–Riemann section on the pinned carriers, the energy–area–Chern identities on closed normalization components, the signed integer virtual dimension, the local coincidence lemma for two branches of pseudoholomorphic curves, the determinant-line functor with the closed real Cauchy–Riemann Riemann–Roch index and its complex orientation, and the normalization of a nonconstant closed curve through a simple curve, with its degree, class and genus identities (Layer 0);
- prestable maps on nodal domains, their retained-arrow groupoid, descent to the nodal quotient, the class of a map, and the theorem that the map automorphism group is finite exactly when every constant component is pointed stable (Layer 1);
- finite-regularity almost-complex parameter spaces and the fixed-domain completion comparison, bundle-valued Sobolev map spaces on normalization strata, point evaluation and the node-matching subspace, domain-deformation transitions with their derivative budgets, the smooth zero-node carriers, the early index, localized universal surjectivity, anchor-slice projections, the proper Hausdorff solution quotient, the generic-J smooth-simple manifold theorems for moving domains, specified fixed complex structures, ordered marks, fixed incidence and relative families, and the extension of the smooth-simple branch to arbitrary finite-dimensional Hausdorff second-countable symplectic targets (Layer 2);
- the bubble-openness lemma, the Hausdorff-graph topology on stable maps, its Hausdorffness and global second countability, the energy threshold, the map-stable anchor adapter, the simultaneous covering and global parametrization used in the compactness proof, and the all-genus Gromov compactness theorem with its parameter-family version (Layer 3);
- nodal linearization, the nodal and augmented index, the weighted-end Fredholm theory with constant-mode extension on node ends, and finite-dimensional equivariant obstruction data supported away from nodes and marks (Layer 4);
- the thickening data and the thickened moduli spaces with their topology and local comparison (Layer 5), the uniform weighted gluing analysis (Layer 6), Newton gluing, surjectivity onto neighbourhoods and the topological projection charts (Layer 7), canonical orientations and their choice comparisons (Layer 8), the verification of the implicit-atlas axioms and the resulting rational dual-Čech functional (Layer 9), families and choice comparisons (Layer 10), evaluation, forgetting and clutching maps (Layer 11), joint reductions (Layer 12) and target comparisons (Layer 13).

What it builds on, and does not plan again:

- **Mathlib and Tau Ceti at the pins.** The almost-complex structure, symplectic-form, taming, compatibility and pseudoholomorphicity predicates, the standard-complex-line energy, scalar Sobolev spaces, Fredholm operators and their index, Sard–Smale for Fredholm maps, and the compact-Riemann-surface degree and ramification theory. The adapters that make bundle-, surface-, node- and parameter-valued versions of these are constructed here on those carriers; no private generic analysis vocabulary replaces them.
- **HeegaardFloer**, as it stands on main: Lane F1 items 1–3 (Sobolev spaces of maps of surfaces with multiplication for `kp>2` and trace, the Calderón–Zygmund interior estimate with bootstrapping, linear Cauchy–Riemann operators as Fredholm operators between Sobolev completions) and Lane F2 items 2–5 (local theory of pseudoholomorphic curves with unique continuation, isolated critical points and somewhere injectivity; mean-value inequalities, monotonicity and removal of singularities on fixed genus-zero domains; transversality through universal moduli spaces and Sard–Smale; gluing with pregluing, uniformly bounded right inverses, quadratic estimates and Newton iteration on fixed genus-zero domains). HeegaardFloer states no closed-surface determinant-line functor, no closed Riemann–Roch index, no finite-regularity almost-complex parameter spaces, no fixed-domain completion comparison, no coincidence lemma for two branches and no sphere model: Layer 0 and Layer 2 state them here. HeegaardFloer's scope is fixed genus-zero domains and bordered problems; this roadmap owns moving domains, node matching and weights, all-genus compactness and uniform nodal gluing, and HeegaardFloer consumes nothing from it.
- **PDE**, Lanes A and B: scalar weak Sobolev spaces, density, trace and extension, and the Rellich floor.
- **ComplexKahlerGeometry** K1 (pointwise complex orientation and integrability calculus), K5 (compact Hermitian elliptic theory, Dolbeault cohomology and Serre duality on compact components) and K7 (projective carriers), each on its own hypotheses. The target J here need not be integrable; an integrable-target unfolding result does not substitute for the general-J proof.
- **ComplexCurveModuli**: normalization and flags, prestable analytic nodal families, the stable pointed chart groupoid and its universal curves, plumbing and Hardy deformation charts, properness, domain operations and the late Orbifolds adapter. It retains unstable domains and their positive-dimensional automorphisms and the integrability equations and bracket conventions of its families; this roadmap owns map-dependent stability, incidence slices and map reductions.
- **ImplicitAtlases** Layers 0–7 and **TopologicalSheafCohomology** Layers 0–2: the generic topological chain and sheaf theory, purity, orientation sheaves, the global relative trace, the dual-Čech virtual functional and the transverse fiber-product extension. This roadmap supplies all atlas data before applying them and constructs the analytic joint-model inputs of ImplicitAtlases Layer 7, not a second engine.
- **DifferentialGeometry** 8.3–8.5 (smooth singular chains, integration and the de Rham comparison), **CharacteristicClasses** C3 (integral Chern classes), **AlgebraicTopology** Stages 6–8 (ordinary cohomology, universal coefficients, duality, Euler characteristic, finite CW type of compact smooth manifolds) and **GeometricTopology**'s smoothing-and-triangulation comparison item 1 (smooth triangulation of a compact smooth manifold): consumed with their own naturality and orientation hypotheses for target realization only.
- **Orbifolds** O1–O5: used only in §13.3's late domain-target adapter after analytic domain properness; it is not an input to the topology, compactness, reductions or gluing of Layers 0–12.
- **MorseNovikov** N1: the generic completed Novikov coefficient ring. The Gromov–Witten development owns its curve-class, Chern and area specialization, the cohomology-valued operations, descendants and all axioms; it consumes the maps, orientations, families and joint data constructed here.
- **FuchsianOrbifolds** Layer 5 item 3: the branched-cover Euler-characteristic formula and Riemann–Hurwitz for finite holomorphic maps of compact Riemann surfaces.

No semipositivity or genericity of J is imposed on the stable-map and virtual construction. Genericity is imposed only on the separate unaugmented smooth-simple branch of Layer 2. The nodal gluing conclusion of Layer 7 is a topological manifold and projection model on the regular thickening; smooth nodal transition maps are not part of it.

## Conventions

| Item | Convention |
| --- | --- |
| Target | X compact, boundaryless, Hausdorff, second countable, of real dimension 2m, with a smooth two-form ω satisfying the pinned `SmoothTwoForm.IsSymplectic` and a smooth almost complex structure J with `ω.Tames J`; neither integrability nor genericity of J is assumed. Layer 2's arbitrary-target branch drops compactness only. |
| Parameters | P a compact finite-dimensional smooth manifold with corners; a family is a smooth map `p ↦ J_p` of tame structures, relative to prescribed parameter collars and faces |
| Source | A compact nodal complex curve of arithmetic genus g with n ordered marks, given by its normalization components, paired node flags and marks as in ComplexCurveModuli D1 |
| Cauchy–Riemann section | `∂̄_J u = (du + J∘du∘j)/2`, identified with the pinned intertwining predicate `IsPseudoholomorphic`; Wendl's unhalved `Tu + J∘Tu∘j` is twice this section and every estimate taken from that source is transported by the explicit factor 2 |
| Regularity | Pseudoholomorphicity is the pinned derivative-level predicate; smoothness of a component map is a separate hypothesis wherever it is used, since the pinned predicate carries no elliptic regularity |
| Energy | The pinned standard-complex-line energy with its half-density convention; area is `ω(β)`; on a closed smooth component `E(u) = ∫u*ω = ⟨[ω], u_*[Σ]⟩` is a theorem of §0.1, not a definition |
| Virtual dimension | The signed integer `v = 2((m−3)(1−g) + ⟨c₁(TX,J),β⟩ + n)`; never a natural-number truncation and never `6g−6+2n` read off an empty unstable-domain moduli space |
| Marks and anchors | Original marks are ordered; auxiliary anchors and incidence marks are finite sets, unordered unless stated, and are never identified with original marks |
| Node ends | Cylindrical coordinates `z = e^(s+it)` with t of period 2π, so the spectral gap of `−J∂_t` on the circle is 1; weights `δ ∈ (0,1)`; the constant Fourier mode is the normalized circle average (§6.1) |
| Orientations | Determinant lines are ordered as written in §8.1: domain deformation, map, node matching, marks, obstruction summands, parameter first in families; obstruction summands commute with the sign `(−1)^(dim E_i · dim E_j)`; family boundaries carry the outward-first convention |
| Coefficients | Obstruction representations are real; the virtual functional is rational; integral homology classes retain torsion |

Signs are read in ℤ/2 and reduced modulo 2 before any truncation. Set-sized ambient collections carry explicit universe bounds.

## Exact supplier contracts

### From Mathlib

- `ContinuousLinearMap.IsFredholm` (Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean): finite-dimensional kernel and cokernel with closed range for a bounded operator between normed spaces, and `LinearMap.index` with `IsFredholm.index_comp`. Every Fredholm statement below is about these; no private Fredholm predicate is introduced.
- `ContinuousLinearMap.isClosed_ker`, `ContinuousLinearMap.pi` and the Banach open-mapping and inverse-function theorems: the kernel of the branch-difference map of §2.2 is closed, and the Newton gluing of §7.1 uses the pinned Banach fixed-point theorem.
- Singular homology, `AlgebraicTopology.singularHomologyFunctor` (Mathlib/AlgebraicTopology/SingularHomology/Basic.lean), absolute and with integral coefficients: the carrier of the classes `u_*[Σ]` and β in `H₂(X; ℤ)`. No relative class is used anywhere below; the relative theory is Tau Ceti's TauCeti/AlgebraicTopology/Singular/Relative.lean and is not consumed. The fundamental class `[Σ]` of a closed oriented surface is AlgebraicTopology Stage 6 item 3. `Module.finrank`, `Matrix.SpecialLinearGroup` and the quotient-group topology, `OnePoint ℂ`: carriers of dimensions and the genus-zero domain model.
- `MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero` (Mathlib/MeasureTheory/Function/Jacobian.lean): the image of a set on which a differentiable map `E → E` of a finite-dimensional space has singular derivative has Haar measure zero. This equal-dimension Sard theorem is the only finite-dimensional Sard statement consumed here (§1.2 and §5.1 apply it, as Pardon Lemma 9.2.7 does, to `π∘f` with π a local projection to `T_pN`); the general Morse–Sard theorem is Tau Ceti's `ContDiff.addHaar_image_criticalPoints_eq_zero` and `ContDiff.dense_compl_image_criticalPoints` (TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean) and is not needed.
- Baire category on complete metric spaces and the countable-intersection lemma: the smooth-J residual theorems of §2.13 and §2.19 are countable intersections of dense open sets in a complete metrizable space.

### From Tau Ceti

- `SmoothAlmostComplexStructure` (TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean), `SmoothTwoForm.IsSymplectic`, `SmoothTwoForm.Tames` and `SmoothTwoForm.Compatible` (TwoForm.lean), `IsPseudoholomorphicAt` and `IsPseudoholomorphic` (JHolomorphic.lean): the target data and the derivative-level pseudoholomorphicity predicate, a `HasMFDerivAt` witness intertwining the two structures and nothing more. `SmoothAlmostComplexStructure` has at the pin only the constant, negated and product constructors: no almost complex structure of a complex manifold, so a compact Riemann surface is not yet a domain carrier at the pin, and `Suggested.lean` says so.
- `stdComplexLineEnergyDensity` and `stdComplexLineEnergy` (Energy.lean): the pointwise and integrated energy of a map from the standard complex line, half-density convention. §0.1 constructs the chart and gluing-to-closed-surface adapter.
- `Wkp` (TauCeti/Analysis/Sobolev/Wkp/Basic.lean) with the W1p, trace, extension, Rellich–Kondrachov, Morrey and density modules of TauCeti/Analysis/Sobolev: scalar real Sobolev spaces on open subsets of Euclidean space, with finite-p completeness and density theorems. They are not bundle-valued or manifold-valued mapping spaces, and their higher-order `p=2` norm is not literally Hilbert: §2.2 builds the bundle adapters and uses Banach arguments or explicitly equivalent Hilbert norms.
- `exists_mem_nhds_isClosed_isNowhereDense_image_criticalPoints`, `isMeagre_image_criticalPoints_of_isFredholm` and `dense_compl_image_criticalPoints_of_isFredholm` (TauCeti/Analysis/Fredholm/SardSmale.lean), with the normal-form, closed-range, adjoint, restriction, parametric and universal-level-set modules of TauCeti/Analysis/Fredholm: Sard–Smale for a map between Banach spaces, defined on an open subset U of a complete second-countable normed space, that is `C^n` at every point of U with Fredholm derivative and satisfies the pointwise threshold `(dim ker df_x)² + 1 ≤ n` on U; the critical values form a meagre set and the regular values are dense, and the local form gives a neighbourhood of any such point on which the critical values are closed and nowhere dense. The threshold is not Smale's classical `n > max(index, 0)`: no pinned declaration states that one, and §2.12 budgets the differentiability by a kernel-dimension bound accordingly. Also the kernel and cokernel bookkeeping of a Fredholm operator with finitely many appended parameters. Every genericity theorem of Layer 2 states its own differentiability budget before invoking them, and transports the Banach-space statement to the Banach manifolds of §2.7 through their countable chart covers and the separability of §2.2.
- `FiniteHolomorphicMap`, `localMultiplicity`, `fiberMultiplicitySum`, `degree`, `fiberMultiplicitySum_eq_degree`, `degree_comp`, `FiniteHolomorphicMap.ofMDifferentiable` and `biholomorphOfDegreeEqOne` (TauCeti/Analysis/Complex/RiemannSurface/Degree.lean), `ramificationDegree`, `ramificationDivisor` and `degree_ramificationDivisor` (Ramification.lean): finite holomorphic maps between compact Riemann surfaces, their fibre-independent degree, multiplicativity under composition, the degree-one biholomorphism and the ramification divisor. §0.5 compares the branched cover `π : Σ → Σ₀` with this carrier. No Riemann–Hurwitz theorem is at the pin; it comes from FuchsianOrbifolds below.

### From TauCetiRoadmap.HeegaardFloer

- Lane F1 item 1: Sobolev spaces `W^(k,p)` of maps of surfaces, multiplication for `kp>2`, trace. Lane F1 item 2: the Calderón–Zygmund interior estimate and elliptic bootstrapping. Lane F1 item 3: linear Cauchy–Riemann operators on discs and strips as Fredholm operators between Sobolev completions. Consumed as the local elliptic floor of §0.1, §0.2 and §2.2.
- Lane F2 item 2: unique continuation, isolated critical points and somewhere injectivity of pseudoholomorphic curves on connected domains (McDuff–Salamon Chapter 2). Lane F2 item 3: mean-value inequalities, monotonicity and removal of singularities for finite-energy pseudoholomorphic maps on punctured fixed genus-zero domains; its scope is fixed genus-zero domains and it supplies no varying-domain or stable-map statement. Lane F2 item 4: universal moduli spaces and Sard–Smale via somewhere injectivity on fixed domains; Layer 2 constructs the all-genus moving-domain application. Lane F2 item 5: pregluing, uniformly bounded right inverses, quadratic estimates and Newton iteration on fixed domains; Layers 6–7 construct the nodal weighted version. Lane F2 item 1: the definitions of tame and compatible structures, consumed with the pinned predicates.

### From TauCetiRoadmap.PDE

- Lane A: scalar weak Sobolev spaces on domains, density, trace and extension. Lane B: Rellich compactness and the Calderón–Zygmund estimate in general dimension. Consumed through the pinned `Wkp` modules and HeegaardFloer Lane F1.

### From TauCetiRoadmap.ComplexCurveModuli

- D0 item 1: the smooth classification of compact oriented surfaces, fixing closed connected genus-g source models. D0 item 3: the genus-zero model on `OnePoint ℂ` with its Möbius group and triple normalization, and the genus-one period and lattice model with its retained finite stabilizer. D0 item 5: properness of the diffeomorphism action on stable marked smooth curves and finiteness of their automorphism groups.
- D1: normalization, paired flags and retained arrows of nodal curves. D3 item 5: holomorphic marked deformation slices, the full Sobolev chart of complex structures, the offset implicit-function theorem over an arbitrary finite-dimensional complex complement with derivative `2j₀(∂̄ξ + η)` and its jointly moving-mark formulation. D4: Hardy gluing and universal plumbing charts. D5: the countable stable pointed chart groupoid and its C∞ parameter topology. D6 item 1: `roundAnnulusNormalization`, `annulusModulusFamilyComparison`, `protectedCollarAnnulusInterpolation` and `nodalAnnulusBranchLimit`, and the equivalence of Deligne–Mumford convergence with convergence in universal charts. D6 item 4: `finiteActionUniversalChart` and `unorderedAuxiliaryActionChart`. D7 item 1: forgetting and contraction with ordered and setwise arrow descent, `forgetAuxiliarySet` and `forgetPartitionedAuxiliarySet`. D7 item 3: external and self-clutching of domains. D8: the late Orbifolds target adapter of the stable-domain groupoid.

### From TauCetiRoadmap.ImplicitAtlases

- Layer 1 (§1.1–1.4): the implicit-atlas axioms, boundary atlases, subatlases and reindexing. Layers 2–4: deformation spaces, virtual cochain complexes, the orientation sheaf, purity and the rational virtual class with finite-subatlas independence. Layer 5 (§5.2–5.4): boundary and cobordism law, refinements and shrinkings, pushforward. Layer 6: cell-like stratified atlases and products. Layer 7: transverse fiber products and the application interface, consumed with the joint models of Layer 12 supplied as inputs.

### From TauCetiRoadmap.TopologicalSheafCohomology

- Layers 0–2: constant-ring adapters, bounded-below derived sections, compact Hausdorff Čech and derived comparisons and proper finite-fibre stalks, consumed through ImplicitAtlases' use of them and in §13.1.

### From the remaining roadmaps on main

- ComplexKahlerGeometry K1 (pointwise complex orientation and type calculus), K5 (compact elliptic theory, Dolbeault cohomology and Serre duality on compact components, used for the point-constrained cokernel identification of §3.6 and the normal cokernel of §2.23), K7 (the projective carrier `ℂP²` with its Fubini–Study form, used in §3.8).
- DifferentialGeometry 8.3–8.5: smooth singular chains, Stokes for chains and the de Rham comparison. CharacteristicClasses C3: integral Chern classes and their naturality. AlgebraicTopology Stage 6 item 1 (singular cochains and universal coefficients), Stage 7 item 1 (Euler–Poincaré for finite CW type) and Stage 8 item 7 (finite CW type of compact smooth manifolds). GeometricTopology, smoothing-and-triangulation comparison item 1: smooth triangulations.
- Orbifolds O1–O5: retained-arrow orbifold charts, coarse triangulation, orbibundles and the weighted rational pairing, consumed only in §13.3.
- MorseNovikov N1: the period-controlled completed group ring, named in §13.4 as the coefficient ring of the downstream development.
- FuchsianOrbifolds Layer 5 item 3: `χ(X) = degree(f)·χ(Y) − ramificationDegree(f)` and Riemann–Hurwitz for a finite holomorphic map of compact Riemann surfaces.

## How to read the build

Layer 0 fixes the analytic conventions on the pinned carriers and proves the linear and local floor: energy and area identities, the coincidence lemma, determinant lines with the closed index, and the normalization theorem for nonconstant closed curves. Layer 1 defines prestable maps and proves the stability theorem. Layer 2 constructs the moving-domain Sobolev carriers and proves the generic-J smooth-simple manifold theorems, including the arbitrary-target branch; none of it uses compactness of moduli spaces or gluing. Layer 3 constructs the stable-map topology first and proves global second countability and all-genus compactness, independently of any atlas or gluing chart. Layers 4–8 build the nodal linear theory, the thickening data, the uniform weighted gluing and its topological projection charts, and the canonical orientations. Layer 9 verifies the implicit-atlas axioms and applies ImplicitAtlases to obtain the rational functional. Layers 10–12 construct families, choice comparisons, evaluation, forgetting and clutching maps, and the joint models required for diagonal identities. Layer 13 constructs the target comparison maps and states the boundary with Gromov–Witten theory. Numbering: Layer k here is the k-th stage of the construction in build order, and Layer 13's four subsections are its four target comparisons.

## Layer 0: Targets, coefficients and the analytic floor (M0)

### 0.1 The Cauchy–Riemann section, energy, area and the virtual dimension

Define the half-normalized Cauchy–Riemann section `∂̄_J u = (du + J∘du∘j)/2` of a smooth map u from a Riemann surface (Σ, j) to (X, J), and prove that it vanishes exactly when u satisfies the pinned `IsPseudoholomorphic j J u`. Wendl's unhalved section `Tu + J∘Tu∘j` (Wendl, Lectures, v3.2, §2 at the display defining the nonlinear Cauchy–Riemann operator) is twice this one; transport every derivative, forcing term and estimate quoted from that source by the explicit factor 2 rather than identifying the two normalizations. Define the energy of a smooth map on a closed smooth component as the integral of the pinned `stdComplexLineEnergyDensity` in each chart, and construct the componentwise chart and gluing-to-closed-surface adapter that makes it chart-independent. Prove, for a smooth pseudoholomorphic u on a closed connected component with its complex orientation, that `E(u) = ∫_Σ u*ω = ⟨[ω], u_*[Σ]⟩` (DifferentialGeometry 8.3–8.5 for the smooth-chain integration and de Rham maps; CharacteristicClasses C3 for the integral `c₁`), then sum over components and pass to the nodal quotient class for a nodal source. Define the area of a class as `ω(β)`. Prove that for an auxiliary metric adapted to the taming form the Dirichlet energy equals the symplectic area for pseudoholomorphic maps, and that for an arbitrary auxiliary metric on compact X and over a compact family of tame structures the two are uniformly comparable. Define the signed integer `v = 2((m−3)(1−g) + ⟨c₁(TX,J),β⟩ + n)` for real dimension 2m, genus g and n marks. Prove the transport of `c₁`, area and homology class under source biholomorphisms and under target diffeomorphisms intertwining the almost complex structures, and the independence of the chosen auxiliary norms and trivializations on the common carriers.

- The half-normalized section vanishes at a point if and only if the pinned `IsPseudoholomorphicAt` holds there; a derivative-level pseudoholomorphic map is not thereby smooth, and smoothness is a separate hypothesis throughout.
- The energy of a smooth pseudoholomorphic map on a closed component is nonnegative, vanishes exactly for constant maps, and equals the pairing of `[ω]` with the pushed-forward fundamental class.
- Energy is additive over components of a nodal source and depends on the nodal quotient class only through `ω(β)`.
- `v` is even, may be negative, and is a function of (m, g, n, ⟨c₁,β⟩) alone.

**Checks.**

- For (m, g, n, ⟨c₁,β⟩) = (3, 0, 0, 0) the virtual dimension is 0; for degree-one maps to `ℂP¹` with three marks, (1, 0, 3, 2), it is `2(−2+2+3) = 6`, which equals the 6 real dimensions of `PSL(2,ℂ)` plus 6 for the marks minus 6 for the automorphisms; for an elliptic curve class in a K3 surface, (2, 1, 0, 0), it is 0; for a genus-two class in a surface with `⟨c₁,β⟩ = −2` and no marks, (2, 2, 0, −2), it is `2((−1)(−1) − 2 + 0) = −2`, negative, and no natural-number formula would record this; for the constant class with (g, n) = (0, 2) it is `2((m−3) + 0 + 2) = 2m − 2`, nonnegative for every `m ≥ 1`, and that space is empty by the stability theorem of §1.2, not by the sign of v.
- For the identity map of `ℂP¹` with the Fubini–Study form of total area 1, the energy is 1 and `⟨[ω], [ℂP¹]⟩ = 1`; with the unhalved convention the integrated squared norm of du would be 2, so the factor in the identity pins the convention.
- For a constant map the energy is 0 and the class is 0; for a degree-d holomorphic self-map of `ℂP¹` the energy is d, by the degree identity of §0.5 rather than by a separate computation.
- For a tame but not compatible J, the Dirichlet energy of a pseudoholomorphic map for an arbitrary J-invariant metric differs from `ω(β)` in general; the identity holds for the metric `g_J(v,w) = (ω(v,Jw) + ω(w,Jv))/2`, and the uniform comparison constant for another metric on compact X is a Check value, not 1.

*Needs:* Tau Ceti `IsPseudoholomorphic`, `stdComplexLineEnergyDensity`, `stdComplexLineEnergy`, `SmoothTwoForm.Tames`; DifferentialGeometry 8.3–8.5; CharacteristicClasses C3; Mathlib `AlgebraicTopology.singularHomologyFunctor`; AlgebraicTopology Stage 6 item 3.

### 0.2 The local coincidence lemma for two branches

Prove the vector Carleman similarity principle: a `W^(1,p)` solution ξ of `∂̄ξ + Aξ + B·conj(ξ) = 0` on a disc, with locally `L^p` matrix coefficients and `p > 2`, equals an invertible `W^(1,p)` matrix function times a holomorphic vector on a smaller disc; in particular a nonzero solution has isolated zeros of positive order. Using it, prove for J of class at least `C^2`: if u₀ and u₁ are pseudoholomorphic on discs with `u₀(0) = u₁(0)`, `du₀(0) ≠ 0`, and there are exact coincidences `u₀(z_ν) = u₁(ζ_ν)` with `z_ν → 0`, `ζ_ν → 0` and `ζ_ν ≠ 0`, then on a neighbourhood of 0 one has `u₁ = u₀∘φ` for a holomorphic φ with `φ(0) = 0` (McDuff–Salamon, J-holomorphic Curves and Symplectic Topology, 2nd ed., Lemma 2.4.3, cited by locator; the book is not readable from an open source). The second branch may be critical at 0. Route: straighten u₀ to the first coordinate axis in adapted coordinates in which J equals i along that axis and has controlled transverse derivative; write `u₁ = (a, b)`; show `|∂̄b| ≤ C|b||du₁|`, absorb the antilinear term into an `L^p` coefficient, apply the similarity principle to b, and conclude from the accumulating zeros that b vanishes identically, after which the tangential equation makes a holomorphic. Also prove, from HeegaardFloer Lane F2 item 2, that a nonconstant pseudoholomorphic map on a connected compact closed Riemann surface has finitely many critical points and finite fibres, so that `u⁻¹(u(Crit u))` is finite (McDuff–Salamon Lemma 2.4.1, by locator).

- The conclusion is local: it says nothing about global injectivity or embeddedness.
- The lemma applies with either branch critical at the limit point, as long as the first branch is immersed there.
- Isolated intersections of two branches at a point are not coincidences: the hypothesis requires an accumulating sequence of exact coincidences.

**Checks.**

- For `u₀(z) = (z, 0)` and `u₁(ζ) = (ζ², 0)` in `ℂ²` with the standard structure, coincidences `u₀(ζ_ν²) = u₁(ζ_ν)` accumulate and `φ(ζ) = ζ²` is the holomorphic factor; the second branch is critical at 0.
- For `u₀(z) = (z, 0)` and `u₁(ζ) = (0, ζ)`, the only coincidence is at 0 itself, so no sequence with `ζ_ν ≠ 0` exists and the lemma does not apply: the two branches meet transversally and neither factors through the other.
- For `u₀(z) = (z, 0)` and `u₁(ζ) = (ζ, ζ²)`, the coincidence set is `{0}` again; a wrong statement asserting factorization from a single coincidence would wrongly force `ζ² = 0`.
- With J only `C^1` the adapted coordinates lose a derivative and the transverse coefficient bound is not available; the `C^2` hypothesis is used.

*Needs:* HeegaardFloer Lane F1 item 2, Lane F2 item 2; PDE Lane A; Tau Ceti `Wkp`.

### 0.3 Determinant lines and the closed Cauchy–Riemann index

Construct the determinant-line functor on Fredholm operators between Banach spaces: the real line `det D = Λ^top ker D ⊗ (Λ^top coker D)^∨`, its canonical isomorphisms under exact sequences of Fredholm operators and under stabilization by finite-dimensional spaces, its continuity in continuous Fredholm families as a line bundle over the parameter space, and its behaviour under direct sums with the sign of the factor permutation. Define a real Cauchy–Riemann operator on a complex vector bundle E of complex rank r over a closed Riemann surface (Σ, j) as a real-linear first-order operator `D : W^(k,p)(E) → W^(k−1,p)(Λ^(0,1) ⊗ E)` whose complex-linear part is a Dolbeault operator and whose remaining part is of order zero. Prove that D is Fredholm for `k ≥ 1`, `p > 1`, with kernel and cokernel independent of (k, p) through elliptic regularity, and prove the closed Riemann–Roch index formula `ind_ℝ D = rχ(Σ) + 2⟨c₁(E), [Σ]⟩`, where χ is the Euler characteristic of the compact surface (AlgebraicTopology Stage 7 item 1 for the finite-CW Euler characteristic; FuchsianOrbifolds Layer 5 item 1 for `χ = 2 − 2g`). Route: the index is a homotopy invariant of the zeroth-order part, so reduce to a complex-linear operator; compute its index as `2(deg E + r(1−g))` through Serre duality on compact components (ComplexKahlerGeometry K5) and the cut-and-glue comparison along a decomposition of Σ into discs and annuli with collars, using HeegaardFloer Lane F1 item 3 for the bordered Fredholm pieces. Construct the complex orientation of `det D`: for a complex-linear D kernel and cokernel are complex, hence canonically oriented, and the orientation extends uniquely along the homotopy to any real Cauchy–Riemann operator with the same complex-linear part. Prove the gluing law of determinant lines for operators on a surface cut along a circle with matching asymptotics, with the ordering of factors fixed as in §8.1.

- The index depends only on r, χ(Σ) and `⟨c₁(E), [Σ]⟩`; the kernel and cokernel dimensions separately do not.
- The complex orientation is natural under complex-linear isomorphisms of bundles and under deformation of the zeroth-order term.
- Under direct sum of operators the determinant lines multiply, and interchanging two summands introduces the sign `(−1)^(ind D₁ · ind D₂)`.

**Checks.**

- For the trivial line bundle on the sphere with the standard Dolbeault operator: `ind = 1·2 + 0 = 2`; the kernel is the constants (real dimension 2) and the cokernel is 0, consistent.
- For the tangent bundle of the sphere, `r = 1`, `χ = 2`, `c₁ = 2`: `ind = 2 + 4 = 6`, the real dimension of `PSL(2,ℂ)`, whose Lie algebra is the kernel; a formula omitting the factor 2 on `c₁` would give 4.
- For the trivial line bundle on a torus: `ind = 0`; kernel (constants) and cokernel (constant (0,1)-forms) both have real dimension 2, so an index formula is not a kernel formula.
- For the trivial line bundle on a genus-two surface: `ind = −2`; the kernel is still the constants, so the cokernel has real dimension 4, matching the genus.

*Needs:* Mathlib `ContinuousLinearMap.IsFredholm`, `LinearMap.index`; Tau Ceti Fredholm restriction and adjoint modules; HeegaardFloer Lane F1 items 1–3; ComplexKahlerGeometry K5; AlgebraicTopology Stage 7 item 1; FuchsianOrbifolds Layer 5 item 1.

### 0.4 Finite exceptional sets and compact-image localization

Let (Σ, j) be a connected compact smooth Riemann surface without boundary, X a finite-dimensional Hausdorff second-countable smooth manifold without boundary with a smooth almost complex structure J, and `u : Σ → X` smooth, nonconstant and pseudoholomorphic. Nothing is assumed about immersion, embeddedness, integrability or genericity of J, or primitivity of the homology class; the compact symplectic target of this roadmap is a special case. Construct the compact-image localization: finitely many relatively compact target charts covering `u(Σ)` with uniform local bounds, and at each exceptional image value a smaller chart on which the constant standard two-form of a linear complex identification tames J, proved by openness of taming after shrinking. These local taming forms and the auxiliary metric comparisons supply the hypotheses of the removal theorem of HeegaardFloer Lane F2 item 3 on a compact target-image neighbourhood; neither a global taming form nor compactness of X is inferred, and no noncompact moduli compactness, no-escape, punctured or bordered statement is claimed. Prove, by nonconstancy, unique continuation and compactness of Σ, that `Crit(u)` and every fibre `u⁻¹(x)` are finite, and define `B = u⁻¹(u(Crit(u)))`, the full preimage of the critical values; prove B finite. B contains `Crit(u)` and is in general larger.

**Checks.**

- For a degree-two self-map of `ℂP¹` branched at two points, `Crit(u)` has two points and B equals `Crit(u)`; for the map `z ↦ z²(z−1)` the critical value of a critical point may have a second, noncritical preimage, which lies in B but not in `Crit(u)`.
- For a constant map every point is critical and the statement is not applied; the hypothesis of nonconstancy is used in the finiteness proof.
- For J the standard structure on `ℂⁿ` the localization chart is the whole space and the taming form is the standard one; the localization adds nothing, as it should.

*Needs:* HeegaardFloer Lane F2 items 2–3; §0.2; Tau Ceti `SmoothTwoForm.Tames`.

### 0.5 Normalization of a nonconstant closed curve through a simple curve

With the data and the finite set B of §0.4, define on the connected punctured surface `Σ∖B` the relation Γ₀: `(z, ζ) ∈ Γ₀` when there are neighbourhoods of z and ζ on which the two immersed branches of u differ by a holomorphic change of source coordinate; the diagonal is included. Prove that Γ₀ coincides with the accumulation characterization of §0.2, so isolated intersections of different branches are excluded, that Γ₀ is an equivalence relation with holomorphic local inverses, and that Γ₀ is closed in `(Σ∖B)²`. Prove that the first projection `Γ₀ → Σ∖B` is a proper finite covering: a limiting partner over a point z outside B cannot lie in B, since its image would be the noncritical value u(z). Its fibre cardinality `d ≥ 1` is constant. Prove that the closure `Γ = cl(Γ₀)` in `Σ × Σ` is an equivalence relation with finite classes and that B is Γ-invariant. Construct positive local multiplicities `e_z`, equal to 1 off B, with `Σ_(ζ∼z) e_ζ = d` for every z. Extend the local coordinate transitions across the exceptional points and construct holomorphic charts on the quotient from the local branch-product coordinate; prove their independence of choices, the holomorphy of transitions and that the quotient map has local degree `e_z` at z. The quotient is not the image subset with its subspace topology.

Construct the connected compact Hausdorff second-countable Riemann surface `Σ₀ = Σ/Γ` and the surjective finite holomorphic branched cover `π : Σ → Σ₀` of degree d, with `π⁻¹(π(z))` equal to the Γ-class of z. Prove that u descends to a continuous `v : Σ₀ → X` with `u = v∘π`, that v is pseudoholomorphic off the finitely many exceptional values, that v has finite Dirichlet energy near each exceptional value (change of variables for π off its branch locus, in a local target metric) and, by the localization of §0.4 and HeegaardFloer Lane F2 item 3, that v extends smoothly and pseudoholomorphically across them. Prove that the coincident-germ multiplicity of v is 1 by lifting germ coincidences of v to coincidences of u, which the quotient identifies; in this argument retain regular points of B with a possibly critical partner, and discard, using finite fibres, a subsequence with constant partner before applying §0.2. Deduce that the set of noninjective points `{z : dv(z) = 0 or #v⁻¹(v(z)) > 1}` is at most countable with accumulation only at critical points, so v has an injective regular point; v need not be globally injective or embedded (Wendl, Lectures, v3.2, Prop. 4.3; McDuff–Salamon Prop. 2.5.1, by locator).

Define a nonconstant closed curve to be simple when it does not factor through a finite holomorphic branched cover of degree greater than 1. Prove that simplicity is equivalent to the existence of an injective regular point and to `d = 1` in this construction, using the pinned degree-one biholomorphism `biholomorphOfDegreeEqOne` and not merely a set-theoretic bijection. Prove uniqueness: if `u = v₁∘π₁ = v₂∘π₂` with v₁, v₂ somewhere injective, there is a unique biholomorphism `a : Σ₁ → Σ₂` with `a∘π₁ = π₂` and `v₂∘a = v₁`, by the quotient and germ characterization, including separate branches at self-intersection values. Construct the identity and composition laws under source biholomorphisms and under target diffeomorphisms intertwining the almost complex structures; equality of image subsets alone is not a comparison of source data.

Compare π with the pinned `FiniteHolomorphicMap` carrier: its `degree` equals d by `fiberMultiplicitySum_eq_degree`, its `localMultiplicity` at z equals `e_z`, and `ramificationDegree π = Σ_z (e_z − 1) = R`. Prove `π_*[Σ] = d[Σ₀]` and `u_*[Σ] = d·v_*[Σ₀]` in integral homology, retaining torsion and the class of v itself rather than a division by d; prove `⟨c₁, u_*[Σ]⟩ = d⟨c₁, v_*[Σ₀]⟩` and, when a taming closed form is given, `∫_Σ u*ω = d∫_(Σ₀) v*ω`. Prove `2 − 2g(Σ) = d(2 − 2g(Σ₀)) − R` from FuchsianOrbifolds Layer 5 item 3; no analytic genus comparison or Riemann–Roch theorem enters this topological formula. As a formal unmarked index identity put `D(u) = (m−3)(2−2g(Σ)) + 2⟨c₁, u_*[Σ]⟩` and derive `D(u) = d·D(v) − (m−3)R`; this is an identity of indices, not a dimension statement for a multiple-cover moduli space.

Constant maps have no simple factor and the theorem is not applied to them. For a disconnected compact source apply the theorem to each nonconstant connected component and retain every constant component with its genus, labels and map; distinct components with the same image are not merged. For nodal maps of Layer 1 the theorem is additional factorization data on each nonconstant normalization component: the domain graph, node pairings, ordered marks, cover, degree, ramification and all automorphism arrows are retained, images of distinct marks or flags under π may coincide, and no multiple-cover multiplicity is discarded. On the simple locus of Layer 2 the degree-one comparison identifies Σ₀ with Σ, so the moving-domain index and regularity theorems apply with the original genus and class; for a covered map the Fredholm complex keeps the original genus and class, and normalization does not make it regular. Nothing here asserts that factor surfaces or degrees form a smooth family through degenerations.

- π is a finite holomorphic map of degree d in the pinned sense; `u = v∘π`; v is smooth, pseudoholomorphic and somewhere injective.
- The pair (Σ₀, v) is unique up to a unique biholomorphism compatible with π.
- `g(Σ) ≥ g(Σ₀)`, with equality exactly when `d = 1`, or `g(Σ₀) = 1` and `R = 0`, or `g(Σ₀) = 0` and `R = 2d − 2`.

**Checks.**

- The genus-one double cover of a line in `ℂP²` branched at four points: `d = 2`, `g(Σ₀) = 0`, `R = 4`, so `2g(Σ) − 2 = 2(−2) + 4 = 0` and `g(Σ) = 1`; with `m = 2` and `⟨c₁, line⟩ = 3`, `D(v) = −2 + 6 = 4`, `D(u) = 0 + 12 = 12`, and `d·D(v) − (m−3)R = 8 + 4 = 12`.
- A degree-one map is simple; the parametrization of a nodal cubic by `ℂP¹` is simple (d = 1) although it is not injective, so simplicity is weaker than injectivity, and its two branches at the node are separate Γ-classes.
- The double cover `z ↦ z²` of `ℂP¹` composed with an embedded line: `d = 2`, `R = 2`, `g(Σ) = g(Σ₀) = 0`, consistent with `2 − 0 = 2·2 − 2`; a definition taking B to be `Crit(u)` only would miss nothing here, but for `z ↦ z²(z−1)` composed with a line it would treat the noncritical partner of a critical point as unexceptional and the quotient chart there would be wrong.
- For a constant component of a nodal source the theorem is not applied; a definition applying it would divide by `d = 0`.

*Needs:* §0.2, §0.4; HeegaardFloer Lane F2 items 2–3; Tau Ceti `FiniteHolomorphicMap`, `degree`, `localMultiplicity`, `fiberMultiplicitySum_eq_degree`, `biholomorphOfDegreeEqOne`, `ramificationDegree`; FuchsianOrbifolds Layer 5 item 3; DifferentialGeometry 8.3–8.5; CharacteristicClasses C3.

### Examples

- The identity of `ℂP¹` with the area-one Fubini–Study form: energy 1, `v = 2(−2·1 + 2 + 0) = 0` for `m = 1`, `g = 0`, `n = 0`.
- A degree-d self-map of `ℂP¹` factors through its own simple part; for `z ↦ z^d` the simple part is the identity and `R = 2(d−1)`.
- An elliptic curve mapped to a K3 surface in a class of square zero: `v = 0`, and the index of the Dolbeault operator on its normal bundle is 0.

### Dependencies

Mathlib and Tau Ceti at the pins (almost complex structures, energy, Sobolev spaces, Fredholm operators, Riemann-surface degree theory); HeegaardFloer Lane F1 items 1–3 and Lane F2 items 2–3; PDE Lanes A–B; DifferentialGeometry 8.3–8.5; CharacteristicClasses C3; ComplexKahlerGeometry K5; AlgebraicTopology Stage 7 item 1; FuchsianOrbifolds Layer 5 items 1 and 3.

## Layer 1: Prestable maps and map-dependent stability (M1)

### 1.1 Prestable maps and their retained-arrow groupoid

Take a nodal domain in the sense of ComplexCurveModuli D1: finitely many closed normalization components, paired node flags and ordered smooth marks, with unstable pointed components allowed. Define a prestable map as a collection of smooth pseudoholomorphic component maps that agree at each pair of node flags. Prove that such a collection descends to a continuous map on the compact nodal quotient, and define its class as the sum of the component fundamental-class pushforwards. Define arrows as biholomorphisms of the normalization components together with the induced permutation of graph vertices, flags and marks, intertwining the maps exactly; construct composition, inverses, isotropy groups and the resulting groupoid, which retains every arrow including those acting trivially on a deformation base.

- Descent to the nodal quotient is compatible with the quotient topology of ComplexCurveModuli D1 and with the class: the class of the descended map is the nodal quotient class.
- Isotropy groups are groups of biholomorphisms of the normalization intertwining the map; they act on flags and marks through the graph.
- The empty domain gives the empty map with trivial isotropy; a constant map in the stable pointed range has the isotropy of its stable pointed domain.

**Checks.**

- A self-node (both flags on one component) is admitted; the branch-interchange arrow exists exactly when a biholomorphism of the component swaps the two flag points and intertwines the map.
- The degree-two cover of an unmarked sphere onto an embedded sphere has isotropy `ℤ/2`, nontrivial and finite; a definition that quotiented by the sphere's Möbius group would lose it.
- A constant unmarked sphere component has isotropy `PSL(2,ℂ)`, positive-dimensional; a constant unmarked torus component has isotropy containing the torus translations.
- A map on a one-node two-sphere domain whose two component maps disagree at the node is not a prestable map; the matching condition is a hypothesis of the definition, not a consequence.

*Needs:* ComplexCurveModuli D1; §0.1; Mathlib `AlgebraicTopology.singularHomologyFunctor`.

### 1.2 The stability theorem

Prove that the isotropy group of a prestable map is finite if and only if every constant component is pointed stable: a constant rational component carries at least three special flags and a constant genus-one component at least one. Nonconstant unmarked spheres and tori are allowed. Route for the forward direction: on each nonconstant pointed-unstable component choose regular injective points, by §0.5, and transverse target discs of real codimension 2 through their images avoiding the images of nodes, marks and constant components and the critical values of every nonconstant component; use the finiteness of critical sets and a finite-dimensional Sard perturbation of the discs (Pardon, arXiv:1309.2370, Lemma 9.2.7, in the equal-dimension form `MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`: with π a local projection to `T_pN`, the critical values of `π∘f` have measure zero, and a regular value near `π(f(p))` is attained near p because `π∘f` is a local diffeomorphism there) to achieve transversality at every preimage while keeping the selected intersections, with compact boundary buffers. Take all preimages of the selected discs as one finite unordered auxiliary set; compactness, boundary avoidance and transversality make it finite, and every isotropy element preserves it. With enough discs every previously unstable nonconstant component becomes stable, so the augmented domain is a stable pointed curve whose ordered automorphism group is finite by ComplexCurveModuli D0 item 5, and the original isotropy group is finite as a finite permutation extension of that group (Pardon Lemma 9.2.8). For the converse exhibit the positive-dimensional automorphisms of an unstable constant sphere or torus component, which intertwine the constant map. Establish both directions componentwise and under finite graph permutations; no free-action assertion is used.

**Checks.**

- A constant unmarked sphere, a constant sphere with one or two special flags and a constant unmarked torus have infinite isotropy; the theorem excludes them.
- A nonconstant unmarked sphere of degree one onto an embedded sphere has trivial isotropy; of degree two, isotropy `ℤ/2`; both are stable maps although their domains are pointed unstable.
- A nonconstant map from a sphere with a single self-node onto a nodal curve is stable; the auxiliary discs through two regular injective points stabilize it.
- Maps into a target of dimension 0 are constant, so stability is pointed stability of the domain, and no codimension-two disc exists; the construction is never invoked there.

*Needs:* §1.1, §0.5; ComplexCurveModuli D0 item 5; Mathlib `MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`.

### Examples

- The empty map, constant maps in the stable pointed range, a self-node with branch interchange, and multiple covers of an embedded sphere are objects of the groupoid.
- The degree-two cover of an unmarked sphere is the standard example of a stable map with nontrivial finite isotropy; a constant unmarked sphere or torus is the standard excluded unstable example.

### Dependencies

Layer 0; ComplexCurveModuli D0 item 5 and D1.

## Layer 2: Moving-domain maps with an explicit derivative budget (M2)

The targets of this layer concern smooth zero-node sources and the Sobolev carriers on fixed normalization strata. They use no plumbing, no stable-map compactness, no obstruction forcing, no gluing and no virtual engine.

### 2.1 Finite-regularity almost-complex parameter spaces and the fixed-domain completion comparison

For an integer `ℓ ≥ 1` construct the Banach manifold `J^ℓ_τ(X, ω)` of `C^ℓ` sections J of `End(TX)` with `J² = −id` tamed by ω, and its closed submanifold `J^ℓ_c(X, ω)` of compatible ones, with prescribed germs on a closed subset where required. Charts: pointwise anticommuting tangent sections `Y` with `YJ + JY = 0` and the conjugation chart `Y ↦ (1 + JY/2)J(1 + JY/2)⁻¹`, restricted in the compatible case to the symmetric variations `ω(Yv, w) = ω(Yw, v)` for all v, w, equivalently `ω(v, Yw) = ω(w, Yv)`. Prove that the tame condition is open, that the compatible chart preserves compatibility, and the Banach chart, composition and Nemytskii estimates. Prove that the space of smooth tame (compatible) structures with the C∞ topology is a complete metrizable space, so Baire category applies to it, and that it is dense in each `J^ℓ`. Construct the fixed-domain completion comparison: for a fixed closed Riemann surface, Sobolev order s, differentiability class q of the Cauchy–Riemann section and parameter class ℓ with `ℓ ≥ q + s + 1`, the section `(u, J) ↦ ∂̄_J u` on `W^(s,p)` maps times `J^ℓ` is `C^q`; on overlapping allowed orders the zero sets and the regular charts coincide, and for smooth J the solutions are smooth and the smooth charts agree with every Sobolev chart. Finite-`C^ℓ` coefficients are never promoted to smooth ones by this comparison, and the smooth almost-complex carrier never stands in for the finite-order parameter space.

- The tangent space at J of `J^ℓ_τ` is the space of `C^ℓ` sections Y with `YJ + JY = 0`; for `J^ℓ_c` it is the subspace satisfying the symmetric condition as well.
- Completion independence identifies solution spaces across allowed Sobolev orders; regularity of a chart at one allowed order implies it at the others.
- Every genericity theorem below carries its (q, s, p, ℓ) inequalities explicitly.

**Checks.**

- For `X = ℝ²` with `ω = dx∧dy` and the standard J, the anticommuting variations are the symmetric traceless matrices `Y = [[a,b],[b,−a]]`; for `v = e₁`, `w = e₂` both `ω(Yv, w)` and `ω(Yw, v)` equal a, so every tame variation is compatible in real dimension 2, and the tangent space has dimension 2, matching `Sp(2)/U(1)`. In `ℝ⁴` the anticommuting variations form an 8-dimensional space and the compatible ones a 6-dimensional space, matching `Sp(4)/U(2)`; a chart that imposed only anticommutation would leave the compatible locus.
- With `ℓ = q + s` the Nemytskii map `J ↦ J∘du∘j` on `W^(s,p)` maps is `C^(q−1)` only; the inequality `ℓ ≥ q + s + 1` is used.
- A `C^ℓ` J with ℓ finite admits nonsmooth pseudoholomorphic curves, so the completion comparison identifies solution spaces at different Sobolev orders without making them smooth.

*Needs:* Tau Ceti `SmoothAlmostComplexStructure`, `SmoothTwoForm.Tames`, `SmoothTwoForm.Compatible`; HeegaardFloer Lane F1 items 1–2, Lane F2 item 1; Mathlib Baire category.

### 2.2 Sobolev map carriers, evaluation and the node-matching subspace

On each fixed normalization stratum of ComplexCurveModuli D1, with the prestable family germs and the stable pointed local plumbing of D4 after auxiliary marks, construct the Banach manifolds of `W^(k,p)` maps from the normalization components to X, with `kp > 2`, the Banach bundle of `W^(k−1,p)` sections of `Λ^(0,1) ⊗ u*TX`, and the Cauchy–Riemann section of §0.1 as a `C^q` section for the budgets of §2.1. Prove that point evaluation is continuous on the continuous representatives, and define the node-matching subspace of sections along a map u with equal node values as the kernel of the continuous linear map `ξ ↦ (ξ(left a) − ξ(right a))_a` over the finite set of node pairs, where the two branch values are compared in the common tangent space `T_(u(node))X`. Prove that distinct node flags admit disjoint bump interpolation, so this map is onto the product of the target tangent spaces and the matching subspace has real codimension 2m per node, including self-nodes. Prove separability and second countability of the Sobolev completions for finite `2 < p < ∞` from the pinned finite-p theorems and the weak-derivative graph realization, transported through the finite-atlas bundle adapters, and the completeness, multiplication, chart and frame restriction, finite sum, pullback, bounded evaluation, composition and norm-transport laws of these carriers. The scalar pinned `Wkp` is not itself a bundle- or manifold-valued mapping space, and its higher-order `p = 2` norm is not literally Hilbert; use Banach arguments or an explicitly equivalent Hilbert norm.

- The matching subspace is closed, of finite codimension exactly `2m · (number of node pairs)`, and is the tangent space at u of the prestable-map carrier of §1.1 inside the product of component carriers.
- Evaluation at a moving point is `C^r` on `W^(k,p)` maps when `(k − r)p > 2`.
- The carriers are independent of the finite atlas and of the trivializations up to canonical isomorphism.

**Checks.**

- One node joining two spheres mapped to `X = ℝ^(2m)`: the matching subspace is `{(ξ₁, ξ₂) : ξ₁(z₁) = ξ₂(z₂)}`, of codimension 2m; a definition comparing values in different fibres would not type-check unless the base map matched there, which it does by §1.1.
- A self-node on one sphere, flags `z ≠ z'`: the matching condition `ξ(z) = ξ(z')` still has codimension 2m, by a bump supported near z only.
- A junk self-node with `z = z'` is not a node of any domain of ComplexCurveModuli D1 (flags are distinct points); a carrier that admitted it would impose no condition, which is why the node set is taken from D1 rather than from an arbitrary pair of maps into the surface.
- For `k = 1`, `p = 2` on a surface, `kp = 2` and point evaluation is not continuous: the hypothesis `kp > 2` is used.

*Needs:* ComplexCurveModuli D1, D4; Tau Ceti `Wkp` with the W1p, trace, extension, Rellich–Kondrachov, Morrey and density modules; HeegaardFloer Lane F1 item 1; PDE Lane A; Mathlib `ContinuousLinearMap.isClosed_ker`, `ContinuousLinearMap.pi`; §2.1.

### 2.3 Domain deformations, transitions and derivative budgets

For a finite-dimensional smooth domain deformation parameter (a Teichmüller or plumbing coordinate of ComplexCurveModuli D3 item 5 and D4), construct the pullback, inverse and section transitions between the Sobolev carriers of §2.2 over nearby domains, with derivative-offset estimates: no smooth action of the full diffeomorphism group on a single Sobolev completion is assumed. For a desired `C^r` mapping or evaluation statement choose k with the source embeddings and derivatives specified; at moving intersection points `(k − r)p > 2` is a sufficient local evaluation budget. On solution loci, bootstrapping compares the completions with the smooth charts. Treat the positive-dimensional automorphism directions of sphere and torus domains explicitly: auxiliary incidence slices remove them, leaving a finite residual group. The regular nonconstant theorem of Wendl (Lectures, v3.2, Thm 4.43) is applied on a smooth stratum only after the unstable-case slice, properness and transition statements below are in place; it supplies no nodal charts.

**Checks.**

- Pulling back a `W^(k,p)` map by a smooth diffeomorphism depending smoothly on a parameter is `C^r` in the parameter only after losing r derivatives on the map side; the identity parameter is `C^∞` because the map does not change.
- For the sphere with three marked anchors the residual group is trivial; with two anchors it is `ℂ^*`, positive-dimensional, and the slice is incomplete.
- On a torus, fixing one anchor leaves the finite group of lattice automorphisms, of order 2, 4 or 6.

*Needs:* ComplexCurveModuli D3 item 5, D4; §2.2.

### 2.4 Smooth zero-node application carriers

Construct the unaugmented smooth-source carriers independently of the nodal map carrier of §1.1 and the matching spaces of §2.2. Fix closed connected genus-g source models by the smooth classification of ComplexCurveModuli D0 item 1. Use the complete bundle-valued Sobolev map spaces of §2.2 with their continuous representatives, the smooth homology-class components and the finite complex-structure models: for genus 0 the fixed sphere `OnePoint ℂ` with its Möbius group (ComplexCurveModuli D0 item 3), for genus 1 the period and lattice model with its retained finite stabilizer (D0 item 3), for genus greater than 1 the smooth slices of D3 item 5. For the auxiliary-marked stable smooth source use the action and offset-slice theorem of D0 item 5 and D3 item 5. Apply the smooth specialization of D5's parameter-space topology only to the anchored stable smooth sources and before its nodal and universal charts; on the unanchored low-genus branches use the direct sphere and torus models. Consume the finite-`C^ℓ` parameter spaces and the fixed-domain completion comparison of §2.1 before constructing the `C^q` sections and parameter projections. This layer supplies the moving-domain and auxiliary-anchor offsets, the transitions and the elliptic comparisons on these carriers with the half-normalized section.

**Checks.**

- For genus 0 the complex-structure model is a point and the automorphism group is `PSL(2,ℂ)`; for genus 1 the model is the upper half-plane modulo `SL(2,ℤ)` with translations; for genus 2 the slice has complex dimension 3 and trivial infinitesimal automorphisms.
- The Sobolev completion of smooth maps in a fixed class is separable for `p < ∞`; for `p = ∞` it is not, which is why `p < ∞` is required.
- For a nonconstant map u from the fixed sphere `OnePoint ℂ`, the Möbius transformations φ with `u∘φ = u` form the finite group `Aut(u)` of §1.2: trivial for the degree-one parametrization of a line, `{±1}` for `z ↦ z²` composed with that parametrization. A carrier that first divided the sphere by its whole Möbius group and then imposed the equation would lose this residual isotropy, and one that imposed no quotient at all would carry the six-dimensional `PSL(2,ℂ)` orbit as spurious tangent directions.

*Needs:* ComplexCurveModuli D0 items 1, 3 and 5, D3 item 5, D5; §2.1, §2.2.

### 2.5 The early smooth unaugmented index

Before augmentation or nodal gluing, apply §0.3 to the bundles of §2.4. Write r for the number of ordered distinct original marks and `2m` for the real dimension of X. For a fixed complex structure j the index of the linearized operator is `m(2 − 2g) + 2⟨c₁, β⟩`; moving marks contribute `2r`; the unmarked infinitesimal automorphism complex contributes `−a_g` with `a_g = 6, 2, 0` for `g = 0, 1, > 1`; the finite complex-structure slice contributes `t_g = 0, 2, 6g − 6`. Construct the determinant and deformation-complex comparisons giving the signed moving-domain index `d_r = (m − 3)(2 − 2g) + 2⟨c₁, β⟩ + 2r` (Wendl, Lectures, v3.2, Def. 4.2 and Thm 4.43). A quotient dimension statement uses injectivity of the infinitesimal reparametrization action on the pair (map, marks), as for a nonconstant map or a pointed-stable constant curve; before that hypothesis the formal index is the index of the full complex and not a dimension of a quotient manifold. Construct a complex-linear reference operator for the index homotopy; the target J need not be integrable. Layer 4 consumes this smooth specialization while retaining the full nodal flags, matching and deformation complex.

**Checks.**

- `d_r − v(n = r) = 0` for every (m, g, r, c₁): the two formulas agree.
- `(a_g, t_g) = (6, 0), (2, 2), (0, 6)` for `g = 0, 1, 2`, and `m(2−2g) + 2c₁ − a_g + t_g + 2r = d_r` in each case: for `g = 0`, `2m + 2c₁ − 6 + 2r = (m−3)·2 + 2c₁ + 2r`; for `g = 1`, `2c₁ − 2 + 2 + 2r = 2c₁ + 2r`; for `g = 2`, `−2m + 2c₁ + 6 + 2r = (m−3)(−2) + 2c₁ + 2r`.
- For a constant unmarked sphere the infinitesimal action on the map alone is not injective; the quotient-dimension statement is not made.

*Needs:* §0.3, §2.4; ComplexCurveModuli D0 item 3, D3 item 5.

### 2.6 All-genus localized universal surjectivity

On the smooth somewhere-injective carrier of §2.4 prove that the derivative of the universal Cauchy–Riemann section in the map and target-J directions is split surjective, for every source genus, separately for the tame tangent space `{Y : YJ + JY = 0}` and the compatible tangent space with the additional symmetry `ω(v, Yw) = ω(w, Yv)` (§2.1). Route: an isolated injective regular source disc, the adjoint and unique continuation of §0.2 and §0.3, the closed Fredholm range of the pinned Fredholm theory, and finitely many target bumps (Wendl, Lectures, v3.2, Prop. 4.55 and Lemmas 4.56–4.57). Prove the localized tangent evaluation and its realizability in the compatible chart. Include domain variation with derivative `j̇ = 2jη` in the coordinates of ComplexCurveModuli D3 item 5. The generic Sard–Smale theorem is the pinned one and HeegaardFloer Lane F2 item 4; this is its all-genus carrier, tangent and completion application.

**Checks.**

- A nonzero cokernel element is a nonzero adjoint solution, nonzero on a dense set by §0.2; at an injective regular point the pairing with `Y∘du∘j` is made nonzero by a compatible variation Y supported near the image, since for nonzero vectors v, w there is a compatible Y with `⟨Yv, w⟩ ≠ 0` (Wendl, Lectures, v3.2, Lemma 4.57): in `ℝ²` with `v = w = e₁` the symmetric traceless `Y = [[1,0],[0,−1]]` gives `⟨Yv, w⟩ = 1`.
- For a doubly covered curve `u = v∘π` with `d = 2`, a J-variation pairs equally with the two sheets, so the argument fails: the cokernel element antisymmetric under the deck transformation is not reached, which is why somewhere injectivity is a hypothesis.
- With `j̇ = 2jη` and `η = 0` the domain-variation term vanishes and the statement reduces to the fixed-j one.

*Needs:* §0.2, §0.3, §2.1, §2.4; Tau Ceti Fredholm adjoint and closed-range modules; HeegaardFloer Lane F2 item 4; ComplexCurveModuli D3 item 5.

### 2.7 Universal anchor-slice projections

Choose finitely many auxiliary anchors in injective regular source discs, away from all original marks, and transverse real codimension-two target discs through their images; choose enough anchors to stabilize the smooth domain. Run the Cauchy–Riemann-first argument in the jointly moving-mark formulation of ComplexCurveModuli D3 item 5: after unmarked universal surjectivity (§2.6), each moving anchor supplies its own two real normal directions to its incidence equation, so solve the Cauchy–Riemann equation first and the normal errors second. Transfer the image at smooth zero solutions to the fixed-mark offset slice by the equivariance identity: infinitesimal reparametrization orbit vectors lie in the kernel of the full linearized section, so decomposing a tangent vector into slice and orbit parts preserves its image; include the analogous transfer for the fixed-j `Aut(Σ, j)` anchor slice, whose raw derivative is not the moving-mark derivative. This uses no joint universal evaluation at original marks. Prove the resulting `C^q` Banach solution charts, their transitions, the elimination of finite isotropy, the moving-domain and anchor derivative offsets and the elliptic bootstrap. Orient each auxiliary normal space through the isomorphism `du : T_anchor Σ → N_disc`, so no independent orientation of the target disc is assumed. Construct the projections from these universal anchor-slice solution charts to `J^ℓ`; their Fredholm index is `d_r`, plus `dim P` for a P-family and minus `codim Q` when a specified original-mark incidence is imposed; anchor contributions and transverse-disc constraints cancel. The fixed-j variant fixes the conformal parameter and has index `m(2 − 2g) + 2⟨c₁, β⟩ − a_g + 2r`. Prove independence and common refinement of anchor choices. Obtain open local slice saturations from the offset inverse of D3 item 5 and its comparison laws, and a countable chart cover by Lindelöf on the anchored stable prequotient and the separable Sobolev charts of §2.2, before global quotient properness or Sard–Smale.

**Checks.**

- Three anchors on a sphere: `6` real anchor coordinates and `3 · 2 = 6` real incidence constraints cancel, leaving `d_0`.
- One anchor on a torus: `2 − 2 = 0` again; the finite lattice stabilizer remains and is eliminated separately.
- Orienting the normal space by `du` at a critical point would fail; anchors are chosen at regular injective points, so `du` is injective there.

*Needs:* §2.6, §2.4, §2.2; ComplexCurveModuli D3 item 5; Mathlib `ContinuousLinearMap.IsFredholm`.

### 2.8 The proper Hausdorff solution quotient

Prove properness of the biholomorphism and reparametrization action on the smooth nonconstant somewhere-injective solution carrier, including globally convergent source and target sequences, and construct the Hausdorff second-countable solution quotient with smooth anchor-slice transitions, bootstrapped. For genus 0 prove the map-level statement here: if `u_k → u` and `u_k∘φ_k → u'` with u nonconstant and `φ_k ∈ PSL(2,ℂ)`, the Möbius maps `φ_k` have a convergent subsequence, because an escaping Möbius sequence contracts the complement of a point to a point and would force u constant; use three injective regular points of u to pin the subsequence. For genus 1 compare period and lattice coordinates, the proper modular action and the compact translation torus; for genus greater than 1 consume the stable smooth-domain action properness of ComplexCurveModuli D0 item 5. Construct the chart and inverse comparisons on maps. Trivial isotropy of a simple map proves freeness, not properness. Divide the finite-dimensional fixed-J regular solution spaces by these comparisons; the universal solution charts are the offset anchor-slice charts of §2.7.

**Checks.**

- For the constant sphere the Möbius action is not proper: `φ_k(z) = kz` has no convergent subsequence although `u∘φ_k = u`; the nonconstancy hypothesis is used.
- For the degree-two map `z ↦ z²` the isotropy is `{±1}`, finite, and the quotient near it is an orbifold chart rather than a manifold chart.
- For a genus-two source the full diffeomorphism action is proper by ComplexCurveModuli D0 item 5 without any hypothesis on the map.

*Needs:* §2.7; ComplexCurveModuli D0 items 3 and 5.

### 2.9 The minimal unmarked generic-J theorem

On the compact boundaryless X of the Conventions, fix g and β and restrict to smooth closed connected zero-node maps with an injective regular point z, `du(z) ≠ 0` and `u⁻¹(u(z)) = {z}`: the smooth-simple locus. Prove that applying the pinned Sard–Smale theorem and HeegaardFloer Lane F2 item 4 to the countably covered anchor-slice projections of §2.7 yields a residual subset of smooth ω-tame J, and separately of smooth ω-compatible J, for which the unmarked unaugmented proper quotient is a smooth oriented Hausdorff second-countable manifold of signed dimension `d_0 = (m − 3)(2 − 2g) + 2⟨c₁, β⟩` (Wendl, Lectures, v3.2, Thm 4.48 with Thm 4.43). Use the early index of §2.5, the localized surjectivity of §2.6, the projection budgets of §2.12, the smooth-J passage of §2.13 and the determinant comparisons of §0.3. Negative signed dimension gives an empty regular stratum. This endpoint is independent of original-mark evaluation, incidence and relative-family refinements.

**Checks.**

- Lines in `ℂP²` (`m = 2`, `g = 0`, `c₁ = 3`): `d_0 = −2 + 6 = 4`, the real dimension of the dual projective plane.
- Conics in `ℂP²` (`c₁ = 6`): `d_0 = −2 + 12 = 10`, the real dimension of the space of smooth conics `ℙ⁵` minus nothing: `dim_ℝ ℙ⁵ = 10`.
- A smooth genus-two curve C in a K3 surface with its integrable structure, `C² = 2`, `c₁ = 0`: `d_0 = (2−3)(−2) + 0 = 2`. The normal bundle is `K_C` by adjunction with trivial canonical bundle, with `h⁰(K_C) = 2` and `h¹(K_C) = h⁰(O_C) = 1` by Serre duality on C (ComplexKahlerGeometry K5), so the integrable linearization modulo reparametrization has kernel of real dimension 4 and cokernel of real dimension 2: its index `4 − 2 = 2` is `d_0`, while the actual family `|C| ≅ ℙ²` (`h⁰(O(C)) = C²/2 + 2 = 3`) has real dimension 4. The integrable structure is not in the residual set of this theorem, and away from that set `d_0` is an index, not a dimension; the product curves of §2.23 are the same phenomenon.
- For `m = 3` and `c₁ = 0`, as in a Calabi–Yau threefold, `d_0 = 0` in every genus. A genus-two class in a surface with `⟨c₁, β⟩ = −2` has `d_0 = (−1)(−2) − 4 = −2`: the regular stratum is empty for generic J, and no natural-number formula would record this.

*Needs:* §2.5–§2.8, §2.12, §2.13; Tau Ceti `dense_compl_image_criticalPoints_of_isFredholm`; HeegaardFloer Lane F2 item 4.

### 2.10 The specified fixed-j theorem

For each specified smooth complex structure j on the closed source, prove the separate residual smooth tame and compatible J theorem for simple maps modulo `Aut(Σ, j)`, with unmarked signed dimension `m(2 − 2g) + 2⟨c₁, β⟩ − a_g`. Use the fixed-j anchor-slice projections and proper action of §2.7–§2.8 together with the fixed-j bounded-piece openness, density and completion passage of §2.13 on pieces normalized by the `Aut(Σ, j)` anchor slice, including the at-zero comparison between the moving-anchor and the fixed-slice images. This is not inferred from moving-domain regularity. The ordered original-mark version adds `2r`. No single residual set is asserted to be regular for every one of the uncountably many j.

**Checks.**

- Spheres: `a_0 = 6` and the fixed-j dimension is `2m + 2c₁ − 6 = d_0`, since the sphere has a unique complex structure.
- Tori with fixed j: `2c₁ − 2`, which is `d_0 − 2`, the moving-domain dimension minus the two real moduli of the torus.
- Genus two with fixed j: `−2m + 2c₁`, which is `d_0 − 6`.

*Needs:* §2.7, §2.8, §2.13.

### 2.11 Ordered original marks

Construct the universal-curve and configuration-space comparisons and the proper quotient for r distinct ordered original marks over the unmarked simple carrier; prove the dimension shift `2r`, the determinant orientation and the smoothness of the evaluation maps after fixed-J regularity, with common-refinement, arrow and completion laws. Smoothness of these evaluation maps is not a submersion statement. This construction is separate from the unmarked endpoint of §2.9.

**Checks.**

- Lines in `ℂP²` with one mark: dimension `4 + 2 = 6`, the real dimension of the incidence variety of pointed lines, and evaluation to `ℂP²` is a submersion. The exceptional curve of the blow-up of `ℂP²` at a point (`m = 2`, `g = 0`, `⟨c₁, E⟩ = 1`) has `d_0 = −2 + 2 = 0` and marked dimension 2; its evaluation to the four-dimensional surface has image the curve E and is not a submersion, so smoothness is all that is claimed in general.
- Two marks on a sphere colliding is excluded by distinctness; the configuration space is open.
- Two marks on a line in `ℂP²`: dimension `4 + 2·2 = 8`, and evaluation is a diffeomorphism onto the complement of the diagonal in `ℂP² × ℂP²`, since two distinct points lie on exactly one line; a shift of 1 per mark would give 6, and a 6-manifold cannot map diffeomorphically onto an open subset of an 8-manifold.

*Needs:* §2.9, §0.3; ComplexCurveModuli D5.

### 2.12 Projection-specific finite-regularity budgets

For each selected universal anchor-slice projection π, each compact subset F of its fixed-`J₀` fibre (the fibres over a smooth structure `J₀` of the bounded pieces of §2.13 and §2.19 are such sets, by the elliptic compactness proved there) and each desired differentiability `q₀`, choose a kernel-dimension bound κ as follows. The kernel of `dπ` at a universal solution `(u, J₀)` is the kernel of the anchor-slice linearization at fixed `J₀`, of finite dimension `ind π + dim coker`, equal to `ind π` exactly at the regular points. Prove that the kernel dimension of a Fredholm operator is upper semicontinuous in the operator norm: if `T₀` is Fredholm and C is a closed complement of `ker T₀`, then `T₀|_C` is injective with closed range, this is an open condition on the operator, and `ker T ∩ C = 0` for T near `T₀`, so `dim ker T ≤ dim ker T₀` (the splitting is the pinned Fredholm normal form of TauCeti/Analysis/Fredholm/NormalForm.lean; Mathlib `IsFredholm.eventually_nhds` keeps T Fredholm and `IsFredholm.index_continuousAt` keeps the index constant). Hence `dim ker dπ ≤ κ := max_F dim ker dπ` on an open neighbourhood U of F in the universal solution chart. Choose `q ≥ max(q₀, κ² + 1)`, `p > 2`, a Sobolev order s with `(s − q)p > 2`, and parameter class `ℓ ≥ q + s + 1`; prove the `C^q` Banach chart, section and projection, the split Fredholm property and the transition hypotheses on U before invoking the pinned Sard–Smale theorem, whose differentiability requirement at a point is `(dim ker)² + 1` and not the classical `n > index`. Apply the local form `exists_mem_nhds_isClosed_isNowhereDense_image_criticalPoints` at the finitely many centres of a subcover of F, or the global form `isMeagre_image_criticalPoints_of_isFredholm` on U, in the Banach-space charts of §2.7 and the `J^ℓ` chart of §2.1, and pass the closed nowhere dense critical-value sets to the openness and density argument of §2.13. An unquotiented alternative must add the automorphism excess `a_g` to κ, since the infinitesimal automorphisms lie in the unquotiented kernel. Match the half-normalized section and the tame or compatible tangent constraints. The budget depends on the piece and on `J₀`; it is a device of the density proof, and the residual sets of §2.9, §2.10 and §2.15–§2.17 are statements about smooth structures only.

**Checks.**

- Lines in `ℂP²` unmarked with `J₀` the integrable structure: every line is regular for `J₀`, so `dim ker dπ = ind π = d_0 = 4` on the whole fibre, `κ = 4` and `q ≥ 17`; with `p = 3`, `s ≥ q + 1 = 18` and `ℓ ≥ 36`. The classical threshold would allow `q = 5`, which the pinned theorem does not grant.
- A budget with `q = κ² = 16` for `κ = 4` fails the pointwise hypothesis `(dim ker)² + 1 ≤ n` of the pinned theorem; `q = 17` meets it. At a nonregular point of F with `dim coker = 2` the kernel has dimension `ind π + 2`, so κ exceeds `ind π` there and an index-only budget `q = ind π + 1` would not meet the hypothesis at that point.
- For a negative index every point is critical, since surjectivity would force `dim ker = ind π < 0`; the kernel dimension `ind π + dim coker ≥ 0` is still bounded on F, and the conclusion is that the image of U in `J^ℓ` is meagre near `J₀`: for a dense set of nearby structures the piece carries no solution, which is the empty-regular-locus statement of §2.9 for negative `d_0`. With `ind π = −2` and `dim coker = 2` on F, `κ = 0` and `q ≥ max(q₀, 1)`.
- The semicontinuity is one-sided: for `T_t = diag(t, 1)` on `ℝ²`, `dim ker T_0 = 1` and `dim ker T_t = 0` for `t ≠ 0`, so a bound taken at `t = 0` holds nearby while a bound taken at `t ≠ 0` fails at 0; this is why κ is computed on F itself and U is chosen afterwards.

*Needs:* §2.1, §2.7; Tau Ceti `exists_mem_nhds_isClosed_isNowhereDense_image_criticalPoints`, `isMeagre_image_criticalPoints_of_isFredholm` and the normal-form module of TauCeti/Analysis/Fredholm; Mathlib `IsFredholm.eventually_nhds`, `IsFredholm.index_continuousAt`.

### 2.13 The smooth-J passage on bounded pieces

Prove the all-genus passage from finite-`C^ℓ` genericity to smooth-J genericity on compact X: countably many nondegenerating smooth domain, map and anchor chart pieces with quantitative derivative, injective-point separation and buffer bounds; elliptic compactness on each bounded piece; openness of regularity on each piece; finite-`C^ℓ` perturbations, obtained from the pinned Sard–Smale theorem on the neighbourhood U of §2.12 with the budget computed on the fibre of the piece over the given smooth structure, and relative smooth approximation giving dense open sets in the C∞ topology; the countable intersection by Baire. Use the quantitative simple-point condition at some z, `inf_(ζ≠z) d(u(z), u(ζ))/d(z, ζ) ≥ 1/K` with `‖du‖_∞ ≤ K` and a positive lower bound on the distance of the image point from the fixed region in the relative case, and prove that these pieces exhaust the simple curves as K grows (McDuff–Salamon §3.2, by locator; Wendl, Lectures, v3.2, Prop. 4.49 and Lemma 4.59). Supply the moving-domain and anchor-offset compatibility across orders, completions, representatives and anchor refinements, consuming the fixed-domain comparison of §2.1. A finite-`C^ℓ` residual set is not simply intersected with the smooth structures. This uses compact X; the noncompact-target topology, exhaustion and geometry are §2.18–§2.21.

**Checks.**

- The pieces for `K = 1, 2, 3, …` are nested and closed; a smooth-simple curve with `‖du‖_∞ = 5` lies in no piece with `K < 5`.
- For a fixed piece the set of smooth J regular on it is open in C∞; the intersection over all pieces is residual but not open: a limit of regular structures may fail to be regular for a curve of larger K.
- Intersecting a finite-`C^ℓ` residual set with the smooth structures gives a set that may fail to be residual in C∞, which is why the argument is run piecewise.

*Needs:* §2.1, §2.7, §2.12; Mathlib Baire category; HeegaardFloer Lane F2 item 4.

### 2.14 Marked universal evaluation

On the universal simple solution locus with J varying, prove that joint evaluation at r distinct original marks is a split submersion, with completion and quotient comparisons. Use the localized tangent application of §2.6 and the point-constrained Fredholm and adjoint argument, beginning with `W^(1,p)` and its `L^(p/(p−1))` range dual before transporting to higher orders; include the moving-mark derivatives (Wendl, Lectures, v3.2, Prop. 4.55). This is separate from the moving auxiliary-anchor normal directions of §2.7 and does not imply fixed-J evaluation submersivity.

**Checks.**

- For one mark the statement says that every target point and every tangent direction at it is reached by varying (u, J, mark); the fixed-J statement is false for the exceptional curve of §2.11.
- The range dual of `W^(1,p)`, `p > 2`, is realized on the adjoint-function space plus finite cotangent spaces at the marked images; with `p ≤ 2` the point evaluations are not continuous and the dual is different.
- For two marks on a line in `ℂP²` with the integrable structure the fixed-J evaluation derivative already has rank 8 onto `T(ℂP² × ℂP²)`, by §2.11, so the J-variation adds nothing there; for the exceptional curve of §2.11 with one mark the fixed-J derivative has rank 2 in a tangent space of dimension 4 and the J-variation supplies the two missing normal directions. The universal theorem covers both cases, the fixed-J statement only the first.

*Needs:* §2.6, §2.11; Tau Ceti Fredholm adjoint module.

### 2.15 Fixed-incidence generic-J theorem

For each fixed smooth embedded `Q ⊂ X^r`, construct the incidence-constrained anchor-slice Fredholm projection and prove that a residual subset of smooth tame, and separately compatible, J makes evaluation transverse to Q, with signed dimension `d_r − codim Q`. Supply its own smooth-J openness and density passage on countably many compact chart pieces of Q paired with bounded map and domain pieces and buffers; Q need not be closed, and openness near its frontier is not inferred. Countably many prescribed Q may be combined, not all at once. With a coorientation of Q use the normal-first orientation isomorphism `det(T M_r) = det(NQ) ⊗ det(T ev⁻¹(Q))` with specified ordered normal lifts; without it retain the normal orientation local system. This is separate from the unmarked endpoint and from the obstruction-augmented models of Layer 12.

**Checks.**

- Lines in `ℂP²` through two fixed points (`Q` a point of `X²`, `codim Q = 8`): `d_2 − 8 = 8 − 8 = 0`, one line, consistent.
- Conics through five points: `d_5 − 20 = 20 − 20 = 0`, one conic.
- Lines through three points: `d_3 − 12 = 10 − 12 = −2`: empty for generic position, as expected.

*Needs:* §2.14, §2.13, §0.3.

### 2.16 Unconstrained relative families

Construct generic smooth finite-dimensional P-family versions on the anchor-slice charts, relative to prescribed compatible parameter collars and faces whose restricted simple problems are already regular. The unmarked projection index is `d_0 + dim P`; unconstrained original marks add `2r` through §2.11 without the joint-evaluation theorem. Prove the family topology, completion, relative smoothing and parameter-first orientations using the vertical Fredholm determinant line, with the outgoing-minus-incoming endpoint identifications; identify that line with a fixed-parameter fibre tangent only where the fixed-parameter problem is regular. The resulting simple cobordism may be noncompact; compactness requires separately proved no-bubbling, no-exit and properness hypotheses. Spatially restricted perturbations require an injective regular point in the allowed open target region for every relevant map and quantitative separation on each bounded piece.

**Checks.**

- For `P = [0,1]` and `d_0 = 0` the family space is one-dimensional; a point of the family where the fixed-parameter problem has a one-dimensional cokernel is a fold of the projection to P, which is why the vertical determinant line and not the fibre tangent is oriented.
- Conics degenerating to two lines along a path of complex structures leave every compact set of the smooth-simple family: the cobordism is noncompact.
- Lines in `ℂP²` over `P = [0, 1]`: the family index is `d_0 + 1 = 5`; for a path of tame structures along which the fixed-parameter problem is regular at every parameter the family space is a 5-manifold with boundary fibred over `[0, 1]` with fibre the dual plane, and the vertical determinant line is the fibre tangent at every point because every fibre is regular; the parameter-first orientation restricts at `t = 1` to the fibre orientation and at `t = 0` to its opposite.

*Needs:* §2.9, §2.11, §2.13, §0.3.

### 2.17 Incidence relative families

For the fixed Q of §2.15 require the prescribed parameter faces and collars already regular for that incidence problem and apply the projection with index `d_r + dim P − codim Q`. Prove its own bounded-piece smooth-family residual and density passage and all boundary, arrow and refinement laws. Orient parameter-first using the normal-first vertical determinant line; identify it with the fixed-parameter fibre tangent only where that problem is regular. The total generic family need not project submersively to P. Translating to a normal-first incidence orientation on the full P-family carries the Koszul factor `(−1)^(dim P · codim Q)`. No compactness is inferred from genericity or a compact target. Neither family branch uses compactness of Layer 3, nodal gluing, a virtual engine or simple-image normalization.

**Checks.**

- `dim P = 1`, `codim Q = 2`: the Koszul factor is `+1`; `dim P = 1`, `codim Q = 1`: `−1`. Reordering (parameter, normal) to (normal, parameter) on `ℝ ⊕ ℝ` reverses orientation, consistent.
- With `dim P = 1` and index `d_r − codim Q = −1`, the family index is 0: isolated parameter values with a solution, the standard wall-crossing picture.
- Lines through two fixed points of `ℂP²` over `P = [0, 1]`: index `d_2 + 1 − 8 = 8 + 1 − 8 = 1`, a one-dimensional family whose fibre at each regular parameter value is the single line through the two points, and the Koszul factor `(−1)^(1·8) = +1`.

*Needs:* §2.15, §2.16.

### 2.18 Arbitrary-target localized carriers

In this smooth-simple branch allow a finite-dimensional Hausdorff second-countable boundaryless symplectic target X without compactness. Fix g and an integral class A and restrict to nonconstant smooth closed connected sources with an injective regular point. Transfer the half-normalized section, class, `c₁`, area, orientation and native-carrier conventions of §0.1 to this branch, replacing only compactness of the target. Extend the carriers of §2.4–§2.8 (early index, tame and compatible localized surjectivity, moving-anchor and fixed-slice image comparison, countable chart cover, proper action and solution quotient) to this target by constructing the target-dependent estimates and transitions on compact neighbourhoods of each map image and comparing chart, frame, anchor and completion changes. A convergent solution sequence has a common compact target neighbourhood; use it for the local proper-action and quotient comparisons rather than any compact-X theorem. For each sufficiently large ℓ construct the finite-`C^ℓ` target-J and finite-order map Banach Cauchy–Riemann zeros, anchor slices, projections and transitions on these compact-image charts, the restriction, cutoff-extension and norm-comparison estimates needed there, and use the fixed-domain completion comparison of §2.1 only where its hypotheses apply; compare nested completions only with the elliptic regularity available at that order, and bootstrap to C∞ only on smooth parameters. No normalization, nodal or virtual theory and no global no-escape hypothesis is an input.

**Checks.**

- For `X = ℝ^(2m)` with the standard structures the only closed pseudoholomorphic curves are constant, so the carrier of nonconstant simple curves is empty and every statement is vacuous there; the branch is not a theorem about this target.
- For `X = T*S¹ × ℂP¹` a sequence of spheres `{a_k} × ℂP¹` with `a_k → ∞` has no common compact target neighbourhood and no convergent subsequence; the hypothesis of the proper-action comparison is on convergent sequences only.
- In the same target the spheres `{a_k} × ℂP¹` with `a_k → a` converge, and for large k their images lie in the compact set `B̄(a, 1) × ℂP¹` for a metric ball of `T*S¹`, so the local proper-action and quotient comparisons apply on that common neighbourhood and the limit is `{a} × ℂP¹`; the comparison is a statement about convergent sequences, which is all the generic theorem of §2.19 uses.

*Needs:* §2.1, §2.4–§2.8; Tau Ceti `SmoothTwoForm.IsSymplectic`.

### 2.19 Moving-domain quantitative pieces and the unmarked endpoint

Choose countable target windows `K_n` inside larger precompact buffers, nondegenerating compact domain-slice and anchor patches, uniform first-derivative bounds, compact distinct anchor configurations and a witness with quantitative nonzero derivative, injective-point separation and target and free-region buffers; nest the pieces so that every somewhere-injective curve is tested in some piece. Prove compactness of closed pieces for converging smooth J from the local elliptic estimates and preservation of witness, integral class and anchor conditions: this is bounded-piece compactness, not stable-map compactness. For these pieces choose `C^ℓ` parameter norms and finite-order solution completions above the budgets of §2.12; prove compactness for converging finite-`C^ℓ` coefficients, operator-norm convergence of the completed projections and right inverses, and regular-on-piece openness in the finite topology and in the smooth topology; use one-order and compact-embedding buffers where the completion requires them and state the inequalities. First obtain a finite-order open regular neighbourhood, then smooth inside it and apply the finite-order-to-smooth passage of this branch. Applying it to these pieces gives a residual subset of smooth tame J, and separately of smooth compatible J, whose unmarked proper quotient is an oriented Hausdorff second-countable smooth manifold of signed dimension `d_0 = (m − 3)(2 − 2g) + 2⟨c₁(TX), A⟩`; negative dimension means emptiness. For every following variant choose, for that projection, that piece and the smooth base structure `J₀` at which density is proved, the kernel-dimension bound κ of §2.12 on the compact fixed-`J₀` fibre of the piece, `q ≥ max(q₀, κ² + 1)`, `p > 2`, weak order s with `(s − q)p > 2`, a stronger order `s₊ ≥ s + 1` for compact embedding, and `ℓ ≥ q + s₊ + 1`, and prove the finite-order elliptic estimates, strong-to-weak compactness and completed-operator convergence with every additional derivative-offset inequality the charts require. The non-family endpoints are unrestricted `U = X`; spatially relative alternatives go through §2.21 with P a point.

**Checks.**

- The spheres `{a} × S²` of §2.22 lie in the piece with window `K_n ⊇ {a} × S²` and leave every window as `a → ∞`: each is tested in some piece, none in all.
- A witness with `‖du‖_∞ ≤ K` and injective-point separation `1/K` is preserved under smooth convergence of maps and J; a witness defined by strict inequalities only would not be closed.
- For `X = ℝ² × S²` with the split structure of §2.22, the fibre of a piece with window `K_n` over that structure is the compact set of spheres `{a} × S²` with a in a compact subset of the plane, all regular with `dim ker = d_0 = 2`, so `κ = 2` and the budget is `q ≥ max(q₀, 5)`; a piece whose window were the whole plane would have a noncompact fibre, and no bound κ would be available from it.

*Needs:* §2.18, §2.12, §2.13 (pattern), Mathlib Baire category.

### 2.20 Fixed-j, marked, joint-evaluation and incidence variants on arbitrary targets

For each specified smooth j construct the separate `Aut(Σ, j)`-normalized carrier, projection, proper quotient and index `f_j = m(2 − 2g) + 2⟨c₁, A⟩ − a_g`, using fixed-conformal-structure anchor pieces; on the fixed-j finite-order slice construct its own buffered pieces, prove compactness for converging smooth J and sufficiently strong finite-`C^ℓ` coefficients, completed-operator norm convergence, smooth and finite-order openness, then the perturb, smooth and Baire passage with its own index budget; this does not follow from the moving-domain openness. Retain the at-zero anchor and slice comparison. For r ordered distinct original marks construct the configuration, universal-curve and proper quotient comparisons of §2.11 on each moving-domain or fixed-j carrier; marks contribute `2r`, and smooth fixed-J evaluation is not submersivity. Extend the marked universal split submersion of §2.14, with the `W^(1,p)` range dual, moving-mark derivatives and quotient comparisons, and its finite-order section and operator comparisons on marked pieces. For each fixed embedded `Q ⊂ X^r` construct the incidence-constrained moving-domain projection of index `d_r − codim Q` with `d_r = d_0 + 2r`, its own joint map, domain and Q pieces, compactness and openness for smooth and finite-`C^ℓ` coefficients with operator-norm convergence before smoothing, compact pieces in the topology of Q with normal-chart and frontier buffers for nonclosed Q, and then the separate residual fixed-Q theorem, with the orientation conventions of §2.15. For fixed j construct the joint operator on the fixed-j section with `j̇ = 0`, `(ξ, Y, ż) ↦ (D_u ξ + (1/2)Y∘du∘j, (ξ(z_i) + du(z_i)ż_i)_i)`: on `W^(1,p)`, `p > 2`, the map operator with appended finite evaluations is Fredholm; its range dual is the `L^(p/(p−1))` adjoint space plus the finite cotangent spaces at the marked images; from the injective regular witness construct an isolated source disc away from the marks; localized J variations kill an annihilator on that disc; adjoint unique continuation propagates on the connected punctured source; the range-dual function has no part supported only at marks; local test sections kill the remaining point covectors; closed finite-codimensional range and finitely many J directions give a continuous right inverse. Transfer moving-mark derivatives, higher completions and the `Aut(Σ, j)` and anchor-slice images by the at-zero comparisons. Use this operator for the fixed-j incidence projection of index `f_j + 2r − codim Q`, with its own buffered pieces and passage. Neither moving-domain surjectivity, the `2r` shift nor smoothness of fixed-J evaluation proves the joint submersion, and each specified j or Q theorem is its own conditional passage.

**Checks.**

- The factor `1/2` in `(1/2)Y∘du∘j` is the derivative of `(du + J∘du∘j)/2` in J; with Wendl's unhalved section it would be 1.
- For a torus with fixed j and one mark the quotient dimension is `f_j + 2 = 2c₁ − 2 + 2 = 2c₁`; for `c₁ = 0` the translations of the torus move the mark, so after dividing by `Aut(Σ, j)` the one-marked fixed-j quotient is zero-dimensional, with the finite lattice stabilizer retained.
- `Q` the diagonal in `X²` with two marks: index `d_2 − 2m = d_0 + 4 − 2m`, for lines in `ℂP²` equal to `4 + 4 − 4 = 4`; a line is injective, so two distinct marks never map to the same point and the solution set is empty. Transversality to Q asserts the dimension of the solution set only when it is nonempty, and a statement promising a nonempty four-dimensional space would be false.

*Needs:* §2.18, §2.19, §2.10, §2.11, §2.14, §2.15; Tau Ceti Fredholm adjoint module.

### 2.21 The relative application guard and families on arbitrary targets

On the localized carriers of §2.18 construct compact finite-dimensional P-family problems with compatible prescribed parameter collars and faces and smooth neighbourhood germs on closed spatial regions. At each free parameter value every tested curve must have an injective regular point in the allowed open target region with quantitative support and separation buffers, or the frozen tested problem must already be regular for its combined parametrized operator including the chosen incidence; prescribed faces and collars are compatible ambient-regular extensions of that same problem. Meeting the free region is not a witness, and no unproved density lemma upgrades it. The precompact-U theorem fixed outside U tests curves with an injective point in U; unrestricted `U = X` uses compact windows and does not require X precompact. Own the combined P-family finite-order section, projection and buffered pieces for the moving-domain unconstrained family (index `d_0 + dim P`, plus `2r` through the marked carrier), the moving-domain incidence family (index `d_r + dim P − codim Q`, with already regular incidence faces), the specified fixed-j family (index `f_j + dim P`, plus `2r`) and the fixed-j incidence family (index `f_j + 2r + dim P − codim Q`), each with its own compactness for smooth and sufficiently strong finite-`C^ℓ` coefficients, completed-operator convergence and finite-order and smooth openness before smoothing, then the relative conditional passage for that problem; no branch is inferred from another's openness. Retain the vertical Fredholm determinant, parameter-first and outward-first endpoint conventions, the Koszul factor `(−1)^(dim P · codim Q)` and the normal orientation local system where required; orientations assert neither regularity of each fixed-p slice nor compactness of a cobordism.

**Checks.**

- A family of spheres `{a_p} × S²` in `ℝ² × S²` with `a_p` moving: every tested curve has an injective point in U when U contains its image, and the family is regular with index `d_0 + dim P = 0 + dim P` by §2.22; if U is the complement of a neighbourhood of the image, no witness exists and the guard refuses the perturbation.
- With P a point the relative guard reduces to the precompact-U theorem; with `U = X` to the unrestricted endpoint of §2.19.
- For the spheres of §2.22 over `P = [0, 1]` with `U = X` the family index is `d_0 + 1 = 3`; for the constant path of split structures the total family is `[0, 1] × ℝ²`, three-dimensional, regular at every parameter and noncompact: the guard admits the family and produces no compactness, as the orientation and regularity conventions state.

*Needs:* §2.18–§2.20, §2.16, §2.17.

### 2.22 Scope of the arbitrary-target branch and the escape test

Layers 0 and 3–13 keep their compact-target hypotheses; no nodal gluing, virtual engine, orbifold or simple-image normalization enters the arbitrary-target branch of §2.18–§2.21. Prove the escape test: for the split structure `J = i ⊕ J_(S²)` and the product form on `ℝ² × S²`, the spheres `{a} × S²` are regular in one fixed class and area and escape every compact set; their normal Cauchy–Riemann operator is the Dolbeault operator of the trivial line bundle, with kernel the constants and zero cokernel, their tangential operator is that of `O(2)` with zero cokernel, so both cokernels vanish and the moduli space is `ℝ²`, of dimension `d_0 = (2 − 3)(2) + 2·2 = 2`. Hence no compact moduli space, cobordism or count follows from this branch; an application supplies its own uniform image confinement and compactness theorem. Punctured and noncompact sources, boundary conditions and weighted ends are separate problems.

**Checks.**

- `d_0 = 2` matches the two real parameters of a; a formula giving `d_0 = 0` would contradict the explicit family.
- Each sphere is embedded, so simple; its energy is the area of `S²`, fixed; the images leave every compact set as `|a| → ∞`.
- Replacing `ℝ²` by `T²` makes the target compact and the same family compact: the escape is a property of the target, not of the index.

*Needs:* §2.19, §0.3.

### 2.23 Product-class rigidity and its normal obstruction

Let (Σ, j) be a closed connected Riemann surface of genus g with a positive area form, F a connected symplectic manifold with a smooth tame `J_F`, `dim_ℝ F = 2(n − 1)`, `n ≥ 1`, with the product form and structure on `Σ × F` and the class `A = [Σ × {p}]`; use the compact-image carrier of §2.18 when F is noncompact. Prove, for a pseudoholomorphic map from any closed connected Riemann surface into `Σ × F` in class A, that its second projection is constant and its first projection has degree one and is a biholomorphism: the energy and area identity of §0.1 gives `E = area(Σ)` and the second projection has energy zero, hence is constant, and the first projection is a nonconstant holomorphic map of degree one in the pinned sense, hence a biholomorphism by `biholomorphOfDegreeEqOne`. Thus the source genus is g; identify the smooth unmarked quotient with F by the constant value of the second projection, with its quotient topology, and the one-marked quotient with `Σ × F` through evaluation. At the slice `Σ × {p}` identify the normal operator with the Dolbeault operator on the trivial bundle `Σ × T_pF`, with kernel `T_pF` and cokernel `H^(0,1)(Σ) ⊗_ℂ T_pF` of complex dimensions `n − 1` and `g(n − 1)` (ComplexKahlerGeometry K5). Compare with the full moving-domain deformation complex: cancel the tangent and domain-deformation directions while retaining the low-genus automorphism quotient, and prove that the same normal obstruction remains. Compute `⟨c₁(T(Σ × F)), A⟩ = 2 − 2g`, the real dimension `2n − 2` of the moduli space and its signed expected dimension `(n − 1)(2 − 2g)`. Prove regularity for `g = 0` and nonregularity for `g > 0`, `n > 1`. At `n = 1`, F is a point, the normal bundle is zero, the curve is regular in every genus and the unmarked quotient is one point with trivial stabilizer and dimension 0. This explicit nongeneric product family tests the index and the universal theorem; it is not an application of the generic conclusion to the fixed product structure.

**Checks.**

- `g = 1`, `n = 2`: expected dimension 0, actual dimension 2, cokernel of complex dimension 1; the difference `2 − 0 = 2` is twice the complex cokernel dimension.
- `g = 0`, any n: expected `2(n − 1)` equals actual `2n − 2`; cokernel `0·(n−1) = 0`.
- `n = 1`: both dimensions 0 in every genus, and `⟨c₁, A⟩ = 2 − 2g` is the Euler characteristic of Σ, as it must be for the tangent bundle.
- A map in class A whose first projection had degree 2 would have energy `2·area(Σ)`, contradicting `ω(A) = area(Σ)`; the class fixes the degree.

*Needs:* §0.1, §0.5, §2.18, §2.5; Tau Ceti `biholomorphOfDegreeEqOne`; ComplexKahlerGeometry K5.

### Examples

- Lines, conics and point-conditions in `ℂP²` as computed in §2.9 and §2.15; the exceptional curve of a blown-up point as the evaluation non-submersion of §2.11.
- The spheres `{a} × S²` in `ℝ² × S²` (§2.22) as a regular, noncompact, escaping family.
- The product classes `Σ × {p}` (§2.23) as a nongeneric family whose cokernel is computed exactly.

### Dependencies

Layer 0; ComplexCurveModuli D0 items 1, 3 and 5, D1, D3 item 5, D4, D5; HeegaardFloer Lane F1 items 1–2 and Lane F2 items 1 and 4; PDE Lane A; ComplexKahlerGeometry K5; Tau Ceti Sobolev and Fredholm modules; Mathlib Baire category.

## Layer 3: Global stable-map topology and compactness (M3)

The topology is constructed first, independently of any implicit-atlas engine or gluing chart, and the compactness theorem is proved for all genera, including varying conformal structures and degenerating normalization components; local gluing charts do not prove it.

### 3.1 The bubble-openness lemma

For a chosen finite stabilization by auxiliary labels, prove that the image of a chart under auxiliary forgetting is open. Use `forgetAuxiliarySet` of ComplexCurveModuli D7 item 1 on the retained-arrow groupoid with specified retained and forgotten label sets, its enumeration-independent comparison, permutation-arrow and automorphism descent and family and base-change laws, in the stable target-signature range on the combined marked family. Retain the full graph of the map over the uncontracted combined universal domain, with all labels and multiplicities, and push it under the domain contraction only as a graph relation for the exclusion test. On relatively compact family patches choose uniform exact target balls and shrink the domain and target buffers by the modulus of continuity of the reference map; if a component is contracted to one domain point, its whole image lies in one small exact ball, and Stokes with taming excludes every nonconstant closed normalization component there, the uniform primitive and monotonicity constants being those of §3.4. Allow stable collision bubbles where transported retained labels meet comparison labels; they are inserted domain vertices, not original components. After deleting comparison-only tails, construct the collision refinement so that each remaining inserted vertex has at least two retained special flags, and prove this from the marked-point bubble construction of D7 item 2. Each original constant vertex in a contracted rational tree has at least three retained special flags. With `V_orig` and `V_ins` the two vertex counts of a contracted tree, the tree has at least `3V_orig + 2V_ins − 2(V_orig + V_ins − 1) = V_orig + 2` external flags; a contracted tree has at most two, hence `V_orig = 0`: only pure inserted constant trees contract, harmlessly, and no original vertex or nonconstant multiplicity is discarded. The chosen stable target signature excludes contraction of an entire unmarked genus-one exceptional curve. Transport the retained auxiliary labels in disjoint off-node local sections; the surviving augmented source remains pointed stable and, after shrinking, lies in the chosen chart. No faithful graph is replaced by its collapsed relation in the countable presentation of §3.3.

**Checks.**

- `V_orig = 1`, `V_ins = 2`: the count gives `3 + 4 − 4 = 3 > 2` external flags, so such a tree cannot contract; `V_orig = 0`, `V_ins = 1` gives `2 − 0 = 2`, the one allowed case, an inserted bubble with two special flags collapsing back to a point.
- A nonconstant component contracted to a point would have image in an exact ball of arbitrarily small radius, hence energy below the threshold of §3.4 and hence be constant: contradiction, so only constant components contract.
- An assertion that every ghost component individually stays stable after each contraction step is false for an inserted bubble with exactly two retained flags; the whole-tree count is what is used.

*Needs:* ComplexCurveModuli D7 items 1–2, D5; §3.4; §1.1.

### 3.2 The Hausdorff-graph topology and Hausdorffness

Define the topology on isomorphism classes of stable maps by Hausdorff-graph neighbourhoods: after an auxiliary stabilization with enough marks to break the relevant automorphisms, present a map by the graph of its descended map over the universal groupoid family of ComplexCurveModuli D5 in the product of the universal curve with X, and take the ε-neighbourhoods of that compact graph in the Hausdorff metric. Prove independence under combined auxiliary markings, finite quotients and chart choices, and the cross-centre neighbourhood axiom: if v lies sufficiently inside an ε-neighbourhood of u presented with u's auxiliary marks, then after transport to a combined stabilization there is a δ-neighbourhood of v, presented with v's own marks, inside that ε-neighbourhood; use the continuous domain-chart arrows, local sections transporting auxiliary labels off the nodes, unique nearby transverse intersections, compact buffers and off-node local elliptic estimates, with nested buffer radii. Same-centre filteredness alone is not a neighbourhood system. Prove that the restricted auxiliary-forget and chart-quotient maps are continuous and open, before any gluing theorem, using §3.1. Prove Hausdorffness from the domain-arrow properness of ComplexCurveModuli D6: a double-limit sequence in countable local graph bases has, after combined stabilization and the collision comparison, convergent domain-comparison arrows; pass the map intertwining to the limit by the full graphs off the nodes and continuity at the nodes; use D7 item 1 to remove only the pure inserted constant trees. The result is one isomorphism class of limits, not a unique arrow. Prove equivalence with convergence by deformations: complex structures and maps converge smoothly off the nodes, neck oscillation and energy loss are controlled, labels and node identifications are retained.

- The topology is Hausdorff and independent of all auxiliary choices; limits are unique up to isomorphism with all finite automorphism arrows retained.
- Convergence in this topology is equivalent to Gromov convergence by deformations.
- For the empty-node stratum the topology agrees with the quotient C∞ topology of §2.8 on smooth-simple maps.

**Checks.**

- The conic degeneration of §3.8 converges in this topology to the two-line map; convergence of image sets alone would not distinguish the two-component map from the smooth conic parametrized differently.
- Two nonisomorphic maps with the same image, such as the degree-one and degree-two parametrizations of a line, have disjoint neighbourhoods: the graphs carry the parametrization and multiplicity.
- A sequence whose domain complex structures degenerate without a node forming in the map, such as a constant torus with `τ → i∞`, has no limit in the stable-map space of the constant class with `n = 0`, consistent with that space being empty.

*Needs:* ComplexCurveModuli D5, D6, D7 item 1; §3.1; Mathlib Hausdorff metric on compact subsets.

### 3.3 Global second countability

Before compactness, prove that the coarse stable-map space is second countable: enumerate all finite normalization graphs and all finite auxiliary-mark counts, not only graphs satisfying an energy bound; for each stable stabilized signature use the countable universal chart groupoid of ComplexCurveModuli D5; on countably many relatively compact base patches use metrizable universal families, separable metric total-curve and target products, and the second-countable Vietoris hyperspace of compact graphs over the varying universal-domain charts, with finite obstruction parameter spaces where present. The graph includes its domain coordinate and transported labels, so it retains parametrization and multiplicity. Use unrestricted finite stabilizing-mark configurations over these countably indexed chart models; incidence choices enter the local openness proof, not the index set. Pass to the solution and marking subspaces and the open quotient and forget maps of §3.2; their images form a countable family of open second-countable models covering the coarse space, and the union of their countable bases is a countable base. Prove the hyperspace, countable-cover and open-map basis lemmas on these carriers. No uniform finite graph or auxiliary-mark bound is needed. In particular the coarse space is Lindelöf; local metrizability alone is not the compactness argument.

**Checks.**

- The space of constant maps of a stable signature is `X × |M̄_(g,n)|`, second countable as a product; the construction recovers this.
- A countable union of second-countable open subsets is second countable; a union over the uncountably many incidence choices would not be, which is why incidence enters only the openness proof.
- Without second countability, sequential compactness would not give compactness: the long line is sequentially compact and not compact.

*Needs:* ComplexCurveModuli D5; §3.2; Mathlib Vietoris topology on compact subsets, second countability of countable unions.

### 3.4 Interior regularity, monotonicity and the energy threshold

Prove uniform interior ε-regularity: for `2 < p < ∞` there is `ε₁ > 0` such that a pseudoholomorphic map on the unit disc with image in a fixed compact set and `‖du‖_(L²) < ε₁` satisfies `‖du‖_(L^p(½ disc)) ≤ C_p ‖du‖_(L²)`, uniformly over continuous J uniformly close to a fixed one (Ivashkovich–Shevchishin, arXiv:math/9903047, Lemma 3.1; McDuff–Salamon Chapter 4 mean-value inequality, by locator). Prove monotonicity for pseudoholomorphic curves through the centre of a small ball, with a constant uniform on compact X and compact J-families, and the genus-independent positive energy threshold: there is `ħ > 0` such that every nonconstant closed pseudoholomorphic curve for any J in a compact family has energy at least ħ, proved by uniform small exact target balls, Stokes and monotonicity (Ivashkovich–Shevchishin Lemma 3.8 for spheres; the closed-surface case follows from the same local estimate at a point of maximal derivative). Prove finite-energy removal of interior singularities in the form needed here, from HeegaardFloer Lane F2 item 3 and Ivashkovich–Shevchishin Corollary 3.6, and the long-cylinder estimates: small-energy cylinders have exponentially decaying energy and shrinking diameter in their middle, and no energy is lost in the neck (Ivashkovich–Shevchishin Lemma 3.7). Irrational symplectic periods do not obstruct the threshold; no minimal positive period in the homology lattice is assumed.

**Checks.**

- For `ℂP¹` with the area-one form, every nonconstant curve has energy at least 1, since the class is a positive multiple of the generator; the analytic ħ is at most 1 and is not claimed to equal it.
- On a four-torus with a symplectic form whose periods are rationally independent, the areas of integral classes form a dense subgroup of ℝ, so there is no minimal positive period; ħ is nevertheless positive because it comes from the local estimate, and a class of area below ħ has no nonconstant pseudoholomorphic representative for any J in the family. The threshold is analytic, not lattice-theoretic.
- The threshold is proved for compact J-families; for a noncompact family of structures degenerating to a nonsmooth one it fails, as in §2.22's noncompact targets with structures scaled to shrink the sphere.

*Needs:* HeegaardFloer Lane F2 item 3; §0.1; PDE Lane B.

### 3.5 The map-stable anchor adapter

Before Layer 4, construct on each map or prestable limit the map-stable anchor adapter: choose enough distinct off-node off-mark regular points on every nonconstant normalization component to make it pointed stable even after the original marks are forgotten (three added anchors on each rational component and one on each genus-one component suffice, whatever the remaining flags); choose their image values away from the finitely many constant-component images and use local transverse incidence discs with disjoint source buffers, so that unique local intersections persist under sufficiently close off-node `C¹` deformations. These are elementary local incidence choices, not Layer 5's global auxiliary-data construction. Stabilize any remaining constant parts with temporary comparison marks, apply `forgetAuxiliarySet` of ComplexCurveModuli D7 item 1 with the nonconstant anchors retained, and prove that it contracts precisely the newly unstable constant parts. Pull back the universal domain contraction continuously to the parameter space, without assuming that space analytic; its proper quotient property makes the constant-on-fibre map descend. Verify the descended maps fibrewise in the holomorphic and removable charts and preserve the integral class, since contracted components are constant. Then erase the anchors as labels without any further domain contraction; the nonconstant pointed-unstable components remain. Compare different anchor choices by a third disjoint set and unions, the order, permutation, arrow and base-change laws of D7 and the descended maps; this gives choice independence, composition and family laws. Pure inserted comparison collision trees are handled by §3.1.

**Checks.**

- A nonconstant unmarked sphere with three anchors is pointed stable; with two it is not: the count `3` is sharp for spheres, and `1` for tori.
- A constant sphere with two original marks attached to a nonconstant component at a node: the temporary comparison mark stabilizes it, forgetting contracts it, and the two marks land on the nonconstant component, which the anchors keep stable.
- Erasing anchor labels after contraction changes no domain: a procedure that forgot anchors through `forgetAuxiliarySet` again would contract the nonconstant unmarked sphere, which is wrong.

*Needs:* ComplexCurveModuli D7 item 1; §0.5, §1.2, §3.2.

### 3.6 The simultaneous covering and the global parametrization

On each closed stable marked normalization choose a finite pants, disc and annulus arrangement with disjoint annular cores away from all protected overlaps and flags. Using the point-constrained Dolbeault and Serre comparison of ComplexCurveModuli D0 item 2 and ComplexKahlerGeometry K5, identify the cokernel of the point-constrained infinitesimal action with the dual of meromorphic quadratic differentials with the prescribed simple poles; restriction to a nonempty annular core on each component detects such a differential by unique continuation, hence compactly supported smooth Beltrami representatives in these cores span the full marked cokernel, including mark-motion directions. Choose a finite complex core-supported complement T and verify every hypothesis of the arbitrary-complement offset-slice theorem of D3 item 5; transport its derivative `2j₀(∂̄ξ + η)` with the convention comparison, and apply the theorem to T to obtain one global normalization reparametrization whose pulled-back complex structure equals the reference structure outside the cores. Its common collar restrictions are used by every adjacent piece. This uses point constraints on closed components, not vector fields fixed on an open boundary collar. Extend the same branch germs over the plumbing annuli of D4, preserving permanent-node branch coordinates, and apply `roundAnnulusNormalization`, `annulusModulusFamilyComparison`, `protectedCollarAnnulusInterpolation` and `nodalAnnulusBranchLimit` of D6 item 1 on every spare and plumbing annulus with the same end germs, retaining reciprocal coordinates `zw = ρ` and the real angular lifts; the middle interpolation is smooth and matches both prescribed holomorphic end germs on smaller protected collars. Prove the simultaneous application and overlap laws that assemble these pieces into one global parametrization `σ_n`, with finite-modulus or node-limit convergence; for the artificial fixed mark discs preserve the original outer parametrizations. Prove every covering condition of Ivashkovich–Shevchishin Theorem 4.2(a)–(g): a fixed finite cover of the parametrizing surface by discs, annuli and pants; a fixed outer annulus for every attached-disc boundary; n-independent pulled-back structures on disc, pants and boundary pieces; connected annular overlaps with fixed structures and a single compatible restriction of the global parametrization; fixed contracting circles for persistent nodes with fixed structures on both punctured sides; convergent conformal radii in `(1, ∞]` for the other annuli, with the standard-cylinder containment of Ivashkovich–Shevchishin Lemma 4.1 (an annulus adjacent to a boundary circle of a cylinder and of conformal radius R contains the cylinder of length `a₊(R)` at that boundary) supplying the uniform overlap collars; and equality with prescribed outer-disc parametrizations on smaller collars. Subdivide loop edges and spare annuli so that no pair of pieces meets in two disjoint collars, keep deformation supports in annular interiors away from overlaps, apply the finite-modulus, capacity and plumbing logarithmic-radius comparisons of D6 item 1 with their hypotheses, and use the two fixed punctured branches at persistent nodes. Use real twist parameters for marked Teichmüller coordinates; periodic twists parametrize the Dehn-twist quotient; prove the covering statement on the chosen quotient.

**Checks.**

- On a sphere with three marks the point-constrained cokernel is zero (no quadratic differentials with at most three simple poles), so `T = 0` and the reparametrization is the identity; on a torus with one mark it has complex dimension 1, spanned by the constant differential, detected on any annular core.
- On a genus-two surface the cokernel has complex dimension 3; a core-supported Beltrami representative that vanished on one component of a two-component normalization would miss that component's differentials, which is why every component carries a core.
- Covering condition (e) for a persistent node: the contracting circle is fixed and the structures on the two punctured sides are n-independent, which the plumbing coordinate `zw = ρ_n` with `ρ_n → 0` satisfies by construction.

*Needs:* ComplexCurveModuli D0 item 2, D3 item 5, D4, D6 item 1; ComplexKahlerGeometry K5; §3.5.

### 3.7 All-genus Gromov compactness

Prove, for fixed (g, n, β) and compact X with a compact smooth tame family `J_p`, `p ∈ P`, that the coarse space of stable maps with the topology of §3.2 is compact Hausdorff and that its projection to P is proper; closed subsets over compact subsets of P are compact by the same argument. Route (Ivashkovich–Shevchishin Theorem 1.1 and its Remark 2 for marked points): fix the oriented parametrizing surface and the complete image set, with the uniform auxiliary-metric squared-derivative bound equivalent to the area bound `ω(β)` by §0.1 and the uniform metric comparison; the original closed sources have no boundary, and when marked points are handled by attaching constant discs their new boundary circles satisfy boundary nondegeneration by the fixed collar construction. After the controlled temporary stabilization of §3.5, construct the covering of §3.6, then run the area-threshold induction on covering pieces: the small-energy Cauchy–Green estimate, the long-cylinder three-strip recurrence and the common-node-value and removal conclusion (§3.4), bubbling at an existing node in both bounded and unbounded centre-to-scale regimes, patching of the overlap-fixed parametrizations, and stability and class conservation (Ivashkovich–Shevchishin §§3–4, Lemma 4.3 for condition (g), Lemma 4.5 for the limit). Marks are compared by the attached constant discs and the recovery of labelled flags. Prove the milestones separately: finitely many concentration points and rescaled sphere extraction; removal at limiting punctures; no residual neck energy; conformal thick-thin degeneration and domain compactness after stabilization; constant-component stabilization and the graph and genus bounds; class and area conservation; uniqueness of the limit up to isomorphism. Do not identify this roadmap's stabilization with Ivashkovich–Shevchishin's separate notion of non-exceptional components (their Definition 1.11); whole unmarked nonconstant spheres and tori keep their normalized cases. Own the fixed-cover adapter rather than treating a C∞-varying core family as satisfying the source's fixed-structure hypotheses. Prove the combinatorial bound: with a the number of nonconstant components, `a·ħ ≤ ω(β)`; for a stable connected limit graph `Σ_v (2g_v − 2 + val_v) = 2g − 2 + n`, each ghost vertex contributes at least 1 and each nonconstant vertex at least `−2`, so `#ghost ≤ 2g − 2 + n + 2a` and `#edges ≤ 3a + 3g − 3 + n`, with an impossible negative bound read as emptiness; this bound and a uniform finite auxiliary-mark budget are constructed rather than presumed from a stable pointed moduli space. Upgrade sequential compactness to compactness by §3.3: Lindelöf plus sequential compactness gives countable compactness and hence compactness; prove the same countable presentation and subsequence theorem over compact parameter bases. For the zero-area case prove that every component is constant, the space is empty unless `β = 0`, and for `β = 0` the domain has the stable pointed signature and the space is `X × |M̄_(g,n)|`, treated without a rescaling argument. The conclusion is compactness of the coarse space, not of every thickened chart, and not finite CW type of the source.

- Compact Hausdorff coarse spaces for every (g, n, β) and compact tame family, with proper projection to P.
- Limits preserve class and energy, and the limit graph satisfies the stated bounds.
- The space for `β = 0` is `X × |M̄_(g,n)|`, empty when `2g − 2 + n ≤ 0`.

**Checks.**

- `(g, n, a) = (0, 0, 1)`: `#ghost ≤ 0` and `#edges ≤ 0`, a lone sphere; `(0, 4, 0)`: `#ghost ≤ 2`, `#edges ≤ 1`, the two-ghost boundary of `M̄_(0,4)`.
- Two genus-zero vertices joined by one edge, marks 2 + 2: `g = 0 + 1 − 2 + 1 = 0`, valences 3 and 3, `(−2 + 3) + (−2 + 3) = 2 = 2·0 − 2 + 4`.
- The conic degeneration of §3.8 has `a = 2`, `2ħ ≤ 2L`, one edge and no ghost, within the bounds `#edges ≤ 6 − 3 = 3`.
- The constant class with `(g, n) = (0, 2)` gives the empty space; `(1, 0)` likewise; `(0, 3)` gives X itself.

*Needs:* §3.2–§3.6, §0.1, §1.2; ComplexCurveModuli D4, D5, D6, D7 item 1; HeegaardFloer Lane F2 item 3.

### 3.8 A nodal conic limit in the complex projective plane

On the projective carrier `ℂP²` of ComplexKahlerGeometry K7 with its standard complex structure and a Fubini–Study form, construct the family `XY = εZ²`. For `ε ≠ 0` identify each fibre with the embedded degree-two sphere `[s : t] ↦ [s² : εt² : st]`. Prove that its stable-map limit as `ε → 0` consists of two degree-one components, the lines `X = 0` and `Y = 0`, meeting at `[0 : 0 : 1]`, with the source node and both normalization maps given explicitly: the source plumbing is `zv = ε` with `v = 1/w` on the bubble branch; in the coordinates `x = X/Z`, `y = Y/Z` near `[0 : 0 : 1]` the smoothing is `xy = ε` and the map is `x = z`, `y = v`. The map is stable because both components are nonconstant; no pointed-domain stability is assumed. Verify convergence in the topology of §3.2: in `z = s/t` the principal component converges away from `z = 0` to `[z : 0 : 1]`, while `z = εw` gives the bubble map `[0 : 1 : w]` away from its node `w = ∞`. Prove that no component or energy is lost: if a line has area L the smooth conic has area `2L` and both limiting components have area L; exclude extra constant components by the genus-zero dual tree and unmarked stability, separately from the area argument. Compare the source smoothing, target maps, homology classes and energies, and deduce the noncompactness of the smooth embedded conic locus from Hausdorff uniqueness of limits and the comparison with the smooth quotient topology: the two-component limit is not isomorphic to a smooth-domain map. Convergence of image sets alone does not establish convergence of maps.

**Checks.**

- `[s² : εt² : st]` satisfies `XY = s²·εt² = ε(st)² = εZ²`; at `ε = 0` the parametrization degenerates to `[s² : 0 : st] = [s : 0 : t]`, the line `Y = 0`, and the bubble `[0 : 1 : w]` is the line `X = 0`.
- Areas: `L + L = 2L`; a limit with a third nonconstant component would need area at least `2L + ħ > 2L`, impossible, and a constant third component would be an unstable ghost with at most two flags on a genus-zero tree, excluded by stability.
- The limit has one node, `#edges = 1 ≤ 3·2 + 0 − 3 + 0 = 3`, and no ghost, `0 ≤ −2 + 4 = 2`.

*Needs:* ComplexKahlerGeometry K7; §3.2, §3.7, §0.1.

### Examples

- The nodal conic limit of §3.8, with its explicit plumbing and area bookkeeping.
- Constant maps: `X × |M̄_(g,n)|` for `β = 0` in the stable range, and the empty space otherwise.
- The two-ghost boundary of `M̄_(0,4)` as the extreme case of the ghost bound.

### Dependencies

Layers 0–2; ComplexCurveModuli D0 item 2, D3 item 5, D4, D5, D6, D7 items 1–2; ComplexKahlerGeometry K5 and K7; HeegaardFloer Lane F2 item 3; PDE Lane B.

## Layer 4: Nodal linearization, index and finite-dimensional obstruction data (M4)

### 4.1 The nodal linearization and the augmented index

Differentiate the Cauchy–Riemann section of §0.1 along a prestable map with a chosen J-linear connection on TX, including the moving-intersection terms of §2.3 and the domain-deformation terms, on the node-matching subspace of §2.2. Prove closed range and the Fredholm property from the closed-surface Fredholm theory of §0.3, finite-codimension restriction to the matching subspace and the pinned Fredholm theory. Consume the early smooth zero-node index of §2.5 and prove the full nodal and augmented index by component Riemann–Roch, node constraints (`−2m` per node), domain deformation and smoothing parameters and the quotient slice; retain the full node-flag, matching and deformation complex for constant normalization components rather than applying a free quotient-dimension formula to an unstable constant piece. The expected dimension is v of §0.1; a regular augmented thickening with obstruction space E has `dim_ℝ = v + dim_ℝ E`, with a natural dimension witness, and if this sum is negative its regular locus is empty, with no conclusion about the nonregular base.

- The index of the nodal deformation complex is v and is independent of the stratum.
- Restriction to the matching subspace changes the index by exactly `−2m` per node, by §2.2.
- Pardon's dimension `dim M̄_(g,n+ℓ) + (1 − g) dim X + 2⟨c₁, β⟩ + dim E − 2ℓ` for ℓ incidence marks (arXiv:1309.2370, Theorem B.1.1(ii)) equals `v + dim E`: `(6g − 6 + 2n + 2ℓ) + 2m(1 − g) + 2c₁ + dim E − 2ℓ = 2((m − 3)(1 − g) + c₁ + n) + dim E`.

**Checks.**

- Two spheres joined at one node, each of degree one onto a line in `ℂP²`, `n = 0`: component map operators `10 + 10` (each `m(2 − 2g) + 2c₁ = 4 + 6`), automorphisms `−6 − 6`, moving flag points `+2 + 2`, matching `−2m = −4`, smoothing parameter `+2`: total `10 = v = 2((−1)·1 + 6 + 0)`. Omitting the moving flag points gives 6, off by 2 per flag.
- A constant sphere component attached by three nodes to nonconstant components contributes to the full complex its map index `2m` (constants), its automorphisms `−6`, its three moving flag points `+6` and its three matchings `−6m`, that is `−4m`, with the three smoothing parameters `+6` counted once for the nodes; a free quotient formula dividing the constant map by the six-dimensional automorphism group, which fixes it, would produce no such term and would miscount v.
- `v + dim E < 0`: empty regular locus, for example the genus-two class of §0.1 with `(m, g, n, ⟨c₁,β⟩) = (2, 2, 0, −2)`, `v = −2`, with `E = 0` or with `dim E = 1` and `v + dim E = −1`; the constant class with `(g, n) = (0, 2)` has `v = 2m − 2 ≥ 0` and is empty for the stability reason of §1.2, not by this sign.

*Needs:* §0.1, §0.3, §2.2, §2.3, §2.5; Mathlib `ContinuousLinearMap.IsFredholm`, `LinearMap.index`.

### 4.2 Weighted node ends and the constant-mode extension

For nodes treated as cylindrical ends `[0, ∞) × S¹` with coordinate `z = e^(s+it)`, the asymptotic operator is `−J∂_t` on the circle, with spectrum ℤ, spectral gap 1 and kernel the constants, of real dimension 2m. Construct the weighted Sobolev spaces `W^(k,p)_δ` on the punctured normalization with weight `e^(δs)`, `0 < δ < 1`, and prove the weighted Fredholm property of the linearized operator between them, with `ind(D_δ) = ind(D_0) − 2m` per end once δ crosses 0, since the constants cease to be in the domain. Define the extended operator on `W^(k,p)_δ ⊕ (common node constants)`, where the constant for a node is one vector of `T_(u(node))X` cut off on both branches, and prove that it is Fredholm with the same index as the unweighted matched operator, that its kernel and cokernel are identified with those of the unweighted matched operator by the removable-distribution and weak-regularity argument at the puncture, and that these identifications are compatible with the determinant lines of §0.3. Domain spaces contain common constant node values plus decaying parts, not unrelated constants on the two branches. For `p = 2` construct the Fourier and partition estimates on the ends directly; for general p construct the weighted theory as a stated target. Compare the angular normalization: with period `2π` the gap is 1 and Pardon's `δ ∈ (0, 1)` (arXiv:1309.2370, §B.4) is the admissible range; with period 1 the gap becomes `2π` and the range rescales.

- The extended operator with matched constants has index v; the weighted operator without the constants has index `v − 2m·(number of nodes)`.
- The identifications of kernels and cokernels are independent of `δ ∈ (0, 1)`.
- The weight convention is a positive exponent `e^(δs)` on the end `s → ∞`, so decaying sections are in the domain.

**Checks.**

- One node, `m = 1`, hence two ends: crossing eigenvalue 0 removes the constants from each end, `2m = 2` per end and 4 per node, and the common node constant restores 2, so for `δ ∈ (0, 1)` the weighted operator has index lower by 2 per node than the matched operator and the extended operator has the matched index; at `δ = 1` the eigenvalue-1 modes `e^(it)v`, of real dimension `2m = 2` per end, would be crossed as well, a further drop of 4 per node with nothing restored; a statement with `δ ∈ (0, 2π)` for period `2π` would cross the eigenvalues 1, 2, … .
- The constant map on a nodal domain: the unweighted matched kernel contains the common constant `T_xX`, of dimension 2m, counted once, not twice.
- A section that is constant `c₁` on one branch and `c₂ ≠ c₁` on the other is not in the extended domain, although each branch is in its own unweighted space.

*Needs:* §4.1, §0.3; Tau Ceti `Wkp`; HeegaardFloer Lane F1 items 1–3.

### 4.3 Finite-dimensional equivariant obstruction data

Construct finite-dimensional smooth obstruction spaces of sections of `Λ^(0,1) ⊗ u*TX` supported away from nodes and marks that surject onto the cokernel of the linearization: at `k = 1`, `p > 2`, density of smooth compactly supported forcing in `L^p` and finite-dimensionality of the cokernel give the complement, and elliptic regularity transports it to all sufficiently high completions. The obstruction representation is real; rational coefficients belong to the engine. Extend the finite forcing family from the graph to the universal family times X by local trivializations and cutoffs, still away from nodes and marks. Consume the finite-action universal chart of ComplexCurveModuli D6 item 4, including `unorderedAuxiliaryActionChart` and the lifted universal curve, and induce over its finite group to obtain an equivariant real representation and equivariant forcing; prove support and all pullback and equivariance laws, including for ineffective groups.

**Checks.**

- For a regular map the cokernel is zero and the empty obstruction space suffices; a construction that always added a positive-dimensional E would change the dimension witness of §4.1.
- For the product curve of §2.23 with `g = 1`, `n = 2`, the cokernel has real dimension 2 and a one-dimensional complex forcing space supported on an annulus of Σ surjects onto it.
- Inducing from a trivial representation over a group of order 2 acting ineffectively gives a representation of dimension `2·dim E` on which the group acts by swapping, not the trivial representation.

*Needs:* §4.1, §4.2; ComplexCurveModuli D6 item 4; Tau Ceti Sobolev density modules; Mathlib `Representation`.

### Examples

- The two-line map of §3.8 as a one-node domain: `v = 10`, index bookkeeping as in §4.1.
- The product curve of §2.23 as a nonregular map with explicit cokernel and forcing.

### Dependencies

Layers 0–3; ComplexCurveModuli D6 item 4; HeegaardFloer Lane F1 items 1–3; Tau Ceti Sobolev and Fredholm modules.

## Layer 5: Auxiliary incidence and the thickening data (M5)

### 5.1 Thickening data

Construct Pardon's thickening datum `(D_α, r_α, Γ_α, M_α, E_α, λ_α)` (arXiv:1309.2370, Definition 9.2.1): `D_α` a compact embedded real codimension-two submanifold of X with boundary, built from local incidence discs, not required to be a closed or pseudoholomorphic divisor, so no rationality of ω or Donaldson divisor is an input; an integer `r_α ≥ 0` with `2g + n + r_α > 2`; a finite group `Γ_α`, possibly ineffective; `M_α` a `Γ_α`-manifold with the finite-action universal chart of ComplexCurveModuli D6 item 4 over an open subset of `M̄_(g,n+r_α)/S_(r_α)`, with its lifted universal curve `C_α`; `E_α` a finitely generated real `Γ_α`-module; and `λ_α` a `Γ_α`-equivariant linear map from `E_α` to smooth sections over `C_α × X` supported away from the nodes, marks and auxiliary marks of the fibres. A map is transverse to `D_α` (Definition 9.2.2) when it misses `∂D_α`, meets the interior transversally at points that are neither nodes nor marks, and has exactly `r_α` such intersection points. Prove the simultaneous incidence construction and the stability of these conditions under the topology of §3.2, by the equal-dimension Sard theorem `MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero` and local projections with compact buffers (Pardon Lemmas 9.2.7–9.2.8, as in §1.2), without generic-J regularity. Allow `D_α` empty and `r_α = 0` when the domain is already stable; zero-dimensional targets and constant maps never force nonempty incidence data. For the local gluing model choose exactly the minimal additional incidence marks that stabilize each previously unstable component, and prove that the infinitesimal holomorphic domain automorphisms evaluate isomorphically onto the real normal constraints at the selected points, using rank-2 du there; this transports vertical surjectivity to the incidence-constrained model, and extra rigidifying marks are compared as moving data with compensating parameters rather than added as uncompensated constraints. The domain chart `M_α/Γ_α` is `unorderedAuxiliaryActionChart`: the retained-arrow `S_r`-extended domain groupoid restricted to its invariant base is the finite group action groupoid, and its coarse quotient embeds openly; retain the universal curve with its lifted action. Construct the unique local moving-intersection functions with their differentiability budget. Multiple images of a map are allowed: transverse incidence marks their individual preimages. For a finite set I of data form the thickened maps `(C, u, (φ_α), (e_α))` (Definition 9.2.3), their group action, obstruction section and forgetful coordinate maps by summing the `λ_α` terms; no chart-independent C∞ action is inferred.

- The set of all thickening data is set-sized with explicit universe bounds (§9.1).
- `λ_α` vanishes near every node, mark and auxiliary mark of its fibres, and this is retained under extension, cutoff and pullback.
- A thickened map with trivial automorphism group is determined by its underlying map and its chosen identifications.

**Checks.**

- A stable domain needs no incidence: `D_α = ∅`, `r_α = 0`, and the condition `2g + n + 0 > 2` is exactly pointed stability.
- An unmarked nonconstant sphere needs `r_α ≥ 3` and a disc meeting it transversally in exactly `r_α` points; a disc meeting it tangentially somewhere is excluded by the transversality condition.
- A map whose image meets `∂D_α` is not transverse to `D_α`, even if all interior intersections are transverse: the boundary condition is part of the definition.
- Two intersection points on a self-intersecting component with the same image point are two distinct auxiliary marks.

*Needs:* ComplexCurveModuli D6 item 4; §1.2, §3.2, §3.5, §4.3; Mathlib `MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`.

### 5.2 The topology of the thickened spaces

Before any projection-chart theorem define the topology on every `X_I`: for nonempty I use compact graphs of `(u, (φ_α)_α)` in `X × ∏ C_α` over the chart parameters, together with the Euclidean `E_I` coordinates and compatible auxiliary stabilization charts; graph equivalence is by the tuple isomorphisms. On bounded chart and `E_I` parameter neighbourhoods extend the off-node graph elliptic estimates to the finite smooth inhomogeneous forcing sum, with derivative budgets and auxiliary-intersection transport. Prove Hausdorffness, equivalence of presentations, continuity of the group, section and coordinate maps and the identification of `X_∅` with the space of §3.2. A chosen `φ_α` identifies the augmented source with a chart fibre, so an automorphism fixing that identification is the identity; retain the different `Γ_I` translates rather than quotienting them out.

**Checks.**

- `X_∅` is the compact coarse space of §3.7; `X_I` for nonempty I is Hausdorff but in general not compact, since the forcing parameter is unbounded.
- The fibre of `X_I` over `e = 0` in `E_I` is the set of pseudoholomorphic maps with chosen identifications, a finite cover of a subset of `X_∅`.
- Two thickened maps differing by an element of `Γ_I` are distinct points of `X_I` with the same image in `X_∅`.

*Needs:* §5.1, §3.2, §4.3.

### 5.3 The local comparison with the fixed-incidence gluing model

Construct the comparison between Pardon's local model (arXiv:1309.2370, §B.1) and `X_I` by adding the minimum incidence stabilization D with its ordered ℓ-tuple and separately moving every preimage of each `D_α`. The universal chart arrows of ComplexCurveModuli D4–D5 extend each `φ_α` uniquely near its chosen value. Use the unique transverse D-intersections and identity-near arrows to construct the inverse maps: forget the added ℓ marks in one direction, reconstruct them and all `φ_α` in the other; prove continuity both ways in the graph and parameter topologies; at a tuple with trivial automorphisms the chosen rigidification removes the remaining finite ambiguity, and for I empty use a rigidified local lift and the residual quotient. Prove equality of regularity in the local model and intrinsic regularity in `X_I` after the minimum-incidence slice: the linear diagram includes the moving-intersection terms, the automorphism-to-incidence-normal isomorphism of §5.1 and its compensating parameters. Prove this equality and its independence from D, ℓ and the completion before applying §7.3.

**Checks.**

- For a stable domain `ℓ = 0` and the comparison is the identity.
- For an unmarked sphere component `ℓ = 3`: six real constraints against six real automorphism directions, an isomorphism by rank-2 du at the three points; with only two incidence marks the comparison would leave a `ℂ^*` of automorphisms and the two regularities would differ.
- Adding a fourth rigidifying mark without its moving compensation would overconstrain the fixed-domain operator by 2; the comparison treats it as moving data.

*Needs:* §5.1, §5.2; ComplexCurveModuli D4, D5.

### Examples

- The two-line map of §3.8 is a stable map with a stable domain: it needs no incidence datum, and a thickening with `E_α = 0` is a chart of `X_∅` near it.
- An unmarked degree-two cover of a line: `r_α = 3` minimal, with the `ℤ/2` isotropy acting on the six preimages.

### Dependencies

Layers 1–4; ComplexCurveModuli D4–D6; Mathlib `MeasureTheory.addHaar_image_eq_zero_of_det_fderivWithin_eq_zero`.

## Layer 6: Uniform weighted gluing estimates (M6)

### 6.1 Geometric data and the weighted norms

Own Pardon's §§B.2–B.8 as concrete analysis on the carriers of Layers 2–5. Choose node charts and plumbing from ComplexCurveModuli D4 and stratum deformation coordinates from D3 item 5 and D5; choose an exponential map for a metric making the fixed incidence submanifold locally totally geodesic, a separate J-linear connection (the Levi-Civita connection of an arbitrary metric is not J-linear), and norm data. Flatten and preglue maps and sections, retaining the shared node constants (§B.2–§B.3). Define the weighted norms on ends and necks as this roadmap's convention: on an end `[0, ∞) × S¹` in the parallel-transport trivialization of §B.4, the contribution to the squared norm is the squared norm of the normalized circle average `ξ̄ = (2π)⁻¹ ∫_(S¹) ξ(0, t) dt` of the constant Fourier mode plus the weighted integral of `|ξ − ξ̄|² + Σ_(j=1)^k |D^j ξ|²` against `e^(2δs)`, and on a neck of length `2R` the analogous expression with the constant mode taken at the middle circle. Pardon takes instead the value `ξ(n)` at the node of the limiting map as the constant mode (arXiv:1309.2370, Definition B.4.1 and display (B.4.3)); the two choices define equivalent norms on every fixed end, and the uniformity of the equivalence constants as the gluing parameter tends to 0 is a target of §6.3, not an assumption. Prove completeness and the uniform Sobolev, product and composition bounds. Fixed-α norm equivalence does not imply uniform equivalence as `α → 0`.

- The weighted spaces are Banach, with `W^(k,2)_δ` Hilbert for the circle-average norm.
- The constant mode of a section is well defined on each end and neck and is a bounded linear functional.
- Sections in the weighted space converge exponentially to their constant mode along the end.

**Checks.**

- For the constant section `ξ ≡ c` on an end: the circle average is c, the weighted integral vanishes, and the norm is `|c|`; with Pardon's node-value convention the norm is also `|c|` when `ξ(n) = c`, so the two conventions agree on constants.
- For `ξ(s, t) = c + e^(−μs)` with `μ > δ` the weighted integral is finite and the norm is `|c|` plus a term of order `(μ − δ)^(−1/2)`; with `μ < δ` the norm is infinite in both conventions.
- For `ξ(s, t) = e^(−μs) cos t`, the circle average is 0 while a node-value convention evaluating at a point of the circle `s = 0` would assign a nonzero constant mode; the two norms differ but are equivalent on the fixed end with constants depending on δ and μ only.
- On a neck of length `2R` with the middle-centred weight `e^(2δ(R − |s|))`, a section equal to `c₁` at one end and `c₂` at the other with a linear interpolation has weighted norm of order `|c₁ − c₂| e^(δR) R^(−1)` up to constants depending on δ only: the deviation `(c₂ − c₁)s/(2R)` from the middle constant mode contributes approximately `|c₁ − c₂|² e^(2δR)/(8δ³R²)` to the squared norm and the derivative `(c₂ − c₁)/(2R)` approximately `|c₁ − c₂|² e^(2δR)/(4δR²)`. This is unbounded as `R → ∞`: sections with unmatched constants are not uniformly small, which is why the shared node constant is retained.

*Needs:* §4.2, §5.1; ComplexCurveModuli D3 item 5, D4, D5; Tau Ceti `Wkp`.

### 6.2 The finite-evaluation complement and the right inverse

Construct a finite-evaluation complement `L₀` on the linearized kernel and the bounded right inverse `Q₀` with image `ker L₀`, including the obstruction-parameter quotient in `L₀`. Do not assert that every section in an augmented kernel obeys homogeneous unique continuation: forcing can create compactly supported solutions. Prove the finite-evaluation separation lemma using the parameter coordinate, finite-dimensional linear algebra and unique continuation only on the forcing-free end collars; nonlocal moving-incidence terms at nonzero forcing parameter do not justify interior unique continuation. Precisely: let H be the image of the augmented kernel in E; `E'`-regularity gives `H + E' = E`; choose `E'' ⊂ E'` complementary to H; on the kernel `K₀` of the parameter map to `E/E''` the parameter is zero, and finitely many evaluations outside both ends and necks give an injection into a finite-dimensional value space W; take `W₀ = ev(K₀)`, a linear projection `W → W₀` and a linear isomorphism from `W₀` to its model; combine these projected evaluations with `E/E''` to make `L₀` an isomorphism on the augmented kernel; the operator then restricts to an isomorphism on `ker L₀` with parameter in `E''`. Prove the bounded inverse and the exact transport of this slice: choose evaluation points outside both ends and necks so that `L_α` transports exactly, and if the parameter-zero section vanishes on this exterior region extend the vanishing across the adjacent forcing-free collars by the homogeneous equation, never into the forcing interior (Pardon Lemma B.5.1 for the linearized operator and §B.7 for the approximate right inverse).

**Checks.**

- With `E = 0` and a regular map, `H = 0`, `E'' = 0`, and `L₀` consists of evaluations alone: finitely many point evaluations separate the finite-dimensional kernel because a kernel element vanishing at enough generic points vanishes identically, by unique continuation on the connected forcing-free surface.
- With forcing supported on an annulus, a section supported in that annulus solving the inhomogeneous equation is in the augmented kernel and vanishes outside: evaluations outside the annulus do not see it, and it is separated by its parameter coordinate instead, which is why `E/E''` is part of `L₀`.
- Choosing an evaluation point on an end would make `L_α` depend on the gluing parameter through the neck coordinate; the exterior choice avoids this.

*Needs:* §4.1, §4.3, §6.1, §0.2.

### 6.3 Break, transport and glue operators, uniform bounds and the quadratic estimate

Define the break, transport and glue operators between the weighted spaces of the broken and glued domains, and prove uniform bounds with error tending to 0, retaining separate small factors from domain motion, pregluing decay and cutoff weight ratios (Pardon §§B.6–B.7, Proposition B.7.9). Use the pinned Banach Neumann series to obtain right inverses `Q_(α,y)` with image inside `ker L_α` and uniform norm bound. Prove the quadratic and Lipschitz estimate for the nonlinear section on one uniform ball, including torsion and moving-incidence derivative terms (Pardon §B.8). These estimates are uniform over the specified local compact data, not over all maps without a bound; in particular prove the uniform equivalence, as the gluing parameter tends to 0, of the circle-average and node-value weighted norms on the necks created by gluing, as part of the glue-operator bounds.

**Checks.**

- The cutoff weight ratio on a neck of length `2R` with weight `e^(δ|s|)` from each side is `e^(−δR)`, which tends to 0; with the opposite sign convention it would blow up.
- The error of the approximate right inverse on a fixed broken domain (`R = ∞`) is 0, and the Neumann series is trivial.
- The quadratic estimate `‖F(ξ) − F(0) − DF(0)ξ‖ ≤ C‖ξ‖²` on a ball of radius `r₀` fails on a ball of radius 1 for a nonlinearity like `e^ξ − 1 − ξ` in a sup norm; the uniform ball radius is a stated constant.

*Needs:* §6.1, §6.2; Mathlib Banach Neumann series.

### Examples

- The nodal conic of §3.8 with gluing parameter ε: the neck has length `−log|ε|` up to a constant, the weight ratio is `|ε|^δ`, and the preglued map is the conic itself.

### Dependencies

Layers 2–5; ComplexCurveModuli D3 item 5, D4, D5; Tau Ceti Sobolev modules; Mathlib Neumann series.

## Layer 7: Newton gluing, neighbourhood surjectivity and projection models (M7)

### 7.1 The contraction and the gluing map

Construct the contraction on `κ_α + im Q_(α,y)` with complete closed domain, invariant radius, uniform residual bound and uniqueness (Pardon Lemma B.9.1), by the pinned Banach fixed-point theorem. Bootstrap solutions to smooth maps. Prove the kernel pregluing and complement isomorphism with uniform inverse bound, index invariance, image in `ker L_α` and injectivity (Lemmas B.10.2–B.10.3). The gluing map preserves the base parameters and the quotient `E/E'` when the `E'`-restricted linearization is onto.

**Checks.**

- At gluing parameter 0 the contraction is the identity on the broken solution and the gluing map is the inclusion.
- For the regular two-line map of §3.8 the gluing map produces, for each small ε, the smooth conic `XY = εZ²` up to reparametrization, and the index is preserved: `v = 10` on both sides.
- Uniqueness within the invariant ball is not global uniqueness: a solution outside the ball is not excluded by the contraction alone, which is why §7.2 is separate.

*Needs:* §6.2, §6.3; Mathlib Banach fixed-point theorem.

### 7.2 Continuity and surjectivity onto a neighbourhood

Prove continuity of the gluing map at every nodal pattern using transported comparisons with the fixed evaluation complement of §6.2 (Pardon Proposition B.10.4), not a claim that arbitrary right inverses vary continuously across degenerating Sobolev spaces. Prove surjectivity onto a full neighbourhood (Proposition B.11.5): graph-near solutions are C∞-close off the nodes by the graph almost-complex trick and the local estimates; on long necks the exponential decay `‖du‖_(W^(1,2)) ≤ c e^(µ(r−R)) · (boundary term)` with `0 < δ < µ < 1` (Lemma B.11.2) makes them small in the weighted norm, including the constant-mode control; contraction uniqueness then recovers them. The decay estimate is for derivatives of order at least 1; a nonzero constant map refutes any order-zero decay statement. This analytic argument is separate from global compactness.

**Checks.**

- A constant map on a long cylinder has `du = 0`, so the derivative estimate holds trivially, while its value does not decay to anything: an order-zero statement would be false.
- With `µ ≤ δ` the decaying solutions would not lie in the weighted space with weight `e^(δs)`; the ordering `δ < µ` is used.
- A sequence of conics `XY = ε_k Z²` with `ε_k → 0` is recovered by the gluing map for large k, which is the content of surjectivity for the example of §3.8.

*Needs:* §7.1, §6.1, §3.4; HeegaardFloer Lane F2 item 3.

### 7.3 Projection charts and topological regularity

Use the Hausdorff compact-ball inverse lemma (Pardon Lemma B.12.1: a continuous injection f from `ℝⁿ` into a Hausdorff space whose restriction to every neighbourhood of 0 is surjective onto a neighbourhood of `f(0)` restricts to a homeomorphism from an open set `U ∋ 0` onto the open set `f(U)`; the proof uses only that a continuous bijection from the compact closed ball onto its Hausdorff image is a homeomorphism, the pinned `Continuous.homeoOfEquivCompactToT2`, together with the surjectivity hypothesis, which §7.2 supplies) to obtain local homeomorphisms and `E/E'` projection charts, with openness of the regular locus. Establish the integer dimension witness and the negative-dimension-empty branch. The conclusion is exactly the topological manifold and submersion statement of Pardon Theorem B.1.1(i)–(iii) and Proposition 9.2.6: `X_I^reg` is open, a topological manifold of dimension `v + dim E_I`, and the projection to `E_I/E_J` is a topological submersion. Smooth nodal transitions, a smooth Banach–Lie action or auxiliary-group equivariance of one chosen gluing chart are not inferred. The group actions and coordinate maps are continuous, and their orientation naturality is Layer 8.

**Checks.**

- Near the two-line map of §3.8 with `E = 0`, `X_∅^reg` is a topological 10-manifold whose chart is the gluing parameter `ε ∈ ℂ` times the 8 real deformation parameters of the pair of lines through a point; `8 + 2 = 10 = v`.
- A chart that was smooth in ε would have to make the conic family smooth in ε at `ε = 0`, which the plumbing coordinate does not provide: only continuity is claimed.
- For `v + dim E < 0` the regular locus is empty and the submersion statement is vacuous.

*Needs:* §7.1, §7.2, §5.3; Mathlib `Continuous.homeoOfEquivCompactToT2`.

### Examples

- The conic degeneration: gluing map, continuity at `ε = 0`, surjectivity onto nearby conics, and the 10-dimensional topological chart.

### Dependencies

Layers 3–6; HeegaardFloer Lane F2 item 3; Mathlib Banach fixed-point theorem and `Continuous.homeoOfEquivCompactToT2`.

## Layer 8: Canonical orientations and choice comparisons (M8)

### 8.1 The determinant sequence and the canonical virtual orientation

Using the determinant-line functor and the complex orientation of §0.3, construct the determinant sequence for the nodal deformation complex: domain deformation, map operator, node matching, original and auxiliary marks and finite obstructions, with each real and complex factor in this order. Constraint normal lines at auxiliary intersections are identified by du with the complex tangent of the domain; their orientation is not a global orientation of `D_α`. Compare permutations of ordered auxiliary points, obstruction summands and component labels; finite isotropy acts on the virtual line. Construct the canonical virtual orientation trivialization for the closed symplectic map problem and its restriction and coordinate-change laws. The closed virtual dimension v is even; real obstruction dimensions need not be. Obstruction-factor permutations carry the sign `(−1)^(dim E_i · dim E_j)`, and parameter families have virtual parity `v + dim P`; transport these graded orientation lines through ImplicitAtlases Layers 0 and 3 rather than declaring every map even. Place the parameter orientation first in family products and compare its outward-first boundary convention to the ordered factors.

- The virtual orientation line is canonically trivialized at every point of `X_I^reg`, compatibly with the coordinate maps and with ImplicitAtlases §0.2's sign conventions.
- Under a permutation of two obstruction summands the trivialization changes by `(−1)^(dim E_i · dim E_j)`.
- Under the swap of two ordered auxiliary points the trivialization is unchanged, because each contributes a complex (even) factor.

**Checks.**

- `dim E_1 = dim E_2 = 1`: swapping gives `−1`; `dim E_1 = 1`, `dim E_2 = 2`: `+1`; `(1, 3)`: `−1`. The sign is the parity of the product, not of the sum.
- Family parity: `v = 10`, `dim P = 1` gives odd total dimension 11; the boundary of the interval family has the two endpoint moduli with opposite outward signs, `+` at 1 and `−` at 0 for the orientation `0 → 1`.
- A component label swap of two isomorphic components with equal complex factors changes nothing; with an odd real obstruction factor on each it introduces `−1`.

*Needs:* §0.3, §4.1, §4.3, §5.1; ImplicitAtlases §0.2 and Layer 3.

### 8.2 Gluing orientations

Either prove the explicit kernel-pregluing determinant comparison, or implement Pardon's extension route (arXiv:1309.2370, §B.13): the smooth-domain orientations agree, the nodal locus has real codimension 2 in the regular thickening, and local orientation-line isomorphisms extend uniquely across it; supply the local extension and connectedness statements and prove equivariance and naturality, not mistaking a dense subset alone for enough extension data. These are topological orientation sheaves as in ImplicitAtlases Layer 3 and TopologicalSheafCohomology. Prove independence of metrics, cutoffs, connections and linear complements within the same geometric atlas; these analytic choices are not replacements of the atlas.

**Checks.**

- A real codimension-one locus would not allow unique extension: the complement of a hyperplane in a ball is disconnected; codimension 2 leaves it connected, which is the fact used.
- Changing the J-linear connection changes the linearization by a zeroth-order term, which is a homotopy of Fredholm operators and preserves the determinant orientation.
- For the two-line map, the orientation of the 10-dimensional chart from the complex gluing parameter and the complex deformation parameters agrees with the complex orientation of the smooth conic locus, as the extension route predicts.

*Needs:* §8.1, §7.3; ImplicitAtlases Layer 3; TopologicalSheafCohomology Layers 0–1.

### Examples

- Sign table for two obstruction summands as in §8.1; the interval family boundary signs.

### Dependencies

Layers 0, 4–7; ImplicitAtlases Layers 0 and 3; TopologicalSheafCohomology Layers 0–1.

## Layer 9: The implicit-atlas axioms and the rational functional (M9)

### 9.1 The ambient collection and the atlas axioms

Consume the same finite-action and unordered-auxiliary chart of ComplexCurveModuli D6 item 4 and its unique-up-to-`Γ_α` universal-curve comparison in the quotient and extra-group freeness proofs. Construct one set-sized ambient collection A of thickening data of §5.1, with explicit finite-group, finite-real-model and chart codes and universe bounds, all finite-union thickenings `X_I`, their sections `s_I` and footprints `U_IJ`, and the quotient maps `ψ_IJ` on their zero-fibre domains. Prove the axioms of ImplicitAtlases §1.1 (Pardon Theorem 9.2.10 for the source's version): identity and composition of the `ψ_IJ`; section compatibility; the footprint intersection and union law; the inverse-image law; the quotient homeomorphism; the regular-preimage inclusion; freeness of the extra group `Γ_(J∖I)` over the preimage of `X_I^reg`; the local `E_(J∖I)` product projections, transported from §7.3 by the homeomorphism of §5.3 and the equality of regular loci; orientation compatibility from Layer 8; and the covering axiom from §4.3 and §5.1 (Pardon Lemma 9.2.9). Freeness is not asserted for an arbitrary `Γ_I` action, the base may retain finite automorphisms, and `X_I` need only be Hausdorff, not compact or everywhere regular.

**Checks.**

- For `I = ∅` the footprint is the whole compact coarse space and the section is zero; for `I ⊂ J` the footprint `U_IJ` is the open set where the extra incidence conditions of `J∖I` are satisfied transversally.
- The extra group for `J∖I = {α}` with `Γ_α = S_3` acts freely on the preimage of the regular locus by permuting the three auxiliary marks, since a thickened map with chosen identifications has no automorphism fixing them.
- A base point with isotropy `ℤ/2` (the degree-two cover) remains a point with isotropy `ℤ/2` in every `X_I`; freeness of the extra group does not make the total action free.

*Needs:* §5.1–§5.3, §7.3, Layer 8; ComplexCurveModuli D6 item 4; ImplicitAtlases §1.1–§1.4.

### 9.2 The regular locus, the atlas and the functional

Define `X_I^reg` by triviality of the thickened-tuple automorphism group together with surjectivity of the fixed-domain vertical augmented linearization, with the moving-intersection terms included, and prove its independence of the sufficiently high Sobolev completion; this is stronger than moving-domain Fredholm regularity of the unthickened map and is not the entire finite-isotropy regular orbifold locus. Global base compactness is §3.7 and is independent of these local axioms. Apply ImplicitAtlases Layers 2–4 only after the complete package is supplied, and obtain the canonical rational functional on degree-v Čech cohomology of the compact coarse moduli space with coefficients in the virtual orientation sheaf of §8.1. No identification with singular homology of a possibly wild source, no strict chain-level functional, no weighted orbifold Poincaré duality and no Gromov–Witten axiom follows from naming an atlas.

**Checks.**

- A regular map with trivial automorphisms and `I = ∅` lies in `X_∅^reg`; the degree-two cover with `E = 0` does not, since its automorphism group is `ℤ/2`, although it is Fredholm regular for a generic J.
- For the constant class in the stable range with `X` a point, the coarse space is `|M̄_(g,n)|`, `v = 6g − 6 + 2n`, and the functional is the fundamental class of the coarse space weighted by the generic isotropy, `1/2` for `(g, n) = (2, 0)` and `(1, 1)`.
- For the constant class over a point with `(g, n) = (0, 3)`, `v = 0`, the coarse space is a point and the functional sends the generator of `H⁰` to 1, the isotropy being trivial; for `(1, 1)`, `v = 2`, the coarse space is the sphere `|M̄_(1,1)|` and the functional is one half of the fundamental-class pairing, the generic isotropy having order 2.

*Needs:* §9.1, §3.7, §8.1; ImplicitAtlases Layers 2–4.

### Examples

- The constant class over a point target recovers the weighted fundamental class of the coarse Deligne–Mumford space.
- Lines in `ℂP²`: a generic J makes the unthickened space regular with trivial isotropy, so the atlas with `A = ∅`-type data is a manifold atlas and the functional is the fundamental class of the dual plane.

### Dependencies

Layers 3–8; ComplexCurveModuli D6 item 4; ImplicitAtlases Layers 1–4.

## Layer 10: Families, auxiliary choices, refinement and cobordism (M10)

### 10.1 Relative families and the cobordism law

Construct relative parameter versions of Layers 2–9 over a compact P with collar and face models and the compact family topology of §3.7. Prove the tame-J family interpolation used here: the space of smooth ω-tame structures is contractible, via the retraction onto compatible structures given by the polar decomposition with respect to the metric `g_J` of §0.1 and the contractibility of compatible structures, so any two tame structures are joined by a smooth path, and a path fixed near its endpoints exists; this uses the definitions of HeegaardFloer Lane F2 item 1 and the pinned predicates, not integrability. Keep J fixed on the endpoint collars when proving a cobordism statement; the regular model has the parameter dimension included. Obstruction augmentation supplies vertical surjectivity, so no generic-J path is assumed. Build the endpoint restrictions and identifications and the outward-first signs: for an oriented interval `0 → 1` the endpoint virtual classes satisfy the outgoing-minus-incoming relation with the same trivializations, by ImplicitAtlases §5.2.

**Checks.**

- Tame structures are not convex: for `ω = dx∧dy` on `ℝ²`, the structures `J_a = [[a, −(1+a²)], [1, −a]]` all square to `−id` and are tame, since `ω(v, J_a v) = (x − ay)² + y²`, but the midpoint of `J_1` and `J_(−1)` is `[[0, −2], [1, 0]]`, whose square is `−2·id`; and `−J` is never tame. The retraction route avoids convex combinations.
- For `P = [0, 1]` and a regular family, the boundary identity reads `[M_1] − [M_0] = 0` in the cobordism-invariant sense: counts for `v = 0` agree at the two ends.
- A family over `P = S¹` has no boundary; the relative statement is then that the functional of the total space is defined and the endpoint relation is empty.

*Needs:* Layers 2–9; HeegaardFloer Lane F2 item 1; Tau Ceti `SmoothTwoForm.Compatible`; ImplicitAtlases §5.1–§5.2.

### 10.2 Choice comparisons

Separate the choices: finite subatlases of the same ambient A compare by union (ImplicitAtlases §4.3); shrinkings, relabelings and rigidifying variants require common-refinement witnesses (§5.3); changes of auxiliary constructions not embedded in one A require a constructed common ambient family or compatible cobordism. Extend finite endpoint data to the family, cover the compact middle and prove all atlas and footprint restrictions. Distinct arbitrary atlases on the same space can have different multiplicities, as the atlas with obstruction space `E` and section `z ↦ z^r` on ℂ shows, so no arbitrary-atlas independence is stated. Apply the global relative trace and cobordism law of ImplicitAtlases §5.2 only to these data. Parameter faces and multiple compositions use the cell-like stratified engine of ImplicitAtlases Layer 6 with its normal-line signs, not codimension-only strata.

**Checks.**

- The atlas on a point with `E = ℂ` and section `z ↦ z^r` has virtual class r times the point; for `r = 1` and `r = 2` these differ, so two atlases on the same compact space need not agree unless related by a refinement witness.
- Two finite subatlases `I₁`, `I₂` of one A give the same functional as `I₁ ∪ I₂`, by finite-subatlas independence.
- A corner of codimension 2 in P contributes a normal-line sign from each of its two faces; the cell-like engine records both, a codimension-only count would record one.

*Needs:* §10.1, §9.1; ImplicitAtlases §4.3, §5.3, Layer 6.

### Examples

- The `z ↦ z^r` atlas as the standard multiplicity example; the interval family of tame structures as the standard cobordism.

### Dependencies

Layers 2–9; HeegaardFloer Lane F2 item 1; ImplicitAtlases Layers 4–6.

## Layer 11: Evaluation, forgetting and clutching maps (M11)

### 11.1 Evaluation and forgetting

Construct the continuous evaluation map to `X^n`, the graph and permutation actions, and the map to the coarse stable-pointed moduli space of ComplexCurveModuli only when the remaining domain signature is stable. Prove auxiliary-mark independence by stabilization and groupoid isomorphisms. Define forgetting and stabilizing of stable maps only on target signatures and classes where stable-map stabilization exists: contract exactly the newly unstable constant components and preserve nonconstant unstable domains. Consume the anchor adapter of §3.5: anchors on each nonconstant component away from constant-component images, `forgetAuxiliarySet` of D7 item 1 with the anchors retained, and erasure of the anchor labels without further contraction. Use disjoint third-anchor choices, union comparisons and the finite-set, permutation, arrow and base-change coherence of D7 to prove independence, repeated-forget coherence and continuity and family laws, including for map-stable targets whose domains remain pointed unstable. The constant class with `(g, n) = (0, 2)` has no stable target, so a universal unqualified forget map would be false.

**Checks.**

- Forgetting the last mark of a constant three-marked sphere: the target would be the constant class with two marks, which is empty; the forget map is not defined there.
- Forgetting a mark on a nonconstant sphere with one mark: the target is the unmarked nonconstant sphere, map-stable and pointed-unstable; the forget map is defined and continuous.
- Forgetting a mark that lies on a constant two-flag bridge between two nonconstant components contracts the bridge and identifies the two node points, as the anchor adapter prescribes.

*Needs:* §3.5, §3.7, §1.2; ComplexCurveModuli D5, D7 item 1.

### 11.2 Clutching and the universal family

Construct external and self-clutching on evaluation-equal fibre products, tracking flags, labels, class sum and arithmetic genus; prove continuity and the group and finite-quotient factors (ComplexCurveModuli D7 item 3 for the domains). Construct the marked universal domain family on each thickening, its group actions, sections and auxiliary-forget identifications, and the induced compatible family on refinement groupoids. These family maps supply the cotangent-line input of the downstream development; defining descendant classes belongs to Gromov–Witten theory. Prove that the gluing maps commute with evaluation, stabilization and node matching on their domains. This is a construction of maps, not a splitting theorem for the virtual class.

**Checks.**

- External clutching of two one-marked lines in `ℂP²` with equal evaluation gives the two-line map of §3.8 with class `2·line` and genus `0 + 0 + 0 = 0`.
- Self-clutching of a two-marked sphere with equal evaluations gives a genus-one nodal domain: `g = 0 + 1`.
- The self-clutched map has an extra `ℤ/2` factor from the flag swap when the two marks are interchanged by an automorphism of the map, and none otherwise.

*Needs:* §11.1, §5.1; ComplexCurveModuli D7 item 3.

### Examples

- The two-line map as an external clutching; the self-clutched two-marked sphere as a genus-one example.

### Dependencies

Layers 1–5 and 9; ComplexCurveModuli D5, D7 items 1 and 3.

## Layer 12: Joint reductions and application compatibilities (M12)

### 12.1 Joint models for diagonal identities

When a diagonal or Gysin identity for the virtual functional is used, construct refined obstruction data for which the relevant evaluations together with all extra-obstruction projections admit joint local product charts, compatible with every coordinate map, group and orientation. Cauchy–Riemann surjectivity alone does not imply evaluation submersivity. Use finite-point constrained Fredholm operators, cokernel complements supported away from the marked points, fixed-evaluation right inverses and the gluing of Layer 7 to build the joint models: on `W^(1,p)`, `p > 2`, disjoint bump sections make point evaluation onto; its kernel has finite codimension and the restricted operator is Fredholm; smooth forcing supported away from nodes and marks is dense in the `L^p` range, so a finite-dimensional complement surjecting onto the restricted cokernel exists; realize prescribed values by bump sections and correct their Cauchy–Riemann error within the evaluation kernel using the complement; prove the parameter and elliptic transport and the fixed-evaluation gluing estimates. The joint normal-product charts live on the ambient regular thickening products before imposing the diagonal, with compatible translated charts; the normal coordinate vanishes exactly on the fibre. Construct these for every finite index and extra-obstruction projection, prove all joint-model and normal-map refinement squares, and obtain the trace squares from ImplicitAtlases Layer 7 after supplying its inputs: the chosen tubular diagonal, the ambient normal-product charts and the compatible normal and Thom maps; construct their coordinate, common-refinement and family compatibility using Layers 9 and 10, and apply the Layer 7 theorem rather than assuming the comparison. That theorem is the engine's; Pardon §9 asserts the desideratum without this generality.

**Checks.**

- For a regular curve with one mark whose evaluation is not a submersion (the exceptional curve of §2.11), the refined obstruction space has dimension at least the codimension of the evaluation image, 2, and the joint chart is `ℝ² × (normal directions)`.
- For lines in `ℂP²` with two marks and the diagonal, the joint model has normal coordinate in `T_xℂP²`, of real dimension 4, and the fibre over the diagonal is empty, consistent with §2.20.
- A translated chart differing by a vector in the normal direction maps the fibre to a parallel fibre; the normal coordinate vanishing exactly on the fibre is what the refinement square records.

*Needs:* §2.14, §4.3, §7.1, Layers 9–10; ImplicitAtlases Layer 7.

### 12.2 The forget-compatible ambient collection

For clutching, stabilization and forgetting applications supply their joint matching, normalization and family diagrams; forgetting maps are not covered by a transverse diagonal theorem. Construct a forget-compatible ambient collection for the universal extra mark: its forcing stays away from all nodes, old marks and old auxiliary incidence data but may meet the freely moving new mark. Define the same-obstruction endpoint literally as the universal marked curve over the old thickenings, with their old E spaces, old incidence identifications on the forgotten curve and pulled-back forcing; it is not a standard `(n + 1)`-marked thickening datum. Use the local collision, insertion and contraction charts of ComplexCurveModuli D7 item 2 when the new point meets an old node, mark or incidence, using the vanishing of the old forcing there. Verify the regularity and projection estimates of Layers 4 and 7, the dimension, freeness, product-projection and coordinate laws of §9.1, the orientations and all arrow and family coherences for this collection. Joint fixed-evaluation models require their own constrained-cokernel complements; the old E alone is not asserted to make the new evaluation submersive. Construct a common enlargement and a relative family and cobordism of Layer 10 with endpoint refinement witnesses to the standard `(n + 1)`-marked collection whose forcing avoids all marks: cut off forcing near the new mark with collision-compatible node collars and add finite constrained complements as needed; prove the regular-footprint coverage, extra-projection charts, compact zero-level family and relative orientation and coordinate laws. The forget-compatible endpoint carries the universal-curve projection on its ambient thickenings. On the comparison cobordism require the continuous forgetting map of §11.1 and the needed target and coefficient classes on its compact zero loci; mixed forcing is not assumed to descend through every ghost or to give a forgetting map on every regular thickening. Apply ImplicitAtlases §5.2–§5.3 with these relative data and endpoint witnesses to obtain the forgetting trace comparison. Gromov–Witten theory consumes this comparison and owns the relative fundamental-class, finite-Čech integration and projection-formula application. Products of unrelated moduli problems need external product thickenings and orientations (ImplicitAtlases §6.4); gluing problems need the joint diagrams, not a formal homology fibre product. None of this proves the unit, divisor or splitting axioms by atlas existence; the downstream development consumes only the compatibilities constructed.

**Checks.**

- Dimension: the forget-compatible endpoint over an old thickening of dimension `v + dim E` has dimension `v + 2 + dim E`, the universal curve adding the two real dimensions of the new point; the standard `(n+1)`-marked datum has `v(n+1) + dim E' = v + 2 + dim E'`, so the two agree exactly when `dim E' = dim E`.
- When the new point collides with an old mark, the collision chart inserts a three-flag constant sphere, on which the old forcing vanishes because it was supported away from the old mark.
- A forcing that did not vanish near the old marks would not descend through the inserted ghost, and the endpoint would not carry a forgetting map; the support condition is used.

*Needs:* §12.1, §11.1, Layers 9–10; ComplexCurveModuli D7 item 2; ImplicitAtlases §5.2–§5.3, §6.4.

### Examples

- The diagonal joint model for two-marked lines; the forget-compatible collection for the universal mark over lines in `ℂP²`.

### Dependencies

Layers 2, 4, 7, 9–11; ComplexCurveModuli D7 item 2; ImplicitAtlases Layers 5–7.

## Layer 13: Target comparisons and the output boundary (M13)

### 13.1 Pushforward of the functional along a continuous map

For a continuous map f from the compact moduli space to a specified target Y, construct the dual-pullback pushforward of the rational dual-Čech functional of §9.2 along f (ImplicitAtlases §5.4), with its coefficient and pair maps. It does not require finite CW type or Poincaré duality of the stable-map source. For an ordinary singular target class supply the Čech and singular comparison and the rational universal-coefficient and evaluation maps on Y (TopologicalSheafCohomology Layers 0–1; AlgebraicTopology Stage 6 item 1); for a finite-CW target prove that the resulting functional is represented by a unique class in `H_v(Y; ℚ)`, with homotopy, product and coefficient compatibility.

**Checks.**

- For Y a point the pushforward is the degree of the functional, a rational number; for lines in `ℂP²` and `v = 4` against the fundamental class of the dual plane it is 1.
- For Y a non-finite-CW compact space such as the Hawaiian earring, the functional is defined but no unique homology class is claimed.
- Two homotopic maps give the same pushforward, by the homotopy invariance of Čech cohomology on compact Hausdorff spaces.

*Needs:* §9.2; ImplicitAtlases §5.4; TopologicalSheafCohomology Layers 0–1; AlgebraicTopology Stage 6 item 1.

### 13.2 The target `X^n`

For `Y = X^n` consume GeometricTopology's smoothing-and-triangulation comparison item 1 and AlgebraicTopology Stage 8 item 7: a compact smooth manifold has a finite smooth triangulation and hence a finite CW model. Construct the finite-product witness and the ordinary cohomology maps and universal-coefficient comparison used here. This is a target comparison; no finite-CW property of the possibly singular source is inferred.

**Checks.**

- `X = S²`, `n = 2`: the finite CW model of `S² × S²` has cells in dimensions 0, 2, 2, 4, and `H_4(S² × S²; ℚ) = ℚ`.
- For `n = 0` the target is a point and the statement is §13.1's degree.
- `X = ℂP²`, `n = 1`: the finite CW model has one cell in each of the dimensions 0, 2, 4, so `H_v(ℂP²; ℚ)` vanishes for odd v and for `v > 4`; the functional of lines (`v = 4`) pushes forward to a multiple of the fundamental class, and the functional of conics (`v = 10`) pushes forward to 0 for dimension reasons.

*Needs:* §13.1; GeometricTopology smoothing-and-triangulation comparison item 1; AlgebraicTopology Stage 8 item 7.

### 13.3 The stabilization-evaluation map and the domain-target adapter

For `2g − 2 + n > 0` construct the map `(st, ev)` from the moduli space to `|M̄_(g,n)| × X^n` from Layer 11. ComplexCurveModuli D5–D6 first construct the stable-pointed analytic proper étale groupoid and its properness; its D8 adapter then compares that retained-arrow presentation, with its complex orientation, to Orbifolds O1–O3, constructs the compact coarse finite-CW and Čech-singular witness and the product comparison, and supplies the weighted rational perfect pairing of Orbifolds O4–O5 on the domain target. Consume this adapter after those domain theorems; it is not an input to Layers 0–12 or to the gluing proof. A compact proper étale assertion alone is not the target-comparison map or its weighted normalization. Keep the full ineffective isotropy, including the generic `μ₂` factors, in all target maps.

**Checks.**

- `M̄_(0,3)` is a point, `M̄_(0,4)` the cross-ratio sphere, `M̄_(1,1)` has generic ineffective isotropy of order 2 with exceptional orders 4 and 6, and `M̄_(2,0)` has generic ineffective order 2 (ComplexCurveModuli D8): the weighted pairing divides by 2 on the last two.
- For `2g − 2 + n ≤ 0` no map to a coarse Deligne–Mumford space is defined; the unmarked sphere class maps to `X^0`, a point, only.
- `(g, n) = (0, 5)`: `|M̄_(0,5)|` has real dimension `6g − 6 + 2n = 4` and trivial generic isotropy, so the weighted pairing on it is the ordinary one; for the constant class the map `(st, ev)` is the identity on the first factor times the diagonal `X → X⁵` on the second.

*Needs:* §11.1, §13.2; ComplexCurveModuli D5, D6, D8; Orbifolds O1–O5.

### 13.4 Exports to Gromov–Witten theory

Export the evaluation and stabilization maps, clutching, parameter families, common refinements and joint-diagonal data of Layers 10–12, the functional of §9.2 and the target comparisons of §13.1–§13.3. The downstream Gromov–Witten development defines cohomology-valued operations by the weighted domain-target pairing, proves its axioms from these diagrams, constructs descendants, including tensor-power descent on singular finite-group zero loci, and owns the curve-class, Chern and area specialization and the geometric energy finiteness for the MorseNovikov N1 coefficients. This roadmap constructs none of those operations. The cotangent-line input is the marked family of §11.2 with its equivariant and refinement maps; its rational Chern-class and descendant construction is separate. A weighted target pairing is not replaced by an ordinary coarse pairing without its kernel normalization, and no Poincaré duality of the nonregular source is used.

**Checks.**

- The genus-zero three-point invariant of lines in `ℂP²` through three points: `v = 4 + 6 = 10` against three point classes of degree 12 gives 0 by degree; through two points and a line: `8 + 2 = 10`, and the count is 1, recovered downstream from the functional of §9.2 and the evaluation maps, not stated here.
- The exported data for the constant class over a point target are the weighted fundamental class of `|M̄_(g,n)|` and the identity stabilization map.
- The constant class `β = 0` with `(g, n) = (0, 3)` on a general X: the moduli space is X itself, `v = 2((m − 3) + 0 + 3) = 2m = dim X`, the functional is the fundamental class of X, and the exported `(st, ev)` map is the small diagonal `X → pt × X³`, so the pushforward is the class of the small diagonal in `H_(2m)(X³; ℚ)`.

*Needs:* §9.2, Layers 10–12, §13.1–§13.3; MorseNovikov N1.

### Examples

- The degree and the pushforward for lines in `ℂP²`; the isotropy weights of the small Deligne–Mumford spaces.

### Dependencies

Layers 9–12; ComplexCurveModuli D5, D6, D8; ImplicitAtlases §5.4; TopologicalSheafCohomology Layers 0–1; AlgebraicTopology Stages 6 and 8; GeometricTopology; Orbifolds O1–O5; MorseNovikov N1.

## Downstream consumers

- **GromovWittenTheory** consumes the stable-map carrier and its retained arrows (Layer 1), compactness (Layer 3), the nodal index (Layer 4), families and refinement comparisons (Layer 10), forgetting and clutching (Layer 11), the joint models and forget-family diagrams (Layer 12) and the stabilization and family target maps (§13.3–§13.4), and owns the cohomology-valued operations, axioms and descendants.
- **HeegaardFloer** consumes nothing from this roadmap; its scope is fixed genus-zero domains.
- Roadmaps on punctured or bordered curves, symplectic field theory and Lagrangian Floer theory may consume the closed-source carriers, the all-genus compactness route of Layer 3 and the weighted-end theory of §4.2 as their closed-case input; none is a supplier here.

## References

- J. Pardon, *An algebraic approach to virtual fundamental cycles on moduli spaces of pseudo-holomorphic curves*, [arXiv:1309.2370](https://arxiv.org/abs/1309.2370): §9.2 (Definitions 9.2.1–9.2.3, Proposition 9.2.6, Lemmas 9.2.7–9.2.9, Theorem 9.2.10) for the thickening data and the atlas; Appendix B (Theorem B.1.1, §§B.2–B.13, Lemma B.5.1, Proposition B.7.9, Lemma B.9.1, Lemmas B.10.2–B.10.3, Proposition B.10.4, Lemma B.11.2, Proposition B.11.5, Lemma B.12.1) for the local topological gluing route. Its fibre-product desideratum is constructed here only with Layer 12's joint data and ImplicitAtlases Layer 7.
- S. Ivashkovich and V. Shevchishin, *Gromov compactness theorem for stable curves*, [arXiv:math/9903047](https://arxiv.org/abs/math/9903047): Theorem 1.1 and Remark 2, Definition 1.11, Lemmas 3.1, 3.7, 3.8, Corollary 3.6, Lemma 4.1, Theorem 4.2(a)–(g), Lemmas 4.3 and 4.5, for the varying-domain compactness proof; the closed smooth tame-family, labelled-mark, normalization, exceptional-component and class adapters are Layer 3's; the totally real boundary theorem is outside this roadmap.
- C. Wendl, *Lectures on Holomorphic Curves in Symplectic and Contact Geometry*, version 3.2, [arXiv:1011.1690](https://arxiv.org/abs/1011.1690): the unhalved Cauchy–Riemann operator of §2; Definition 4.2, Proposition 4.3, Definition 4.4, Theorem 4.8, Definition 4.29, Theorem 4.43, Theorem 4.45, Theorem 4.48, Proposition 4.49, Proposition 4.55, Lemmas 4.56–4.57 and 4.59, for the moving-domain and genericity analysis; Layers 1–2 construct the unstable-domain slice cases.
- D. McDuff and D. Salamon, *J-holomorphic Curves and Symplectic Topology*, second edition, AMS Colloquium Publications 52, [doi:10.1090/coll/052](https://doi.org/10.1090/coll/052): Lemmas 2.4.1 and 2.4.3, Proposition 2.5.1, §3.2, Chapter 4 (mean-value inequality, monotonicity, removal of singularities, genus-zero compactness) and Appendix A (determinant lines). Cited by locator; the text is not available from an open source.
- J. Robbin and D. Salamon, *A construction of the Deligne–Mumford orbifold*, [arXiv:math/0407158](https://arxiv.org/abs/math/0407158), and its corrigendum: the domain-family input consumed through ComplexCurveModuli, which retains all genus-zero and genus-one integrability conditions.
- J. Robbin, Y. Ruan and D. Salamon, *The moduli space of regular stable maps*, Math. Z. 259 (2008): the integrable-target comparison on its regular locus, not the arbitrary-J virtual statement. Cited by locator.
