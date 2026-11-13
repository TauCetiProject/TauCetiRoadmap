# Roadmap: mixed Hodge modules, exponential mixed Hodge structures and the irregular Hodge filtration

**Summary.** This roadmap builds Saito's theory of polarizable and mixed Hodge modules on smooth complex quasi-projective varieties, the Kontsevich–Soibelman category of exponential mixed Hodge structures with its projector `Π`, and the irregular Hodge filtration of an exponentially twisted de Rham cohomology. It starts from algebraic `D`-modules (SpringerResolutionAndCharacteristicCycles), analytification, compact-support sheaf theory and Deligne's regular-singular Riemann–Hilbert theory (ComplexComparisonPartII), the formal classification of differential modules and the index formula on curves (PadicDifferentialEquationsAndRigidCohomology), the monodromy filtration of a nilpotent operator (LefschetzPencilsAndVanishingCycles), pure variations of Hodge structure and their one-variable degenerations (ShimuraData, ShimuraVarieties), and the linear pure and mixed Hodge structures of Tau Ceti. On these it constructs algebraically constructible Betti sheaves with rational and complex coefficients and the regular Riemann–Hilbert correspondence (Layer 1), exponential twists and Fourier–Laplace transformation (Layer 2), variations of mixed Hodge structure on punctured curves with their limits, admissibility and `L²` cohomology (Layer 3), pure and mixed Hodge modules with their operations, weights and nearby cycles (Layers 4 and 5), exponential mixed Hodge structures (Layer 6), the Deligne filtration and the strict bifiltered exponential realization (Layer 7), the classical mixed Hodge structures inside the exponential ones (Layer 8), the exponential cohomology of a pair `(U, f)` (Layer 9), the classicality criterion for the function `tg` (Layer 10), Fourier cohomology, costalks and monodromy weights at infinity (Layer 11), and the logarithmic and Newton descriptions of the irregular Hodge filtration (Layer 12). The end theorems are Saito's projective direct-image and abelianness theorems, Esnault–Sabbah–Yu's `E₁`-degeneration of the irregular Hodge filtration with Fresán–Sabbah–Yu's strict bifiltered realization (FSY, Proposition A.10), the classicality of the `tg` pair cohomology (FSY, Theorem A.24), the Fourier costalk and Hodge-number theorems (FSY, Theorem A.30 and Corollary A.31), the monodromy weights at infinity of `Π M` (MT, Proposition A.3), and the concentration, volume and Hodge comparison theorems for a Newton-nondegenerate Laurent polynomial (AS, Theorems 4.13 and 5.1; Yu, Theorems 4.1 and 4.6).

## Scope and ownership

This roadmap owns:

- algebraic Whitney stratifications of algebraic maps and the bounded algebraically constructible derived categories of `ℚ`- and `ℂ`-sheaves on analytifications with the six operations, middle perversity, Betti nearby and vanishing cycles, and Kashiwara's regular Riemann–Hilbert correspondence for regular holonomic `D`-modules (Layer 1);
- exponential twists, Fourier–Laplace transformation on the affine line, additive convolution, localized Fourier transformation and Fourier duality (Layer 2);
- graded-polarizable variations of mixed Hodge structure, the limit mixed Hodge structure on the full nearby space of a quasi-unipotent polarized variation on a punctured disc, admissibility, and Zucker's `L²` Hodge theory of a punctured curve (Layer 3);
- compatible filtrations and Rees modules, the rational Kashiwara–Malgrange filtration, polarizable pure Hodge modules, strict-support extension, the polarized projective direct-image theorem, mixed Hodge modules and their abelianness and simultaneous strictness (Layer 4);
- the derived Hodge-module operations, weight bounds, Hodge nearby and vanishing cycles, the pure curve costalk formula, constant-divisor localization and the rigidity of Hodge modules with constant underlying local system (Layer 5);
- exponential mixed Hodge structures, the projector `Π`, the exponential tensor product, exponential weights, the de Rham fibre and its Fourier description (Layer 6);
- the Deligne filtration, filtered Laplace specialization, polarized twistor `D`-modules on curves and the strictness of their Fourier–Laplace transformation on the projective line, `E₁`-degeneration and the strict bifiltered realization (Layer 7);
- the classical embedding of mixed Hodge structures into exponential ones and the agreement of filtrations (Layer 8);
- ordinary, compact and middle exponential cohomology of a pair and its Künneth, duality, weight and localization theorems (Layer 9);
- the classical `tg` criterion and its zero-locus formula (Layer 10);
- Fourier cohomology, costalks, the constant correction of `Π`, regular stationary phase and the monodromy weights at infinity (Layer 11);
- the logarithmic pole-order complex, its blow-up and model independence, the Newton complex, Kouchnirenko's graded acyclicity, the Adolphson–Sperber concentration and volume theorem, the Newton–Hodge comparison, the constant Gauss–Manin boundary of a convenient Laurent polynomial and the filtered Künneth and duality theorems (Layer 12).

It leaves to named owners, and imports by section:

- Ordinary algebraic differential operators are ComplexComparisonPartII §C5.1; their symbol algebra and filtered PBW on smooth characteristic-zero varieties are FormalConnectionsOpers §F2.2. Left `D`-modules with quasi-coherent underlying `O`-module and their coherent subcategory are SpringerResolutionAndCharacteristicCycles §8.1; Noetherianity, good filtrations, their existence and comparison, and characteristic varieties are SpringerResolutionAndCharacteristicCycles §§8.2–8.5; transfers and duality, Kashiwara equivalence, holonomicity, finite length, intermediate extension and regularity are its §§9.1, 9.2, 9.4–9.7, including regular duality and smooth pullback in §9.7.
- Analytification of finite-type complex schemes, finite triangulations compatible with algebraic stratifications, the finite-coefficient local-system dictionary, the topological compact-support theory (extension by zero, c-soft resolutions, `f_!`, localization triangles) for module sheaves over an arbitrary commutative ring, the analytic canonical logarithmic extension with its residue–monodromy normalization `T = exp(−2πi·Res)`, Deligne's regular-singular Riemann–Hilbert equivalence and the regular-singular de Rham comparison are ComplexComparisonPartII §§C-1.1, C6.0, C6.1 and C5.6. This roadmap's Betti categories have rational and complex coefficients and require the extension of the local-system dictionary in gap:rational-complex-local-system-dictionary; the finite and adic constructible categories stay with ComplexComparisonPartII and the étale roadmaps.
- Formal differential modules over `ℂ((x))`: the finite-ramification formal normal form, slopes, ramified descent, Malgrange's irregularity `Irr = Σ slope · multiplicity` with good lattice pairs, and the Euler–Poincaré formula `χ_dR(U, E) = rank(E) · χ(U) − Σ_z Irr_z(E)` for an algebraic connection on a smooth affine curve are PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a and RD.6.53, used at the base field `ℂ`.
- Pure real and rational variations of Hodge structure on complex manifolds, their morphisms and rational polarizations are ShimuraData §§3.1–3.3 (`Variation`, `RationalPolarizedVariation`). The nilpotent-orbit theorem, the monodromy weight filtration, the polarized limiting mixed Hodge structure and the Hodge-norm estimates of a polarized variation with unipotent monodromy on `(Δ^*)^r × Δ^s` are ShimuraVarieties §§3.5b.1–3.5b.2. Layer 3 adds the mixed and quasi-unipotent one-variable statements that Saito's theory needs.
- The monodromy filtration `M(N, c)` of a nilpotent endomorphism in an abelian category, its strictness and primitive decomposition, the uniqueness of the relative monodromy filtration, the normalized `can` and `var`, and the existence of Lefschetz pencils are LefschetzPencilsAndVanishingCycles §§1.3, 1.4, 1.5, 1.7 and 3.4. Its étale nearby cycles are not used: Layer 1 constructs the Betti nearby cycles.
- Embedded resolution, principalization and smooth projective compactification with simple normal crossing boundary are ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.2 and 6.2; 3.3 and 4.6 use the last as the boundary at which admissibility is tested.
- Compactifications of a separated finite-type map over a quasi-compact quasi-separated base and their Nagata existence (`Compactification`, `DenseCompactification`, `nagataCompactification`) are EtaleCohomologyFoundations §§G.1–G.2; Layer 1 uses them for the maps of separated complex varieties, whose sources need not be quasi-projective, and 3.3 for the compactification of a smooth variety at whose boundary admissibility is tested.
- The exceptional projective bundle of a Koszul-regular blow-up, its sign `O_X̃(−E)|_E = O_E(1)`, normal line `O_E(−1)` and the negative-twist derived vanishing are SchemeKTheoryOperations §5.7. Smoothness of the blow-up of a smooth variety along a smooth centre is requested from SchemeAndStackFoundations §5.5 (gap:blowup-exceptional-divisor); §§12.2 and 12.9 apply the supplied vanishing to filtered complexes.
- Whitney's condition (b), tubes, control data, controlled lifts and Thom's first isotopy lemma are AlgebraicTopologyPartII §§16.1a–16.1e. Definable Whitney stratifications and Nash strata in the semialgebraic case are StratifiedSpacesAndTameTopology §§7.2–7.3. Layer 1 adds the stratification of an algebraic map.
- Derived categories of sheaves of modules on ringed sites with derived tensor, internal Hom, pullback, pushforward and coefficient change are EnhancedDerivedSheaves §§0.1–0.4 and E1.4.
- Depth and Cohen–Macaulay modules, quasi-coherent cohomology and the cohomology of projective space, Čech and Leray spectral sequences, derived quasi-coherent pullback, pushforward and Tor-independent base change, Serre duality, Riemann–Roch for vector bundles on curves, blow-ups and strict transforms, and strict normal crossing divisors are SchemeAndStackFoundations §§0.17, 2.2, 2.6, 2.18, 2.20, 3.3, 4.11 and 4.17. The nonsingular projective model of a curve and the expansion at a rational place are AlgebraicCurves Layers 9 and 12.
- Integral lattices, toric cones, fans, regular cones, dual semigroups and the fan scheme are AnalyticToricGeometry Layer 0; invariant toric divisors, their character weights and monomial divisor sections are AnalyticToricGeometryPartII §§0.1–0.3.
- Affine semigroups, their saturation and the normality of their algebras are GroebnerGeometry §G2. Hochster's theorem, that the algebra over a field of a finitely generated saturated semigroup is Cohen–Macaulay, is requested from it (gap:normal-semigroup-cohen-macaulay), with Cohen–Macaulay in the sense of Tau Ceti's `TauCeti.Ring.IsCohenMacaulay`; 12.5 applies it to the cones over the faces of the Newton polytope.
- Pure and mixed Hodge structures, their morphisms, Deligne's splitting and the strictness of morphisms for `F`, `W` and the Deligne pieces, Tate structures and Tate twists are Tau Ceti (`TauCeti.Hodge.HodgeStructureOn`, `TauCeti.Hodge.MixedHodgeStructure`, `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_iSup_deligneSplittingFamily_eq_map_iSup`, `TauCeti.Hodge.tate`, `TauCeti.Hodge.HodgeStructureOn.tateTwist`). In particular, the point case of simultaneous strictness for `W_k ∩ F^p` is that pinned theorem and is not restated.
- Koszul complexes of finite sequences in a commutative ring, their zeroth homology and their acyclicity in positive degrees for weakly regular sequences are Tau Ceti (`TauCeti.koszulComplex`, `TauCeti.koszulComplex.homologyZeroEquivSpan`, `TauCeti.koszulComplex.exactAt_of_isWeaklyRegular`); 12.5 applies them to the leading forms of a Newton-nondegenerate Laurent polynomial and does not restate them.
- The derived category of an abelian category, formal power series, formal Laurent series, monoid algebras, convex hulls, exposed faces, Lebesgue measure and the asymptotic count of lattice points in dilates are Mathlib (`DerivedCategory`, `PowerSeries`, `LaurentSeries`, `AddMonoidAlgebra`, `convexHull`, `IsExposed`, `MeasureTheory.volume`, `ZLattice.covolume.tendsto_card_div_pow`).
- KloostermanMomentsAndPotentialAutomorphy owns the Kloosterman connections, their symmetric powers, the particular Newton polytopes, monomial bases, parity and singularity tests, Jordan blocks and numerical Hodge counts; this roadmap supplies the general interfaces they use.

## Conventions

- **Varieties.** Varieties are separated schemes of finite type over `ℂ`; maps are algebraic. Hodge modules live on smooth quasi-projective varieties; a singular closed support `Z ⊂ X` is handled through the full subcategory of objects on the smooth ambient `X` supported on `Z`. Analytification `X ↦ X^an` is ComplexComparisonPartII's `complexSchemeAnalytification`.
- **Coefficients.** All Hodge objects are rational and graded-polarizable. A rational mixed Hodge structure is a `TauCeti.Hodge.MixedHodgeStructure` whose integral group is the rational space itself with the identity as rational model; finite dimension and graded polarizability are added conditions. No integral lattice or integral polarization is imposed.
- **Degrees.** For `X` smooth of pure dimension `d`, the unshifted de Rham complex `DR(M)` of a left `D_X`-module has terms in degrees `0, …, d`, and `pDR(M) = DR(M)[d]`. The constant perverse object is `pℚ_X = ℚ_X[d]`, of Hodge-module weight `d`; a smooth variation of weight `m` gives a Hodge module of weight `m + d`.
- **Hodge filtrations.** Filtrations of `D`-modules are increasing, `F_p`; decreasing notation is `F^p = F_{−p}`. The constant left module `O_X` has `F_0 O_X = O_X` and `F_{−1} O_X = 0`. Side change is `F_p(M_right) = ω_X ⊗ F_{p+d}(M_left)`. For `i : pt → A¹`, the left direct image of a filtered vector space is `F_p(i_+ V) = Σ_{k ≥ 0} F_{p−1−k} V · ∂^k`; this shift cancels the degree-one shift of its de Rham complex.
- **Tate twists.** Tau Ceti's `TauCeti.Hodge.tate m` is `ℤ(m)` of weight `−2m` with `F^p` the whole line exactly for `p ≤ −m`; `ℚ(m)` is its rationalization. Duality gives `D(pℚ_X) = pℚ_X(d)`. On a smooth divisor `i : D → X`, `i^! pℚ_X = pℚ_D(−1)[−1]` and `i^* pℚ_X = pℚ_D[1]`.
- **Exponentials.** The exponential connection is `E^f = (O_U, d + df)`. Fourier–Laplace transformation from the coordinate `τ` to the coordinate `t` uses the kernel `E^{tτ}`; it transports `t` to `−∂_τ` and `∂_t` to `τ`, and its square is pullback by `r(τ) = −τ`. At infinity, with `x = θ⁻¹`, the exponential operator on coefficients is `∂_x − x⁻²`.
- **Specialization.** The Kashiwara–Malgrange filtration is increasing, `V_α`, with `x∂_x + α` nilpotent on `gr^V_α`. Full nearby cycles include every eigenvalue of monodromy. Monodromy `T` is transport of horizontal sections along the positive loop, and the nilpotent operator is `N = (2πi)⁻¹ log T_u`; with ComplexComparisonPartII's `T = exp(−2πi·Res)` this is `N = −Res` on a unipotent block. On `gr^V_α` (4.2) it reads `T = exp(−2πi x∂_x)`, `log T_u = −2πi(x∂_x + α)` and `N = −(x∂_x + α)`. For unipotent `T`, `N = −(2πi)⁻¹ N_j` for the operator `N_j = log T_j` of ShimuraVarieties §3.5b.1, whose period lift satisfies `Φ̃(z + 1) = T_j Φ̃(z)` with `T_j = T⁻¹` (3.3). Primitive parts are therefore polarized through `−N`: the `k`-th one by `Q(·, (−N)^k ·)`, whose values in `ℚ(−k)` are read through `(2πi)^k`, that is by the rational form `Q(·, (−log T_u)^k ·)` (3.2, 4.3). Topological variation satisfies `var_top ∘ can = T − 1`. The normalized variation `var = (2πi)⁻¹ var_top ∘ log(T)/(T − 1) : φ_1 → ψ_1(−1)` of LefschetzPencilsAndVanishingCycles §1.7 satisfies `var ∘ can = N` and `can ∘ var = N`; on `gr^V`, `can` is `∂_x : gr^V_0 → gr^V_1` and `var` is `−x : gr^V_1 → gr^V_0`.
- **Weights.** The exponential weight filtration `W^E` of an exponential mixed Hodge structure is descended through `Π`; it differs from the ambient weight filtration of the representing mixed Hodge module on `A¹`. The unit `K = Π δ_0 ℚ` is exponentially pure of weight `0` and has ambient pieces of weights `0` and `1`.
- **Fibres.** The de Rham fibre is `ω(N) = H¹_dR(A¹, N ⊗ E^θ)`. Its decreasing rational irregular filtration `F^λ_irr`, `λ ∈ ℚ`, is the image of the Deligne-filtered complex. For classical objects `F^λ_irr = F^{⌈λ⌉}`. Constant objects have zero fibre.
- **Volumes.** Volumes in `ℝ^n` are Lebesgue measure, so that a fundamental domain of `ℤ^n` has volume one; in `ℝ⁰` the point has volume one.

## Exact supplier contracts

### From Mathlib

- `DerivedCategory` (`Mathlib/Algebra/Homology/DerivedCategory/Basic.lean`): the derived category of an abelian category, as the localization of cochain complexes at quasi-isomorphisms. It supplies no constructibility, perversity or `t`-structure.
- `Polynomial.derivative` and `Polynomial.derivative_mul` (`Mathlib/Algebra/Polynomial/Derivative.lean`): the formal derivative as an `R`-linear map and the Leibniz rule, used for the rank-one connection on `ℂ[t]`.
- `PowerSeries` (`Mathlib/RingTheory/PowerSeries/Basic.lean`) and `LaurentSeries` (`Mathlib/RingTheory/LaurentSeries.lean`, the abbreviation of the Hahn series `R⟦ℤ⟧`): the lattice ring `ℂ[[x]]` and the field `ℂ((x))` of the formal differential modules imported from PadicDifferentialEquationsAndRigidCohomology.
- `AddMonoidAlgebra` (`Mathlib/Algebra/MonoidAlgebra/Defs.lean`, a structure with field `coeff : M →₀ R`) with `AddMonoidAlgebra.coeffLinearEquiv` (`Mathlib/Algebra/MonoidAlgebra/Module.lean`), `Finsupp.lsum`, `Finsupp.lsingle`, `LinearMap.mulLeft`, `LinearMap.pi`, `LinearMap.proj`, `convexHull`, `affineSpan`, `IsExposed` (`Mathlib/Analysis/Convex/Exposed.lean`: a set `B` is exposed in `A` when it is empty or is the set of maximizers on `A` of a continuous linear functional; the functional may be zero, so `A` is exposed in itself) and `MeasureTheory.volume` on `Fin n → ℝ` (the product of Lebesgue measures, the Dirac mass when `n = 0`): the carriers of the Laurent polynomial ring, its twisted de Rham complex and the Newton polytope in Layer 12.
- `ZLattice.covolume.tendsto_card_div_pow` (`Mathlib/Algebra/Module/ZLattice/Covolume.lean`): for a lattice `L ⊂ ℝ^ι` with a `ℤ`-basis and a bounded measurable `s` whose frontier is null, `#(s ∩ k⁻¹L)/k^{#ι}` tends to `vol(s)/covol(L)` as `k → ∞` through the natural numbers; with `L = ℤ^n`, covolume one, and `s = Δ`, it gives `#(kΔ ∩ ℤ^n)/k^n → vol(Δ)`. `Convex.addHaar_frontier` (`Mathlib/Analysis/Convex/Measure.lean`): the frontier of a convex set in a finite-dimensional real space is null for every additive Haar measure. Used in 12.5.

### From Tau Ceti

- `TauCeti.Hodge.HodgeStructureOn` (`TauCeti/Geometry/Hodge/Structure.lean`): a pure Hodge structure of weight `n` on a complex vector space with a conjugation; it imposes no finiteness and no rational structure.
- `TauCeti.Hodge.MixedHodgeStructure` (`TauCeti/Geometry/Hodge/Mixed/Basic.lean`): an integral group with rational and complex base-change models, a finite increasing rational weight filtration `WQ`, a finite decreasing complex Hodge filtration `F`, and pure rational graded pieces. Its morphisms `TauCeti.Hodge.MixedHodgeStructure.Hom` (`Mixed/Morphism.lean`) are rational linear maps preserving `WQ` whose complexification preserves `F`.
- `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F`, `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ` and `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_iSup_deligneSplittingFamily_eq_map_iSup` (`Mixed/Strictness.lean`): strictness of morphisms for `F`, for `WQ`, and for every sum of Deligne pieces `I^{p,q}`; with the bidegree set `{(r, s) : p ≤ r, r + s ≤ k}` the last is strictness for `W_k ∩ F^p`.
- `TauCeti.Hodge.MixedHodgeStructureCat` (`Mixed/Category.lean`), the `ℚ`-linear category of mixed Hodge structures, with its instance `TauCeti.Hodge.MixedHodgeStructureCat.abelian` (`Mixed/Abelian.lean`): the category is abelian. This is the point case of the abelianness in 4.7 and is not restated.
- `TauCeti.Hodge.IsPolarization`, `TauCeti.Hodge.Polarization` and `TauCeti.Hodge.IsPolarizable` (`Polarization.lean`): the Hodge–Riemann relations for an integral bilinear form on the lattice of a pure Hodge structure. The rational polarizations of this roadmap are `ℚ`-valued forms on rational spaces; on a structure that has a lattice, a rational polarization becomes integral after multiplication by a positive integer, so rational polarizability is then `TauCeti.Hodge.IsPolarizable`.
- `TauCeti.Hodge.tate` and `TauCeti.Hodge.tate_F` (`Tate/Basic.lean`): `ℤ(m)` of weight `−2m` with its explicit Hodge filtration. `TauCeti.Hodge.HodgeStructureOn.tateTwist` (`Tate/Twist.lean`): Tate twist lowers the weight by `2m` and shifts `F^p` to `F^{p+m}`.
- `TauCeti.Ring.IsCohenMacaulay` (`TauCeti/RingTheory/CohenMacaulay/Ring.lean`): a commutative ring that is Noetherian and whose localization at every prime is Cohen–Macaulay as a module over itself; the predicate of 12.5 (a) and of gap:normal-semigroup-cohen-macaulay.
- `TauCeti.koszulComplex` and `TauCeti.koszulComplex.homologyZeroEquivSpan` (`TauCeti/RingTheory/KoszulComplex/Basic.lean`): for a finite sequence `x = (x₁, …, x_n)` in a commutative ring `R`, the Koszul chain complex `K(x)` of the functional `Fintype.linearCombination R x`, with `K(x)_k = ⋀^k R^n`, and `H₀(K(x)) ≅ R/(x₁, …, x_n)`. `TauCeti.koszulComplex.exactAt_of_isWeaklyRegular` (`TauCeti/RingTheory/KoszulComplex/Regular.lean`): if `x` is weakly regular (Mathlib's `RingTheory.Sequence.IsWeaklyRegular`), `K(x)` is exact in every positive degree. Through `⋀^k R^n ≅ (⋀^{n−k} R^n)^∨`, the cohomological Koszul complex of `x` is `K(x)` reindexed by `k ↦ n − k`, so for a weakly regular `x` its cohomology is `R/(x)` in degree `n` and zero elsewhere; this is the form used in 12.5 (c). These are Koszul complexes of ring elements acting by multiplication. The twisted de Rham complex of 12.4 is the Koszul complex of the commuting differential operators `θ_j + θ_j(φ)`, which are not multiplications, and is not an instance; only its associated graded complex in 12.5 is.

### From TauCetiRoadmap.SpringerResolutionAndCharacteristicCycles

§8.1 (left modules over the order-filtered operator sheaf of ComplexComparisonPartII §C5.1 with quasi-coherent underlying `O_Y`-module, and the coherent ones, finitely generated over `D_Y(U)` on every affine open `U`), §8.2 (Noetherianity and the cotangent comparison from supplied PBW), §8.3 (good filtrations), §8.4 (global existence and comparison by bounded shifts), §8.5 (characteristic varieties); §9.1 (transfer modules, `f_+`, `f^† = Lf^*[dim Y − dim Y′]` for `f : Y → Y′`, holonomic duality `𝔻` and `f_! = 𝔻 f_+ 𝔻`), §9.2 (Kashiwara equivalence), §9.4 (holonomic modules), §9.5 (finite length and cycle additivity), §9.6 (intermediate extension `j_!* E = im(H⁰ j_! E → H⁰ j_+ E)`), §9.7 (regularity, its stability under duality, smooth pullback and intermediate extension). Here `k` has characteristic zero, `Y` is smooth separated of finite type and pure dimensional, and left modules have quasi-coherent underlying `O_Y`-modules. On `A¹`, the closed-point direct image is `ℂ[∂]δ`, with `x∂δ = −δ`; the identity transfer has shift zero.

What SpringerResolutionAndCharacteristicCycles must provide (gap:holonomic-specializability): for a holonomic `D_X`-module on a smooth complex variety and a smooth hypersurface `x = 0`, the existence of a good `V_0 D_X`-lattice with a nonzero Bernstein–Sato polynomial for the Euler operator on its graded quotient, also after graph embedding of a regular function, and the rationality of its roots for regular holonomic modules with quasi-unipotent monodromy.

What SpringerResolutionAndCharacteristicCycles must provide (gap:regular-holonomic-stability): stability of the bounded derived category with regular holonomic cohomology under `f_+`, `f_!`, arbitrary `f^†`, external product and restriction to the diagonal, with the corresponding composition, adjunction and duality comparisons for algebraic maps of smooth complex varieties; the duality, smooth-pullback and intermediate-extension cases are supplied by §9.7.

### From TauCetiRoadmap.ComplexComparisonPartII

§C-1.1 (`complexSchemeAnalytification`, the analytic space and topological carrier `T_X` of a finite-type complex scheme); §C6.0 (`complexAlgebraicTopology`: Hausdorff, locally compact, locally contractible carriers of separated finite-type schemes with finite triangulations compatible with a prescribed finite algebraic stratification); §C5.1 (the ordinary differential-operator sheaf with its order filtration and localization; on `A¹`, `[∂, x] = 1`); §C6.1 (the sheaf/native-functor dictionary for finite rings and finite stalks, and separately the topological compact-support theory for module sheaves over an arbitrary commutative ring on locally compact Hausdorff spaces: extension by zero, c-soft resolutions, derived compact-support sections and localization triangles, and `Rf_!` for locally proper separated maps between paracompact locally contractible such spaces; the latter contract is used with `ℚ` and `ℂ`); §C5.6 (`RegularSingular`, `CanonicalLogExtension` with residue eigenvalues in a chosen strip and local monodromy conjugate to `exp(−2πi·Res)`, `deligneRiemannHilbert`, `regularSingularDeRhamComparison`). The canonical extension is constructed for every finite-rank complex local system on the complement of a simple normal crossing divisor in a smooth proper variety.

What ComplexComparisonPartII must provide (gap:rational-complex-local-system-dictionary): for `Λ = ℚ` or `ℂ` and a locally path-connected semilocally simply connected space `S`, an equivalence between locally constant sheaves of finite-dimensional `Λ`-vector spaces and the full subcategory of `TauCeti.LocalCoefficientSystem Λ S` with finite-dimensional values, identifying sheaf stalks with functor values and path transport with native transport, naturally under pullback. On a point the rank-one stalk is `Λ`, of vector-space dimension one and infinite cardinality; it is outside the finite-ring, finite-stalk contract.

### From TauCetiRoadmap.FormalConnectionsOpers

§F2.2 (symbols, the Lie–Rinehart enveloping algebra, filtered PBW for a projective tangent module and comparison with ordinary differential operators on a smooth characteristic-zero scheme). In particular `gr D_{A¹} = ℂ[x, ξ]`, with `x` in order zero and `ξ` in order one.

### From TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology

§RD.6.52a (over a field of characteristic zero: the finite-ramification formal normal form of a differential module over `F((t))`, which after finite constant extension and ramification splits it into exponential factors tensored with regular-singular modules; slopes and ramified descent; Malgrange's irregularity `Irr`, the sum of the slopes with multiplicity, computed by a good lattice pair, and zero exactly for regular-singular modules); §RD.6.53 (for a smooth proper geometrically connected curve `C` over a field of characteristic zero, a finite set `Z` of closed points, `U = C ∖ Z` and an algebraic connection `(V, ∇)` of rank `r` on `U`, `dim H⁰_dR − dim H¹_dR + dim H²_dR = r · χ(U) − Σ_{z∈Z} [κ(z) : F] · Irr_z(V)`). Both are used with `F = ℂ`.

### From TauCetiRoadmap.ShimuraData and TauCetiRoadmap.ShimuraVarieties

ShimuraData §3.1 (`Variation`: a pure real or rational variation of Hodge structure of weight `n` on a complex manifold, with its fibrewise pure Hodge structure and Griffiths transversality), §3.2 (morphisms of variations) and §3.3 (`RationalPolarizedVariation`: a parallel nondegenerate rational form of parity `(−1)^n` satisfying the Hodge–Riemann relations fibrewise). ShimuraVarieties §3.5b.1 (for a pure rational variation of weight `k` on `(Δ^*)^r × Δ^s` with a flat polarization and a monodromy-stable integral lattice: after a finite power cover the monodromies are unipotent, `N_j = log T_j`, the nilpotent-orbit factorization of the period map with Schmid's exponential distance estimate, the monodromy weight filtrations and the polarized limiting mixed Hodge structures) and §3.5b.2 (the Hodge-norm estimates on sectors). Layer 3 uses the case `r = 1`, `s = 0`. A rational local system on `Δ^*` with quasi-unipotent monodromy `T` always has a `T`-stable lattice, since the characteristic polynomial of `T` is a product of cyclotomic polynomials, so the integral-lattice hypothesis is satisfied.

### From TauCetiRoadmap.LefschetzPencilsAndVanishingCycles

§1.3 (the monodromy filtration `M(N, c)` centred at `c`: the unique finite increasing filtration `M` of an object of an abelian category with `N M_i ⊂ M_{i−2}(−1)` and `N^r : gr_{c+r} ≅ gr_{c−r}(−r)`, for which `N` is a morphism `(X, M) → (X(−1), M[−2])`); §1.4 (strictness of `N` and the primitive decomposition); §1.5 (uniqueness of the relative monodromy filtration, existence being a hypothesis wherever used); §1.7 (normalized `can` and `var` with `var ∘ can = N` through the factor `log(T)/(T − 1)`); §3.4 (existence of Lefschetz pencils after a Veronese embedding of degree `r ≥ 2`).

### From TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero

§5.1 (principalization of a coherent ideal nonzero at every generic point), §5.2 (embedded resolution of a reduced closed subscheme of a smooth variety, an isomorphism over the regular locus), §6.2 (SNC compactification of a smooth quasi-projective variety: a smooth projective variety containing it as a dense open with reduced strict simple normal crossing complement).

### From TauCetiRoadmap.EtaleCohomologyFoundations

§G.1 (`Compactification f` for `f : X → S`: a scheme `Xbar`, a quasi-compact open immersion `j : X → Xbar` and a proper `p : Xbar → S` with `j ≫ p = f`; `DenseCompactification f`, the full subcategory with `j` schematically dense) and §G.2 (`nagataCompactification`: for `S` quasi-compact and quasi-separated and `f` separated of finite type, a dense compactification exists). Used with `S = Y` a separated complex variety, including `Y = Spec ℂ` for the compactification of a smooth variety in 3.3. The compactification is proper over `Y`, not projective: for `j : G_m → A¹` the choice `A¹` with `p = id` qualifies, while `P¹ ⊃ G_m` admits no map to `A¹` extending `j`.

### From TauCetiRoadmap.StratifiedSpacesAndTameTopology

§7.2 (finite definable Whitney stratifications compatible with finitely many definable subsets, with the stated finite differentiability or smooth cell-decomposition hypotheses); §7.3 (Nash, hence smooth, strata in the semialgebraic case).

### From TauCetiRoadmap.AlgebraicTopologyPartII

§16.1a (Whitney condition (b)), §16.1b (tubes and Thom–Mather control data), §16.1c (existence of compatible control data), §16.1d (controlled vector fields and lifts), §16.1e (Thom's first isotopy lemma for a proper controlled submersion to a Hausdorff second-countable smooth manifold, with stratum-preserving local trivializations). The control condition includes `dρ_i(ξ) = 0`: on the punctured plane with `ρ = x² + y²`, rotation `ξ = (−y, x)` gives `−2xy + 2xy = 0`, whereas radial dilation gives `2ρ ≠ 0`.

### From TauCetiRoadmap.EnhancedDerivedSheaves

§§0.1–0.4 (enhanced derived categories of module sheaves on ringed sites, replacements, derived tensor, internal Hom and derived functors) and §E1.4 (tensor, internal Hom, pullback, pushforward and change of coefficients), applied to the topological space `T_X` with the constant rings `ℚ` and `ℂ`.

### From TauCetiRoadmap.SchemeAndStackFoundations and TauCetiRoadmap.AlgebraicCurves

SchemeAndStackFoundations §0.17 (depth and Cohen–Macaulay modules), §2.2 (Leray and Čech spectral sequences), §2.6 (quasi-coherent cohomology, including `H^q(P^n_A, O(d))`), §2.18 (derived quasi-coherent pullback and pushforward, the projection formula and Tor-independent base change), §2.20 (Serre duality for proper Cohen–Macaulay schemes), §3.3 (degrees and Riemann–Roch for vector bundles on curves), §4.11 (blow-ups and strict transforms), §4.17 (strict normal crossing divisors), §5.5 (the conormal sheaf `I/I²` and the normal bundle `(I/I²)^∨` of a regular immersion). AlgebraicCurves Layer 9 (expansion of a function field at a rational place into `k((T))`, compatible with derivations) and Layer 12 (the nonsingular projective model of a curve).

What SchemeAndStackFoundations must provide (gap:blowup-exceptional-divisor): for the blow-up `π : X̃ → X` of a smooth variety over a field along a smooth closed subvariety `Z` of pure codimension `c ≥ 2`, the smoothness of `X̃` over that field.

### From TauCetiRoadmap.SchemeKTheoryOperations

§5.7: for a Koszul-regular immersion `Z → X` of pure codimension `c ≥ 1`, the exceptional divisor of `Bl_Z X` is `Proj(Sym(I/I²))`, denoted `P(N_{Z/X})` with `N_{Z/X} = (I/I²)^∨`; `O_X̃(−E)|_E = O_E(1)` and the normal line is `O_E(−1)`. For `p : E → Z`, perfect `G` and `1 ≤ μ ≤ c − 1`, it supplies `Rp_*(O_E(−μ) ⊗ Lp^* G) = 0`. Smooth varieties and smooth centres give Koszul-regular immersions, and `G = O_Z` with `c = 2` and `μ = 1` supplies the vanishing `Rp_* O_E(−1) = 0` used in 12.2 and 12.9.

### From TauCetiRoadmap.AnalyticToricGeometry and TauCetiRoadmap.AnalyticToricGeometryPartII

AnalyticToricGeometry Layer 0, items 1–9 (integral lattices, toric and regular cones, fans and subdivisions, dual semigroups, affine toric schemes, face localizations and the fan scheme over `Spec ℂ`). AnalyticToricGeometryPartII §0.1 (invariant toric divisors), §0.2 (divisor character weights), §0.3 (monomial divisor sections: global sections of the invariant divisor `D = Σ a_ρ D_ρ` are spanned by the characters `m` with `⟨m, v_ρ⟩ + a_ρ ≥ 0`).

What AnalyticToricGeometryPartII must provide (gap:toric-normal-fan): the normal fan of a full-dimensional lattice polytope `Δ ⊂ ℝ^n`, the existence of a regular complete refinement, and the identification of `Δ` with the polytope of the torus-invariant divisor of the refined fan whose coefficient on the ray `v_ρ` is `−min_{u ∈ Δ} ⟨u, v_ρ⟩`.

What AnalyticToricGeometryPartII must provide (gap:toric-rounded-vanishing): for a smooth complete toric variety `X_Σ` and a torus-invariant `ℚ`-divisor `D` that is nef, the vanishing `H^i(X_Σ, O(⌊D⌋)) = 0` for every `i > 0`.

### From TauCetiRoadmap.GroebnerGeometry

§G2 (an affine semigroup is a finitely generated additive submonoid `S` of a finite free abelian group, with algebra `k[S] = AddMonoidAlgebra k S`; its saturation in the group `L_S` that it generates, finite normalization, and, over a field, normality of `k[S]` exactly when `S` is saturated). Used in 12.5 for the semigroups of lattice points of the cones over the faces of `Δ` not containing `0`, each saturated by construction.

What GroebnerGeometry must provide (gap:normal-semigroup-cohen-macaulay): for every field `k` and every finitely generated additive submonoid `S` of a finite free abelian group that is saturated in the group it generates, the monoid algebra `k[S]` is Cohen–Macaulay in the sense of `TauCeti.Ring.IsCohenMacaulay` (Hochster's theorem). On `S = {0}`, `ℕ`, `ℤ` and `ℕ²` the depth equals the dimension, `0`, `1`, `1` and `2`; saturation cannot be dropped, by the nonsaturated example in the Checks of 12.5.

## How to read the build

Layer 1 gives the Betti side: stratifications of maps, constructible complexes with six operations, perverse sheaves, nearby cycles and regular Riemann–Hilbert. Layer 2 gives the exponential and Fourier operations on holonomic modules. Layer 3 gives the variations of mixed Hodge structure on punctured curves that Saito's induction needs. Layer 4 defines pure and mixed Hodge modules and proves the projective direct-image and abelianness theorems; Layer 5 builds the operations, weights and cycles. Layer 6 defines exponential mixed Hodge structures by the projector `Π`; Layer 7 builds the Deligne filtration and proves `E₁`-degeneration and bifiltered strictness; Layer 8 embeds classical mixed Hodge structures. Layer 9 defines pair cohomology, Layer 10 proves the `tg` criterion, Layer 11 computes Fourier cohomology and weights at infinity, and Layer 12 compares the irregular Hodge filtration with logarithmic and Newton filtrations and proves the Adolphson–Sperber theorem, the headline statement of `Suggested.lean`. Each target's `*Needs:*` line lists what its statement and its proof route use, item by item.

### Former-numbering map

The former lettered numbering corresponds to the following sections. A layer entry applies to its unchanged individual topics; the individual entries specify shifts caused by additional topics.

| Former numbering | Section or supplier |
|---|---|
| B | Layer 1; B/constructible-six-operations → §1.2, B/middle-perverse → §1.3, B/betti-cycles → §1.4, B/regular-riemann-hilbert → §1.5 |
| D | PadicDifferentialEquationsAndRigidCohomology §§RD.6.52a–RD.6.53 |
| D/formal-differential-module, D/formal-decomposition | PadicDifferentialEquationsAndRigidCohomology §RD.6.52a |
| D/curve-index | PadicDifferentialEquationsAndRigidCohomology §RD.6.53 |
| F | Layer 2, §§2.1–2.5 in the same topic order |
| H.0 | Layer 4, with the curve-L² topic in §3.4 |
| H.0/filtered-rees, H.0/v-filtration, H.0/pure-hodge-module, H.0/strict-support-extension | §§4.1, 4.2, 4.3, 4.4 respectively |
| H.0/curve-l2-hodge | §3.4 |
| H.0/projective-direct-image, H.0/mixed-hodge-module, H.0/abelian-strictness | §§4.5, 4.6, 4.7 respectively |
| H.1 | Layer 5 |
| H.1/operations | §5.1 |
| H.1/weight-bounds | §5.2 |
| H.1/hodge-cycles, H.1/curve-costalk, H.1/divisor-localisation | §§5.3, 5.4, 5.5 respectively |
| E | Layer 6, §§6.1–6.6 in the same topic order |
| I | Layer 7 |
| I/deligne-filtration, I/rees-laplace-specialisation | §§7.1, 7.2 respectively |
| I/polarized-curve-strictness, I/irregular-e1, I/strict-bifiltered-realisation | §§7.4, 7.5, 7.6 respectively; §7.3 supplies the twistor construction |
| C | Layer 8, §§8.1–8.2 in the same topic order |
| P | Layer 9, §§9.1–9.6 in the same topic order |
| G | Layer 10, §§10.1–10.2 in the same topic order |
| T | Layer 11, §§11.1–11.6 in the same topic order |
| N | Layer 12 |
| N/logarithmic-filtration, N/filtered-blowup, N/model-independence, N/newton-complex | §§12.1, 12.2, 12.3, 12.4 respectively |
| N/newton-concentration, N/newton-hodge-comparison, N/constant-gauss-manin-cone, N/filtered-kunneth-duality | §§12.6, 12.7, 12.8, 12.9 respectively; §12.5 supplies graded acyclicity |

## Layer 1: Betti constructibility and regular Riemann–Hilbert

On analytifications of complex algebraic varieties, this layer constructs bounded algebraically constructible complexes with rational and complex coefficients, the six operations, the middle perverse `t`-structure, nearby and vanishing cycles, and the regular Riemann–Hilbert correspondence normalized by `pDR(M) = DR(M)[dim X]`.

### 1.1 Algebraic Whitney stratifications of a map

Prove Verdier's stratification theorem for algebraic maps. Let `f : X → Y` be a map of separated complex varieties and let `𝒳`, `𝒴` be finite families of locally closed algebraic subsets of `X` and `Y`. There are finite stratifications of `X` and `Y` into smooth locally closed algebraic strata, refining `𝒳` and `𝒴`, satisfying the frontier condition and Whitney's condition (b) after analytification, such that `f` maps each stratum of `X` submersively onto a stratum of `Y` (Verdier, Théorème 3.3 and Corollaire 5.1). Consequently, when `f` is proper, `f^an` is locally topologically trivial over each stratum of `Y`, by a stratum-preserving trivialization. For an arbitrary `f`, let `X ⊂ X̄` with `p : X̄ → Y` proper be a dense compactification of `f` (EtaleCohomologyFoundations §§G.1–G.2; `X̄` is again a separated complex variety); stratifying `p` with `X` and `X̄ ∖ X` added to the family on `X̄`, the stratum-preserving trivializations of `p^an` over the strata of `Y` restrict to trivializations of `f^an`, and the strata of `X̄` contained in `X` stratify `f`. No projective completion of `X`, absolute or over `Y`, is assumed. *Proof route:* pass to the dense compactification `p : X̄ → Y`; stratify `X̄` and `Y` by descending induction on dimension, refining the closures in `X̄` of the members of `𝒳`, the open set `X` and `𝒴`, using generic smoothness of `p` on each stratum and Verdier's analytic Bertini–Sard argument that Whitney's condition (b) holds on a dense Zariski-open subset of each stratum; then over each stratum of `Y` the map `p^an` is a proper controlled submersion, Thom's first isotopy lemma gives a stratum-preserving local trivialization, and it restricts to the union `X` of strata. *Needs:* AlgebraicTopologyPartII §§16.1a–16.1e (condition (b), control data and first isotopy lemma); StratifiedSpacesAndTameTopology §§7.2–7.3 (Whitney stratifications with Nash strata in the semialgebraic case); ComplexComparisonPartII §C-1.1 and §C6.0; EtaleCohomologyFoundations §§G.1–G.2 (`Compactification`, `DenseCompactification`, `nagataCompactification`) for the relative compactification.

**Checks.**

- For `f : A² → A¹`, `(x, y) ↦ xy`, the stratification `{0}`, `{xy = 0} ∖ {0}`, `{xy ≠ 0}` of the source over `{0}`, `A¹ ∖ {0}` of the target is a stratification of the map; the fibre over `t ≠ 0` is `ℂ^×`, while the zero fibre is two crossing lines, so no stratification of the target with one stratum works.
- For the inclusion `j : G_m → A¹`, which is not proper, a dense compactification over `A¹` is `G_m ⊂ A¹` with `p = id_{A¹}`, proper with one-point fibres. With the strata `{0}` and `G_m` of both source and target, `G_m` is a union of strata, and the restrictions of `j` over `{0}` (empty fibre) and over `G_m` (one-point fibres) are both locally trivial. `P¹ ⊃ G_m` is not a compactification of `j`: `Γ(P¹, O) = ℂ`, so every map `P¹ → A¹` is constant and none restricts to `x ↦ x` on `G_m`.
- For the control radius `ρ = x² + y²` on the plane stratified by the origin and its complement, rotation `(−y, x)` gives `dρ = −2xy + 2xy = 0` and is controlled; radial dilation `(x, y)` gives `dρ = 2ρ ≠ 0` away from the origin and fails the control condition of AlgebraicTopologyPartII §16.1d.
- For the cusp `y² = x³` in `A²` with strata the origin and its complement in the curve, Whitney's condition (b) holds at the origin; on the Whitney umbrella `x² = y² z`, the strata given by the `z`-axis and its complement fail (b) at the origin, so the origin must be a stratum of its own.

### 1.2 Algebraically constructible Betti complexes and the six operations

**Construction.** For a separated complex variety `X` and `Λ ∈ {ℚ, ℂ}`, let `D^b_c(X, Λ)` be the full subcategory of the derived category of sheaves of `Λ`-modules on `X^an` (EnhancedDerivedSheaves §0.1) of complexes with bounded cohomology whose cohomology sheaves have finite-dimensional stalks and are locally constant on the strata of some finite algebraic stratification. Construct, for algebraic maps, `f^*`, `Rf_*`, `Rf_!`, `f^!`, derived tensor product, internal Hom, external product and Verdier duality `D_X = RHom(−, f^! Λ)` for `f : X → pt`, with the adjunctions, composition, proper base change, the projection formula and the two localization triangles of an open–closed decomposition. Define `RΓ_Z = i_* i^!` for a closed `Z`. Constructibility of the direct image of an arbitrary analytic map is not asserted. *Proof route:* the operations come from EnhancedDerivedSheaves §§0.1–0.4 and §E1.4 on the topological carriers of ComplexComparisonPartII §C-1.1; `Rf_!` uses the compact-support theory of ComplexComparisonPartII §C6.1 after factoring `f` as an open immersion followed by a proper map (a dense compactification, EtaleCohomologyFoundations §§G.1–G.2), and `f^!` is its right adjoint; constructibility of `Rf_*` and `Rf_!` follows from 1.1 by stratified local triviality (Dimca, Theorem 4.1.5 with Remark 4.1.7 and Corollary 4.1.6, pp. 81–84; Definition 4.2.7, p. 107); Verdier duality is Dimca §3.2, Definition 3.2.1 and Theorem 3.2.3, p. 62, and Theorem 3.3.10, p. 69. *Needs:* 1.1; EnhancedDerivedSheaves §§0.1–0.4, E1.4; ComplexComparisonPartII §§C-1.1, C6.0, C6.1; EtaleCohomologyFoundations §§G.1–G.2; Mathlib `DerivedCategory`.

API:

- Change of coefficients `− ⊗_ℚ ℂ` commutes with all six operations for algebraic maps.
- For `i : Z → X` closed with open complement `j`, `i_* i^! K → K → Rj_* j^* K` and `j_! j^* K → K → i_* i^* K` are distinguished and functorial in `K`.
- For `f` proper and any algebraic base change `g`, the base-change map `g^* Rf_* → Rf′_* g′^*` is an isomorphism.
- `RΓ_Z(X, K) = RΓ(X, i_* i^! K)` sits in the localization triangle with `RΓ(X ∖ Z, K)`.
- On a point, `D^b_c(pt, ℚ)` is equivalent to the bounded derived category of finite-dimensional `ℚ`-vector spaces.

**Checks.**

- `H⁰(A¹, ℚ) = ℚ`, `H²_c(A¹, ℚ) = ℚ`, and all other ordinary and compactly supported cohomology of `A¹` vanishes; a definition that forgot compact supports would give `H⁰_c = ℚ`.
- `RΓ_{0}(A¹, ℚ) = ℚ[−2]`, whereas `i_0^* ℚ = ℚ` in degree `0`; replacing `i^!` by `i^*` fails this test, and `RΓ_Z` is distinct from `RΓ_c`.
- For `X` smooth of dimension `d`, `D_X(ℚ_X[d]) = ℚ_X[d]` before Hodge-theoretic Tate twists; on `A¹`, `D(ℚ) = ℚ[2]`.

### 1.3 Middle perverse sheaves

**Definition.** For an algebraic Whitney stratification with strata `S` of complex dimension `s`, the middle perverse `t`-structure on `D^b_c(X, Λ)` has `pD^{≤0}` given by `H^j(i_S^* K) = 0` for `j > −s` and `pD^{≥0}` by `H^j(i_S^! K) = 0` for `j < −s`. Prove independence of the adapted stratification, boundedness, nondegeneracy and self-duality under `D_X`; the heart `Perv(X, Λ)` is abelian of finite length. Construct perverse cohomology `pH^j` and intermediate extension `j_!* L = im(pH⁰ j_! L → pH⁰ Rj_* L)` for a locally closed immersion `j`. For a local system `L` on a smooth `d`-fold, `L[d]` is perverse; for a reduced divisor `D` in a smooth `d`-fold, `ℚ_D[d − 1]` is perverse (Dimca §5.1, pp. 125–133, Theorem 5.1.20, p. 131; §5.2, pp. 133–140). The divisor statement uses that `D` is a local complete intersection; no claim is made for constants on an arbitrary singular variety. *Proof route:* glue the support and cosupport truncations over strata by recollement (1.2); exchange the two conditions by Verdier duality; for the divisor use normal slices and the connectivity bound of local complete intersections. *Needs:* 1.1, 1.2.

API:

- A finite-rank local system on a smooth `d`-fold gives a perverse object after the shift `[d]`.
- Perverse truncation triangles exist and give a long exact sequence of perverse cohomology.
- `j_!* L` is the unique extension of `L` with no nonzero subobject or quotient supported on the boundary.
- Verdier duality is `t`-exact on the heart and exchanges `pH⁰ j_!` and `pH⁰ Rj_*`.

**Checks.**

- `Perv(pt, ℚ)` is the category of finite-dimensional `ℚ`-vector spaces in degree `0`.
- `ℚ_{A¹}[1]` is perverse and `ℚ_{A¹}` is not; on a curve an unshifted nonzero local system is never perverse.
- For `xy = 0` in `A²`, `ℚ_{xy=0}[1]` is perverse although it is not a shifted local system on a smooth curve; its two branches meet at a point where `H^{−1}` has rank one stalk while the normalization would give rank two.

### 1.4 Betti nearby and vanishing cycles

**Construction.** For `f : X → A¹` and `K ∈ D^b_c(X, ℚ)`, construct `Rψ_f K` from the universal cover of the punctured disc and `Rφ_f K` as the cone of the specialization map `i^* K → Rψ_f K`. Set `pψ_f = Rψ_f[−1]` and `pφ_f = Rφ_f[−1]`. Prove constructibility, `t`-exactness on perverse objects, the decomposition by generalized eigenvalues of monodromy after complexification (the unipotent part is defined over `ℚ`), the `can`/`var` triangles with `var_top ∘ can = T − 1`, and commutation with proper direct image. On the unipotent part, define the normalized variation `var = (2πi)⁻¹ var_top ∘ log(T)/(T − 1) : pφ_{f,1} K → pψ_{f,1} K(−1)`, where `log(T)/(T − 1)` is the polynomial in the nilpotent `T − 1` on `pφ_{f,1} K` with constant term `1` and the factor `(2πi)⁻¹` is carried by the Tate twist `ℚ(−1) = (2πi)⁻¹ℚ`. Prove `var ∘ can = (2πi)⁻¹ log T_u = N` on `pψ_{f,1} K` and `can ∘ var = N_φ`, the nilpotent logarithm on `pφ_{f,1} K`; conversely, on underlying complex objects `var_top = var ∘ (exp(2πiN_φ) − 1)/N_φ`, where `(exp(2πiu) − 1)/u = 2πi + (2πi)²u/2 + ⋯`. Writing this series as `2πi + u·h(u)` with `h(0) = (2πi)²/2 ≠ 0`, the difference `var_top − 2πi·var` is `var ∘ N_φ ∘ h(N_φ)` with `h(N_φ)` invertible, so `var_top = 2πi·var` exactly when `var ∘ N_φ = 0`, in particular when `N_φ = 0` (Dimca §4.2, Definitions 4.2.1 and 4.2.4, Propositions 4.2.8–4.2.11 and Remark 4.2.12, pp. 103–110; Theorem 5.2.21, p. 139). *Proof route:* covering-space pullback and pushforward; perversity by the support and cosupport estimates of Milnor fibres; the triangles by recollement; the normalization as in LefschetzPencilsAndVanishingCycles §1.7 with the analytic loop in place of the inertia generator. *Needs:* 1.2, 1.3; LefschetzPencilsAndVanishingCycles §1.7.

API:

- The specialization, `can` and `var` triangles are functorial in `K`.
- `pψ_f` and `pφ_f` are exact functors between perverse hearts.
- `can`, `var_top` and the normalized `var` intertwine monodromy; `var_top ∘ can = T − 1`, while `var ∘ can = N` and `can ∘ var = N_φ`.
- On underlying complex objects, `var_top = 2πi·var` holds exactly when `var ∘ N_φ = 0`; this is weaker than `N_φ = 0`.
- Nearby and vanishing cycles commute with proper direct image.

**Checks.**

- For `f = t` on `A¹`, `pψ(ℚ[1]) = ℚ` with `T = 1` and `pφ(ℚ[1]) = 0`.
- For a skyscraper `δ_0 V`, `pψ = 0` and `pφ = V` in degree `0`.
- For `f = t²` on `A¹`, the nearby fibre of `ℚ[1]` has dimension two with monodromy eigenvalues `1` and `−1`; keeping only the unipotent part loses rank one.
- For `j : G_m → A¹`, `f = t` and `K = Rj_* L[1]` with `L` of rank two and `T = 1 + 2πiB`, `B ≠ 0`, `B² = 0`: `var_top ∘ can = T − 1 = 2πiB`, while `(2πi)⁻¹ log T = B`, so `var ∘ can = N = B`; the unnormalized composite is off by `2πi`. On `pφ`, where `T_φ − 1 = can ∘ var_top` is again nonzero of square zero, the factor `log(T_φ)/(T_φ − 1) = 1 − (T_φ − 1)/2` is not the identity. Identifying `pφ` with `pψ` through the isomorphism `var_top`, `can = 2πiB`, `N_φ = B` and `var = (2πi)⁻¹(1 − πiB)`, so `var ∘ N_φ = (2πi)⁻¹B ≠ 0` and `2πi·var = 1 − πiB` differs from `var_top = 1`.
- For the same `L` and `K = j_! L[1]`, the stalk at `0` vanishes and `can` is an isomorphism; identifying `pφ` with `pψ` through it, `var_top = T − 1 = 2πiB`, `T_φ = 1 + 2πiB`, `N_φ = B ≠ 0` and `var = (2πi)⁻¹·2πiB·(1 − πiB) = B`. Hence `var ∘ can = B = N`, `can ∘ var = B = N_φ`, and `var_top = 2πiB = 2πi·var` although `N_φ ≠ 0`, because `var ∘ N_φ = B² = 0`. A rule requiring `N_φ = 0` for `var_top = 2πi·var` fails here.

### 1.5 Regular Riemann–Hilbert correspondence

**Theorem.** For `X` a smooth complex variety of dimension `d`, analytification followed by `pDR(M) = DR(M)[d]` is an equivalence from algebraic regular holonomic left `D_X`-modules to `Perv(X, ℂ)`, and from the bounded derived category with regular holonomic cohomology to `D^b_c(X, ℂ)`. It is exact, fully faithful, and compatible with `f_+` and `Rf_*`, `f_!` and `Rf_!`, `f^†` and `f^!` up to the normalizing shifts, holonomic duality and Verdier duality, and external product. Regularity includes regularity at the boundary of an algebraic compactification. The inverse is the regular holonomic realization; it is not the space of analytic solutions of an irregular connection (Kash84, §6 and Main Theorem, pp. 353–355; §7, pp. 355–358; Dimca, Theorems 5.3.1 and 5.3.3, pp. 144–145). Compatibility with nearby and vanishing cycles is 4.2. *Proof route:* construct the inverse by Kashiwara's tempered solutions; reduce biduality to a local system on the complement of a normal crossing divisor by embedded resolution and principalization, proper direct image and induction on the support; on the smooth locus the base case is `deligneRiemannHilbert`; algebraize the regular meromorphic extension and translate the solution comparison to `pDR` by duality. *Needs:* 1.2, 1.3; SpringerResolutionAndCharacteristicCycles §§9.1, 9.2, 9.4, 9.7 and gap:regular-holonomic-stability; ResolutionOfSingularitiesCharacteristicZero §§5.1, 5.2; ComplexComparisonPartII §C5.6 (`deligneRiemannHilbert`, `CanonicalLogExtension`).

**Checks.**

- `pDR(O_X) = ℂ_X[d]`.
- The algebraic connection `E^t` on `A¹` is not isomorphic to `O_{A¹}` in the regular holonomic category, although the analytic gauge `e^t` identifies their analytifications: `E^t` is irregular at infinity and lies outside the source category.
- For `δ_0 = D/Dx` on `A¹`, `pDR(δ_0)` is the skyscraper `ℂ` at the origin in degree `0`; using unshifted `DR` would place it in degree `1`.

### Examples

For `j : G_m → A¹`, 1.2 gives the exact sequence of perverse sheaves `0 → ℚ_{0} → j_! ℚ_{G_m}[1] → ℚ_{A¹}[1] → 0`, and 1.3 gives `j_!* ℚ_{G_m}[1] = ℚ_{A¹}[1]`. Under 1.5 the corresponding `D`-modules are `j_! O_{G_m}`, `δ_0` and `O_{A¹}`, and `j_+ O_{G_m} = O_{A¹}[x⁻¹]` corresponds to `Rj_* ℚ_{G_m}[1]`.

### Dependencies

1.1 needs AlgebraicTopologyPartII §§16.1a–16.1e, StratifiedSpacesAndTameTopology §§7.2–7.3, ComplexComparisonPartII §§C-1.1, C6.0 and EtaleCohomologyFoundations §§G.1–G.2. 1.2 needs 1.1, EnhancedDerivedSheaves, ComplexComparisonPartII §C6.1 and EtaleCohomologyFoundations §§G.1–G.2. 1.3 needs 1.2; 1.4 needs 1.2, 1.3 and LefschetzPencilsAndVanishingCycles §1.7; 1.5 needs 1.2–1.3, SpringerResolutionAndCharacteristicCycles §§9.1–9.7, ResolutionOfSingularitiesCharacteristicZero and ComplexComparisonPartII §C5.6.

## Layer 2: Exponential connections and Fourier–Laplace operations

This layer constructs exponential twists, Fourier–Laplace transformation with kernel `E^{tτ}`, additive convolution and localized Fourier transformation on holonomic modules, and proves exactness, inversion with the sign involution, duality and the regular-input slope bounds. Unshifted de Rham degrees `0, …, dim X` are kept separate from perverse degrees throughout.

### 2.1 Exponential connections and twists

**Construction.** For `U` smooth and `f ∈ O(U)`, let `E^f = (O_U, d + df)`, the left `D_U`-module on which a vector field `ξ` acts by `ξ + ξ(f)`. Construct `M ⊗ E^f` for a left `D_U`-module `M`, and its meromorphic extension along a divisor on which `f` has poles. Its unshifted de Rham differential is `∇_M + df ∧`. Identify `E^f ⊗ E^g ≅ E^{f+g}`, `𝔻(M ⊗ E^f) ≅ 𝔻M ⊗ E^{−f}` and, for `h : U′ → U`, the unshifted connection pullback of `E^f` with `E^{f∘h}`; the normalized inverse image `h^†` adds the shift `dim U′ − dim U` (FSY, Appendix A.1, pp. 60–61, and (A.7)–(A.8), p. 64; ESY, §§2.1–2.3, pp. 18–21). On `ℂ[t]` the differential of `E^f` is `p ↦ p′ + f′ p`, written with Mathlib's `Polynomial.derivative`. *Needs:* ComplexComparisonPartII §C5.1; SpringerResolutionAndCharacteristicCycles §9.1; Mathlib `Polynomial.derivative`, `Polynomial.derivative_mul`.

API:

- `E^f ⊗ E^g ≅ E^{f+g}`, naturally and associatively, with unit `E^0 = O_U`.
- `𝔻(M ⊗ E^f) ≅ 𝔻M ⊗ E^{−f}`.
- Connection pullback takes `E^f` to `E^{f∘h}`; normalized inverse image adds `dim U′ − dim U`.
- `DR(M ⊗ E^f)` has differential `∇_M + df ∧`; on `ℂ[t]` it is `p ↦ p′ + f′ p`.

**Checks.**

- `E^0` is the structure connection `O_U`.
- For `f = ct`, the polynomial differential sends `1` to `c` and `tⁿ` to `n t^{n−1} + c tⁿ`.
- On `ℂ[t]`, `d/dt + 1` is bijective, so `H⁰` and `H¹` of `(A¹, E^t)` vanish; with the opposite sign convention `d − df` the same conclusion holds for `E^{−t}`, so the sign is pinned by the Fourier checks of 2.2 rather than by this one.
- `E^t` is analytically gauge-trivial on `A¹` but not algebraically isomorphic to `O_{A¹}`: `H⁰_dR(A¹, O) = ℂ` while `H⁰_dR(A¹, E^t) = 0`.

### 2.2 Fourier–Laplace transformation

**Construction.** With input coordinate `τ` and output coordinate `t`, define `FT_τ M = p_{t,+}(p_τ^+ M ⊗ E^{tτ})`, with the unshifted connection pullback `p_τ^+`. On the Weyl algebra, `t` acts as `−∂_τ` and `∂_t` as `τ`. Prove that `FT` is an exact autoequivalence of holonomic modules on `A¹`, an equivalence on bounded holonomic complexes, and that `FT_t FT_τ ≅ r_+` for `r(τ) = −τ`; construct its inverse and the identifications `FT(δ_a) = E^{at}` and `FT(O) = δ_0`. The definition and the exactness on holonomic modules are FSY, Appendix A.1, p. 61, FSY lines 2773–2779; the Weyl-algebra correspondence is MT, Appendix, p. 39, MT lines 2104–2107, written there for the kernel `E^{−tτ}`, so that both of its signs are opposite to the ones here; the inversion `FT_t FT_τ ≅ r_+` and the two cyclic identifications are computed in this target from the transported actions. *Proof route:* the Weyl-algebra automorphism `τ ↦ ∂_t`, `∂_τ ↦ −t` from the PBW presentation; comparison with the relative de Rham two-term kernel, including the relative-dimension shift of `p_{t,+}`; cyclic presentations of `O` and `δ_a`. *Needs:* 2.1; FormalConnectionsOpers §F2.2; SpringerResolutionAndCharacteristicCycles §§9.1, 9.4.

API:

- The transported actions are `t = −∂_τ` and `∂_t = τ`.
- `FT` is exact on holonomic modules.
- `FT_t ∘ FT_τ ≅ r_+` and `FT⁻¹ ≅ r_+ ∘ FT`.
- The Weyl realization is naturally isomorphic to `p_{t,+}(p_τ^+ M ⊗ E^{tτ})`.

**Checks.**

- `FT_τ(δ_a) = E^{at}`, including `δ_0 ↦ O`.
- `FT_τ(O_{A¹}) = δ_0`; neither object is sent to zero.
- `FT_t FT_τ(δ_a) = δ_{−a}`, so a nonzero `a` detects a missing sign; after transport, `[∂_t, t] = [τ, −∂_τ] = 1`.

### 2.3 Additive convolution

**Construction.** For holonomic complexes on `A¹`, let `M ⋆ N = s_+(M ⊠ N)` with `s(x, y) = x + y`. Construct the associative and symmetric derived convolution with unit `δ_0`, and prove `FT(M ⋆ N) ≅ FT(M) ⊗^L_O FT(N)` with the unshifted connection tensor product. For regular holonomic modules the cohomology of `M ⋆ N` outside degree zero is constant and lies in negative degrees (KS, §4.2, pp. 27–31; FSY, Appendix A.1, p. 61, and (A.5) with Remark A.6, pp. 63–64). The lift to mixed Hodge modules is 5.1. *Needs:* 2.2; 1.3; SpringerResolutionAndCharacteristicCycles §9.1.

API:

- `(M ⋆ N) ⋆ P ≅ M ⋆ (N ⋆ P)`, coherently with the symmetry and the unit `δ_0`.
- `FT` intertwines convolution with the connection tensor product.
- `δ_a ⋆ M` is the translate of `M` by `a`.
- For regular holonomic modules every cohomology module of `M ⋆ N` outside degree zero is constant.

**Checks.**

- `δ_a ⋆ δ_b = δ_{a+b}`.
- `M ⋆ 0 = 0 ⋆ M = 0`.
- `O ⋆ O` has a nonzero constant cohomology module in negative degree (its Fourier transform is `δ_0 ⊗^L δ_0`, which has a `Tor₁`), so convolution is not exact on the whole regular holonomic heart.

### 2.4 Localized Fourier transformation

**Construction.** For `j_0 : G_m → A¹`, define `ℱ = j_0^+ ∘ FT ∘ j_{0,+}` on holonomic `G_m`-modules and on complexes. If the input is regular holonomic, including at infinity, then `ℱ(M)` is a connection on `G_m`, regular singular at the output origin, with formal slopes in `{0, 1}` at output infinity. Prove compatibility with restriction of `FT`, keeping `j_{0,+}`, `j_{0,!}` and `j_{0,!*}` distinct (FSY, §2.1, Proposition 2.4 and its proof, pp. 10–11; Appendix A.1, p. 61). *Proof route:* by formal stationary phase, an input singular point `c ≠ 0` contributes `E^{ct}` times a regular factor, of slope one, at output infinity; the input point `0` contributes the slope-zero part at output infinity; the regular input infinity contributes only at output zero, where the output is regular singular. *Needs:* 2.2; PadicDifferentialEquationsAndRigidCohomology §RD.6.52a; SpringerResolutionAndCharacteristicCycles §§9.6–9.7.

API:

- `ℱ(M) = j_0^+ FT(j_{0,+} M)`, with a natural identification on morphisms.
- `ℱ` is exact on holonomic modules.
- A regular holonomic input gives an output connection regular at `0` with slopes in `{0, 1}` at `∞`.
- The kernels and cokernels of the comparison maps `j_{0,!} M → j_{0,!*} M → j_{0,+} M` are supported at the input origin. After `FT` they are constant connections, which generally survive restriction to the output torus; these comparisons do not identify the three localized transforms.

**Checks.**

- For `a ≠ 0`, `ℱ(δ_a) = E^{at}|_{G_m}`, with slope one at infinity.
- `ℱ(0) = 0`.
- For `M = O_{G_m}`, `0 → O_{A¹} → O_{A¹}(*0) → δ_0 → 0` gives `j_0^+ FT(j_{0,+} M) = O_{G_m}`, of rank one, whereas `j_{0,!*} M = O_{A¹}` gives `j_0^+ FT(j_{0,!*} M) = 0`, of rank zero. The constant Fourier correction survives output restriction.
- The rank-one input `E^{1/τ²}` on `G_m` has a pole of order two at `τ = 0`; it is not regular and the slope bound is not asserted for it.

### 2.5 Fourier duality and the sign involution

**Theorem.** For holonomic `M` on `A¹`, `𝔻 FT(M) ≅ r_+ FT(𝔻M)` with `r(t) = −t`, compatibly with biduality and with the natural maps `j_! → j_+` and intermediate images; Fourier transformation with the kernel `E^{−tτ}` is the dual kernel (FSY, proof of Theorem A.24(1), p. 69). *Proof route:* dualize the relative exponential kernel using `𝔻E^{tτ} = E^{−tτ}`; change the output coordinate by `r` and apply transfer duality; check biduality signs on Weyl presentations. *Needs:* 2.1, 2.2, 2.3; SpringerResolutionAndCharacteristicCycles §9.1.

**Checks.**

- On `δ_a`: `𝔻(E^{at}) = E^{−at} = r_+ E^{at}`, while `FT(𝔻δ_a) = E^{at}`; a comparison without `r` fails for `a ≠ 0`.
- On `O`: both sides are `δ_0`, and `r_+ δ_0 = δ_0`.
- Applying the duality twice returns the original identification.

### Examples

For `M = D_{A¹}/D_{A¹}(τ∂_τ − α)` with `α ∉ ℤ`, the transport `τ ↦ ∂_t`, `∂_τ ↦ −t` sends `τ∂_τ − α` to `−(t∂_t + 1 + α)`, so `FT(M) = D_{A¹}/D_{A¹}(t∂_t + 1 + α)`, a Kummer module with exponent `−1 − α`; it is regular at `0` and at `∞`, consistent with 2.4 for an input whose only finite singular point is `0`.

### Dependencies

2.1 needs ComplexComparisonPartII §C5.1, SpringerResolutionAndCharacteristicCycles §9.1 and Mathlib's polynomial derivative; 2.2 needs 2.1, FormalConnectionsOpers §F2.2 and SpringerResolutionAndCharacteristicCycles §§9.1, 9.4; 2.3 needs 2.2 and 1.3; 2.4 needs 2.2 and PadicDifferentialEquationsAndRigidCohomology §RD.6.52a; 2.5 needs 2.1–2.3.

## Layer 3: Variations of mixed Hodge structure on punctured curves

Saito's inductive definition and his projective direct-image theorem rest on the Hodge theory of one-parameter degenerations. Pure variations, their rational polarizations and the nilpotent-orbit and Hodge-norm theory of unipotent degenerations are imported from ShimuraData §§3.1–3.3 and ShimuraVarieties §§3.5b.1–3.5b.2. This layer adds graded-polarizable variations of mixed Hodge structure, the limit on the full nearby space of a quasi-unipotent variation (all eigenvalues of monodromy, read on the canonical logarithmic extension), admissibility (on a punctured disc, and on a higher-dimensional base at the boundary of a compactification), and the `L²` cohomology of a polarized variation on a punctured curve. Analytic local systems, the canonical logarithmic extension and the residue–monodromy convention are ComplexComparisonPartII §C5.6.

### 3.1 Graded-polarizable variations of mixed Hodge structure

**Definition.** A variation of mixed Hodge structure on a complex manifold `S` is a local system `L` of finite-dimensional `ℚ`-vector spaces with a finite increasing filtration `W` by sub-local systems and a finite decreasing filtration `F` of `L ⊗ O_S` by holomorphic subbundles satisfying Griffiths transversality `∇F^p ⊂ Ω¹ ⊗ F^{p−1}`, such that for every `k` the induced `(gr^W_k L, F)` is a pure rational variation of weight `k` in the sense of ShimuraData §3.1 (`Variation`). Then each fibre is a rational mixed Hodge structure in the sense of `TauCeti.Hodge.MixedHodgeStructure`, with the rational space as integral group and the identity as rational model. The variation is graded-polarizable when each `gr^W_k L` admits a rational polarization in the sense of ShimuraData §3.3 (`RationalPolarizedVariation`). Morphisms are morphisms of local systems preserving `W` and `F`. This differs from ShimuraData §3.1 by the weight filtration: a pure variation is the case of a single nonzero graded piece (SZ, §§1–3; Kash86, §1.6, printed p. 993, Kash86 lines 78–85; §1.4 for the fibres). *Needs:* ShimuraData §§3.1–3.3; ComplexComparisonPartII §C6.1 (gap:rational-complex-local-system-dictionary); `TauCeti.Hodge.MixedHodgeStructure`, `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F`, `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ`.

API:

- The fibre at `s ∈ S` of a variation is a mixed Hodge structure, functorially; morphisms of variations are strict for `W` and `F` fibrewise, by `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F` and `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ`.
- Graded-polarizable variations form an abelian category whose kernels, images and cokernels are computed on local systems, with the induced `W` and `F`.
- Tensor products, duals and Tate twists `L(m)` of graded-polarizable variations are graded-polarizable; `L(m)` lowers weights by `2m`.
- On a point a variation is a graded-polarizable rational mixed Hodge structure; a variation with one nonzero `gr^W_k` is a pure variation of ShimuraData §3.1.

**Checks.**

- The constant variation `ℚ_S` with `F⁰ = O_S`, `F¹ = 0` is pure of weight `0` and polarized by `Q(a, b) = ab`.
- On a point, the rank-one rational and complex local systems have stalks `ℚ` and `ℂ`, each of vector-space dimension one but infinite cardinality. They satisfy gap:rational-complex-local-system-dictionary and cannot be imported from a finite-ring, finite-stalk equivalence.
- `ℚ(1)` on a point has weight `−2` and `F^{−1} = ℂ`, `F⁰ = 0`, matching `TauCeti.Hodge.tate 1`; the form `Q(a, b) = ab` polarizes it, since the sign condition for type `(−1, −1)` is `i⁰ Q(v, v̄) > 0`.
- On `S = Δ^*`, the Kummer variation is the extension of `ℚ(0)` by `ℚ(1)` whose extension class at `t` is the class of `log t` in `ℂ/2πiℚ`; its weight filtration `W_{−2} = ℚ(1) ⊂ W_0 = L` is flat, its graded pieces are pure, and its monodromy is a nontrivial unipotent. A family of lines that is not flat, such as `ℂ(1, t)` inside the constant `ℂ²`, cannot be the weight filtration of a variation, although it is a holomorphic subbundle.

### 3.2 The limit mixed Hodge structure on the full nearby space

**Theorem.** Let `L` be a rationally polarized variation of pure Hodge structure of weight `w` on the punctured disc `Δ^*`, with quasi-unipotent monodromy `T = T_s T_u` and `N = (2πi)⁻¹ log T_u`. Let `Ē` be the canonical logarithmic extension of `L ⊗ O` with residue eigenvalues in `[0, 1)` (ComplexComparisonPartII §C5.6, `CanonicalLogExtension`) and `Ψ = Ē(0)` its fibre, identified with the space of multivalued flat sections and decomposed into generalized eigenspaces `Ψ_λ` of `T_s`. Then the Hodge bundles `F^p` extend to subbundles of `Ē`, defining a limit Hodge filtration `F_lim` on `Ψ`; and for every eigenvalue `λ`, `(Ψ_λ, F_lim, M(N, w))` is a mixed Hodge structure, on which `N` is a morphism `Ψ_λ → Ψ_λ(−1)`, and for `k ≥ 0` the primitive part `P_k = ker(N^{k+1})` of `gr^M_{w+k}` is polarized by `Q(·, (−N)^k ·)`, with values in the Tate twist `ℚ(−k)` read through `(2πi)^k`, that is by the rational form `Q(·, (−log T_u)^k ·)`; for unipotent `T` this is `Q(·, N_j^k ·)` for the operator `N_j = log T_j = −2πi·N` of ShimuraVarieties §3.5b.1, whose `T_j` is `T⁻¹`. For `λ = 1` the rational structure is that of `Ψ_1`; for `λ ≠ 1` the structure is defined on the sum of the Galois-conjugate eigenspaces, which is rational. This differs from ShimuraVarieties §3.5b.1 in that it does not pass to the power cover: it keeps the eigenvalues `λ ≠ 1` and reads the limit on the canonical extension of the original disc (Schmid, Theorem 6.16 and §6; SZ, §2, the limit for quasi-unipotent monodromy). *Proof route:* pass to the cover `t = u^e` on which the monodromy `T^e` is unipotent, and apply ShimuraVarieties §3.5b.1 to the pullback, whose operator is `N_j = log T^{−e} = −2πi e·N`, a positive multiple of `−2πi·N`, which fixes the sign of the primitive polarizations; the canonical extension of the pullback is the pullback of `Ē` twisted by the eigenvalue exponents, and the deck group `μ_e` acts on the limit by `T_s`, preserving `F_lim` and the monodromy filtration; its eigenspaces give the `Ψ_λ`, and the rational structure descends because `T_s` is defined over `ℚ`. *Needs:* 3.1; ShimuraVarieties §§3.5b.1–3.5b.2; ShimuraData §3.3; ComplexComparisonPartII §C5.6; LefschetzPencilsAndVanishingCycles §§1.3, 1.4.

**Checks.**

- For a constant variation, `N = 0`, `F_lim` is the constant filtration and the limit is the fibre itself, pure of weight `w`.
- For the Legendre family `y² = x(x − 1)(x − t)` near `t = 0`, `H¹` has unipotent monodromy with `N ≠ 0` and `N² = 0`; the limit has weights `0` and `2`, each of dimension one, so it is mixed and not pure.
- The sign of the primitive polarization. For the Tate family `ℂ/(ℤ + ℤτ)` over the punctured disc in `q = e^{2πiτ}`, with cycles `a = 1` and `b = τ`, transport along the positive loop `τ ↦ τ + 1` fixes `a` and sends `b` to `a + b`. On the dual basis `α, β` of `H¹` this gives `Tα = α − β` and `Tβ = β`, so `(log T)α = −β`. The polarization has `Q(α, β) = 1`, since the holomorphic class `α + τβ` has `i·Q(α + τβ, α + τ̄β) = 2 Im τ > 0`. The Hodge line `ℂ(α + τβ)` has limit `F¹_lim = ℂα`, and the class of `α` spans the primitive part `gr^M_2`, of type `(1, 1)`. Then `Q(α, (−log T)α) = Q(α, β) = 1 > 0`, as the theorem requires, whereas `Q(α, (log T)α) = −1`: the form `Q(·, N^k ·)` has the wrong sign for odd `k`. In the convention of ShimuraVarieties §3.5b.1, `T_j = T⁻¹` sends `α` to `α + β` and `Q(α, N_j α) = +1`. The Legendre Check, with `N² = 0`, does not see this sign.
- For a rank-one variation with monodromy `−1`, `T_u = 1`, `N = 0`, and the whole limit lies in `Ψ_{−1}`; a construction restricted to `Ψ_1`, or one that keeps only the unipotent part after the power cover without the `μ_e` action, gives the wrong space (zero, respectively a space with the wrong rational structure).

### 3.3 Admissible variations of mixed Hodge structure

**Definition.** A graded-polarizable variation `L` on `Δ^*` with quasi-unipotent monodromy is admissible when (a) the Hodge bundles extend to subbundles of the canonical extension `Ē` whose restriction to each `gr^W_k` is the limit filtration of 3.2, and (b) the relative monodromy filtration of `N` with respect to the induced filtration `W` on `Ψ` exists (LefschetzPencilsAndVanishingCycles §1.5). On a higher-dimensional base, admissibility is tested at a boundary. Let `S̄` be a complex analytic space and `S ⊂ S̄` a smooth dense open subset whose complement is a closed analytic subset. A graded-polarizable variation `L` on `S` is admissible relative to `S̄` when, for every holomorphic map `φ : Δ → S̄` with `φ(Δ^*) ⊂ S`, the pullback of `L` to `Δ^*` is admissible (Kash86, §0.2, p. 991, Kash86 lines 24–26, and §1.9, p. 994, Kash86 lines 103–107; Sai90, Theorem 3.27, p. 312, Sai90 lines 3080–3086). A map with `φ(0) ∈ S` tests nothing, since the pullback then extends across the centre with trivial monodromy; the content of the condition is at the points of `S̄ ∖ S`. For a smooth curve `C°` with smooth completion `C`, admissibility relative to `C` is admissibility at every point of `C ∖ C°`. For a smooth complex variety `S`, a variation on `S^an` is admissible when it is admissible relative to `S̄^an` for a compactification `S ⊂ S̄`, a proper complex variety containing `S` as a dense open subset: one exists by Nagata's theorem (EtaleCohomologyFoundations §§G.1–G.2 over `Spec ℂ`), and for quasi-projective `S` one may take `S̄` smooth projective with simple normal crossing boundary (ResolutionOfSingularitiesCharacteristicZero §6.2). The condition does not depend on the compactification. Two compactifications `S̄₁`, `S̄₂` are dominated by the closure `S̄₃` of `S` in `S̄₁ × S̄₂`, whose projections `p_i` are proper and isomorphisms over `S`. A test disc `φ` in `S̄_i` lifts to `S̄₃`: the closure in `Δ × S̄₃` of the graph of `φ|_{Δ^*}` is an analytic curve, proper over `Δ` and of degree one over `Δ^*`, hence the graph of a holomorphic map. Conversely, `p_i` sends test discs in `S̄₃` to test discs in `S̄_i` (Kash86, Proposition 1.10.1 and its proof, p. 995, Kash86 lines 135–146; Sai90, Remark after Theorem 3.27, p. 313, Sai90 lines 3127–3134). For admissible `L`, `(Ψ, F_lim, M)` with `M` the relative monodromy filtration is a mixed Hodge structure for which `N` is a morphism of type `(−1, −1)` (SZ, §3, the definition of admissibility and the limit theorem; Kash86, §1.8–1.9, Kash86 lines 91–109). *Needs:* 3.1, 3.2; LefschetzPencilsAndVanishingCycles §1.5; ComplexComparisonPartII §§C-1.1, C5.6 (`complexSchemeAnalytification`, `CanonicalLogExtension`); EtaleCohomologyFoundations §§G.1–G.2 (`nagataCompactification`); ResolutionOfSingularitiesCharacteristicZero §6.2.

API:

- An admissible variation has a limit mixed Hodge structure on `Ψ` with weight filtration the relative monodromy filtration and `N : Ψ → Ψ(−1)` a morphism.
- Admissibility is stable under subquotients, extensions in the category of admissible variations, tensor products, duals and Tate twists.
- A polarizable pure variation with quasi-unipotent monodromy is admissible (3.2).
- Admissibility relative to `S̄` is local on `S̄`: `L` is admissible when every point of `S̄ ∖ S` has an open neighbourhood `B` in `S̄` with `L|_{B ∩ S}` admissible relative to `B`.
- On a smooth variety, admissibility is Zariski-local on `S` provided each piece keeps its boundary. For a Zariski-open cover `S = ⋃ U_i`, `L` is admissible exactly when every `L|_{U_i}` is admissible relative to a compactification of `U_i`, such as its closure in `S̄`. Indeed, for a test disc `φ` in `S̄` some `U_i` meets `φ(Δ^*)`, so `φ⁻¹(S̄ ∖ U_i)` is discrete in `Δ`, and after shrinking `Δ` the map `φ` is a test disc for `U_i`. It is not local for the analytic topology of `S`: on a small ball `B ⊂ S`, admissibility relative to `B` holds for every graded-polarizable variation, since every test disc has its centre in `B`.
- On `Δ^*`, admissibility is invariant under finite base change `t ↦ t^e`.

**Checks.**

- The Tate twist `ℚ(1)` on `Δ^*` is admissible with `N = 0` and limit `ℚ(1)`.
- The Kummer variation of 3.1 is admissible: `W_{−2} = ℚ(1)`, `N` maps `gr^W_0` onto `gr^W_{−2}`, and the relative monodromy filtration equals `W`.
- Failure of the relative monodromy filtration alone. Let `H = ℚa ⊕ ℚb` be the pure structure of weight `−1` with `F⁰H_ℂ = ℂ(a + ib)`, polarized by the alternating form with `Q(a, b) = 1`, since `i·Q(a + ib, a − ib) = 2 > 0`. Let `V = H ⊕ ℚe` with `W_{−1} = H` and `W_0 = V`, and on `Δ^*` let the monodromy be `T = 1 + J` with `J e = a` and `J H = 0`. With `z = log(t)/(2πi)` on the universal cover and flat coordinates in `V`, `F⁰(z) = span(a + ib, e − z a)`, `F^{−1} = V_ℂ` and `F¹ = 0` satisfy `F⁰(z + 1) = T⁻¹F⁰(z)`. This is the descent condition when positive-loop transport of flat sections is `T` (Conventions): flat coordinates of a single-valued section change by `T⁻¹` around the loop, so the lift `Φ̃(z + 1) = T_jΦ̃(z)` of ShimuraVarieties §3.5b.1 has `T_j = T⁻¹`. So they define a graded-polarizable variation whose graded pieces are the constant `H` and `ℚ(0)`; transversality holds since `d(e − z a)/dz = −a`. Condition (a) holds: in the frame of the canonical extension, where `T = exp(−2πi·Res)` and `Res = −(2πi)⁻¹J`, the Hodge bundle is `exp(zJ)F⁰(z) = span(a + ib, e)`, which is constant. But `N = (2πi)⁻¹J` induces zero on both `gr^W_k`. A relative monodromy filtration `M` would therefore induce on each `gr^W_k` the filtration concentrated in degree `k`, which forces `M_{−2} = 0`, `M_{−1} = H` and `M_0 = V`. Then `N M_0 ⊂ M_{−2}` fails, because `N e ≠ 0`. So (b) fails and the variation is not admissible, although it is graded-polarizable. The Kummer variation passes because its weights `−2` and `0` differ by two, so that `N W_0 ⊂ W_{−2}` and `M = W`.
- The boundary must be tested. On `S = A²` with coordinates `x, y`, take the constant local system `ℚe₀ ⊕ ℚe₁` with `W_{−2} = ℚe₁`, `W_0 = ℚ²`, `F⁰ = O·(e₀ + x e₁)`, `F^{−1} = O²` and `F¹ = 0`. Its fibre at `(x, y)` is the extension of `ℚ(0)` by `ℚ(1)` with class `x e₁` modulo `ℚe₁`, its graded pieces are constant and polarized, and `∇(e₀ + x e₁) = e₁ dx` lies in `F^{−1}`. Every disc with centre in `A²` passes the test. In `S̄ = P¹ × P¹`, along the disc `s ↦ (1/s, 0)`, the canonical extension is trivial and the saturated extension of `F⁰` is `O·(s e₀ + e₁)`, with fibre `ℂe₁` at `s = 0`. So the limit `F⁰` has dimensions `1` on `gr^W_{−2}` and `0` on `gr^W_0`, whereas the constant graded limits need `0` and `1`. Condition (a) fails and the variation is not admissible. A definition that tests only discs centred in `S` accepts it. The split variation `F⁰ = O·e₀` passes the same boundary test, with dimensions `0` and `1`.

### 3.4 Hodge theory of a polarized variation on a punctured curve

**Theorem.** Let `j : C° → C` be the complement of finitely many points in a compact Riemann surface and `L` a rationally polarized variation of pure Hodge structure of weight `m` on `C°` with quasi-unipotent local monodromies. Then `H^i(C, j_* L)` is finite dimensional and carries a functorial rationally polarizable pure Hodge structure of weight `m + i`, computed by the complex of `L²` forms for the Poincaré metric near the punctures and the Hodge metric of `L`; its Hodge decomposition is given by `L²` harmonic forms and the filtered `L²` de Rham complex degenerates at `E₁` (Zucker, Theorem 4.8, p. 434; §§5–6, pp. 434–444; Theorem 7.12, Corollary 7.13 and Proposition 8.2, pp. 446–448). The analytic content is part of the theorem: the weak and strong closed extensions of `d` agree on the weighted `L²` domains, the Laplacian is essentially self-adjoint with closed range, and harmonic representatives are finite dimensional (Zucker, §§7.1–7.12, pp. 444–447). *Proof route:* use the canonical extension, the limit of 3.2 and the Hodge-norm estimates of ShimuraVarieties §3.5b.2 (one variable) to compute the weighted `L²` stalk complex at a puncture and identify it with `j_* L` (local Poincaré lemma, Zucker Theorem 4.8); identify the filtered local Dolbeault complex using Zucker's local Hardy-type estimates (§§5–6); prove the self-adjointness and closed-range statements for these domains and apply the Hodge theorem; the integrated pairing gives the polarization. *Needs:* 3.1, 3.2; ShimuraVarieties §3.5b.2; 1.2; ComplexComparisonPartII §C5.6.

**Checks.**

- For the constant variation `ℚ` on `C° = P¹ ∖ {0, ∞}`, `H^i(P¹, j_* ℚ) = H^i(P¹, ℚ)`: `ℚ` in degree `0` and `ℚ(−1)` in degree `2`, not `H^i(C°, ℚ)`, which has `H¹ = ℚ(−1)`.
- For `L` of weight `m`, `H¹(C, j_* L)` has weight `m + 1`, not `m`: for the constant variation on a curve of genus `g ≥ 1`, `H¹(C, ℚ)` has weight `1`.
- On a connected `C` with a nonempty set of punctures, a rank-one variation with nontrivial finite monodromy at every puncture has `j_* L = j_! L`, since the local invariants vanish; its global monodromy is nontrivial, so `H⁰ = 0`, and `H² = 0` by duality with the dual variation, which has the same property: only `H¹` survives. With no punctures the condition is empty, and the constant variation `ℚ` on `C = P¹` has `H⁰ = ℚ` and `H² = ℚ(−1)`, so the nonemptiness of the puncture set cannot be dropped.

### Examples

For the rank-two variation `L = R¹π_*ℚ` of the Legendre family on `C° = P¹ ∖ {0, 1, ∞}`, the local monodromies are unipotent with one-dimensional invariants at `0` and `1`, and minus a unipotent with no invariants at `∞`. 3.2 gives the limits, on `Ψ_1` at `0` and `1` and on `Ψ_{−1}` at `∞`, and 3.3 says `L` is admissible. In 3.4, `χ(P¹, j_* L) = 2 χ(C°) + (1 + 1 + 0) = 0`, and `H⁰ = H² = 0` because `L` has no global invariants, so `H¹(P¹, j_* L) = 0`.

### Dependencies

3.1 needs ShimuraData §§3.1–3.3, ComplexComparisonPartII §C6.1 (gap:rational-complex-local-system-dictionary) and Tau Ceti's mixed Hodge structures; 3.2 needs 3.1, ShimuraVarieties §§3.5b.1–3.5b.2, ComplexComparisonPartII §C5.6 and LefschetzPencilsAndVanishingCycles §§1.3–1.4; 3.3 needs 3.1, 3.2, LefschetzPencilsAndVanishingCycles §1.5, ComplexComparisonPartII §§C-1.1, C5.6, EtaleCohomologyFoundations §§G.1–G.2 and ResolutionOfSingularitiesCharacteristicZero §6.2 (compactifications carrying the boundary tests); 3.4 needs 3.1, 3.2, ShimuraVarieties §3.5b.2, 1.2 and ComplexComparisonPartII §C5.6.

## Layer 4: Pure and mixed Hodge modules

This layer constructs compatible `F`, `V` and Rees modules, defines polarizable pure Hodge modules by strict support, recursive specialization and primitive polarizations, and builds graded-polarizable algebraic mixed Hodge modules by admissibility and relative monodromy. It proves strict-support extension and semisimplicity, the polarized projective direct-image theorem and abelianness with simultaneous strictness. The construction is in every dimension; at a point it recovers Tau Ceti's rational mixed Hodge structures.

### 4.1 Compatible filtrations and Rees modules

**Construction.** For a holonomic left `D_X`-module with a good increasing filtration `F` (SpringerResolutionAndCharacteristicCycles §8.3), form the Rees ring `R_F D_X = ⊕_p F_p D_X z^p` and the Rees module `R_F M = ⊕_p F_p M z^p`. A filtered morphism `u : (M, F) → (N, F)` is strict exactly when `coker(R_F u : R_F M → R_F N)` has no `z`-torsion; this is the cokernel in graded Rees modules, not the Rees module of the filtered cokernel. Several filtrations on one object are compatible when all the cubes of intersections and quotients they generate are exact. Side change is `F_p(M^r) = ω_X ⊗ F_{p+d} M`, and the filtered de Rham complex is `F_p(pDR M)^j = Ω_X^{j+d} ⊗ F_{p+j+d} M` for `−d ≤ j ≤ 0` (Sai88, Introduction, pp. 849–850; §1.1, pp. 861–865; §§2.1–2.2, pp. 876–886; ESY, §2.1, p. 18, ESY lines 944–960). `F` is exhaustive, locally bounded below and good; pairwise strictness of several filtrations does not replace compatibility. *Needs:* FormalConnectionsOpers §F2.2; SpringerResolutionAndCharacteristicCycles §§8.1–8.4.

API:

- `R_F M / (z − 1) = M` and `R_F M / z R_F M = gr_F M`.
- An exact underlying sequence of filtered modules is strictly exact if and only if its Rees sequence is exact.
- `F_p(M^r) = ω_X ⊗ F_{p+d}(M)`; side change does not change weights.
- Compatible `F`, `W`, `V` admit iterated associated graded objects with canonical interchange isomorphisms.

**Checks.**

- The constant `O_X` has right filtration with `F_{−d}(ω_X) = ω_X` and `F_{−d−1}(ω_X) = 0`; the opposite sign convention would start it at `F_d`.
- For the identity `u : ℂ → ℂ` with source filtration starting at `1` and target at `0`, `u(F_0) = 0` while `im(u) ∩ F_0 = ℂ`. The filtered cokernel and its Rees module are zero, but `coker(R_F u) = ℂ[z]/zℂ[z]`, whose nonzero class of `1` is killed by `z`. With both filtrations starting at `0`, both cokernels are zero and `u` is strict.
- For `i : pt → A¹`, `F_p(i_+ V) = Σ_{k≥0} F_{p−1−k} V · ∂^k`; the filtered unshifted de Rham `H¹` of `i_+ V` is `V` with its original `F`, and the direct image of `F_0 V` starts in `F_1`.

### 4.2 The rational Kashiwara–Malgrange filtration

**Construction.** Let `M` be a regular holonomic module on `X` with quasi-unipotent monodromy along the smooth hypersurface `x = 0`. Construct its unique increasing rational filtration `V_α M`, `α ∈ ℚ`, by coherent `V_0 D_X`-modules, exhaustive and discretely indexed, with `x V_α ⊂ V_{α−1}`, `∂_x V_α ⊂ V_{α+1}`, multiplication `x : V_α M → V_{α−1} M` bijective for every `α < 1`, and `x∂_x + α` nilpotent on `gr^V_α = V_α / V_{<α}` (ESY, Definition 2.2.2(1b)–(1c), p. 20, read at `z = 1`). The bijectivity of `x` below index `1` is part of the characterization: without it the constant filtration satisfies the other conditions (Checks). For a good `F`, the `F`-specializability conditions are: `x : F_p V_α → F_p V_{α−1}` is an isomorphism for `α < 1`, and `∂_x : F_p gr^V_α → F_{p+1} gr^V_{α+1}` is an isomorphism for `α > 0`. For a regular function `g`, define the cycles of `M` along `g` through the graph embedding, keeping its codimension-one filtration shift. Prove that the de Rham complexes of `gr^V_α` for `α ∈ [0, 1)` are the Betti nearby cycles of `DR M` on the eigenvalue-`exp(2πiα)` part, that of `gr^V_1` is the unipotent vanishing cycles, and that, with the comparison isomorphism on `gr^V_1` normalized so that `can` corresponds to `∂_x : gr^V_0 → gr^V_1`: the monodromy is `T = exp(−2πi x∂_x)` on `gr^V_α`, so `log T_u = −2πi(x∂_x + α)` and `N = (2πi)⁻¹ log T_u = −(x∂_x + α)`; and the normalized variation `var : pφ_{x,1} → pψ_{x,1}(−1)` of 1.4 corresponds to `−x : gr^V_1 → gr^V_0`. Consistently, `(−x)∂_x = −x∂_x = N` on `gr^V_0` and `∂_x(−x) = −(x∂_x + 1) = N_φ` on `gr^V_1`, while the topological variation corresponds to `−x ∘ (exp(2πiN_φ) − 1)/N_φ`, which is `−2πi x` exactly when `x ∘ N_φ = 0` on `gr^V_1`, in particular when `N_φ = 0` (the criterion of 1.4). These signs are forced by the residue convention `T = exp(−2πi·Res)` of ComplexComparisonPartII §C5.6 and are not read off Saito's right-module formulas (Sai88, (0.2) and (0.7), pp. 851–852, Sai88 lines 80–82 and 127; §§3.1–3.2, especially Lemma 3.1.2 (Sai88 line 1773) and §§3.2.1–3.2.6, pp. 902–908; §3.4, Proposition 3.4.12 and its proof, pp. 924–925; ESY, §§2.1 and 2.3, pp. 18–21; Kash76). This is the compatibility of 1.5 with nearby and vanishing cycles. *Proof route:* the Bernstein–Sato polynomial gives coherent lattices; shift its roots into a fundamental interval by `x` and `∂_x`; quasi-unipotence makes the exponents rational; uniqueness from generalized eigenspaces and the shift relations; translate Saito's right-module conventions by 4.1; read the signs of `T`, `N`, `can` and `var` on the Deligne lattice of a logarithmic connection, where `x∂_x` is the residue. *Needs:* 4.1; 1.4, 1.5; ComplexComparisonPartII §C5.6; SpringerResolutionAndCharacteristicCycles §§9.2, 9.7 and gap:holonomic-specializability.

API:

- The coherence, eigenvalue and shift conditions, including the bijectivity of `x : V_α → V_{α−1}` for `α < 1`, characterize `V`: two filtrations satisfying them coincide.
- The construction along `g` is independent of local coordinates after graph embedding.
- `DR(gr^V_α)` identifies with the corresponding Betti nearby or vanishing eigenspace of 1.4.
- `x` and `∂_x` are filtered isomorphisms in the stated ranges.
- On the unipotent pieces, `N = −(x∂_x + α)` on `gr^V_α`, `can = ∂_x` and `var = −x`, so that `var ∘ can = N` on `gr^V_0` and `can ∘ var = N_φ` on `gr^V_1`.

**Checks.**

- For `O(∗0)` on `A¹`, `x^k` has index `−k` and `x∂_x` acts on it by `k`; so `V_α = x^{−⌊α⌋} O` for nonintegral `α`, and the endpoint at integral `α` is fixed by nilpotence of `x∂_x + α`.
- For the Kummer module `x∂_x e = a e` with `a ∈ ℚ ∖ ℤ`, `x^k e` has index `−a − k`, so the jumps of `V` are nonintegral; the fundamental interval must contain every eigenvalue of monodromy, not only `1`.
- For `δ_0 = D/Dx`, the generator satisfies `x∂_x δ = −δ`, so `∂_x^k δ` lies in `gr^V_{k+1}`; hence `gr^V_α δ_0 = 0` for `α ∈ [0, 1)` and `gr^V_1 δ_0 = ℂδ`: a module supported at `x = 0` has zero nearby cycles and contributes only through vanishing cycles. For `O`, `1 ∈ gr^V_0` and `gr^V_1 O = 0`, so `ψ(O) = ℂ` and `φ_1(O) = 0`.
- Negative control for the characterization. On `O` along `x = 0`, the constant filtration `U_α O = O` for every `α` consists of coherent `V_0 D`-modules, is exhaustive, satisfies `x U_α ⊂ U_{α−1}` and `∂_x U_α ⊂ U_{α+1}`, and has every `gr^U_α = 0`, on which `x∂_x + α` is trivially nilpotent; it is excluded only because `x : U_0 = O → U_{−1} = O` is not onto, the constant `1` not lying in `xO`. The genuine filtration has `V_α O = O` for `α ≥ 0` and `V_α O = x^{⌈−α⌉} O` for `α < 0`, so `x : V_0 O = O → V_{−1} O = xO` is bijective and `gr^V_0 O = ℂ·1 ≠ 0`.
- For the logarithmic connection `d + A dx/x` on `O(∗0)e_0 ⊕ O(∗0)e_1` with `A e_1 = e_0` and `A e_0 = 0`, `gr^V_0` has basis `e_0, e_1` with `x∂_x = A`, so `T = exp(−2πiA) = 1 − 2πiA`, `log T_u = −2πiA` and `N e_1 = −e_0`. Here `can = ∂_x` sends `e_1` to `x⁻¹e_0` and `var = −x` sends that to `−e_0 = N e_1`; on `gr^V_1`, `∂_x(−x)(x⁻¹e_1) = −x⁻¹e_0 = −(x∂_x + 1)(x⁻¹e_1)`. Reading `x∂_x` as `N` gives `+e_0`, and reading `−2πi x∂_x` as `N` gives `−2πi e_0`; examples with zero nilpotent residue, such as `O`, `O(∗0)` and `δ_0`, detect neither. Here `x ∘ N_φ(x⁻¹e_1) = −e_0 ≠ 0`, and the topological variation sends `x⁻¹e_1` to `−2πi e_1 − 2π² e_0`, not to `−2πi e_1`.
- For `M = D/D(x∂_x)²`, the regular holonomic module of `j_! L[1]` with `L` of rank two and one unipotent Jordan block (1.5), let `m_1` be the generator and `m_0 = x∂_x m_1`. Then `x^k m_0, x^k m_1` lie in `gr^V_{−k}` and `∂_x^k m_0, ∂_x^k m_1` in `gr^V_k`, so `can = ∂_x : gr^V_0 → gr^V_1` is an isomorphism; `N_φ(∂_x m_1) = −(x∂_x + 1)∂_x m_1 = −∂_x m_0 ≠ 0`, and `var = −x` sends `∂_x m_1` to `−m_0` and `∂_x m_0` to `0`. So `x ∘ N_φ = 0` and the topological variation is `−2πi x` although `N_φ ≠ 0`; also `var ∘ can = N` on `m_1`, both sides giving `−m_0`.

### 4.3 Polarizable pure Hodge modules

**Definition.** Define the category `MH(X, w)^pol` of polarizable pure Hodge modules of weight `w` on a smooth `X`, inside triples `(M, F, K)` of a regular holonomic module with good filtration, a perverse sheaf `K ∈ Perv(X, ℚ)` and an isomorphism `pDR(M) ≅ K ⊗ ℂ` (1.5), by Saito's induction on the dimension of the support: an object is a finite direct sum of objects with strict support (no nonzero subobject or quotient supported on a smaller closed subset); on a point it is a rationally polarizable pure Hodge structure of weight `w` (3.1); it is strictly specializable along every local function `g`; for `g` not identically zero on the strict support, the monodromy filtration of `N` on `ψ_g` centred at `w − 1` and on the unipotent `φ_{g,1}` centred at `w` has graded pieces which are polarizable pure Hodge modules of the shifted weights on the smaller support, with the induced polarizations on primitive parts: on the `k`-th primitive part of `gr^M ψ_g` the form `ψ_g S ∘ (id ⊗ (−N)^k)`, and on that of `gr^M φ_{g,1}` the form `φ_{g,1} S ∘ (id ⊗ (−N_φ)^k)`, with `N = −(x∂_x + α)` and the Tate twists read through powers of `2πi` as in 3.2. Here `ψ_g S` is the pairing induced by `S` on nearby cycles, normalized so that, for a smooth variation on a punctured curve polarized by `Q` and `g` a local coordinate, it is `Q` extended to multivalued flat sections; and `φ_{g,1} S` is fixed by `φ_{g,1} S ∘ (can ⊗ id) = ψ_{g,1} S ∘ (id ⊗ (−var))`, `can` being surjective on a strict support on which `g` does not vanish identically. On a smooth variation on a punctured curve these are the forms of 3.2. Saito writes the conditions with `id ⊗ N^k` and his own normalization of `ψ_g S` (Sai88, (5.2.10.2)–(5.2.10.3)); that sign is fixed here by the curve case, not copied. A polarization is a nondegenerate rational pairing `S : K ⊗ K → D_X ℚ(−w)` compatible with the filtrations and satisfying these positivity conditions recursively (Sai88, 5.2.10). A function vanishing identically on a component is treated by the Kashiwara clause, not by a decrease of the support dimension. On a smooth `d`-dimensional strict support, the smooth objects are the polarizable variations of weight `w − d` (Sai88, Definition 5.1.6, pp. 955–956, Sai88 line 3352; Definition 5.2.10 and 5.2.11–5.2.14, pp. 967–970, Sai88 line 3740). *Needs:* 4.1, 4.2; 1.5; 3.1, 3.2; LefschetzPencilsAndVanishingCycles §§1.3, 1.4; SpringerResolutionAndCharacteristicCycles §9.2; `TauCeti.Hodge.HodgeStructureOn`.

API:

- The rational realization `MH(X, w)^pol → Perv(X, ℚ)` is faithful and exact.
- Smooth objects of weight `w` on a smooth `d`-fold are the polarizable variations of weight `w − d`.
- On a point, `MH(pt, w)^pol` is equivalent to rationally polarizable pure Hodge structures of weight `w` on `TauCeti.Hodge.HodgeStructureOn`.
- The primitive graded pieces of `ψ_g` and `φ_{g,1}` carry the shifted weights and are polarized by `ψ_g S ∘ (id ⊗ (−N)^k)` and `φ_{g,1} S ∘ (id ⊗ (−N_φ)^k)`.
- The category is independent of closed embeddings by Kashiwara's equivalence.

**Checks.**

- `pℚ_{A¹}` has weight `1`, not `0`; in general `pℚ_X` has weight `d` and `D(pℚ_X) = pℚ_X(d)`.
- On a point, `ℚ(m)` has weight `−2m` with the filtration of `TauCeti.Hodge.tate_F`.
- A rational pure Hodge structure that admits no rational polarization, for instance a weight-one structure on `ℚ⁴` whose complex torus is not an abelian variety, is excluded although its complex filtration is opposed to its conjugate; a triple `(M, F, K)` without the specialization conditions is not a pure Hodge module.
- The primitive forms, on a curve. Let `L` be a weight-one variation near a point `g = 0` of a curve whose limit data are those of the Tate family of 3.2: `Tα = α − β`, `Tβ = β`, `Q(α, β) = 1`, `F¹_lim = ℂα`; and let `M = j_!*(L[1])`, of weight `w = 2`. On `ψ_g`, centred at `1`, the class of `α` spans the primitive part of `gr^M_2` (`k = 1`), and `ψ_g S(α, −Nα)`, read through `2πi`, is `Q(α, β) = 1 > 0`; the form with `id ⊗ N` gives `−1`. On `φ_{g,1}`, one-dimensional and spanned by `can α` of weight `2` (`k = 0`), `φ_{g,1} S(can α, can α) = ψ_{g,1} S(α, −var(can α)) = ψ_{g,1} S(α, −Nα)`, again `+1`; the normalization `φ_{g,1} S ∘ (can ⊗ id) = ψ_{g,1} S ∘ (id ⊗ var)` would give `−1`.

### 4.4 Strict-support extension and semisimplicity

**Theorem.** Let `Z` be an irreducible closed subvariety of dimension `d` of a smooth `X`, `U ⊂ Z` a dense smooth open subset and `L` a polarizable variation of weight `w − d` on `U` with quasi-unipotent local monodromy at the boundary. Then `L` has a unique extension to a polarizable pure Hodge module of weight `w` with strict support `Z`; its perverse realization is the intermediate extension `j_!* L[d]`. Every polarizable pure Hodge module decomposes uniquely by strict supports, is semisimple, and its morphisms preserve the decomposition and are strict for `F` (Sai90, Theorem 3.21, p. 303, Sai90 line 2769, for the existence and uniqueness of the extension and the bijection of polarizations; Sai88, Lemmas 5.1.8–5.1.10, pp. 957–958, for the local criterion and the generic variation, (5.1.5.3), p. 955, and Proposition 5.1.14, p. 959, for the decomposition by strict supports and the strictness of morphisms, Lemma 5.2.12 and Corollary 5.2.13, pp. 968–969, for the polarization of the generic variation and semisimplicity, and Proposition 5.2.14, pp. 969–970, for the inductive polarizability criterion). The direct-sum assertion is for pure polarizable objects only. *Proof route:* construct the filtered extension locally from the canonical extension and the limits of 3.2–3.3 and the `V`-lattices of 4.2, verifying the recursive conditions by induction on the support; uniqueness from the absence of boundary subquotients; semisimplicity by splitting a subobject with its orthogonal complement for the polarization. *Needs:* 4.3; 1.3; 3.2, 3.3; ComplexComparisonPartII §C5.6 (`CanonicalLogExtension`); SpringerResolutionAndCharacteristicCycles §9.6; ResolutionOfSingularitiesCharacteristicZero §5.2.

**Checks.**

- For `j : G_m → A¹` and `L = ℚ`, the extension is `pℚ_{A¹}`, not `j_* pℚ_{G_m}`, which has the extra quotient `δ_0 ℚ(−1)`: the middle extension differs from `j_*` when the local monodromy has invariants.
- For the Kummer variation of 3.3 the strict-support theorem does not apply: it is mixed, and an extension of mixed objects need not split.
- For `L` of rank one with monodromy `−1` around `0`, `j_!* L[1] = j_! L[1] = j_* L[1]`.

### 4.5 Polarized projective direct images

**Theorem.** Let `f : X → Y` be a projective morphism of smooth complex varieties and `M` a polarizable pure Hodge module of weight `w` on `X`. The filtered direct image `f_+(M, F)` is strict, each `H^j f_* M` is a polarizable pure Hodge module of weight `w + j`, and a relatively ample class `ℓ` gives isomorphisms `ℓ^k : H^{−k} f_* M ≅ H^k f_* M(k)` for `k ≥ 0` whose primitive parts carry the induced polarizations. In particular the Hodge-to-de Rham spectral sequence of a projective direct image degenerates at `E₁` (Sai88, Theorem 5.3.1, p. 977, Sai88 lines 4017–4026; proof in §§5.3.3–5.3.11, pp. 978–988). The operations here are bare filtered transfers; the theorem is an input to 5.1. *Proof route:* induction on the dimension of the strict support; for a strict support of positive dimension, choose a Lefschetz pencil and apply 3.4 to the variation on the punctured pencil base; compare the nearby terms of the pencil via specialization and primitive polarizations to prove relative hard Lefschetz; deduce `z`-torsion freeness of the direct-image cohomology from the polarized primitive decomposition and strict specialization. *Needs:* 4.1–4.4; 3.2, 3.4; SpringerResolutionAndCharacteristicCycles §9.1; LefschetzPencilsAndVanishingCycles §§1.4, 3.4.

**Checks.**

- For `f : P¹ → pt` and `pℚ_{P¹}`, the nonzero direct images are in degrees `j = −1, 1`, the objects `ℚ` and `ℚ(−1)` of weights `0` and `2 = 1 ± 1`.
- For the blow-up of `A²` at the origin, `H⁰ f_* pℚ` is `pℚ_{A²} ⊕ δ_0 ℚ(−1)`, both of weight `2`, a nontrivial decomposition.
- The projectivity hypothesis cannot be dropped for the purity statement: for the open immersion `G_m → A¹`, `H⁰ j_* pℚ_{G_m}` has weights `1` and `2`.

### 4.6 Admissible graded-polarizable mixed Hodge modules

**Definition.** Define the category `MHM(X)` of algebraic mixed Hodge modules on a smooth quasi-projective `X` by Saito's admissible gluing: objects are rationally realized good filtered regular holonomic modules with a finite increasing weight filtration `W` such that each `gr^W_w` is in `MH(X, w)^pol`, the filtrations `F`, `W` and `V` are compatible under every local graph specialization, the relative monodromy filtration exists on nearby cycles (LefschetzPencilsAndVanishingCycles §1.5), and the objects glue admissibly across every local hypersurface; on a dense smooth open subset of each support the object is an admissible variation (3.3), and the extendability condition at a good compactification holds (Sai90, Theorem 0.2 and Proposition 0.3, Sai90 lines 94–104; §2.17, pp. 256–258; Remark 3.29, p. 313; §4.1, p. 314). Morphisms preserve the whole structure. A singular closed support is handled by objects on a smooth ambient variety supported on it. A finite `W` with pure graded pieces is not enough: admissibility and relative monodromy are required. *Needs:* 4.1–4.4; 1.4; 3.3; LefschetzPencilsAndVanishingCycles §§1.3, 1.5; ResolutionOfSingularitiesCharacteristicZero §§5.2, 6.2.

API:

- `gr^W_w M` is a polarizable pure Hodge module of weight `w`.
- Admissibility is characterized by the local `F`, `W`, `V` compatibility and the relative-monodromy and gluing conditions.
- For a closed embedding `i : Z → X` of smooth varieties, `i_*` identifies `MHM(Z)` with the objects of `MHM(X)` supported on `Z`.
- `MHM(pt)` is equivalent to finite-dimensional graded-polarizable rational mixed Hodge structures, realized on `TauCeti.Hodge.MixedHodgeStructure` with the rational space as integral group and the identity as rational model.

**Checks.**

- At a point, `ℚ(−1)` has only `gr^W_2` nonzero and `F¹ = ℂ`.
- A nonsplit extension of `ℚ(0)` by `ℚ(1)` (weights `0` and `−2`) exists in `MHM(pt)`: `Ext¹(ℚ(0), ℚ(1)) = ℂ/2πiℚ ≠ 0`.
- The rank-three variation of the Checks of 3.3, with weights `−1` and `0` and `N e ≠ 0` in `W_{−1}`, is defined by the same formula on all of `G_m`. As a smooth object it is excluded from `MHM(G_m)`, although its graded pieces are polarized and its Hodge bundles extend to the canonical extension at `0`: it has no relative monodromy filtration there. Its graded ranks `2` and `1` are realizable, whereas a weight-one graded piece of rank one is not, since a rational Hodge structure of odd weight has even dimension.

### 4.7 Abelianness and simultaneous strictness

**Theorem.** `MHM(X)` is abelian, its rational realization `MHM(X) → Perv(X, ℚ)` is exact and faithful, and every morphism is strictly compatible with `F`, with `W` and with the intersections `W_n ∩ F_p`; kernels, images and cokernels carry the induced admissible structures. At a point the equivalence of 4.6 identifies `F`, `W` and strict morphisms with Tau Ceti's, and simultaneous strictness for `W_k ∩ F^p` is `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_iSup_deligneSplittingFamily_eq_map_iSup` for the bidegree set `{(r, s) : p ≤ r, r + s ≤ k}` (Sai90, Introduction 0.1–0.2, pp. 221–223, Sai90 lines 66–71; §§2.2–2.4, pp. 237–240; §4.1, pp. 314–316). Simultaneous strictness is deduced from compatibility of the filtrations, not from separate strictness. *Proof route:* construct kernels and cokernels through the local admissible gluing presentation, using semisimplicity of `gr^W` (4.4); apply compatibility of `F`, `W`, `V` to the exact gluing diagrams. *Needs:* 4.1, 4.4, 4.6; `TauCeti.Hodge.MixedHodgeStructure`, `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F`, `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ`, `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_iSup_deligneSplittingFamily_eq_map_iSup`.

**Checks.**

- The morphism `δ_0 ℚ → j_! pℚ_{G_m}` on `A¹` is injective with cokernel `pℚ_{A¹}`; it does not split, yet its image is strict for `W`: `W_0` of the target is exactly the image.
- At a point, the inclusion `ℚ(1) → E` of the weight `−2` part of a nonsplit extension `E` of `ℚ(0)` by `ℚ(1)` is strict for `W ∩ F`: `W_{−2} ∩ F^{−1}` of `E` is the image of `ℚ(1)`.
- The point comparison retains the rational structure: `Hom(ℚ(0), ℚ(0)) = ℚ` in `MHM(pt)`, whereas the endomorphisms of the underlying filtered complex line form `ℂ`; and `ℚ(0)`, `ℚ(1)` are not isomorphic, though both are one-dimensional.

### Examples

On `A¹` with coordinate `x`, the objects `pℚ_{A¹}` (weight `1`), `δ_0 ℚ` (weight `0`), `j_! pℚ_{G_m}` (weights `0`, `1`) and `j_* pℚ_{G_m}` (weights `1`, `2`) are mixed Hodge modules, with exact sequences `0 → δ_0ℚ → j_! pℚ_{G_m} → pℚ_{A¹} → 0` and `0 → pℚ_{A¹} → j_* pℚ_{G_m} → δ_0 ℚ(−1) → 0`. Their `V`-filtrations along `x = 0` are computed by 4.2 from `O(∗0) = j_+ O_{G_m}`.

### Dependencies

4.1 needs FormalConnectionsOpers §F2.2 and SpringerResolutionAndCharacteristicCycles §§8.1–8.4; 4.2 needs 4.1, 1.4, 1.5, ComplexComparisonPartII §C5.6 (the residue convention fixing the signs of `N`, `can` and `var`) and SpringerResolutionAndCharacteristicCycles §§9.1–9.7; 4.3 needs 4.1, 4.2, 1.5, 3.1, 3.2 and LefschetzPencilsAndVanishingCycles §§1.3–1.4; 4.4 needs 4.3, 1.3, 3.2, 3.3 and ComplexComparisonPartII §C5.6; 4.5 needs 4.1–4.4, 3.2, 3.4 and LefschetzPencilsAndVanishingCycles §§1.4, 3.4; 4.6 needs 4.1–4.4, 1.4, 3.3 and LefschetzPencilsAndVanishingCycles §1.5; 4.7 needs 4.1, 4.4, 4.6 and Tau Ceti's mixed Hodge structures.

## Layer 5: Hodge-module operations, weights and specialization

This layer lifts `f_*`, `f_!`, `f^*`, `f^!`, external products, duality and Tate twists to bounded derived categories of mixed Hodge modules, proves the weight bounds, constructs normalized nearby and vanishing cycles, and proves the curve costalk formula, constant-divisor localization and rigidity of Hodge modules whose local system is constant. Normalizations: `D(pℚ_U) = pℚ_U(dim U)` and `i^* pℚ_U = pℚ_D[1]`.

### 5.1 Derived Hodge-module operations

**Construction.** On `D^b MHM(X)` for smooth quasi-projective varieties and supported categories, construct `f_*`, `f_!`, `f^*`, `f^!`, the duality `D`, external product `⊠`, the Hodge tensor product `M ⊗^H N = Δ^*(M ⊠ N)` and Tate twists, with adjunctions, composition, proper base change, the projection formula and the open–closed localization triangles. The rational realization commutes with the Betti operations of 1.2, and the filtered de Rham realization with the normalized `D`-module transfer. `⊗^H` is not the unshifted `O`-module tensor product of left `D`-modules. On a smooth `d`-fold `D(pℚ_X) = pℚ_X(d)`, and `(m)` lowers weights by `2m` and shifts `F^p` to `F^{p+m}` (Sai90, §§4.2–4.5, pp. 315–325; Introduction 0.1–0.3, pp. 222–224; FSY, Appendix A.2, pp. 61–63, whose dual Tate twist is corrected to `(d)`). *Proof route:* external products and projective direct images first, by 4.5 and weight dévissage; open extensions and inverse images by admissible gluing; factor an algebraic map as an immersion followed by a projective projection and prove independence by base change; dual operations by `D`; the tensor product from the diagonal. *Needs:* 4.5, 4.6, 4.7; 1.2; SpringerResolutionAndCharacteristicCycles §9.1 and gap:regular-holonomic-stability; `TauCeti.Hodge.tate`, `TauCeti.Hodge.HodgeStructureOn.tateTwist`.

API:

- Every operation commutes with rational realization.
- `j_! j^* M → M → i_* i^* M` and `i_* i^! M → M → j_* j^* M` are distinguished.
- `D² ≅ id`, `D f_* ≅ f_! D`, and `D(pℚ_X) = pℚ_X(d)`.
- At a point the twist is `TauCeti.Hodge.HodgeStructureOn.tateTwist` on graded pieces, with the stated weight and filtration shifts.

**Checks.**

- For `id_pt` all operations are the identity or the linear-algebra operations on rational mixed Hodge structures.
- `D(pℚ_{A¹}) = pℚ_{A¹}(1)`, of weight `1 − 2 = −1`; the printed twist `(−1)` would give weight `3`.
- For `X` a smooth `d`-fold, `pℚ_X ⊗^H pℚ_X = Δ^*(ℚ_{X×X}[2d]) = pℚ_X[d]`; using `O_X ⊗ O_X` as the tensor loses the shift.

### 5.2 Weight bounds and duality

**Theorem.** Say `M ∈ D^b MHM(X)` has weights `≤ w` (resp. `≥ w`) when `H^j M` has weights `≤ w + j` (resp. `≥ w + j`) for all `j`. Then `f_!` and `f^*` preserve weights `≤ w`, `f_*` and `f^!` preserve weights `≥ w`, `D` sends weights `≤ w` to weights `≥ −w` and weights `≥ w` to weights `≤ −w`, and `(m)` sends weights `≤ w` (resp. `≥ w`) to weights `≤ w − 2m` (resp. `≥ w − 2m`). For a pure `M` of weight `w` and `f` projective, `H^j f_* M` is pure of weight `w + j` (Sai90, Introduction, p. 225, Sai90 lines 166–171; §4.5, (4.5.1)–(4.5.2), p. 324, Sai90 lines 3513–3519; FSY, Proposition A.19 and its proof, pp. 66–67). The duality bound negates the weight: a polarization of a pure `M` of weight `w` is an isomorphism `M ≅ D M(−w)`, so `D M` is pure of weight `−w` (Sai88, (0.9), p. 852, Sai88 lines 138–140), and the mixed statement is Sai90, Remark 4.6(1), (4.6.1), p. 328, Sai90 lines 3656–3662. The one-sided bounds assert nothing about purity for nonproper `f`. *Proof route:* admissible gluing and specialization bounds with 4.5; factor `f` through a compactification and bound open extensions; duality for the opposite bound. *Needs:* 5.1; 4.5, 4.7.

**Checks.**

- `H¹(G_m, ℚ) = ℚ(−1)` of weight `2` and `H¹_c(G_m, ℚ) = ℚ(0)` of weight `0`: for `pℚ_{G_m}` of weight `1`, `H⁰ a_*` has weight `2 ≥ 1` and `H⁰ a_!` has weight `0 ≤ 1`, so the two bounds differ.
- `H^{−1} a_* pℚ_{G_m} = H⁰(G_m, ℚ) = ℚ(0)` has weight `0 ≥ 1 − 1`.
- For `a : P¹ → pt`, `H^j a_* pℚ_{P¹}` is pure of weight `1 + j` (`ℚ` in degree `−1`, `ℚ(−1)` in degree `1`), as the projective case requires.
- Duality on Tate lines of a point: `ℚ(−1)` has weight `2`, hence weights `≤ 2`, and `D ℚ(−1) = ℚ(1)` has weight `−2`, so it has weights `≥ −2` and not weights `≥ 2`; starting from `ℚ(1)`, of weights `≥ −2`, the dual `ℚ(−1)` has weights `≤ 2`. A duality that kept the bound `w` fails both. On `A¹`, `pℚ_{A¹}` of weight `1` has dual `pℚ_{A¹}(1)` of weight `−1`, as in 5.1.
- Duality with a degree shift: `M = ℚ[−1]` on a point has `H¹ M = ℚ` of weight `0 ≤ −1 + 1`, so weights `≤ −1`; `D M = ℚ[1]` has `H^{−1} = ℚ` of weight `0 ≥ 1 − 1`, so weights `≥ 1`.

### 5.3 Hodge nearby and vanishing cycles

**Construction.** For a regular function `g` on `X`, lift `pψ_g` and `pφ_g` and their unipotent summands to exact functors on `MHM(X)`, with `can`, `var`, the rational comparison with 1.4, and `N : ψ_{g,1} M → ψ_{g,1} M(−1)`, normalized so that `var ∘ can = N` and `can ∘ var = N`. For mixed `M`, the weight filtration of `ψ_g M` is the relative monodromy filtration of `N` with respect to `L_k ψ = ψ(W_{k+1} M)`, and that of `φ_{g,1} M` is relative to `L_k φ = φ(W_k M)`; for pure `M` of weight `w` they are the monodromy filtrations centred at `w − 1` and `w`, with the primitive polarizations of 4.3 through `−N` and `−N_φ`. On a curve, the rank of `gr^p_F` of a generic fibre of the variation equals the dimension of `gr^p_F` of the full nearby-cycle space, all eigenvalues included (Sai90, §§2.2–2.4, pp. 237–240; §§2.9–2.11, pp. 245–247; FSY, Example A.2, pp. 62–63; Corollary A.31, p. 72). *Proof route:* the graph `V`-filtration of 4.2 and its compatible `F`, `W`, `V` quotients; relative monodromy by admissibility, unique by LefschetzPencilsAndVanishingCycles §1.5; the normalized polynomial in `log T`; with `T = exp(−2πi·Res)` (ComplexComparisonPartII §C5.6), `N = −Res` on a unipotent block, and on the graph `V`-filtration along the coordinate `t` this is `N = −(t∂_t + α)` on `gr^V_α`, with `can = ∂_t` and `var = −t` (4.2); the rank formula from the canonical extension and the full graded `V` fundamental interval. *Needs:* 4.2, 4.6, 5.1; 1.4; LefschetzPencilsAndVanishingCycles §§1.3, 1.5, 1.7; ComplexComparisonPartII §C5.6.

API:

- The rational realization of `ψ_g`, `φ_g` is the shifted Betti `pψ_g`, `pφ_g`.
- `var ∘ can = N` and `can ∘ var = N` with the indicated Tate targets.
- The weights are the relative monodromy filtrations for the shifted input filtrations `L`.
- On a curve all eigenvalue pieces together recover the generic Hodge ranks.

**Checks.**

- A smooth variation of weight `m` on a curve, a Hodge module of weight `m + 1`, has nearby cycles of weight `m` with `N = 0`; for `pℚ_{A¹}`, `ψ = ℚ` of weight `0` and `φ = 0`.
- For `i_{0*} V`, `ψ = 0` and `φ = V` with its original weight.
- A rank-one variation with monodromy `−1` has `ψ_1 = 0` but full nearby rank one; a rank formula using only `ψ_1` fails.

### 5.4 Pure curve costalk formula

**Theorem.** Let `M` be a polarizable pure Hodge module of weight `w` on a smooth curve and `i` the inclusion of a point. Write `M = M_1 ⊕ M_2` with `M_2` supported at the point and `M_1` with no summand supported there (4.4). Then `H⁰ i^! M_1 = 0`, `H¹ i^! M_2 = 0`, `H⁰ i^! M_2 = M_2`, `H¹ i^! M_1 = coker(N : ψ_1 M_1 → ψ_1 M_1(−1))`, and the other costalk cohomology vanishes. In particular, if `M` is smooth at the point, `H¹ i^! M = ψ M(−1)`, pure of weight `w + 1` (FSY, Example A.2, pp. 62–63; Corollary A.31 and its proof, p. 72). This is a costalk statement, not a stalk statement. *Proof route:* split by strict support and use the localization triangles; the boundary map is normalized `var` on the unipotent nearby part, and with no punctual quotient `can` is surjective, so the image of `var` is the image of `N = var ∘ can`; compute the two-term cone. *Needs:* 4.4; 5.1, 5.3.

**Checks.**

- For `pℚ_{A¹}`, `i^! pℚ = ℚ(−1)[−1]`, while the stalk `i^* pℚ = ℚ[1]`; exchanging the two gives the wrong degree and twist.
- For `M = δ_0 V`, `i^! M = V` in degree `0`.
- For `j_!* L[1]` with `L` of rank two and unipotent monodromy with one Jordan block, `ψ_1 = ℚ²` with `N` of rank one, and `H¹ i^!` has dimension one.

### 5.5 Constant-divisor localization

**Theorem.** Let `U` be smooth of dimension `d`, `D ⊂ U` a reduced divisor with inclusion `i` and complement `j`. The supported constant object `pℚ_D = ℚ_D[d − 1]` is a mixed Hodge module, `i^* pℚ_U = pℚ_D[1]`, and `0 → i_* pℚ_D → j_! j^* pℚ_U → pℚ_U → 0` is exact in `MHM(U)`. If `D` is smooth, then `i^! pℚ_U = pℚ_D(−1)[−1]` and `0 → pℚ_U → j_* j^* pℚ_U → i_* pℚ_D(−1) → 0` is exact. For singular reduced `D`, use the full triangle `i_* i^! → id → j_* j^*` instead of the smooth purity formula (FSY, Example A.3, p. 63, whose first inverse-image shift is corrected here; Sai90, §§4.4–4.5, pp. 321–325). *Proof route:* the perversity of `ℚ_D[d − 1]` from 1.3 for the local complete intersection `D`; Hodge localization with the shift of `i^*`; codimension-one purity for smooth `D`. *Needs:* 5.1, 5.2; 1.3.

**Checks.**

- On `A¹` with `D = {0}`, the first sequence is `0 → δ_0 ℚ → j_! pℚ_{G_m} → pℚ_{A¹} → 0`.
- For `D = {xy = 0}` in `A²`, the first sequence holds with `pℚ_D = ℚ_D[1]` perverse, but `i^! pℚ_{A²}` is not `pℚ_D(−1)[−1]`: its stalk at the origin is `H^{k+2}(B, B ∖ D; ℚ) = H^{k+1}(B ∖ D; ℚ)` for a small ball `B`, and `B ∖ D` retracts onto `(S¹)²`, so the stalk is `ℚ²` in degree `0` and `ℚ` in degree `1`, whereas `pℚ_D(−1)[−1] = ℚ_D(−1)` has stalk `ℚ` in degree `0` only; the smooth formula is therefore not used.
- With the erroneous shift `i^* pℚ_U = pℚ_D` the first sequence would not consist of objects in the heart.

### 5.6 Rigidity of Hodge modules with constant local system

**Theorem.** Let `X` be a smooth connected variety of dimension `d` and `M` a mixed Hodge module on `X` which is smooth, that is an admissible variation `L` shifted by `d` (3.3, admissibility tested at the boundary of a compactification of `X`), whose underlying local system is constant. Then `V = H^{−d} a_* M` is a graded-polarizable mixed Hodge structure, the restriction `V → L_x` to every fibre is an isomorphism of mixed Hodge structures, and the counit `a^* V[d] → M` is an isomorphism; in particular on `A¹`, which is simply connected, every smooth mixed Hodge module is constant (Sai90, §4; SZ, §4, the theorem of the fixed part). *Proof route:* the counit `a^* a_* M → M` gives, after `H^{−d}`, a morphism of mixed Hodge modules `a^* V[d] → M`; its rational realization is the evaluation of global sections of a constant local system, an isomorphism; the rational realization is exact and faithful (4.7), so the kernel and cokernel vanish. *Needs:* 5.1; 4.7; 3.3.

**Checks.**

- For `M = pℚ_X` the conclusion is `V = H⁰(X, ℚ) = ℚ(0)`.
- On `G_m`, the Kummer variation of 3.3 has nonconstant local system and is excluded; it is not of the form `a^* V`.
- On `A¹`, a variation of pure weight with constant local system cannot have a varying Hodge filtration: the conclusion forces `F` to be constant, as the period map of a polarized variation on `A¹` with trivial monodromy is constant.
- Admissibility at infinity cannot be dropped. On `A¹`, the constant `ℚe₀ ⊕ ℚe₁` with `W_{−2} = ℚe₁` and `F⁰ = O·(e₀ + x e₁)` is a graded-polarizable variation with constant local system. Its fibre at `x` is the extension of `ℚ(0)` by `ℚ(1)` with class `x` in `ℂ/ℚ`, split at `x = 0` and nonsplit at `x = i`, so no `V` restricts isomorphically to every fibre. It is excluded because it fails condition (a) of 3.3 at `∞`, as the `A²` Check of 3.3 computes along `s = 1/x`.

### Examples

For `f : G_m → A¹` the inclusion, `H⁰ f_* pℚ_{G_m} = j_* pℚ_{G_m}` has weights `1` and `2` and `H⁰ f_! pℚ_{G_m} = j_! pℚ_{G_m}` has weights `0` and `1`, as 5.2 requires; their nearby cycles at `0` are `ℚ` of weight `0`, and their unipotent vanishing cycles are `ℚ(−1)` and `ℚ` respectively.

### Dependencies

5.1 needs 4.5–4.7, 1.2, SpringerResolutionAndCharacteristicCycles §§9.1–9.7 and Tau Ceti's Tate twists; 5.2 needs 5.1, 4.5, 4.7; 5.3 needs 4.2, 4.6, 5.1, 1.4, LefschetzPencilsAndVanishingCycles §§1.3, 1.5, 1.7 and ComplexComparisonPartII §C5.6; 5.4 needs 4.4, 5.1, 5.3; 5.5 needs 5.1, 5.2, 1.3; 5.6 needs 5.1, 4.7, 3.3.

## Layer 6: Exponential mixed Hodge structures and the projector

This layer defines exponential mixed Hodge structures as the mixed Hodge modules on the affine line with vanishing global Betti cohomology, constructs the projector `Π` by additive convolution with `K = j_! pℚ_{G_m}`, and builds the exponential tensor product, exponential weights and the exact faithful de Rham fibre. Exponential weights are distinguished from the ambient weights on `MHM(A¹)`.

### 6.1 Exponential mixed Hodge structures

**Definition.** `EMHS` is the full subcategory of `MHM(A¹_θ)` of objects `N` with `RΓ(A¹, rat N) = 0`. It is an abelian subcategory closed under kernels, cokernels and extensions, with exact inclusion. The constant objects are `a^* V[1]` for graded-polarizable rational mixed Hodge structures `V` on a point (KS, §4.2, Definition 7, p. 31, with the vanishing-cohomology subcategory on p. 30; FSY, Appendix A.3, p. 63). The condition is the vanishing of derived global cohomology, not the absence of punctual subobjects. *Proof route:* the perverse bounds for global cohomology on `A¹` and their long exact sequence. *Needs:* 4.6, 4.7; 5.1; 1.3.

API:

- The inclusion `EMHS → MHM(A¹)` is exact and fully faithful.
- `N` lies in `EMHS` exactly when every derived global Betti cohomology group of `rat N` vanishes.
- A short exact sequence whose outer terms lie in `EMHS` has middle term in `EMHS`.

**Checks.**

- The zero object lies in `EMHS`.
- `pℚ_{A¹}` has `RΓ = ℚ[1]` and is excluded; `δ_0 ℚ` has nonzero `H⁰` and is excluded.
- `j_! pℚ_{G_m}` has `RΓ = 0` (the map `RΓ(A¹, ℚ) → RΓ({0}, ℚ)` is an isomorphism) and is included, although `δ_0 ℚ` embeds into it.

### 6.2 The exponential projector

**Construction.** Let `K = j_! pℚ_{G_m}` for `j : G_m → A¹`. Define `Π N = H⁰ s_*(N ⊠ K)` with `s(x, y) = x + y`, with the natural unit `η : N → Π N` induced by `δ_0 ℚ → K`. Prove that `s_*(N ⊠ K)` has no cohomology outside degree zero, that `Π` is exact, `Π² ≅ Π`, and that `Π` is left adjoint to the inclusion of `EMHS`; the kernel and cokernel of `η` are constant, the kernel being the largest constant subobject; the essential image is `EMHS`; and `Π` kills every constant object (KS, §4.2, pp. 30–31; §4.4, p. 34; FSY, (A.5), Appendix A.3, pp. 63–64). *Proof route:* the sequence `0 → δ_0 ℚ → K → pℚ_{A¹} → 0` of 5.5 gives `η` and its cone, which is a convolution with `pℚ_{A¹}`, computed by global cohomology and hence constant; perverse bounds give concentration and exactness; `RΓ(Π N) = 0`, and the universal property against global-acyclic targets gives the adjunction. *Needs:* 6.1; 2.3; 5.1, 5.5.

API:

- `Hom_{EMHS}(Π N, E) = Hom_{MHM}(N, E)`, naturally in `N` and `E`.
- `Π` is exact on `MHM(A¹)`.
- `Π² ≅ Π`, and `η` is an isomorphism exactly on `EMHS`.
- `ker η` is the largest constant subobject and `coker η` is constant.

**Checks.**

- `Π δ_0 ℚ = K`, whereas `Π pℚ_{A¹} = 0`.
- `Π K = K`.
- `Π δ_0 ℚ ≠ δ_0 ℚ`, so replacing `Π` by intermediate extension, which fixes `δ_0 ℚ`, fails.

### 6.3 Tensor product of exponential structures

**Construction.** For `E`, `F` in `EMHS`, define `E ⊗_E F = H⁰(E ⋆ F)` with the lift of 2.3 to mixed Hodge modules (5.1). Prove that `E ⋆ F` is concentrated in degree zero and lies in `EMHS`; that `⊗_E` is exact in each variable and symmetric monoidal with unit `K = Π δ_0 ℚ`; and that `Π H⁰(N ⋆ M) ≅ Π N ⊗_E Π M` for arbitrary `N`, `M`, `Π` killing the constant cohomology of `N ⋆ M` outside degree zero, with all coherence (KS, §4.2, Definition 7, p. 31; §4.4, Proposition 4 and Lemma 1, pp. 36–37; FSY, Appendix A.3, p. 64). The product is exponential convolution, not the Hodge tensor product along the diagonal. *Proof route:* Fourier conversion to a tensor product of localized modules (2.4) proves concentration and exactness; apply `Π` to the convolution associator; transport the convolution unit `δ_0` through `Π`. *Needs:* 6.2; 2.3, 2.4; 5.1.

API:

- `Π H⁰(N ⋆ M) ≅ Π N ⊗_E Π M`.
- `K ⊗_E E ≅ E` coherently.
- The convolution symmetry and associator induce a symmetric monoidal structure on `EMHS`.
- `⊗_E` preserves short exact sequences in each variable.

**Checks.**

- `E ⊗_E 0 = 0`.
- `K ⊗_E K = K`.
- `Π(δ_a ⋆ δ_b) = Π δ_{a+b}`, including `a + b = 0`, where it is `K`; `δ_0 ℚ` itself is not in `EMHS`, so the unit is `K`.

### 6.4 Exponential weight filtration

**Construction.** For a presentation `E = Π N` with `N ∈ MHM(A¹)`, define `W^E_n E = Π(W_n N)`, a subobject by exactness of `Π`. Prove independence of the presentation, that `W^E` is finite, exhaustive and increasing, that morphisms of `EMHS` are strict for it, and `W^E_n(E ⊗_E F) = Σ_{a+b=n} W^E_a E ⊗_E W^E_b F`. If `N` is pure of weight `w`, `Π N` is pure of exponential weight `w`; its ambient weights are `≥ w` and may be larger, the excess being constant. Construct the natural map from the ambient `W_n E` to `W^E_n E` (KS, §4.4, Definitions 11–12 and Propositions 2–4, pp. 34–37, whose proof assigns the ambient weights incorrectly; FSY, Remark A.6, p. 64). *Proof route:* the constant kernel and cokernel of `η` show that two presentations give the same subobjects; simultaneous strictness (4.7) and exactness of `Π`; the weights of convolution for the tensor formula. *Needs:* 6.2, 6.3; 4.7; 5.2.

API:

- `W^E_n Π N = Π W_n N`, independent of `N`.
- Every morphism of `EMHS` is strict for `W^E`.
- The weight filtration of a tensor product is the convolution of the two weight filtrations.
- There is a functorial map `W_n E → W^E_n E` from the ambient filtration.

**Checks.**

- `K` is pure of exponential weight `0`.
- `K` is not ambient-pure: `0 → δ_0 ℚ → K → pℚ_{A¹} → 0` has ambient weights `0` and `1`.
- `Π δ_0 ℚ(m)` has exponential weight `−2m`, matching `TauCeti.Hodge.tate`.

### 6.5 The de Rham fibre of an exponential structure

**Construction.** For a regular holonomic `N` on `A¹`, regular also at infinity, set `ω(N) = H¹_dR(A¹, N ⊗ E^θ)`. Prove `H^j_dR(A¹, N ⊗ E^θ) = 0` for `j ≠ 1`, exactness of `ω` on regular holonomic modules, that `ω(η) : ω N → ω Π N` is an isomorphism, that `ω` is faithful and exact on `EMHS`, and that `ω(E ⊗_E F) ≅ ω E ⊗_ℂ ω F` with `ω K = ℂ`. Define `W_n ω(Π N) = ω(W_n N)` and identify it with `ω(W^E_n Π N)` (FSY, (A.7)–(A.9), p. 64; KS, §4.3, Definition 8, p. 31). The vanishing is for regular `N` before the exponential twist. *Proof route:* by Fourier transformation and the slope bounds of 2.4, `ω N` is the fibre at `t = 1` of `FT N`, a connection near `t = 1`; finiteness and vanishing follow; constant inputs have acyclic twisted de Rham complex, so `ω η` is an isomorphism; since `ω` is exact, faithfulness on `EMHS` amounts to `ω E = 0 ⇒ E = 0`: then `j^+ FT E` is a connection on `G_m` with fibre `ω E = 0` at `t = 1`, hence of rank zero, so `FT E` is supported at `t = 0` and equals `δ_0 ⊗ V` by Kashiwara's equivalence; by inversion (2.2) the underlying module of `E` is `O ⊗ V`, so `RΓ(A¹, rat E) ⊗ ℂ = V[1]` by 1.5, and the defining vanishing of 6.1 gives `V = 0`, whence `E = 0` because the rational realization is faithful (4.7); monoidality by the relative de Rham Künneth formula. *Needs:* 6.1, 6.2, 6.3, 6.4; 2.2, 2.4; 1.5; 4.7; SpringerResolutionAndCharacteristicCycles §9.2 (Kashiwara equivalence); PadicDifferentialEquationsAndRigidCohomology §RD.6.53.

API:

- `ω` takes short exact sequences of regular holonomic modules to short exact sequences of vector spaces.
- `ω η : ω N ≅ ω Π N`.
- For `E ∈ EMHS`, `ω E = 0` if and only if `E = 0`.
- `ω` is symmetric monoidal and `ω K = ℂ`.

**Checks.**

- Every constant object has zero fibre: `ω(pℚ_{A¹}) = H¹_dR(A¹, E^θ) = 0`. This does not contradict faithfulness, because `pℚ_{A¹}` is nonzero but has `RΓ = ℚ[1]` and lies outside `EMHS`; the unit `K`, which lies in `EMHS`, has fibre of dimension one.
- `ω(δ_a V) = V_ℂ`, the identification using the scalar `e^{a}` of the exponential gauge.
- `ω K = ℂ`, of exponential weight `0`.

### 6.6 Fourier localization realizes the projector

**Theorem.** With `j : G_{m,t} → A¹_t` and the Fourier convention `t = −∂_θ`, there is a natural isomorphism `FT_θ Π_θ N ≅ (FT_θ N)(∗0)` for regular holonomic `N`, equivalently `Π_θ ∘ FT_t^{−1} ≅ FT_t^{−1} ∘ j_+ j^+` on regular inputs; under it the unit `η` corresponds to the localization `M → M(∗0)`, with constant kernel and cokernel on the inverse-transform side. This is an identity of underlying regular holonomic constructions; the Fourier transform of a mixed Hodge module is not asserted to be one (FSY, proofs of Theorem A.24(2)–(3), p. 70). *Proof route:* apply `FT` to the convolution with `K`, and compute `FT K = O(∗0)` from the divisor sequence; compare the unit with `M → M(∗0)` on Weyl presentations; identify kernels and cokernels by exactness and inversion. *Needs:* 6.2; 2.2, 2.3, 2.4; 5.5.

**Checks.**

- For `N = δ_0`, `FT δ_0 = O` and `(FT δ_0)(∗0) = O(∗0) = FT K`, matching `Π δ_0 ℚ = K`.
- For `N = O_{A¹}`, `FT O = δ_0` and `δ_0(∗0) = 0`, matching `Π pℚ_{A¹} = 0`.
- The localization is in the Fourier coordinate `t`, not in `θ`: localizing `δ_0` in `θ` would give zero, while `Π δ_0 ℚ = K ≠ 0`.

### Examples

For `N = δ_a ℚ` with `a ≠ 0`, `Π N = δ_a ⋆ K = j_{a!} pℚ_{A¹ ∖ {a}}`, its exponential weight is `0`, its de Rham fibre is `ℂ`, and its Fourier transform `E^{at}(∗0)` is a localized exponential: the projector of a translated point is not classical (8.1).

### Dependencies

6.1 needs 4.6, 4.7, 5.1 and 1.3; 6.2 needs 6.1, 2.3, 5.1 and 5.5; 6.3 needs 6.2, 2.3, 2.4 and 5.1; 6.4 needs 6.2, 6.3, 4.7 and 5.2; 6.5 needs 6.1–6.4, 2.2, 2.4, 1.5, 4.7, SpringerResolutionAndCharacteristicCycles §9.2 and PadicDifferentialEquationsAndRigidCohomology §RD.6.53; 6.6 needs 6.2, 2.2–2.4 and 5.5.

## Layer 7: The Deligne filtration and the strict bifiltered realization

This layer constructs the rational Deligne filtration on the exponential twist of a mixed Hodge module on `A¹`, normalized by the punctual classical object; proves the filtered Laplace specialization formula, polarized strictness of Fourier–Laplace transformation on `P¹`, and `E₁`-degeneration; and factors the de Rham realization through `Π`, strictly for `W_n ∩ F^λ` simultaneously.

### 7.1 The rational Deligne filtration

**Construction.** Let `N^H` be a mixed Hodge module on `A¹_θ` with underlying good filtered module `(M, F)` of its extension `j_{∞*}` to `P¹`. On the chart at infinity with coordinate `x = θ⁻¹`, for `α ∈ [0, 1) ∩ ℚ` and `p ∈ ℤ`, put `F^Del_{α+p} = Σ_{k≥0} (∂_x − x⁻²)^k [x⁻¹ (F_{p−k} M ∩ V_α M) e^{1/x}]` inside `M(∗∞) ⊗ E^θ`, with `V` the increasing Kashiwara–Malgrange filtration at `x = 0` (4.2); on the finite chart put `F_p N ⊗ e^θ`. Define the filtered unshifted de Rham complex by `F^Del_a DR` in degree `q` equal to `Ω^q ⊗ F^Del_{a+q}`, and `F^λ_irr ω(N) = image[H¹(P¹, F^Del_{−λ} DR) → H¹(P¹, DR)]`. Prove that the local filtrations glue, have discrete rational jumps on cohomology, and do not depend on the extension at infinity (ESY, display (3.1.1), pp. 22–23, and Proposition 3.1.2, p. 23; FSY, Appendix A.3, pp. 63–64, and Proposition A.13, p. 65). With the filtration shifts of 4.1, `δ_0 V` gives `F^λ_irr = F^{⌈λ⌉} V`. *Proof route:* strict `F`, `V` specializability gives finite generation and coordinate independence of the local formula; two extensions differ by a boundary-supported quotient, killed by the meromorphic exponential localization. *Needs:* 4.1, 4.2; 5.1; 6.5; 2.1.

API:

- The formula at infinity and `F_p` on the finite chart determine `F^Del`.
- Morphisms of mixed Hodge modules induce filtered maps of the twisted de Rham complexes.
- For `δ_0 V`, the irregular filtration on the fibre is the original decreasing Hodge filtration, indexed by `⌈λ⌉`.
- Changing the extension at infinity does not change the filtered meromorphic twist.

**Checks.**

- For `δ_0 ℚ(−1)`, `F¹_irr = ℂ` and `F^{1+ε}_irr = 0` for `0 < ε < 1`.
- For `pℚ_{A¹}`, the filtered fibre is zero at every rational index.
- At infinity `∂_x(e^{1/x}) = −x⁻² e^{1/x}`, so the twisted operator is `∂_x − x⁻²`; with `+x⁻²` one would be twisting by `e^{−θ}`.

### 7.2 Filtered Laplace specialization

**Theorem.** Let `R_F M` be the Rees module of a mixed Hodge module on `X × P¹_θ`, and form its partial Laplace module `L = p^*(R_F M)(∗∞) ⊗ E^{θτ/z}`, on whose finite chart `z∂_θ` acts as `z∂_θ + τ` and `z∂_τ` as `θ`. Then `L` is strictly specializable along `τ = 0`, `τ − z` is injective on `V^τ_α L`, and `R_{F^Del_{α+•}}(M ⊗ E^θ) = V^τ_α L / (τ − z) V^τ_α L` for `α ∈ [0, 1)`. The graded pieces `gr^{V^τ}`, including the endpoint `α = 0`, are strict and identified with Rees modules of Hodge specialization, and the formula commutes with projective filtered direct image (ESY, Lemma 2.3.3 and §2.4, pp. 21–22; Proposition 3.1.2, p. 23; Proposition 3.2.3, pp. 24–25; Appendix B, pp. 27–28). The quotient by `τ − z` is specialization to `τ = z`, not `τ = 1` with `z` left free. *Proof route:* write the `V^τ`-lattice from the `F ∩ V` sums at `x = 0` and verify the Bernstein–Sato condition using `z∂_x − τ/x²`; identify the quotient with 7.1 by coefficient expansion and division by `τ − z`; the endpoint argument of ESY Appendix B; strict projective direct image and specialization compatibility. *Needs:* 7.1; 4.1, 4.2, 4.5; 5.3.

**Checks.**

- The finite-chart and infinity-chart actions agree under `x = 1/θ`: `z∂_θ + τ` becomes `−z x² ∂_x + τ`.
- For `M = δ_0 V` on `P¹`, the quotient reproduces the filtration `F^{⌈λ⌉} V` of 7.1 at every `α`.
- The eigenvalue-one endpoint `α = 0` is retained; dropping it loses the classical part of the filtration.

### 7.3 Polarized regular twistor `D`-modules on a curve

**Construction.** On a compact Riemann surface, define polarized regular twistor `D`-modules: triples `(M′, M″, C)` of holonomic `R_X`-modules over the Rees parameter `z`, strictly specializable along every local coordinate with regular singularities, with a sesquilinear pairing `C` along `|z| = 1`, polarized of weight `w` in the sense of Sab05 (Sab05, §1.6 for triples, §§3.1–3.3 for strict specializability, §§4.1–4.2 for twistor `D`-modules and polarizations). A tame harmonic bundle is of Deligne type when the parabolic filtration measured by growth in its given metric equals the canonical filtration of its regular meromorphic connection (Sab05, §5.2.c, printed p. 130, Sab05 lines 5345–5352). Prove that the minimal extension of a tame harmonic bundle of Deligne type on a punctured curve is a polarizable regular twistor `D`-module of weight zero (Sab05, Theorem 5.0.1 and §5.2.e, printed p. 131, Sab05 lines 5402–5411; construction in §§5.3–5.4). For a polarized variation with quasi-unipotent boundary monodromy, its Hodge metric is harmonic; its growth filtration equals the canonical one by the Hodge-norm estimates of 3.2, so this construction applies. The harmonic and Hodge Rees bundles are identified as in Sab05 §1.3.c, printed pp. 24–25, Sab05 lines 992–1028. The weight-zero harmonic normalization is distinct from the Hodge-module normalization `variation weight + dim(support)` of 4.3. Prove that the projective direct image of a polarized regular twistor `D`-module of twistor weight `w` is strict with polarized cohomology of twistor weight `w + j` in degree `j` (Sab05, Theorem 6.1.1 and Remark 2.1.10, Sab05 lines 6405–6408 and 1834), compatibly with partial Fourier–Laplace transformation (Sab05, §8.4). *Proof route:* the curve case of Sabbah's construction, with the Deligne-type harmonic metrics in Sab05 §5.2 supplying the weight-zero polarized smooth twistor structures. *Needs:* 4.3; 3.2, 3.4; 1.5.

API:

- The Deligne-type harmonic construction gives a weight-zero polarized regular twistor extension; at `z = 1` it recovers the minimal extension of the underlying connection, with its given harmonic data on the punctured curve.
- Projective direct images of polarized regular twistor `D`-modules are strict and their cohomology is polarized of weight `w + j`.
- Strict specializability along `τ = 0` is compatible with partial Fourier–Laplace transformation of polarized regular twistor `D`-modules (Sab05, §8.4, printed p. 206), the operation that 7.4 applies.

**Checks.**

- A polarized variation of Hodge structure on the whole compact curve, equipped with its Hodge metric, gives a smooth twistor structure of weight zero whose fibre at `z = 1` is the flat bundle.
- On the trivial flat line on `ℂ^×`, a flat frame with norm `|t|^a`, `a ∉ ℤ`, gives a tame harmonic metric whose growth jumps are `a + ℤ`, whereas the zero-residue canonical filtration jumps at `ℤ`; it fails Deligne type. At `a = 1/2` and filtration index `b = 1/4`, the growth lattice is `O` whereas the canonical lattice is `tO`, since `⌈b − a⌉ = 0` and `⌈b⌉ = 1`. For `a = 0` both lattices are `t^{⌈b⌉}O` for every `b`, so the filtrations agree. The hypothesis distinguishes extensions of the given metric from extensions of the connection alone.
- On a point, a pure twistor structure of weight `w` has bundle `O_{P¹}(w)^r`; the weight-zero harmonic construction of a Hermitian line gives `O_{P¹}`, independently of the weight of a Hodge structure carried by that line.
- The trivial harmonic line on `P¹` gives the trivial twistor triple of weight zero. Its direct image to a point has rank-one cohomology in shifted degrees `−1` and `1`, of twistor weights `−1` and `1`. The Hodge module `pℚ_{P¹}` instead has weight one and Hodge direct-image weights `0` and `2` as in 4.5; these are different normalizations (Sab05, §0.6 and §1.1.b, Sab05 lines 596–597 and 804).

### 7.4 Polarized twistor strictness on the projective line

**Theorem.** Let `M` be a polarizable pure Hodge module on `P¹_θ`. The Deligne-filtered exponential de Rham complex has strict cohomology: for every rational `a`, `H^j(P¹, F^Del_a DR) → H^j(P¹, DR)` is injective; equivalently its Hodge-to-de Rham spectral sequence degenerates at `E₁`, and the filtered fibre is finite dimensional with the Deligne filtration (Sab10, Theorem 6.1, pp. 31–32; §§6.a–6.c, pp. 31–37; Proposition 6.10 and its proof, pp. 36–37). *Proof route:* use the weight-zero harmonic twistor construction of 7.3 on the curve-supported summands of `M`, with the Hodge Rees identification of Sab05 §1.3.c, and polarized twistor structures on its point-supported summands; apply the Fourier–Laplace construction of Sab10 §6 to these triples; compute its `V`-filtration along `τ = 0` and divide by `τ − z` (7.2, Sab10 Proposition 6.10); strictness of the projective direct image of polarized twistor `D`-modules (7.3, which is the curve case of Sab05 §6.1, cited in the proof of Sab10 Proposition 6.10 as [16, Th. 3.3.15] and [16, Th. 6.1.1]) gives injectivity at every index. The pure-input twistor theorem is not replaced by a weight argument. *Needs:* 7.1, 7.2; 7.3 (polarized twistor `D`-modules on a curve); 4.3, 4.5.

**Checks.**

- For `M = δ_0 V` the complex is two-term and the statement is the injectivity of `F^p V → V`.
- For `M = pℚ_{P¹}` the twisted cohomology on `A¹` vanishes, so the statement is empty on `ω` and is a statement about zero groups.
- The theorem concerns filtered hypercohomology; it does not claim that the termwise differentials vanish.

### 7.5 `E₁`-degeneration for mixed exponential twists

**Theorem.** For a mixed Hodge module on `X × P¹` with `X` projective, the global Deligne-filtered exponential de Rham complex is strict and its hypercohomology spectral sequence degenerates at `E₁`. In particular, for `N^H` on `A¹`, every `H¹(F^Del_a DR) → H¹(DR)` is injective. The filtered Deligne construction commutes with the projective direct images of the graph realization of pair cohomology (ESY, Theorem 3.3.1, Remark 3.3.2 and Lemma 3.3.3 with their proofs, pp. 25–26; §3.4 and Theorem 1.2.2, pp. 26 and 6; Proposition 1.7.4 and Corollary 1.7.6, pp. 17–18). *Proof route:* the mixed curve case by induction on `W`: pure strictness (7.4) and compatibility of `W`, `F`, `V` make the connecting maps strict, so the filtered long exact sequences split into strict pieces; then 7.2 commutes projective direct image with the Deligne construction, and 4.5 with weight dévissage gives the general case. *Needs:* 7.2, 7.4; 4.5, 4.7; 5.3.

**Checks.**

- For `N^H = δ_0 V`, injectivity is the injectivity of each `F^p V → V`.
- For a nonsplit extension `0 → δ_0 ℚ → K → pℚ_{A¹} → 0`, strictness on the extension is inherited from the two pure pieces, the second of which has zero fibre.
- The theorem concerns filtered hypercohomology; for `M = O_{P¹}` with `F^Del` it does not claim the termwise differential `d + dθ` is zero.

### 7.6 The strict bifiltered exponential realization

**Theorem.** The functor `N ↦ (ω N, W, F_irr)` factors through `Π`. Every morphism `a : N → N′` of mixed Hodge modules on `A¹` induces a strictly bifiltered map: `a(W_n ω N ∩ F^λ_irr ω N) = im(a) ∩ W_n ω N′ ∩ F^λ_irr ω N′` for every `n` and rational `λ`. The filtered inclusion from the Deligne complex is injective; the fibre has finitely many rational Hodge jumps and integral exponential weights, with strict bifiltrations on kernels, images and cokernels (FSY, Proposition A.10 and its proof, p. 65; ESY, Theorem 3.3.1, Remark 3.3.2 and Lemma 3.3.3, p. 25). The weight filtration on `ω` is defined from `W^E` (6.4), not from the ambient `W`. *Proof route:* 7.5 gives injectivity; constants have zero fibre at every index, so strict exactness for the kernel and cokernel of `η` descends the bifiltration through `Π`; `F`, `V`-bistrictness of morphisms of mixed Hodge modules makes the Deligne-filtered twisted complex exact on short exact sequences, so by 7.5 `F^λ_irr ∘ ω` is exact; applied to `W_n N₁ ↠ W_n(im a) ↪ W_n N₂` with the `W`-strictness of `a` this gives the intersection statement, not only two separate strictness statements. *Needs:* 7.1, 7.5; 6.4, 6.5; 4.7; 5.3.

**Checks.**

- A morphism that is separately strict for `F` and for `W` need not be strict for `W ∩ F`; the theorem asserts the intersection equation, which at a point is `TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_iSup_deligneSplittingFamily_eq_map_iSup`.
- For `η : δ_0 ℚ → K`, `ω η` is an isomorphism of bifiltered lines of weight `0` and Hodge jump `0`.
- For `pℚ_{A¹} → j_* pℚ_{G_m}`, the source has zero fibre and the map on fibres is `0 → ℂ`, strict for both filtrations.

### Examples

For `N = j_* pℚ_{G_m}` on `A¹`, `Π N = Π δ_0 ℚ(−1) = I(ℚ(−1))`; its fibre is `ℂ`, of exponential weight `2` with `F¹_irr = ℂ` and `F^{1+ε}_irr = 0`, computed by 7.1 on the two-term complex of `δ_0 ℚ(−1)`.

### Dependencies

7.1 needs 4.1, 4.2, 5.1, 6.5 and 2.1; 7.2 needs 7.1, 4.1, 4.2, 4.5 and 5.3; 7.3 needs 4.3, 3.2, 3.4 and 1.5; 7.4 needs 7.1, 7.2, 7.3, 4.3 and 4.5; 7.5 needs 7.2, 7.4, 4.5, 4.7 and 5.3; 7.6 needs 7.1, 7.5, 6.4, 6.5, 4.7 and 5.3.

## Layer 8: Classical mixed Hodge structures inside exponential ones

This layer constructs the fully faithful tensor functor `V ↦ Π i_{0*} V` from graded-polarizable rational mixed Hodge structures to exponential ones, with `φ_{θ,1}` as inverse on its image, and proves that on the classical image the irregular filtration is the classical Hodge filtration. An integral jumping set is not the definition of classical.

### 8.1 The classical embedding

**Construction.** Let `MHS_gp` be the graded-polarizable rational mixed Hodge structures of finite dimension, realized on `TauCeti.Hodge.MixedHodgeStructure` with the rational space as integral group and the identity as rational model. Define `I(V) = Π i_{0*} V` for `i_0 : {0} → A¹_θ`. Prove that `I` is exact, fully faithful and symmetric monoidal, with `φ_{θ,1} I(V) = V`. Call an exponential mixed Hodge structure classical when it lies in the essential image of `I`. Its exponential weight filtration is `I(W V)`; this does not identify its ambient weights with `W V`. An object `Π N` is classical exactly when the localized Fourier transform `(FT N)(∗0)` of 6.6 is a constant connection on `G_m`, and then the Hodge data are induced (FSY, Lemma A.12, p. 65, and proof of Theorem A.24(3), p. 70). No new mixed Hodge vector-space structure is introduced. *Proof route:* constants have zero vanishing cycles, so `φ_1 Π i_{0*} = id`; full faithfulness from the adjunction of 6.2 and the punctual supported-category equivalence (4.6); tensor compatibility from convolution of punctual modules; the criterion from 6.6 and 5.6: if `(FT N)(∗0)` is constant of rank `r`, then by 6.6 and inversion (2.2) the module underlying `Π N` is `(j_! O_{G_m})^r`, so the adjunction `j_! j^* Π N → Π N` is an isomorphism (its rational realization is, 4.7); `j^* Π N` is a smooth mixed Hodge module on `G_m` with constant local system, hence `a^* V[1]` by 5.6, and `j_!(a^* V[1]) = K ⊗ V = I(V)`; conversely, if `Π N ≅ I(V)`, then `(FT N)(∗0) ≅ FT Π N = FT I(V) = O(∗0) ⊗ V`. *Needs:* 6.2, 6.3, 6.4, 6.6; 2.2; 4.7; 5.1, 5.3, 5.6; `TauCeti.Hodge.MixedHodgeStructure`.

API:

- `Hom(I(V), I(V′)) ≅ Hom_{MHS}(V, V′)`.
- `φ_{θ,1} ∘ I ≅ id` and `φ_{θ,1} ∘ Π ≅ φ_{θ,1}`.
- `I(V ⊗ V′) ≅ I(V) ⊗_E I(V′)`, with `I(ℚ) = K`.
- `W^E_n I(V) = I(W_n V)`.

**Checks.**

- `I(ℚ) = K`, not `δ_0 ℚ`.
- `I(ℚ(m))` has exponential weight `−2m` and `φ_{θ,1} I(ℚ(m))` is `TauCeti.Hodge.tate m` rationalized.
- `Π δ_a ℚ` for `a ≠ 0` has `φ_{θ,1} = 0` at the origin but nonzero fibre, so it is not classical; and an object whose irregular Hodge numbers happen to be integral is not thereby classical (integrality of jumps is neither the definition nor a sufficient criterion).

### 8.2 Agreement of classical and irregular filtrations

**Theorem.** If `Π N^H` is classical, there is a natural bifiltered isomorphism `(ω N, W, F_irr) ≅ (φ_{θ,1} N^H)_ℂ` with its classical `W` and `F`; at rational `λ` the right-hand filtration is `F^{⌈λ⌉}`. Thus wherever classicality holds, the rational irregular filtration is exactly the integer-indexed Hodge filtration (FSY, Proposition A.13 and its proof, p. 65). *Proof route:* for `N = i_{0*} V` the filtered point direct image `F_p = Σ_k F_{p−1−k} V ∂^k` makes the twisted de Rham complex filtered quasi-isomorphic to `V[−1]` with its original `F`, including the codimension-one shift; then 7.6, full faithfulness and `φ_1 Π = φ_1` pass to any representative. *Needs:* 8.1; 7.1, 7.6; 4.1; 5.3.

**Checks.**

- For `ℚ(−1)`, the last nonzero integer step is `F¹`, and `F^λ_irr = 0` for `λ > 1`.
- For `K = I(ℚ)`, `F⁰_irr = ℂ` and `F^λ_irr = 0` for `λ > 0`.
- For the nonsplit extension `E` of `ℚ(0)` by `ℚ(1)`, `I(E)` has `F^{−1}_irr` of dimension two and `F⁰_irr` of dimension one, matching `F` of `E`; the jumps `−1` and `0` are integral, as the theorem requires on the classical image.

### Examples

For the pair `(G_m, x)` of Layer 9, `H¹ = I(ℚ(−1))` and `H¹_c = I(ℚ(0))`, both classical; their fibres are lines with irregular jumps `1` and `0`.

### Dependencies

8.1 needs 6.2–6.4, 6.6, 2.2, 4.7, 5.1, 5.3, 5.6 and Tau Ceti's mixed Hodge structures; 8.2 needs 8.1, 7.1, 7.6, 4.1 and 5.3.

## Layer 9: Cohomology of a pair and its weights

This layer constructs ordinary, compactly supported and middle exponential cohomology of a smooth quasi-projective pair `(U, f)`, with coefficients; identifies the fibres with unshifted twisted de Rham groups; and proves Künneth, duality, the middle-weight criterion, divisor localization and the affine-line and torus-sum examples. At `f = 0` it recovers the mixed Hodge structures given by Hodge modules.

### 9.1 Ordinary, compact and middle cohomology of a pair

**Construction.** For `U` smooth quasi-projective of dimension `d`, `f : U → A¹_θ` and `N^H ∈ MHM(U)`, set `N^r_* = H^{r−d} f_* N^H`, `N^r_! = H^{r−d} f_! N^H` and `N^r_mid = im(N^r_! → N^r_*)`, and define `H^r(U, N^H, f) = Π N^r_*`, `H^r_c(U, N^H, f) = Π N^r_!` and `H^r_mid(U, N^H, f) = Π N^r_mid`, with their exponential weights and filtered de Rham fibres. For `N^H = pℚ_U` the coefficient is omitted. At `f = 0` these are `I` applied to the mixed Hodge structures `H^r(U)`, `H^r_c(U)` and their image, computed by Hodge modules (FSY, §A.5, the opening definitions, Example A.15 and Definition A.18, p. 66). The shift `r − d` depends on `U`, also for supported coefficients. *Proof route:* 5.1 direct images and perverse cohomology in degree `r − d`; abelianness and exactness of `Π` commute `Π` with the image; for `f = 0`, factor through the point and use 8.1. *Needs:* 5.1; 4.7; 6.2, 6.4, 6.5; 8.1; 7.6.

API:

- Coefficient morphisms and proper maps of pairs induce maps compatible with `! → *`.
- `H^r_mid = im(H^r_c → H^r)` in `EMHS`.
- At `f = 0`, `H^r(U, N^H, 0) = I(H^r(U, N^H))` and similarly for compact supports.
- A distinguished triangle of coefficients gives long exact sequences of exponential cohomology.

**Checks.**

- For `U = pt`, `f = 0` and coefficient `V`, `H⁰ = H⁰_c = H⁰_mid = I(V)` and all other degrees vanish.
- `H^r(A¹, t) = H^r_c(A¹, t) = 0` in all degrees: `f_* pℚ_{A¹} = pℚ_{A¹}` is constant and killed by `Π`.
- For `(A¹, 0)`, `H⁰ = I(ℚ)` and `H²_c = I(ℚ(−1))`, all other groups zero; the middle object is the image in `EMHS`, not an independently chosen subspace.

### 9.2 Twisted de Rham realization of pair cohomology

**Theorem.** With left coefficient module `N` underlying `N^H`, there are natural identifications `ω H^r(U, N^H, f) ≅ H^r_dR(U, N ⊗ E^f)`, `ω H^r_c ≅ H^r_{dR,c}(U, N ⊗ E^f)`, and `ω H^r_mid ≅ im(H^r_{dR,c} → H^r_dR)`. They are bifiltered for the pushforward Deligne filtration and the exponential weights, and commute with the long exact sequences of coefficients (FSY, displays (A.16)–(A.17) and the following paragraph, p. 66, where the filtered statement is deduced from Sabbah–Yu; here it is deduced from 7.5). Unshifted de Rham degrees are used, and compact de Rham cohomology is defined by holonomic `!` direct image. *Proof route:* the projection formula for exponential twisting applied to `f_*` and `f_!`; by 6.5 the exponential fibre of every perverse cohomology term has cohomology only in degree one, so the direct-image spectral sequence has one row; the shift `r − d`; 7.5 for the filtered identification along a compactification of `f`, and 7.6 for filtered images. *Needs:* 9.1; 6.5; 7.5, 7.6; 5.1; 2.1.

**Checks.**

- For a point supported in a `d`-fold, the only nonzero unshifted de Rham degree is `d`, which the normalization must keep.
- For `(G_m, x)`, `H¹_dR(G_m, E^x)` is one-dimensional, matching `ω I(ℚ(−1)) = ℂ`.
- For `(A¹, t)`, `H^r_dR(A¹, E^t) = 0` for all `r` (2.1), matching 9.1.

### 9.3 Künneth and duality for exponential cohomology

**Theorem.** For smooth `U`, `V` and regular functions `f`, `g`, the pair `(U × V, f ⊞ g)` has `H^r ≅ ⊕_{a+b=r} H^a(U, f) ⊗_E H^b(V, g)` as exponential mixed Hodge structures, and similarly for compact supports, with `W^E` the convolution of the two weight filtrations. For `U` of dimension `d` the trace pairing `H^r_c(U, f) ⊗_E H^{2d−r}(U, −f) → I(ℚ(−d))` is perfect and compatible with `W^E`; with coefficients, the dual coefficient has the normalization of 5.1 (FSY, Example A.22, pp. 67–68; Yu, Theorem 2.2 and its proof, pp. 14–16). The dual exponential has the sign `−f`. Compatibility with `F_irr` is 12.9. *Proof route:* external product, projection formula and `E^{f⊞g} = E^f ⊠ E^g`; `Π` and the exact monoidal fibre give the Künneth decomposition; duality of `f_!` and `f_*` with `D(pℚ_U) = pℚ_U(d)` and the trace give the twist `(−d)`. *Needs:* 9.1, 9.2; 6.3, 6.5; 7.6; 5.1; 2.5; `TauCeti.Hodge.tate`.

**Checks.**

- `H¹_c(G_m, x) = I(ℚ)` pairs with `H¹(G_m, −x) = I(ℚ(−1))` into `I(ℚ(−1))`.
- For `(A¹ × A¹, x + 0)`, Künneth gives `H^r = H^•(A¹, x) ⊗ H^•(A¹, 0) = 0`, consistent with 9.1.
- Dropping the sign fails: the cup product `H¹_c(G_m, x) ⊗ H¹(G_m, x) → H²_c(G_m, 2x)` lands in zero (`H^r_c(G_m, 2x)` vanishes for `r ≠ 1`), so only the pairing with `−f` can be perfect.

### 9.4 The middle degree and the lowest weight

**Theorem.** For `U` smooth of dimension `d` and constant coefficients, `H^d_c(U, f)` has exponential weights `≤ d`, `H^d(U, f)` has weights `≥ d`, and `H^d_mid(U, f)` is pure of weight `d`. The map `gr^W_d H^d_c → gr^W_d H^d` is an isomorphism if and only if `H^d_mid = W_d H^d`. All maps are strict for `F_irr` and `W` (FSY, Proposition A.19 and its proof, pp. 66–67). These are statements in the central degree `d` for the coefficient `pℚ_U` of weight `d`. *Proof route:* the weight bounds of 5.2 for `H⁰ f_! pℚ_U` and `H⁰ f_* pℚ_U`, descended by `Π`; the image has both bounds; the kernel and cokernel of `! → *`, their duality with the Tate twist and exactness of `gr^W Π`. *Needs:* 9.1, 9.3; 5.2; 6.4; 7.6.

**Checks.**

- For `(G_m, x)`, `d = 1`: `H¹_c = I(ℚ)` of weight `0 ≤ 1`, `H¹ = I(ℚ(−1))` of weight `2 ≥ 1`, and `H¹_mid = 0`, pure of weight `1` vacuously; `gr^W_1` of both is zero, so both sides of the criterion hold.
- For `(A¹, x²)`, `H⁰ f_* pℚ_{A¹} = pℚ_{A¹} ⊕ j_* L[1]` with `L` the rank-one local system of monodromy `−1` on `G_m`; `Π` kills the first summand, and `H¹_c ≅ H¹ ≅ H¹_mid` is one-dimensional and pure of weight `1`.
- The ambient weight of the representing module must not be used: for `(G_m, x)`, `H⁰ f_* pℚ_{G_m} = j_* pℚ_{G_m}` has ambient weights `1` and `2`, while its `Π` is pure of exponential weight `2`.

### 9.5 Divisor sequences for pair cohomology

**Theorem.** Let `D ⊂ U` be a reduced divisor on which `f` vanishes. There is a long exact sequence `… → H^{r−1}_c(D) → H^r_c(U ∖ D, f) → H^r_c(U, f) → H^r_c(D) → …`, the terms on `D` being classical. If `D` is smooth there is a long exact sequence `… → H^{r−2}(D)(−1) → H^r(U, f) → H^r(U ∖ D, f) → H^{r−1}(D)(−1) → …`, compatible with the compact-to-ordinary maps. For singular `D` the ordinary sequence keeps `RΓ_D` (FSY, Example A.20 and (A.21), p. 67). *Proof route:* apply `f_!` and `Π` to 5.5 and use the zero-function comparison on `D`; for smooth `D` apply `f_*` to the second sequence of 5.5 with its twist; naturality of localization triangles. *Needs:* 5.5; 9.1, 9.2; 8.2.

**Checks.**

- For `U = A¹`, `D = {0}`, `f = x`: the compact sequence gives `H¹_c(G_m, x) ≅ H⁰_c(D) = I(ℚ)`, since `H^•_c(A¹, x) = 0`.
- The ordinary sequence for the same data gives `H¹(G_m, x) ≅ H⁰(D)(−1) = I(ℚ(−1))`.
- For `D = {xy = 0}` in `A²` and `f = xy`, the ordinary sequence with `H^{r−2}(D)(−1)` is not used; `RΓ_D(A², ℚ)` has the extra node contribution of 5.5.

### 9.6 Affine-line and torus-sum examples

**Theorem.** `H^r(A¹, t) = H^r_c(A¹, t) = 0` for every `r`. For `k ≥ 1`, `H^r(G_m^k, x₁ + ⋯ + x_k)` vanishes for `r ≠ k` and is `I(ℚ(−k))` for `r = k`; `H^r_c` vanishes for `r ≠ k` and is `I(ℚ(0))` for `r = k`; the compact-to-ordinary map in degree `k` is zero and `H^k_mid = 0`. For `k = 0` the point gives `I(ℚ)` in degree `0` with identity comparison. These are equalities in the classical subcategory, hence statements about both Hodge and irregular filtrations (FSY, Example A.22 and (A.23), pp. 67–68). *Proof route:* the affine identity pushforward is constant; the divisor sequences at `{0}` give `H¹(G_m, x) = I(ℚ(−1))` and `H¹_c(G_m, x) = I(ℚ)`; Künneth for the `k`-fold sum and duality for compact supports; the comparison is zero for `k ≥ 1` by weights. *Needs:* 9.1, 9.3, 9.5; 8.2; 5.2.

**Checks.**

- The ordinary and compact Hodge jumps are `k` and `0`.
- For `k = 0` the comparison is the identity of `I(ℚ)`, which distinguishes it from a map that is zero in every case.
- The de Rham dimensions `dim H^k_dR(G_m^k, Σ x_i) = 1` agree with 12.6: the Newton polytope is the standard simplex, of volume `1/k!`.

### Examples

For `(G_m, x)`: `H¹ = I(ℚ(−1))`, `H¹_c = I(ℚ)`, the comparison is zero, `H¹_mid = 0`, the ordinary filtration jumps at `1` and the compact one at `0`, and the duality pairs them into `I(ℚ(−1))`. Taking `k` factors gives the torus-sum example with `I(ℚ(−k))` and `I(ℚ)` paired into `I(ℚ(−k))`.

### Dependencies

9.1 needs 5.1, 4.7, 6.2, 6.4, 6.5, 8.1 and 7.6; 9.2 needs 9.1, 6.5, 7.5, 7.6, 5.1 and 2.1; 9.3 needs 9.1, 9.2, 6.3, 6.5, 7.6, 5.1 and 2.5; 9.4 needs 9.1, 9.3, 5.2, 6.4 and 7.6; 9.5 needs 5.5, 9.1, 9.2 and 8.2; 9.6 needs 9.1, 9.3, 9.5, 8.2 and 5.2.

## Layer 10: The classical `tg` criterion and the zero locus

This layer proves that the exponential cohomology of the pair `(A¹_t × V, tg)` is classical for every regular function `g` on a smooth quasi-projective `V`, with no tameness assumption on `g`, and computes it from the zero locus of `g`.

### 10.1 The classical `tg` criterion

**Theorem.** Let `V` be smooth quasi-projective, `g ∈ O(V)`, `M^H ∈ MHM(V)`, `U = A¹_t × V` and `f = tg`. Then all `H^r(U, pℚ_{A¹} ⊠ M^H, f)` and `H^r_c(U, pℚ_{A¹} ⊠ M^H, f)` are classical. For the coefficient `pℚ_{A¹}[∗0] ⊠ M^H` the ordinary groups are classical in every degree, and for `pℚ_{A¹}[!0] ⊠ M^H` the compact groups are. Their bifiltered fibres are the corresponding mixed Hodge structures, so `F_irr` agrees with `F`. This holds for `g = 0` and for an arbitrary, possibly singular or empty, zero locus; no tameness or nondegeneracy of `g` is assumed (FSY, Theorem A.24 and proofs (A.25)–(A.26), pp. 68–70). Here `pℚ_{A¹}[∗0] = j_* pℚ_{G_m}` and `pℚ_{A¹}[!0] = j_! pℚ_{G_m}`. *Proof route:* localize along `A¹ × g⁻¹(0)`: the supported term pushes to `θ = 0` and is classical; on the complement push along `(t, g)` to reduce to `g = τ`; the localized ordinary fibre is the Fourier de Rham complex `[M(∗0) → M(∗0)]` with differential multiplication by `τ`, acyclic since `τ` is invertible; duality with the sign involution gives the compact case; for `[∗0]`, replace `M` by `Π_τ M`, whose difference is constant and killed after localization, using 5.6 on `A¹` to see that constancy of the underlying `D`-module suffices, and 6.6; faithfulness of the fibre (6.5) and 8.2 conclude. *Needs:* 9.1, 9.2, 9.5; 8.1, 8.2; 6.5, 6.6; 2.2, 2.5; 5.1, 5.6.

**Checks.**

- For `V = pt` and `g = 0`, the ordinary groups are `I(ℚ)` in degree `0` and the compact ones `I(ℚ(−1))` in degree `2`.
- For `g = 1`, all groups vanish: `f = t` and 9.6.
- The argument uses the derived direct image of `M` and no tameness of `g`: for `g = x²` on `A¹`, with singular-looking fibre `x² = 0` (a nonreduced point), the groups are classical and computed by 10.2 on the reduced point.

### 10.2 Zero-locus description of `tg` cohomology

**Theorem.** For constant coefficients and `Z = g⁻¹(0)` with its reduced structure, `H^r_c(A¹ × V, tg) ≅ I(H^{r−2}_c(Z)(−1))` and `H^r(A¹ × V, tg) ≅ I(H^r_Z(V))`, as classical structures with their filtered fibres. If `Z` is a smooth divisor, `H^r_Z(V) ≅ H^{r−2}(Z)(−1)`. For `g = 0` the ordinary group is `H^r(V)` and the compact group `H^{r−2}_c(V)(−1)`; for `g` a unit both vanish (FSY, Example A.27, pp. 70–71, whose assertion that the relevant pushforward is the zero functor is corrected here). The smooth-divisor formula is not applied to `g = 0` or to singular `Z`. *Proof route:* the localized vanishing of 10.1 and the compact localization triangle reduce compact cohomology to `A¹ × Z`, where the exponential function is zero; compact Künneth with `H²_c(A¹) = ℚ(−1)`; for ordinary cohomology use `i_* i^!` and homotopy invariance in the `A¹` direction; `tg ∘ i` is the zero function, whose direct image factors through the point and is not the zero functor; purity only for a smooth divisor. *Needs:* 10.1; 9.3, 9.5; 5.1; 1.2.

**Checks.**

- For `g = x` on `V = A¹`, `Z` is a point: `H²_c(A², tx) = I(ℚ(−1))` and `H²(A², tx) = I(H²_{0}(A¹)) = I(ℚ(−1))`.
- For `V = pt` and `g = 0`, the ordinary group is `I(ℚ)` in degree `0` and the compact group `I(ℚ(−1))` in degree `2`.
- For `g = xy` on `A²`, `Z` is the node and `H^r_Z(A²)` is kept: `H²_Z = ℚ(−1)²` and `H³_Z = ℚ(−2)`, whereas a smooth-divisor formula would predict `H^{r−2}` of the normalization.

### Examples

For `V = A¹`, `g = x`: the pair `(A², tx)` has `H_c² = I(ℚ(−1))` and `H² = I(ℚ(−1))`; for `g` invertible both vanish; for `g = 0`, `Z = V` and the ordinary cohomology is `H^r(A¹)`, while the compact cohomology is `H^{r−2}_c(A¹)(−1)`, nonzero only for `r = 4`.

### Dependencies

10.1 needs 9.1, 9.2, 9.5, 8.1, 8.2, 6.5, 6.6, 2.2, 2.5, 5.1 and 5.6; 10.2 needs 10.1, 9.3, 9.5, 5.1 and 1.2.

## Layer 11: Fourier cohomology, costalks and weights at infinity

This layer gives the Fourier transform of a mixed Hodge module on `A¹` a cohomological mixed Hodge structure through the pair `(A¹ × A¹, tτ)`, without claiming that the Fourier transform is a mixed Hodge module; proves the costalk comparison and the pure-input Hodge-number formula; computes the constant correction of `Π`; and proves the monodromy-filtration theorem at infinity for `Π` of a pure Hodge module, keeping every primitive part.

### 11.1 Classical cohomology of a Fourier transform

**Construction.** For `M^H ∈ MHM(A¹_τ)`, define `H^j(A¹_t, FT M^H) = φ_{θ,1} H^{j+1}(A¹_t × A¹_τ, pℚ_{A¹} ⊠ M^H, tτ)` and similarly `H^j_c`, classical by 10.1. Their de Rham fibres are `H^j_dR(A¹, FT M)` and `H^j_{dR,c}(A¹, FT M)`; ordinary cohomology can be nonzero only for `j = 0, 1` and compact cohomology only for `j = 1, 2`. They carry the `W` and `F` of the classical pair comparison. The notation does not assert that `FT M` is a regular Hodge module; it may be irregular (FSY, Lemma A.28 and Notation A.29, p. 71). *Proof route:* 10.1 for the classical structure; compare the projection along `τ` with the Fourier kernel and its relative dimension one; 9.2 and the de Rham bounds on an affine curve; duality for the compact range. *Needs:* 10.1; 9.1, 9.2; 2.2, 2.5; 8.2.

API:

- The complex fibre is the ordinary or compact de Rham cohomology of `FT M`.
- Exact sequences of inputs give long exact sequences of mixed Hodge structures.
- The classical Hodge filtration equals the irregular filtration of the pair.

**Checks.**

- For `M^H = δ_0 V`, `H⁰(FT M^H) = V` and the other ordinary degrees vanish; `FT δ_0 = O` has `H⁰_dR = ℂ`.
- For `M^H = pℚ_{A¹}`, `H¹(FT M^H) = ℚ(−1)` and `H⁰ = 0`; `FT O = δ_0` has `H¹_dR = ℂ`.
- For `δ_a V` with `a ≠ 0`, ordinary and compact Fourier cohomology vanish (`FT δ_a = E^{at}`); the pair degree is `j + 1`, and using `j` changes the costalk formula of 11.2.

### 11.2 Fourier cohomology is the costalk

**Theorem.** For every `M^H ∈ MHM(A¹_τ)` there are natural isomorphisms of mixed Hodge structures `H^j(A¹_t, FT M^H) ≅ H^j i_0^! M^H` for all `j`, both sides vanishing outside `j = 0, 1`, identifying `W` and the irregular Hodge filtration on the Fourier fibre with the classical `W` and `F` of the costalk; `i_0` is the origin of the input line (FSY, Theorem A.30 and its proof, p. 71). *Proof route:* first `M = i_{0*} V`; then the triangle `i_* i^! M → M → M[∗0]`, where the Fourier de Rham complex of `M[∗0]` is acyclic because it becomes multiplication by the invertible coordinate `τ`; take cohomology and use the punctual case and 7.6. *Needs:* 11.1; 10.1; 5.1; 8.2; 6.5; 2.2.

**Checks.**

- For `pℚ_{A¹}` the answer is `ℚ(−1)` in degree one, which is `H¹ i_0^! pℚ`; the stalk `i_0^* pℚ = ℚ[1]` would give a different degree and twist.
- For `δ_0 V` both sides are `V` in degree `0`.
- For `K = j_! pℚ_{G_m}`, the map `j_! pℚ_{G_m} → j_* pℚ_{G_m}` has kernel `δ_0 ℚ` and cokernel `δ_0 ℚ(−1)`, so `H⁰ i_0^! K = ℚ` and `H¹ i_0^! K = ℚ(−1)`; on the other side `FT(j_! O) = O(∗0)` has `H⁰_dR = H¹_dR = ℂ`, matching both degrees.

### 11.3 Pure-input Fourier Hodge numbers

**Theorem.** Let `M^H` be pure of weight `w` with no nonzero section supported at `τ = 0`. Then `H^j_dR(A¹, FT M) = 0` for `j ≠ 1` and `H¹(A¹, FT M^H) = coker(N : ψ_{τ,1} M^H → ψ_{τ,1} M^H(−1))`. If `M` is smooth at `0`, this is `ψ_τ M^H(−1)`, pure of weight `w + 1`, and `dim gr^p_{F_irr} H¹_dR(A¹, FT M) = rank gr^{p−1}_F M` for every integer `p` (FSY, Corollary A.31(1)–(2) and its proof, p. 72). Having no punctual summand at `0` is weaker than smoothness there; the rank formula needs smoothness. *Proof route:* 11.2 and 5.4; semisimplicity rules out degree-zero costalk; for smooth input `N = 0` and the full nearby cycles have the generic Hodge ranks and weight `w − 1` (5.3), so the twist `(−1)` gives the shift. *Needs:* 11.2; 5.3, 5.4; 4.4.

**Checks.**

- For `M = pℚ_{A¹}` (weight `1`, smooth at `0`), `H¹ = ψ(−1) = ℚ(−1)`, of weight `2 = w + 1`; the variation `O` has `gr⁰_F` of rank one and all other `gr^p_F` zero, and the formula gives `dim gr¹_{F_irr} H¹ = 1`, the single jump of `ℚ(−1)` at `1`.
- At a singular point the cokernel of `N` must be kept: for `j_!* L[1]` with a unipotent Jordan block of size two at `0`, `H¹` is one-dimensional while the generic rank is two.
- For `M = δ_0 V` the hypothesis fails (a punctual section), and indeed `H⁰ ≠ 0`.

### 11.4 The constant correction of the projector

**Theorem.** Let `M^H` be pure of weight `w` with no constant subobject. Then `η` gives an exact sequence `0 → M^H → Π M^H → M′^H → 0` with `M′` constant of ambient weights `≥ w + 1`, and `W_w Π M = M`. For all integers `l` and `p`, `dim gr^p_{F_irr} gr^W_l H¹_dR(A¹, FT M′) = rank gr^{p−1}_F gr^W_{l−1} M′`, the left `W` being the classical cohomology weight and the right `W` the ambient weight (FSY, Corollary A.31(3) and its proof, p. 72). *Proof route:* the kernel of `η` is the largest constant subobject, hence zero; pure splitting rules out a weight-`w` constant quotient inside `Π M`; apply 11.3 to each pure constant `gr^W_{l−1} M′`. *Needs:* 6.2, 6.4; 4.4; 5.2; 11.3; 7.6.

**Checks.**

- For `M = δ_0 ℚ` (weight `0`), `Π M = K` and `M′ = pℚ_{A¹}` of ambient weight `1 = w + 1`.
- For `M = j_* L[1]` with `L` of monodromy `−1` on `G_m`, `M` has no constant subobject and `RΓ(M) = 0`, so `Π M = M` and `M′ = 0`.
- The weight shift `l − 1` is essential: for `M′ = pℚ_{A¹}`, of ambient weight `1`, `H¹(FT M′) = ℚ(−1)` has weight `2 = 1 + 1`.

### 11.5 Regular Fourier stationary phase at eigenvalue one

**Theorem.** For a regular holonomic `M` on `A¹`, regular also at infinity, there is a natural isomorphism `(φ_{t,1} FT M, N) ≅ (ψ_{1/τ,1} M, N)` between the unipotent vanishing cycles of `FT M` at the output origin and the unipotent nearby cycles of `M` at the input infinity, taken along the coordinate `1/τ`, intertwining the two nilpotent monodromies, each normalized as in 4.2 in its local coordinate (the sign of the Fourier kernel does not enter: pullback by `t ↦ −t` fixes `0` and preserves the positive loop, hence `N`); it is natural for the localization `FT M → (FT M)(∗0)` and matches its `can`/`var` diagram with `ψ_∞ M → ψ_∞ Π M`. The comparison is of underlying local systems; Tate shifts are attached through 5.3, without claiming that the irregular `FT M` underlies a mixed Hodge module (MT, Lemma A.4 and its proof, p. 39). *Proof route:* compactify the Fourier kernel to `P¹ × A¹` and specialize at the output coordinate `0`; use the local exponential model near the input boundary, excluding the nonzero finite exponential factors (PadicDifferentialEquationsAndRigidCohomology §RD.6.52a), and identify the surviving unipotent factor and its logarithm; apply proper specialization (1.4) and compare the localization and variation maps. The local kernel-specialization computation is part of this target; exactness of `FT` and the formal normal form alone do not give it. *Needs:* 2.2, 2.4; PadicDifferentialEquationsAndRigidCohomology §RD.6.52a; 1.4; 4.2; 5.3.

**Checks.**

- For `M = O_{A¹}`: `FT M = δ_0` has unipotent vanishing cycles `ℂ` at `0`, and `O` has unipotent nearby cycles `ℂ` at `∞`.
- For `M = δ_a`, `a ≠ 0`: `FT M = E^{at}` is smooth at `0` with zero vanishing cycles, and `δ_a` has zero nearby cycles at `∞`.
- The comparison is not with the vanishing cycles of `M` at the input origin: for `M = δ_0`, `φ_0 M = ℂ`, while `FT M = O` has zero vanishing cycles at `0`, consistent with `ψ_∞ δ_0 = 0`.
- For `M = D/D(τ∂_τ)²`, regular with one unipotent Jordan block of size two at `0` and at `∞`, 2.2 gives `FT M = D/D(∂_t t)²`, since `τ∂_τ` goes to `−∂_t t = −(t∂_t + 1)`. At `t = 0` the generator `e` and `(t∂_t + 1)e` span `gr^V_1`, where `N = −(t∂_t + 1)` is one Jordan block of size two. At infinity, with `s = 1/τ` and `τ∂_τ = −s∂_s`, the generator lies in `gr^V_0` and `N = −s∂_s = τ∂_τ`, which the operator correspondence sends to `−(t∂_t + 1)`, the `N` at the output origin. The other Checks have `N = 0` and do not see this normalization.

### 11.6 Monodromy weights at infinity of the projector

**Theorem.** Let `M^H` be a polarizable pure Hodge module of weight `w` with no constant subobject, and `0 → M → Π M → M″ → 0` as in 11.4. Put `Ψ = ψ_{∞,1} Π M` with `L_k Ψ = ψ_{∞,1}(W_{k+1} Π M)`. The weight filtration of `Ψ` is the monodromy filtration of `N` centred at `w`. On underlying nilpotent spaces `im N = ψ_{∞,1} M`, the inclusion with its shift being the variation comparison. For `k ≥ 0` put `P_k = ker[N^{k+1} : gr^W_{w−1+k} ψ_{∞,1} M → gr^W_{w−3−k} ψ_{∞,1} M(−k−1)]`. Then `W_{w+1} M″` is the constant variation with fibre `H⁰(P¹, pDR M_min)`, where `M_min` is the pure intermediate extension to `P¹`, and `gr^W_{w+k+2} M″` is the constant variation with fibre `P_k(−1)`. Every primitive part `P_k` is kept; a single Jordan block is not assumed (MT, Proposition A.3, Lemmas A.2 and A.4 and the complete proof, pp. 36–40, especially (A.1)–(A.7); FSY, Proposition 2.21, pp. 16–18). The central weight is `w` for `ψ_∞ Π M` and `w − 1` for `ψ_∞ M`. *Proof route:* the long exact global sequence and `RΓ(Π M) = 0` give the constant fibre `H⁰(A¹, pDR M)`; intermediate extension to `P¹` and the boundary cokernel of `N` split its graded pieces into `H⁰(P¹, pDR M_min)` and the `P_k(−1)`; 11.5 and semisimplicity identify `im N` with the original nearby space; the primitive decomposition (LefschetzPencilsAndVanishingCycles §1.4) compares the relative and absolute monodromy graded pieces, and purity and symmetry force `W = M(N)[w]`. *Needs:* 11.4, 11.5; 4.4, 4.5; 5.3; 6.2, 6.4; LefschetzPencilsAndVanishingCycles §§1.3, 1.4, 1.5.

**Checks.**

- For `M = δ_0 ℚ` (`w = 0`), `Π M = K`, `ψ_{∞,1} K = ℚ` with `N = 0`, of weight `0 = w`, and `M″ = pℚ_{A¹}` with fibre `H⁰(P¹, pDR δ_0) = ℚ` in weight `w + 1 = 1`; no `P_k` occurs since `ψ_∞ δ_0 = 0`.
- A direct sum of two inputs whose nearby cycles at infinity have Jordan blocks of different lengths must produce two constant weight pieces of `M″`, in the weights `w + k + 2` for the two values of `k`.
- Keeping only the eigenvalue-one part of `ψ_∞ M` is correct here, but a single-block assumption is not: for an input with blocks of sizes one and three, `P_0` and `P_2` are both nonzero.

### Examples

For `M = pℚ_{A¹}` the Fourier cohomology is `H¹ = ℚ(−1)`, which is `H¹ i_0^! pℚ`, while the stalk `ℚ[1]` has a different degree and twist. For `M = δ_0 V` the Fourier cohomology is `V` in degree `0`.

### Dependencies

11.1 needs 10.1, 9.1, 9.2, 2.2, 2.5 and 8.2; 11.2 needs 11.1, 10.1, 5.1, 8.2, 6.5 and 2.2; 11.3 needs 11.2, 5.3, 5.4 and 4.4; 11.4 needs 6.2, 6.4, 4.4, 5.2, 11.3 and 7.6; 11.5 needs 2.2, 2.4, PadicDifferentialEquationsAndRigidCohomology §RD.6.52a, 1.4, 4.2 and 5.3; 11.6 needs 11.4, 11.5, 4.4, 4.5, 5.3, 6.2, 6.4 and LefschetzPencilsAndVanishingCycles §§1.3–1.5.

## Layer 12: Logarithmic and Newton descriptions of the filtration

This layer constructs the pole-order logarithmic filtration on good and non-degenerate compactifications and proves its blow-up invariance, model independence, `E₁`-degeneration and agreement with the irregular Hodge filtration of Layer 9. For a full-dimensional Newton-nondegenerate Laurent polynomial it constructs the Newton complex and proves graded acyclicity, the Adolphson–Sperber concentration and volume theorem, and the Newton–Hodge comparison. For a convenient nondegenerate Laurent polynomial it proves that the cone of `h_! pℚ → h_* pℚ` has constant cohomology. It ends with the filtered Künneth and duality theorems.

### 12.1 The logarithmic pole-order complex

**Construction.** A good compactification of `(U, f)` is a smooth projective `X ⊃ U` with `D = X ∖ U` a simple normal crossing divisor (SchemeAndStackFoundations §4.17) such that `f` extends to `f : X → P¹`; write `P` for its pole divisor with multiplicities and `D = P_red + T`. The decreasing rational filtration of the twisted logarithmic complex is `(F^λ_log DR_f)^q = 0` for `q < λ` and `Ω^q_X(log D)(⌊(q − λ)P⌋)` for `q ≥ λ`, with differential `d + df ∧`; for `λ ≤ 0` it is quasi-isomorphic to `DR(U, E^f)`. For compact supports use the logarithmic complex twisted by `O(−T)`, keeping the pole components. Also allow non-degenerate compactifications whose local model at the indeterminacy locus is `f = z/x^e`, with transverse zero and pole divisors, besides the pole model `1/x^e` (Yu, §1(a)–(c), pp. 4–8, the logarithmic complex on p. 8; §2, pp. 14–16; §4(b), pp. 27–31; ESY, §1.2, pp. 5–6; Proposition 1.7.4 and Corollary 1.7.6, pp. 17–18). `P` has its actual multiplicities. *Proof route:* a good model from an SNC compactification of `U` by principalizing the indeterminacy ideal of `f`; `d + df ∧` preserves the degree-dependent pole bounds; the local exponential Koszul computation compares the meromorphic and logarithmic complexes; the compact variant by extension by zero along `T` and meromorphic extension along `P`. *Needs:* 2.1; 9.2; ResolutionOfSingularitiesCharacteristicZero §§5.1, 6.2; ComplexComparisonPartII §C5.6 (`regularSingularDeRhamComparison`) for the case `f = 0`.

API:

- The `q`-th term is `Ω^q(log D)(⌊(q − λ)P⌋)` for `q ≥ λ` and zero for `q < λ`.
- The full complex computes `H^•_dR(U, E^f)`, and its `O(−T)`-twist computes compactly supported cohomology.
- The filtration is decreasing and its jumps lie in `(1/m)ℤ` for `m` the least common multiple of the pole multiplicities.
- For `f = 0` it is the Hodge filtration of the logarithmic de Rham complex.

**Checks.**

- For `(pt, 0)`, `F⁰ = ℂ` and `F^λ = 0` for every `λ > 0`.
- For `x` on `A¹ ⊂ P¹`, `P = {∞}` with multiplicity one and the degree-`q` twist is `⌊q − λ⌋ {∞}`; for `x^m` the twist is `⌊m(q − λ)⌋ {∞}`, allowing jumps in `(1/m)ℤ`.
- For `f = x` on `G_m ⊂ P¹`, the horizontal boundary is `{0}` and the pole boundary `{∞}`; the compact filtration twists by `−{0}`, not by `−{0} − {∞}`, which would change the pole contribution.

### 12.2 Filtered comparison under the toric blow-ups

**Theorem.** For the blow-up resolving an indeterminacy stratum of a non-degenerate model `f = z/x^e`, along a smooth boundary stratum of the intersection of the zero and pole divisors as in Yu §4(b), the pullback comparison of the `F^λ_log` complexes is a filtered quasi-isomorphism after direct image, for every rational `λ`, and likewise with the compact-support twist. In Yu's interpolation between the pulled-back complex and the complex of the new pole divisor, the centre `Ξ` has codimension two (a component of the transverse intersection of the zero divisor with a pole component, Yu, Proposition 4.3, p. 27), the exceptional divisor `E` is a `P¹`-bundle over `Ξ`, and the successive quotients are sums of `O_E(−1)`, whose derived direct images to `Ξ` vanish (Yu, Proposition 4.4, Lemma 4.5 and proof, pp. 29–31). It is not a statement about arbitrary blow-ups. *Proof route:* the two affine charts, the transformed zero and pole divisors and multiplicities; the intermediate complexes with exceptional pole bounds; local exponential Koszul exactness reduces the quotients to `O_E(−1)`; `X̃` is smooth (SchemeAndStackFoundations §5.5, gap:blowup-exceptional-divisor); import `E = P(N_{Ξ/X})`, `O_X̃(−E)|_E = O_E(1)` and `R(π|_E)_* O_E(−1) = 0` from SchemeKTheoryOperations §5.7 (its vanishing for `1 ≤ μ ≤ c − 1` in the case of codimension `c = 2` and twist `μ = 1`, with `G = O_Ξ`), and apply this vanishing to the successive quotients; the projection formula for the compact variant. *Needs:* 12.1; SchemeKTheoryOperations §5.7; SchemeAndStackFoundations §§2.18, 4.11, 5.5 (gap:blowup-exceptional-divisor).

**Checks.**

- The floor must be recomputed with the transformed pole multiplicities on both charts: for `z/x` blown up at `z = x = 0`, the chart `z = x z′` gives `f = z′` with no pole, and the chart `x = z x′` gives `1/x′` with pole multiplicity one along `x′ = 0` and none along the exceptional divisor.
- The centre is the transverse intersection of two divisors, so it has codimension two, the fibres of `E → Ξ` are `P¹`, and the only twist is `−1`: for a point blown up in a surface, `H⁰(P¹, O(−1)) = H¹(P¹, O(−1)) = 0`. A centre of codimension three, with fibre `P²` and a twist `−2`, does not occur in this construction.
- The twist `−1` cannot be replaced by `−2`: `H¹(P¹, O(−2)) = ℂ ≠ 0`, so a quotient `O_E(−2)` would survive the direct image and the comparison would fail.
- The sign of the exceptional twist is fixed by `O_X̃(−E)|_E = O_E(1)`: for the blow-up of `A²` at the origin, `E = P¹` has self-intersection `−1`, so `O_X̃(E)|_E = O_{P¹}(−1)`. With the opposite convention `O_X̃(E)|_E = O_E(1)` the quotients would read `O_E(1)`, whose direct image to `Ξ` is the conormal sheaf `I/I²`, of rank two, and the comparison would fail.

### 12.3 Model independence and the Deligne comparison

**Theorem.** For any two good compactifications, the image filtrations on `H^r_dR(U, E^f)` and on its compact variant agree under the canonical identifications, because on each model the image filtration is `F_irr` of 9.2; on non-degenerate compactifications the same filtration is obtained before resolving indeterminacy. The spectral sequences degenerate at `E₁`, so `H^r(F^λ_log) → H^r(DR)` is injective, and the construction is functorial for the proper direct images defining pair cohomology (Yu, Lemma 1.6, p. 9; Theorem 1.7 and Corollary 1.8, pp. 10–12; Proposition 4.4, pp. 29–31; ESY, Theorem 1.2.2, p. 6; §1.7, Proposition 1.7.4 and Corollary 1.7.6, pp. 16–18; §§3.3–3.4, pp. 25–26). Independence of the model is deduced from the identification with `F_irr` on each model; Yu's proof through weak factorization is not used. *Proof route:* on a fixed good model identify the logarithmic filtration with the Deligne filtration of the localized module (ESY Proposition 1.7.4, Corollary 1.7.6); 12.2 passes from the non-degenerate model; the graph construction, 7.5 and projective direct image identify the image filtration with the filtered fibre of 9.2; duality for compact supports. *Needs:* 12.1, 12.2; 7.1, 7.2, 7.5; 9.2, 9.3.

**Checks.**

- For `(A¹, x)` the complex on `P¹` has `H^•` zero for every `λ`, consistent with 9.6.
- For `(G_m, x)` on `P¹`, `H¹(F^λ_log)` is `ℂ` for `λ ≤ 1` and `0` for `λ > 1`, the jump of `I(ℚ(−1))`; with the compact twist the jump is at `0`.
- The agreement includes all rational steps: for `(A¹, x²)` both models give the single jump `1/2`, not only the same dimension.

### 12.4 The Newton complex of a Laurent polynomial

This subsection fixes the objects of the headline theorem 12.6. Let `LaurentRing` `n` be the Laurent polynomial ring `ℂ[x₁^{±1}, …, x_n^{±1}]`, the additive monoid algebra of `ℤ^n`, and `φ = Σ_m a_m x^m` an element.

**Definition (Euler derivations and the twisted de Rham complex).** Define `eulerDerivation` `i`, the derivation `θ_i = x_i ∂/∂x_i` multiplying `x^m` by `m_i`, and `twistedEuler` `φ i = θ_i + θ_i(φ)`. Algebraic `q`-forms on the torus are written in the basis `dlog x_J`, `J ⊂ {1, …, n}` of cardinality `q` (`forms`); the twisted differential `twistedDifferential` is `(dω)_J = Σ_{j ∈ J} (−1)^{#{i ∈ J : i < j}} (θ_j + θ_j φ) ω_{J ∖ {j}}`, the differential `d + dφ ∧` of `DR(T, E^φ)`; `cocycles` and `coboundaries` are its closed and exact `q`-forms, the latter zero in degree `0`; and `topCohomology` is the quotient of the Laurent ring by the sum of the images of the twisted Euler operators, the degree-`n` cohomology.

API:

- `θ_i` is a derivation, the `θ_i` commute, and `θ_i(x^m) = m_i x^m`.
- The twisted Euler operators commute, so `twistedDifferential` squares to zero and the complex is the Koszul complex of `(θ_1 + θ_1 φ, …, θ_n + θ_n φ)` on the Laurent ring.
- Under `dlog x_J ↦ ∧_{j∈J} dx_j/x_j`, the complex is the algebraic de Rham complex `(Ω^•(T), d + dφ ∧)`, whose cohomology is `H^•_dR(T, E^φ)`.
- In degree `n` every form is closed, and `topCohomology` is `H^n_dR(T, E^φ)`.

**Checks.**

- For `n = 1` and `φ = x`, `twistedEuler` sends `x^m` to `m x^m + x^{m+1}`; its cokernel is spanned by the class of `1` (all `x^k`, `k ≥ 1`, are exact, and `x^{−k}` reduces to a multiple of `1`), so `topCohomology` is one-dimensional, in agreement with the Euler–Poincaré formula of PadicDifferentialEquationsAndRigidCohomology §RD.6.53 (`χ(G_m) = 0`, `Irr_0 = 0`, `Irr_∞ = 1`, `H⁰ = 0`).
- For `φ = 0` the complex is the Koszul complex of `θ_1, …, θ_n` on `ℂ[x^{±1}]`, whose cohomology in degree `q` is spanned by the constant forms `dlog x_J`, `#J = q`: the cohomology of `(G_m)^n`, of dimension `C(n, q)`. For `n ≥ 1`, `Δ(0) = {0}` is not full dimensional, consistent with the hypothesis of 12.6: for `n = 1`, `topCohomology` is `ℂ[x^{±1}]/θℂ[x^{±1}] = ℂ·1` and `H⁰` is also `ℂ`, so cohomology is not confined to the top degree. For `n = 0`, `ℝ⁰ = {0}`, so `affineSpan ℝ {0} = ⊤` and `{0}` is full dimensional; the complex is `ℂ` in degree `0 = n`, of dimension `1 = 0! · vol({0})`, and 12.6 applies.
- For `n = 2`, with every sign replaced by `+1`, `d²(ω)_{12}` would equal `2 (θ_1 + θ_1φ)(θ_2 + θ_2φ) ω_∅`, not zero; with the sign `(−1)^{#{i ∈ J : i < j}}` it is `D_1 D_2 ω_∅ − D_2 D_1 ω_∅ = 0`.

**Definition (Newton polytope and nondegeneracy).** Let `latticePoint` send `m ∈ ℤ^n` to `ℝ^n`, and `newtonPolytope` `φ` be `Δ(φ) = conv({0} ∪ supp φ)`. For a subset `σ ⊂ ℝ^n` let `faceEulerEval` `φ σ j z` be `θ_j φ_σ` evaluated at `z ∈ ℂ^n`, where `φ_σ = Σ_{m ∈ σ} a_m x^m`. `IsNewtonNondegenerate` `φ` means: for every nonempty exposed face `σ` of `Δ(φ)` not containing `0`, the functions `θ_1 φ_σ, …, θ_n φ_σ` have no common zero on `(ℂ^×)^n`. Since `0 ∈ Δ(φ) ∖ σ`, the face is cut out by a functional `ℓ` with `ℓ = c > 0` on `σ`, and `Σ ℓ_i θ_i φ_σ = c φ_σ`; so the condition is equivalent to Yu's, which also requires `φ_σ = 0` (Yu, §4(a), Definition, p. 25). Faces of a polytope are exactly its exposed faces. The cone `C_Δ` generated by `Δ` and the gauge `h(m) = inf{a ≥ 0 : m ∈ aΔ}` define the Newton filtration: `F^λ_Newton` in degree `q` is zero for `q < λ` and otherwise spanned by `x^m dlog x_I` with `m ∈ C_Δ` and `h(m) ≤ q − λ` (Yu, (24)–(25), pp. 25–26; FSY, §4.3.1, p. 35). Convenience means `0` lies in the interior of `Δ`. *Needs:* Mathlib `AddMonoidAlgebra`, `AddMonoidAlgebra.coeffLinearEquiv`, `convexHull`, `affineSpan`, `IsExposed`, `MeasureTheory.volume`; AnalyticToricGeometry Layer 0 (items 1, 2 and 6: the integral lattice `ℤ^n ⊂ ℝ^n`, the cone `C_Δ` and the semigroup of its lattice points); AnalyticToricGeometryPartII §0.3 (gap:toric-normal-fan); PadicDifferentialEquationsAndRigidCohomology §RD.6.53 for the first Check.

API:

- `Δ(φ)` is a lattice polytope containing `0`; `h` is rational piecewise linear and subadditive on `C_Δ`, and every exponent of `φ` has `h ≤ 1`, so `d + dφ ∧` preserves `F^λ_Newton`.
- `x^m dlog x_I` of degree `q` lies in `F^λ_Newton` exactly when `q ≥ λ`, `m ∈ C_Δ` and `h(m) ≤ q − λ`.
- For rational `a ≥ 0`, on a smooth complete toric refinement of the normal fan of full-dimensional `Δ`, the span of `x^m` with `m ∈ C_Δ ∩ ℤ^n` and `h(m) ≤ a` is `H⁰(X_Σ, O(⌊aP⌋))` for the pole divisor `P` (AnalyticToricGeometryPartII §0.3 and gap:toric-normal-fan). This is the range `a = q − λ ≥ 0` in the filtered complex; for `q < λ` its term is defined to be zero.
- Nondegeneracy is the stated absence of common Euler-critical points on every face away from `0`.

**Checks.**

- For `φ = x` on `G_m`, `Δ = [0, 1]`, `C_Δ = ℝ_{≥0}` and `h(m) = m`; negative monomials are absent from the cone complex. At `a = 0` both the monomial span and `H⁰(P¹, O)` are `ℂ`; at `a = 1` both have basis `1, x`.
- For `n = 0` and constant `φ`, `Δ = {0}`, `h(0) = 0`, `X_Σ = pt` and `P = 0`. At `a = 0` both sides are `ℂ`. At `a = −1` the monomial span is zero but `H⁰(pt, O(⌊aP⌋)) = ℂ`, so the section identity is asserted only for `a ≥ 0`; the filtered term for `q < λ` remains zero.
- For `φ = x + x⁻¹`, `Δ = [−1, 1]`, `h(m) = |m|`, and `φ` is convenient; for `φ = (x + y)²` on `(G_m)²`, the edge from `(2, 0)` to `(0, 2)` has face polynomial `(x + y)²`, whose Euler derivatives vanish on `x + y = 0`, so `φ` is degenerate.
- For `φ` constant and `n ≥ 1`, `Δ = {0}` is not full dimensional; the empty set is an exposed face of every set, and the nonemptiness clause is what keeps it from making every `φ` degenerate. Convenience does not make `φ : T → A¹` proper: for `x + x⁻¹ + y + y⁻¹` on `(G_m)²`, convenient and nondegenerate, the fibre over `0` is a positive-dimensional affine curve (a correction of Yu, p. 26, which uses only the exhaustiveness of the Newton filtration).

### 12.5 Kouchnirenko's graded acyclicity

**Theorem.** Let `φ` be Newton nondegenerate with `Δ(φ)` full dimensional, and let `gr ℂ[C_Δ ∩ ℤ^n]` be the graded ring associated with the Newton filtration of the cone algebra (the filtration by the gauge `h`). Then (a) `gr ℂ[C_Δ ∩ ℤ^n]` is a Cohen–Macaulay ring of dimension `n`; (b) the classes of the face Euler derivatives, that is the leading forms of `θ_1 φ, …, θ_n φ`, form a regular sequence on it; (c) consequently the associated graded complex `gr_Newton` of the Newton complex, which is the cohomological Koszul complex of these leading forms acting by multiplication on `gr ℂ[C_Δ ∩ ℤ^n]`, has cohomology only in degree `n`, by `TauCeti.koszulComplex.exactAt_of_isWeaklyRegular` read through the self-duality of the Koszul complex, and that cohomology, the quotient of the graded ring by the leading forms (`TauCeti.koszulComplex.homologyZeroEquivSpan`), has dimension `n! · vol(Δ(φ))` (AS, (4.3), AS lines 442–445, quoting Kouchnirenko, Théorème 2.8; Yu, Theorem 4.1(ii), Yu lines 1408 and 1442). Top-degree concentration is not inferred from face nondegeneracy without the regular-sequence argument. *Proof route:* for every face `σ` of `Δ` not containing `0`, including the empty face, whose cone is `{0}`, the lattice points of the cone `C_σ` over `σ` form a finitely generated semigroup (Gordan, AnalyticToricGeometry Layer 0 item 6) that is saturated in the group it generates (GroebnerGeometry §G2), so its algebra `ℂ[C_σ ∩ ℤ^n]` is Cohen–Macaulay by Hochster's theorem (gap:normal-semigroup-cohen-macaulay; AS line 617 recalls it for one graded cone). The Newton-graded ring is the ring on the monomials `x^m`, `m ∈ C_Δ ∩ ℤ^n`, in which `x^m · x^{m′} = x^{m+m′}` when `m` and `m′` lie in the cone over a common such face, that is when `h(m + m′) = h(m) + h(m′)`, and `0` otherwise; Kouchnirenko's exact sequence relating it to the face algebras `ℂ[C_σ ∩ ℤ^n]` gives its Cohen–Macaulay property (Kou, §2). Cohen–Macaulayness of the cone algebra itself is not used: it does not pass to an associated graded ring in general; nondegeneracy says that the leading forms `F_1, …, F_n` have no common zero on any face away from `0`, so they form a homogeneous system of parameters and hence a regular sequence. The graded ring is then free over `ℂ[F_1, …, F_n]` on a homogeneous basis of the quotient `Q` by the `F_i`. All degrees lie in `e⁻¹ℕ` for a common denominator `e` of the values of `h`; with `H_gr(t) = Σ_{m ∈ C_Δ ∩ ℤ^n} t^{h(m)}`, the Hilbert series of `Q` is the polynomial `H_Q(t) = (1 − t)^n H_gr(t)` in `t^{1/e}`. The dimension of `Q` is its value `H_Q(1) = lim_{t→1}(1 − t)^n H_gr(t)`, not the series itself. To evaluate it for `n ≥ 1`, count the monomials of degree at most `k`: since `h(m) ≤ k` exactly when `m ∈ kΔ`, freeness gives `#(kΔ ∩ ℤ^n) = dim Q · k^n/n! + O(k^{n−1})`, while `#(kΔ ∩ ℤ^n)/k^n → vol(Δ)` (Mathlib `ZLattice.covolume.tendsto_card_div_pow`, the boundary of `Δ` being null by `Convex.addHaar_frontier`); hence `dim Q = n! · vol(Δ)`. *Needs:* 12.4; AnalyticToricGeometry Layer 0 (dual semigroups, item 6); GroebnerGeometry §G2 (saturation and normality of semigroup algebras) and gap:normal-semigroup-cohen-macaulay; SchemeAndStackFoundations §0.17 (depth, regular sequences and Cohen–Macaulay modules) and Tau Ceti `TauCeti.Ring.IsCohenMacaulay`; Tau Ceti `TauCeti.koszulComplex`, `TauCeti.koszulComplex.homologyZeroEquivSpan` and `TauCeti.koszulComplex.exactAt_of_isWeaklyRegular` with Mathlib `RingTheory.Sequence.IsWeaklyRegular`; Mathlib `ZLattice.covolume.tendsto_card_div_pow` and `Convex.addHaar_frontier`.

**Checks.**

- For `φ = x` on `G_m`, `gr ℂ[ℕ]` is a polynomial ring in one variable and `θφ_σ = x` on the face `{1}` is a nonzerodivisor.
- For `φ = (x + y)²`, degenerate, the face derivatives on the edge have the common factor `x + y`, are not a regular sequence, and graded cohomology appears in degree `1`.
- For `n = 0` the complex is `ℂ` in degree `0`, the top degree.
- For `φ = x²` on `G_m`, `Δ = [0, 2]` and `h(m) = m/2`, so `gr ℂ[ℕ] = ℂ[x]` with `x` of degree `1/2` and `H_gr(t) = 1/(1 − t^{1/2})`. The leading form `2x²` has degree one, and the quotient `ℂ[x]/(x²)` has basis `1, x`, Hilbert series `(1 − t)H_gr(t) = 1 + t^{1/2}` and dimension `2 = 1! · vol([0, 2])`, which is `dim H¹_dR(G_m, E^{x²})` (irregularity two at `∞`). The series `1 + t^{1/2}` is not the number `2`; only its value at `t = 1` is.
- For `φ = x + x⁻¹`, `Δ = [−1, 1]` and the faces not containing `0` are `{1}`, `{−1}` and the empty face, with face algebras `ℂ[x]`, `ℂ[x⁻¹]` and `ℂ`. In the graded ring `x · x⁻¹ = 0`, since `h(0) = 0 < 2`, so it is `ℂ[x, y]/(xy)` with `y` the class of `x⁻¹`: Cohen–Macaulay of dimension one, though not a domain, and not the Laurent ring `ℂ[x^{±1}]`, in which `x · x⁻¹ = 1`. The leading form `x − y` of `θφ` lies in neither minimal prime `(x)`, `(y)`, so it is a nonzerodivisor, and `ℂ[x, y]/(xy, x − y) = ℂ[x]/(x²)` has dimension `2 = 1! · vol([−1, 1])`.
- Hochster's theorem needs saturation: the semigroup `S ⊂ ℕ²` generated by `(4, 0)`, `(3, 1)`, `(1, 3)`, `(0, 4)` contains `(4, 4) = 2 · (2, 2)` but not `(2, 2)`, which lies in its group. Its algebra `k[s⁴, s³t, st³, t⁴]` has dimension two and depth one: `t⁴ · s⁶t² = s⁴ · s²t⁶`, but `s⁶t²` is not in `s⁴ k[S]`, so the parameters `s⁴, t⁴` are not a regular sequence. The face semigroups `C_σ ∩ ℤ^n` are saturated by construction.

### 12.6 Concentration and volume of twisted de Rham cohomology on a torus

**Theorem** (`twistedDeRham_concentration_finrank`). Let `φ ∈ LaurentRing n` with `Δ(φ)` full dimensional (its affine span is `ℝ^n`) and `IsNewtonNondegenerate φ`. Then the twisted de Rham complex `(Ω^•(T), d + dφ ∧)` of the torus `T = (G_m)^n` is exact outside degree `n`, and `H^n_dR(T, E^φ)` is finite dimensional of dimension `n! · vol(Δ(φ))`, the volume normalized so that `ℤ^n` has covolume one. Moreover, for every `λ ≤ 0` the inclusion of the Newton-filtered subcomplex `F^λ_Newton` of 12.4 into the Laurent complex is a quasi-isomorphism, and the spectral sequence of the Newton filtration degenerates at `E₁` (AS, Theorem 4.13, p. 73, AS lines 569–573, and Theorem 5.1, p. 74, AS lines 583–590, with `r = 0` and `a = 0`; Theorem 4.1, p. 67, AS lines 395–398, is the same statement for the cone-algebra complex, the input of 12.5; Yu, Theorem 4.1 and Corollary 4.2, Yu lines 1397–1416). Full dimension is necessary: if `φ` is constant along a subtorus, ordinary cohomology of that subtorus appears. In Lean the conclusion is stated as `cocycles φ r ≤ coboundaries φ r` for `r ≠ n`, finite dimensionality of `topCohomology φ`, and the equality of its dimension with `n.factorial · volume (newtonPolytope φ)`. *Proof route:* 12.5 gives graded acyclicity outside degree `n`; the dimension of the graded cone algebra modulo the regular sequence, the value at `t = 1` of its Hilbert series, is the normalized volume (12.5 (c)); filtered acyclicity compares the cone and Laurent complexes and degenerates the spectral sequence. *Needs:* 12.4, 12.5; AnalyticToricGeometry Layer 0.

**Checks.**

- For `φ = x` on `G_m`, `n! vol = 1` and `dim H¹ = 1`; for `x + x⁻¹`, `n! vol = 2` and `dim H¹ = 2`, in agreement with PadicDifferentialEquationsAndRigidCohomology §RD.6.53, since `E^{x+x⁻¹}` has irregularity one at `0` and at `∞` and no horizontal sections.
- For `φ = x₁ + ⋯ + x_n`, `Δ` is the standard simplex of volume `1/n!`, so `dim H^n = 1`, matching 9.6.
- For `φ = x` on `(G_m)²`, `Δ` is a segment and the hypothesis fails; indeed `H^•_dR = H^•(G_m, E^x) ⊗ H^•(G_m)` has `H¹` and `H²` both one-dimensional, so cohomology is not confined to degree two. For `n = 0`, `φ` is a constant `c`, `Δ = {0}` is full dimensional in `ℝ⁰`, and `H⁰ = ℂ` has dimension `0! · 1`.

### 12.7 Newton and irregular Hodge filtrations agree

**Theorem.** For every full-dimensional Newton-nondegenerate Laurent polynomial `φ` and every rational `λ`, `F^λ_irr H^n_dR(T, E^φ)` is the image of `H^n(F^λ_Newton)`. In particular, for `m ∈ C_Δ` with `h(m) ≤ n − λ`, the class of `x^m dlog x₁ ∧ ⋯ ∧ dlog x_n` lies in `F^λ_irr`. The equality of image filtrations does not depend on the toric refinement or the resolution of indeterminacy, and it does not assert that these monomials form a basis (Yu, Proposition 4.3, p. 27; Proposition 4.4 and Lemma 4.5, pp. 29–31; Theorem 4.6, p. 31; FSY, §4.3.1, p. 35). Convenience is not required. *Proof route:* on a regular refinement of the normal fan, the Newton complex is the global logarithmic pole-order complex, and toric vanishing (gap:toric-rounded-vanishing) shows that global sections compute hypercohomology; zero and pole divisors meet transversally by nondegeneracy (Yu, Proposition 4.3), so the toric model is non-degenerate; 12.2 resolves the indeterminacy and 12.3 identifies the image filtration with `F_irr`. *Needs:* 12.1, 12.2, 12.3, 12.4, 12.6; AnalyticToricGeometry Layer 0; AnalyticToricGeometryPartII §0.3 (gap:toric-normal-fan, gap:toric-rounded-vanishing).

**Checks.**

- For `φ = x` on `G_m`, `x⁰ dlog x` has `h = 0 ≤ 1 − λ` exactly for `λ ≤ 1`, so `F^λ_irr H¹ = H¹` for `λ ≤ 1` and the jump is at `1`, matching `I(ℚ(−1))`.
- For `φ = x + x⁻¹`, `dlog x` has `h = 0` and `x^{±1} dlog x` have `h = 1`; the jumps are `0` and `1` once a basis of `H¹` is extracted, which is a separate computation.
- The implication bounds the filtration of a class, including the class zero; it gives no linear independence.

### 12.8 The constant boundary correction of a Laurent Gauss–Manin system

**Theorem.** For a convenient Newton-nondegenerate Laurent polynomial `h : T = (G_m)^n → A¹`, the cone of `h_! pℚ_T → h_* pℚ_T` has constant cohomology mixed Hodge modules. Consequently `Π H⁰ h_! pℚ_T ≅ Π im(H⁰ h_! pℚ_T → H⁰ h_* pℚ_T) ≅ Π H⁰ h_* pℚ_T`; the central compact-to-ordinary map of the pair `(T, h)` is an isomorphism after `Π`, and the central invariant is pure of exponential weight `n` (DL, §§3.3–3.7 and the proof in §3.9(c), pp. 280–282, whose finite-field constancy step is replaced here by simple connectedness of `A¹`; FSY, proof of Proposition 2.21, pp. 16–18). Both convenience and nondegeneracy are required; `h` need not be proper. *Proof route:* close the graph `h − θ = 0` in a smooth proper toric refinement; Denef–Loeser's face computation gives a proper graph compactification smooth over the boundary strata, whose boundary maps have no vanishing cycles over `A¹`; proper base change and the boundary-strata Čech resolution make every boundary direct image a local system on `A¹`, constant because `A¹` is simply connected; 5.6 upgrades it to a constant mixed Hodge module; the boundary localization triangle identifies these with the cone; exactness of `Π` and 9.4. *Needs:* 12.4; AnalyticToricGeometry Layer 0; 1.2; 5.1, 5.6; 6.2; 9.4.

**Checks.**

- For `h = x` on `G_m`, convenience fails, and indeed `H¹_c = I(ℚ)` and `H¹ = I(ℚ(−1))` are not isomorphic: the comparison cannot be deduced from nondegeneracy alone.
- For `h = x + x⁻¹`, convenience holds, the common central object has fibre of dimension two (12.6), and the compact-to-ordinary map is an isomorphism after `Π`.
- For `h = x + y + 1/(xy)` on `(G_m)²`, convenient and nondegenerate, the central object has fibre dimension `2! · vol = 3`, pure of exponential weight `2`.

### 12.9 Filtered Künneth and Poincaré duality

**Theorem.** For smooth quasi-projective pairs `(U, f)` and `(V, g)`, the Künneth isomorphism of 9.3 identifies `F^λ_irr H^r(U × V, f ⊞ g)` with `⊕_{a+b=r} Σ_{α+β=λ} F^α_irr H^a(U, f) ⊗ F^β_irr H^b(V, g)`, and likewise for compact supports. For `U` of dimension `d`, the perfect pairing `H^r_c(U, f) ⊗ H^{2d−r}(U, −f) → ℂ` of 9.3 identifies the rational filtration with its dual: the annihilator of `F^λ` on the compact factor is `F^{>d−λ}` on the ordinary factor, where `F^{>a} = Σ_{b>a} F^b`. These are statements for constant coefficients (CY, Theorem 1, pp. 1–2; §§3.1–3.2, pp. 7–11; Yu, Theorem 2.2 and its proof, pp. 14–16). *Proof route:* start from the product of two good models. On each intermediate model `Y`, write `a_D` and `b_D` for the pole multiplicities of the pulled-back `f` and `g` along a boundary component `D`; while some pair of distinct meeting components `D₁`, `D₂` has `(a_{D₁} − b_{D₁})(a_{D₂} − b_{D₂}) < 0`, blow up `D₁ ∩ D₂` for a pair at which this product is smallest. When no such pair remains, the zero divisor of `f ⊞ g` is smooth near the boundary and meets it transversally, so the model is non-degenerate (CY §3.1, p. 8, the quantity `Δ_Y(D₁, D₂)`, and the termination argument there); on intermediate models use the convex combinations `Σ_{0≤θ≤1} O(⌊μ((1 − θ)P_f + θP_g)⌋)`, whose blow-up quotients are sums of `O_E(−1)` with vanishing direct image (SchemeKTheoryOperations §5.7, applied as in 12.2), checking pushforward on the finite monomial resolution although the sum need not be locally free (CY §3.2); the coherent external-product computation (Tor-independent base change and Čech complexes) and `E₁`-degeneration of both factors identify the convolution filtration, transferred by 12.3; for duality pair the logarithmic complex with its horizontal compact twist via residues and Serre duality, with the strict inequality at a rational jump, and dualize the ordinary Künneth statement for compact supports. *Needs:* 12.1, 12.2, 12.3; 9.3; 7.5; SchemeAndStackFoundations §§2.2, 2.6, 2.18, 2.20.

**Checks.**

- The torus-sum examples give `F^k H^k = H^k` with jump `k` for the ordinary groups and `F⁰ H^k_c = H^k_c` with jump `0` for the compact groups, and the annihilator rule pairs jump `0` with jump `k = d`.
- For `(A¹, x²)` the jump is `1/2`, and for `(A², x² + y²)` it is `1 = 1/2 + 1/2`; rounding each factor to an integer before adding would give `0` or `2`.
- For `(G_m, x)`, `d = 1`: the compact jump `0` and the ordinary jump `1` satisfy `ann F^λ = F^{>1−λ}`: for `λ ≤ 0`, `F^λ H_c = H_c` and its annihilator is `0 = F^{>1−λ} H` since `1 − λ ≥ 1`.
- The blow-up criterion compares differences of pole orders, not their signs. For `f = 1/x` on `G_m` and `g = 1/y` on `G_m`, at the crossing of `x = 0` and `y = 0` the pole multiplicities are `(a, b) = (1, 0)` and `(0, 1)`, never of opposite signs, but the differences are `1` and `−1`, with product `−1 < 0`, so the crossing is blown up. Before the blow-up `f ⊞ g = (x + y)/(xy)` has zero divisor `x + y = 0` through the crossing point of the two pole components, three divisors through one point of a surface, so the product model is not non-degenerate. On the chart `y = xu` the sum is `(u + 1)/(xu)`, whose zero divisor `u = −1` meets the exceptional pole divisor `x = 0` transversally.

### Examples

For `φ = x` on `G_m`, the Newton cone has only nonnegative exponents and `H¹` is one-dimensional; for `φ = x + x⁻¹` the cone is the whole line, the height is `|m|` and `H¹` is two-dimensional; for `φ = x` on `(G_m)²` the polytope is not full dimensional and the ordinary cohomology of the unused variable appears. These separate full dimension, nondegeneracy and convenience.

### Dependencies

12.1 needs 2.1, 9.2, ResolutionOfSingularitiesCharacteristicZero §§5.1, 6.2 and ComplexComparisonPartII §C5.6; 12.2 needs 12.1, SchemeKTheoryOperations §5.7 and SchemeAndStackFoundations §§2.18, 4.11, 5.5 (gap:blowup-exceptional-divisor); 12.3 needs 12.1, 12.2, 7.1, 7.2, 7.5, 9.2 and 9.3; 12.4 needs Mathlib's monoid algebras and convex geometry, AnalyticToricGeometryPartII §0.3; 12.5 needs 12.4, AnalyticToricGeometry Layer 0, GroebnerGeometry §G2 (gap:normal-semigroup-cohen-macaulay), SchemeAndStackFoundations §0.17, Tau Ceti's Koszul complexes and Mathlib's lattice-point count; 12.6 needs 12.4 and 12.5; 12.7 needs 12.1–12.4, 12.6 and the toric suppliers; 12.8 needs 12.4, 1.2, 5.1, 5.6, 6.2 and 9.4; 12.9 needs 12.1–12.3, 9.3, 7.5 and SchemeAndStackFoundations §§2.2, 2.6, 2.18, 2.20.

## Downstream consumers

- **KloostermanMomentsAndPotentialAutomorphy** uses 2.4 (localized Fourier transformation of its recursive connections), Layers 6, 7 and 8 (the exponential realization and classicality), 10.1 and 11.1–11.6 (Fourier cohomology, costalks, Hodge numbers and the weights at infinity of `Π`), and 12.4–12.8 (Newton complexes and the constant Gauss–Manin correction). It owns its connections, polytopes, bases and Jordan blocks.
- **MappingClassGroupsAndCanonicalRepresentations** uses 3.1–3.3 (graded-polarizable variations, their limits and admissibility) and 5.6 (rigidity with constant local system), and states its real-coefficient variants as its own targets.
- **TopologicalMirrorSymmetryForHitchinSystems** uses 4.6, 5.1 and Layer 9 at `f = 0` for the compactly supported mixed Hodge realization of smooth quasi-projective varieties.
- **SheafConvolutionOnAbelianVarieties** needs, in its §§0.4, 0.9, 1.5 and 4.3, the equivalence between complexes with regular holonomic cohomology and `D^b_c(X, ℂ)`; that equivalence is 1.5.

## Worked examples

- **Tori sums.** For `(G_m, x)`, localization at `0` in `A¹` gives `H¹ = I(ℚ(−1))` and `H¹_c = I(ℚ(0))`; the comparison is zero because the weights differ. For `k` factors, `H^k((G_m)^k, Σ x_i) = I(ℚ(−k))` and `H^k_c = I(ℚ(0))`, all other groups zero; the ordinary filtration jumps at `k`, the compact one at `0`, the duality pairing lands in `I(ℚ(−k))`, and the de Rham dimension `1` is `k!` times the volume `1/k!` of the standard simplex (12.6). This checks the degree normalization, the Tate signs, the two support theories and the classical filtration comparison together.
- **Costalk versus stalk.** For `M = pℚ_{A¹_τ}`, Fourier cohomology is `H¹ = ℚ(−1)`, which is `H¹ i_0^! pℚ`, since `i_0^! pℚ = ℚ(−1)[−1]`; the stalk `i_0^* pℚ = ℚ[1]` has a different degree and twist. For `M = δ_0 V`, Fourier cohomology is `V` in degree `0`.
- **Zero loci.** For `g = x` on `V = A¹`, the zero locus is a point, and `(A², tx)` has `H²_c = I(ℚ(−1))` and `H² = I(H²_{0}(A¹)) = I(ℚ(−1))`. For `g` invertible both groups vanish. For `g = 0`, ordinary cohomology is `H^r(V)` and compact cohomology `H^{r−2}_c(V)(−1)`; the smooth-divisor formula does not apply to this zero locus.
- **Newton polytopes.** For `φ = x` on `G_m`, the Newton cone has only nonnegative exponents and `H¹` has dimension one; for `φ = x + x⁻¹` the cone is the whole line, the height is `|m|` and `H¹` has dimension two; for `φ = x` on `(G_m)²` the polytope is not full dimensional and the ordinary cohomology of the unused variable prevents top-degree concentration.
- **Ambient versus exponential weights.** `K = Π δ_0 ℚ = j_! pℚ_{G_m}` is pure of exponential weight `0` with fibre `ℂ` and irregular jump `0`, while as a mixed Hodge module on `A¹` it has weights `0` and `1`.

## References

- **FSY.** J. Fresán, C. Sabbah, J.-D. Yu, *Hodge theory of Kloosterman connections*, Duke Math. J. 171 (2022), 1649–1747; arXiv:1810.06454v5, whose pagination is used. Appendix A.1–A.7, pp. 59–73; §2.1, Proposition 2.4; §2.3, Proposition 2.21, pp. 16–18; §4.3.1, p. 35.
- **ESY.** H. Esnault, C. Sabbah, J.-D. Yu, *E₁-degeneration of the irregular Hodge filtration* (with an appendix by M. Saito), J. reine angew. Math. 729 (2017), 171–227; arXiv:1302.4537. §§1.2, 1.7, 2.1–2.4, 3.1–3.4, Appendices A–B.
- **Yu.** J.-D. Yu, *Irregular Hodge filtration on twisted de Rham cohomology*, Manuscripta Math. 144 (2014); arXiv:1203.2338v2. §1, Lemma 1.6, Theorem 1.7, Corollary 1.8; §2, Theorem 2.2; §4, Theorems 4.1 and 4.6, Corollary 4.2, Propositions 4.3 and 4.4, Lemma 4.5.
- **KS.** M. Kontsevich, Y. Soibelman, *Cohomological Hall algebra, exponential Hodge structures and motivic Donaldson–Thomas invariants*, arXiv:1006.2706v2. §§4.2–4.4, Definitions 7, 8, 11, 12, Propositions 2–4.
- **MT.** Y. Matsui, K. Takeuchi, *Monodromy at infinity of polynomial maps and Newton polyhedra* (appendix by C. Sabbah), arXiv:0912.5144v12. Appendix, Lemmas A.2 and A.4, Proposition A.3, pp. 34–40.
- **Sab10.** C. Sabbah, *Fourier–Laplace transform of a variation of polarized complex Hodge structure, II*, Adv. Stud. Pure Math. 59 (2010), 289–347; arXiv:0804.4328. §6, Theorem 6.1 and Proposition 6.10.
- **Sab05.** C. Sabbah, *Polarizable twistor D-modules*, Astérisque 300 (2005); arXiv:math/0503038. §§1.6, 3.1–3.3, 4.1–4.2, Theorem 5.0.1, §6.1, §8.4.
- **Sai88.** M. Saito, *Modules de Hodge polarisables*, Publ. RIMS 24 (1988), 849–995. §§1.1, 2.1–2.2, 3.1–3.2, 3.4, 5.1–5.3.
- **Sai90.** M. Saito, *Mixed Hodge modules*, Publ. RIMS 26 (1990), 221–333. Introduction, §§2.2–2.4, 2.9–2.11, 2.17, 3.29, 4.1–4.5.
- **Kash76.** M. Kashiwara, *B-functions and holonomic systems*, Invent. Math. 38 (1976), 33–53.
- **Kash84.** M. Kashiwara, *The Riemann–Hilbert problem for holonomic systems*, Publ. RIMS 20 (1984), 319–365. §§6–7.
- **Kash86.** M. Kashiwara, *A study of variation of mixed Hodge structure*, Publ. RIMS 22 (1986), 991–1024. §1.
- **Dimca.** A. Dimca, *Sheaves in Topology*, Universitext, Springer, 2004. §§3.2–3.3, 4.1–4.2, 5.1–5.3.
- **Verdier.** J.-L. Verdier, *Stratifications de Whitney et théorème de Bertini–Sard*, Invent. Math. 36 (1976), 295–312.
- **Schmid.** W. Schmid, *Variation of Hodge structure: the singularities of the period mapping*, Invent. Math. 22 (1973), 211–319. Theorems 4.9 and 6.16, §6.
- **SZ.** J. Steenbrink, S. Zucker, *Variation of mixed Hodge structure. I*, Invent. Math. 80 (1985), 489–542. §§1–4.
- **Zucker.** S. Zucker, *Hodge theory with degenerating coefficients: L₂ cohomology in the Poincaré metric*, Ann. of Math. 109 (1979), 415–476. Theorem 4.8; §§5–8.
- **AS.** A. Adolphson, S. Sperber, *On twisted de Rham cohomology*, Nagoya Math. J. 146 (1997), 55–81. Theorem 4.13, Theorem 5.1, Theorem 4.1 and (4.3).
- **Kou.** A. G. Kouchnirenko, *Polyèdres de Newton et nombres de Milnor*, Invent. Math. 32 (1976), 1–31. §2, Théorème 2.8.
- **DL.** J. Denef, F. Loeser, *Weights of exponential sums, intersection cohomology, and Newton polyhedra*, Invent. Math. 106 (1991), 275–294. §§3.3–3.9.
- **CY.** K.-C. Chen, J.-D. Yu, *The Künneth formula for the twisted de Rham and Higgs cohomologies*, SIGMA 14 (2018), 055. Theorem 1; §§3.1–3.2.

