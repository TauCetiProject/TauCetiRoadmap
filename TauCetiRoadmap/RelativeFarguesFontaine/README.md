# Roadmap: relative Fargues–Fontaine curves and period geometry

**Summary.** Develop explicit period geometry over perfectoid bases using the supplied ramified coefficients, relative Fargues–Fontaine domains and curves. Prove Dwork and twisted-coordinate formulas, integral chart estimates, symmetric-divisor and multileg completion refinements, and linear and group-valued modification theorems. Identify modifications with completed-divisor lattices, compare the supplied relative `B`-pair equivalence with these interfaces, and give functorial gluing with precise descent hypotheses. Mixed characteristic, ramification and equal characteristic are kept separate whenever their proofs differ.

## Scope and ownership

The geometry is relative to the perfectoid base, permits a general local coefficient field, and retains the integral `π=0` end. TauCetiRoadmap.AdicSpaces owns rational presheaves (Layer 3), sheaf criteria (Layer 4), general adic gluing (Layer 5), and the absolute `ℚ_p` curve (Layer 6). The period-specific extension below proves comparison with that absolute object rather than rebuilding it. AdicSpacesPartII R0 owns completed analytic tensors. AdicSpacesPartIII R3 owns affinoid bundle comparison and rational/Kiehl descent; PerfectoidSpaces §§P3.17a.1–P3.17a.4 owns sousperfectoid frames, stability and sheaf criteria.

Tau Ceti provides the `p`-typical `(p,[ϖ])`-adic Huber topology in `TauCeti.RingTheory.Huber.WittVector`, with `isHuberRing_adicTopology_span_p_teichmuller` and `isTateRing_adicTopology_span_p_teichmuller_iff`, and its completeness in `TauCeti.RingTheory.WittVector.Complete`: `WittVector.isAdicComplete_span_p_teichmuller`, `TauCeti.WittVector.completeSpace_and_t2Space_adicTopology_span_p_teichmuller`, `Valuation.Integers.isAdicComplete_span_p_teichmuller` for `A_inf`, and the coordinate description of the powers of `(p,[ϖ])` (`WittVector.pow_dvd_coeff_of_mem_span_p_teichmuller_pow`, `WittVector.mem_span_p_teichmuller_pow_of_pow_dvd_coeff`). Its modules `TauCeti.AlgebraicGeometry.AdicSpace.FarguesFontaine.Y`, `.Window` and `.Quotient` provide `spaY`, the identification of the analytic locus of `Spa(W(R),A⁺)` with `D(p)∪D([ϖ])` (`mem_spaAnalytic_iff_of_isAdic`), `frobeniusHomeomorph`, `IsRadiusLowerBound`, `IsRadiusUpperBound`, the rational wandering windows and their cover, and `spaX`. In particular, `quotientMap_eq_iff`, `isOpenQuotientMap_quotientMap`, open embeddings of windows, compactness and the `T₀` property are existing inputs. Their `p`-typical carriers and topological theorems are excluded from the targets. VectorBundlesAndIsocrystals VB−1 supplies their relative all-`E` extensions; the retained targets add explicit estimates, integral-chart refinements and geometric comparisons.

TauCetiRoadmap.AlgebraicVectorBundles and Tau Ceti's `AlgebraicGeometry.VectorBundle` modules own scheme-level finite locally free bundles, ranks, affine finite-projective comparison, tensor products, duals and pullback. Those generic constructions are excluded. VectorBundlesAndIsocrystals VB−1 supplies the relative coefficients, integral period domain, annuli, analytic curve, generic Cartier legs and completions, twists and partial Proj charts. The work below adds explicit Dwork and twisted coordinates, integral-chart and integral-end refinements, symmetric-orbit and multileg descent, coefficient comparisons and modification gluing. General sites, tilts and diamond machinery belong to PerfectoidSpaces and DiamondsAndVStacks; their exact additional hypotheses are stated as contracts.

TauCetiRoadmap.LocalFieldsRamification supplies local fields and finite extensions (Layer 0), unramified extensions and Frobenius (Layer 2), and inertia (Layer 4). VectorBundlesAndIsocrystals VB3, `lubin-tate-universal-cover`, supplies the normalized Lubin–Tate formal module and its logarithm/period comparison. Section 2.5 constructs the marked torsion tower and its coefficient-unit Galois action. Section 0.23 supplies nonperfect-residue Cohen lifting from DerivedModuleAlgebra §§0.4–0.12 and §0.25's full cotangent-complex deformation theory; the perfect strict lift does not assert canonical Cohen lifts of nonperfect rings.

VectorBundlesAndIsocrystals owns the arbitrary-rank isocrystal functor and bundle cohomology (VB1), global generation, ampleness, global analytic-to-`Proj` comparison, tautological twists and classification (VB2), and spatiality/properness/cohomological smoothness of degree-one divisor moduli (VB3). Those results are excluded from the early targets. Its supplied partial section chart map is defined only on the section-covered open. The later `B`-pair applications explicitly consume the global comparison. VB4, `integral-frobenius-local-systems`, supplies the independent integral Frobenius foundation; AInfCohomology §AI.2.3 supplies the geometric no-leg equivalence; §6.14a proves normalized-tail compatibility.

ReductiveGroups Layer 1 owns field-valued representation reconstruction. PadicHodgeTheory §5.5 supplies the scheme-relative field tensor-isomorphism torsor dictionary. Section 7.0 glues it and extends the integral adic torsor dictionary needed for modifications, using the `ℤ_p` dictionary of VectorBundlesAndIsocrystals VB4, `integral-group-torsors`, in its stated scope. GeometricSatakeAndFusion, GS0 owns loop quotients and Grassmannians. This roadmap transfers the linear construction to torsors and supplies modifications to those consumers. AInfCohomology §AI.2.1 supplies regular-completion patching and geometric punctured-spectrum triviality, and §AI.2.3 supplies no-leg descent and analytic geometric-field extension. The target below proves general-perfect-Tate-base punctured Witt algebraicity; its integral-domain presentation is an application of that theorem, not a second target. The portable algebraic patching needed for Breuil–Kisin–Fargues modules can be used at the AInfCohomology foundation without depending on the whole relative curve.

## Conventions


### Coefficients and Witt vectors

Fix a prime `p`, a residue cardinality `q=p^f` and a nonarchimedean local field `E` with residue field `𝔽_q`. Its complete discrete valuation ring is `O_E` and its chosen uniformizer is `π`. The notation allows both mixed and equal characteristic. The affinoid base is `S=Spa(R,R⁺)`, perfectoid over `𝔽_q`; `ϖ` is a topologically nilpotent unit of `R`, lying in `R⁺`. General bases are handled by gluing over such affinoid opens.

For perfect input, consume VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`); `W_{O_E}(R⁺)` denotes the strict `π`-adically complete lift with residue `R⁺`, with the residue-field identification included. In equal characteristic this is `R⁺[[π]]`. In mixed characteristic, finite coefficient change tensors over the maximal unramified coefficient subring. It does not tensor two arbitrary `O_E`-actions without identifying that subring.

The arbitrary-algebra ramified Witt functor uses universal ghost polynomials in characteristic-zero coefficient situations. Ghost injectivity is only an argument on torsion-free universal inputs, not an axiom on every coefficient algebra. Coordinate extensionality and evaluation at torsion inputs are part of its API. A twisted polynomial `Q` must satisfy `Q≡X^q` modulo `π`. Its transported Teichmüller lift need not be multiplicative. The ordinary Teichmüller map `[−]` is multiplicative and is not an additive structural map `R→W_{O_E}(R)`.

Write `φ` for the coefficient-compatible `q`-Frobenius. Coefficient changes, Teichmüller lifts and Frobenius must be compared with Mathlib’s `p`-typical Witt constructions at the exact `ℚ_p` specialization. A Lubin–Tate torsion tower and the coefficient-root tower used to perfect an integral chart are distinct constructions.

### Three period loci and their topology

Put `A_inf,E=W_{O_E}(R⁺)`, with its weak `(π,[ϖ])`-adic topology. The integral period domain is

`𝒴_S = Spa(A_inf,E,A_inf,E) ∖ V([ϖ])`.

It retains the `π=0` end. The unlocalized weak Witt ring is a Huber ring and need not be Tate. Its rational localizations and separated completions carry the specified Tate topologies; these are constructed before any Tate sheaf criterion is applied.

The generic domain is `Y_S=𝒴_S∖V(π)`. Both `π` and `[ϖ]` are nonzero there. For the additional `p`-typical algebraicity comparison set `E=ℚ_p`, `W=W(R⁺)`, and

`Z_S = Spa(W,W) ∖ V(p,[ϖ]) = D(p) ∪ D([ϖ])`.

Here `D(a)` means the locus where the valuation of a is nonzero. `Z_S` contains both `𝒴_S=D([ϖ])` and the crystalline end `[ϖ]=0,p≠0`. It is larger than the generic intersection `D(p)∩D([ϖ])`. Its two rational charts satisfy `|[ϖ]|≤|p|≠0` and `|p|≤|[ϖ]|≠0`. Kedlaya’s `A₁,A₂,A₁₂` and `B₁,B₂,B₁₂` retain the ideals of definition in Definition 3.5; an isomorphism of underlying rings involving a primed chart is not automatically a homeomorphism. Proposition 3.6 gives stable uniformity for `A₁,A₁₂,B₁,B₂,B₁₂,B₂′` and only uniformity for `A₂`.

The sheafy chart presentations define `Z_S`. The punctured algebraic/analytic bundle equivalence is proved once in Layer 6. Freeness and extension across the omitted point have the valued-field hypotheses of Kedlaya 3.9, with the geometric specialization supplied by AInfCohomology; Example 3.14 excludes that conclusion over a general perfect Tate base.

The coefficient-root charts adjoin roots of the **whole ratio** `π/[ϖ]`. At level `m` use `π_m,ϖ_m` and `s_m` with `π_m=ϖ_m s_m` and `s_{m+1}^p=s_m`. The tilted coordinate `t₁` has sharp `π/[ϖ]`; the resulting disc coordinate is `t=ϖt₁`. Independent roots without these relations do not specify the chart.

### Radii, quotient and base projection

On the generic domain define the real radius through the rank-one generalization of a valuation by `log|[ϖ]|/log|π|`. For higher-rank points use the equivalent rational power inequalities. Frobenius multiplies the radius by `q`. Replacing `ϖ` by `ϖ^m` multiplies this radius by `m`; the corresponding windows remain cofinal. Interval norm parameters are compared with this radius convention, rather than identified without the reciprocal-radius calculation.

The curve is the analytic Frobenius quotient `X_S=Y_S/φ^ℤ`, glued from wandering interval charts. Its diamond is given by the product formula followed by the equivariant Frobenius quotient. The natural projection `|X_S|→|S|` is continuous and qcqs in the stated affinoid scope. There is no adic structural morphism `X_S→S` obtained from Teichmüller representatives. Products and base-change assertions that use the base are stated on diamonds or on the explicit period-ring interfaces.

The twelve period-ring variants have their own radius, growth, plus and completion data. The sheaf theorem names all twelve, the acyclicity theorem its exact nine variants, and Kiehl descent its exact three cases. An all-`E` theorem transports each estimate through the stated coefficient comparison; replacing `p` by `π` in a formula does not prove that transport. Countable Stein arguments use complete Banach modules, dense restriction maps and a convergent correction, rather than algebraic Mittag–Leffler alone.

### Cartier divisors and completed neighbourhoods

A marked untilt determines `θ` and a principal regular kernel, locally generated by a primitive element `ξ=π−a[ϖ]`. An integral characteristic-`p` leg may have `ξ=π`. The norm estimate is proved on finite-level ordinary discs and transferred by approximation through boundary suprema; it does not assert arbitrary attainment of a perfected-chart spectral supremum.

`Div^d` is the `v`-sheafification of the symmetric **orbit sheaf**, with repeated legs retained. It is not the symmetric quotient stack with permutation stabilizers. `Div^0` is terminal and represents the empty divisor. A sum of ordered primitive legs has equation `∏ξ_i`. Permutation invariance descends its invertible ideal, not a preferred global generator. The early inverse degree criterion requires local factorization and fibre-length arguments independent of later Picard/Banach–Colmez classification.

For a closed Cartier divisor `D` with invertible ideal `I_D`, complete the **ambient** structure sheaf along `I_D`. Its sections, where the divisor is affinoid, are `B_D⁺`; puncturing this completion by the completed invertible ideal gives `B_D`. Completing `O_D` along its zero ideal does not give `B_D⁺`. A unit change of `ξ` gives the same intrinsic completion. Repeated powers `I_D^m` have cofinal adic topology but a different numbered filtration. Disjoint divisors give a Chinese-remainder product decomposition; colliding divisors retain multiplicity and do not give independent products.

`Div^1` has the coefficient-base presentations `Spd(E)/φ^ℤ` over `Perf_{𝔽_q}` and `Spd(Ê)/φ^ℤ` after extending to `Perf_{𝔽̄_q}`. The spatial/proper/cohomologically smooth moduli theorem is a VB3 output. These coefficient bases and ownership boundaries also apply when transporting the projection properties.

The comparison with Mathlib’s PreTilt, Fontaine `θ` and BDeRhamPlus first identifies the marked geometric tilt, the `p`-localized `θ` kernel and the Cartier ideal. For finite mixed-characteristic `E`, select the embedding/factor and lift it successively by formal étaleness. Equal-characteristic completion is intrinsic to the Cartier ideal. Graded filtration pieces are tensor powers of the conormal line, and are not globally free without a trivialization. At one geometric generic leg the completed ring is a complete DVR with residue `C♯`. A multileg completion is not assigned that DVR property.

### Twists, graded algebra and modifications

The rank-one descent multiplier for `O(n)` is `π^(−n)φ`; its sections satisfy `φ(f)=π^n f`. The corresponding isocrystal has slope `−n` and the line bundle has degree `+n`. The lattice `ξ^k B_D⁺` gives the modification `O(−k)`, consistently with these signs. VectorBundlesAndIsocrystals VB−1 supplies `P=⊕_{n≥0}H⁰(X_S,O(n))`, its grading and the partial analytic chart comparison. The algebraic standard-open isomorphism `D₊(g)≅Spec` of the degree-zero homogeneous localization is distinct from the ring homomorphism to analytic functions. Layer 5 uses the latter and the supplied morphism on the section-covered open `U`. Proving `U=X_S` and the global comparison/twists belongs to VB2. The two crystalline-boundary charts and their Čech section input are compared with the supplied mixed-characteristic Lubin–Tate divisor section.

An algebraic exact square `R→R₁,R₂→R₁₂` means exactness of `0→R→R₁⊕R₂→R₁₂→0`, with the difference as last map. Glueing data carry actual base-change identifications. Finite-projective recovery requires the universal comparison-surjectivity criterion and the maximal-ideal covering condition; an exact square by itself does not imply every proposed descent conclusion. Topological glueing squares are AdicSpacesPartIII R3.2’s specialization of this algebraic interface.

A Stacks glueing pair `(R→R′,f)` has isomorphisms modulo every `f^n` and bijections on `f`-power torsion. The completion version includes `f` regular. Completion is not assumed fpqc and no noetherian hypothesis is inserted into the general theorem.

A modification is an isomorphism off `D`, meromorphic along `D`. Its groupoid arrows are isomorphisms commuting with that identification. Extensionality is up to the specified isomorphism, not equality of differently chosen bundle objects. Pole bounds control both the map and its inverse. Local lattice gluing for a **globally given reference bundle** uses an affinoid chart cover of `D`; an affinoid divisor need not lie inside a single affinoid chart with a global equation. Gluing complement data that carry a meromorphic structure along `D`, without a globally given reference bundle, is the separate target §6.8.

For a repeated divisor `mD`, an `ℓ`-bound at `mD` is an `mℓ`-bound at `D`. Given a `k`-bound at `D`, `ceiling(k/m)` is a sufficient bound at `mD`; claims about a least bound also require existence of that least bound. Composition at intersecting `D₁,D₂` is meromorphic at `D₁+D₂`: `kD₁+ℓD₂≤max(k,ℓ)(D₁+D₂)`. Independent local pieces form a product only for disjoint supports; a colliding chain retains its intermediate modification.

The unramified schematic `B`-pair theorem uses KL’s actual `φ^a` setting and the later VB2 scheme comparison. Flat quasicoherent sections use ordinary tensor products with the completed coefficient ring, not a completed tensor product for an arbitrary infinite module. For varying pairs `(T,Ξ)`, the integral lattice `T` is retained as data: a rational automorphism multiplying by `1/p` is not a `ℤ_p`-lattice automorphism.

For a linear algebraic group `G/E`, a `G`-bundle is an exact tensor functor from finite-dimensional `Rep_E(G)` to bundles. For smooth affine `G/O_E` use finite-free `O_E` representations. On `Spec(B)` the target is finite projective `B`-modules. For `G`-modifications, use the §7.0 exact tensor dictionary in the required scheme/integral generality. Meromorphy over `E` is tested on a faithful representation using its tensor generator `V⊕V∨`; tensor operations propagate explicit degree bounds. The integral closed-immersion criterion is not inferred from the field theorem. Ordinary `v`-descent uses the smooth affine `O_E` scope of its source. Étale-local triviality in the cited theorem retains reductive `G` and the actual henselian approximation hypotheses.

## Exact supplier contracts

A supplier is used only in the scope stated here. These contracts are theorem inputs to the relevant targets; a general-`E` conclusion does not follow from an unramified specialization. FarguesFontaineDiamonds F4 supplies the fixed-field `ℚ_p` analytic Cartier divisor and marked-untilt comparison. The period targets prove the relative and all-`E` chart, norm and choice comparisons, including their compatibility with that fixed-field input.

### From Mathlib

At the statement baseline, WittVector, its `ghostComponent`, `teichmuller`, `frobenius`, `PerfectRing` and `PadicInt` supply the `p`-typical coefficient comparison. `FormalGroup` and `MvPowerSeries.eval₂` provide formal-group carriers and evaluation, rather than Lubin–Tate endomorphisms or torsion logarithms. `Valuation`, polynomial rings, ideals and `nonZeroDivisors` supply the elementary coefficient and chart algebra.

`AdicCompletion`, `AdicCompletion.of`, `IsAdicComplete` and `IsAdicComplete.liftRingHom` supply algebraic ideal completion and compatible lifting. `IsLocalization`, `Localization.Away`, `IsLocalization.Away.awayToAwayLeft` and `.awayToAwayRight` supply algebraic punctures. The existing `Ideal.span_singleton_mul_left_unit` is the unit-invariance input; its integral and multileg completion/filtration comparisons are targets below. No algebraic completion is identified with a Huber completion without a comparison theorem.

`PreTilt`, `PreTilt.untilt`, `WittVector.fontaineTheta`, `BDeRhamPlus` and `BDeRham` supply the `p`-localized algebraic de Rham constructions. First identify the marked tilt, `θ` kernel and Cartier ideal. In characteristic `p`, `p`-localization can be zero, so it cannot replace an integral completed divisor. `Algebra.FormallyEtale.of_isSeparable` and `.comp_bijective` supply successive square-zero coefficient lifts; `Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete` lifts sections from a complete ring's quotient. `IsAdicComplete.henselianRing` supplies `HenselianRing R I` for an `I`-adically complete commutative ring, not the completed-stalk approximation theorem.

`Submodule.torsion' R M (Submonoid.powers f)` supplies `f`-power torsion: its elements satisfy `∃ n : ℕ, f^n • m = 0`, and `n=0` contributes only zero (`Mathlib.Algebra.Module.Torsion.Basic`, `Submodule.mem_torsion'_iff`). Glueing pairs and glueability use this submodule directly.

`TensorProduct`, `LinearEquiv`, `TensorProduct.AlgebraTensorModule.rid`, `Module.Dual`, `Module.Finite`, `Module.FinitePresentation`, `Module.Flat`, `Module.Projective`, `Module.Free`, `Module.Invertible` and `Module.FaithfullyFlat` supply the algebra of gluing data. `Algebra.Etale`, `Algebra.Smooth` and `CommAlgCat.FiniteEtale` supply its algebra categories. `Module.length` measures the finite geometric fibres of a divisor. `GradedAlgebra`, `ProjectiveSpectrum`, `AlgebraicGeometry.Scheme`, `.LocallyRingedSpace` and `.projIsoSpec` supply the algebraic graded-chart target category and standard-open theorem. The analytic chart map is separate. Category equivalences, monoidal functors and sheafification use `CategoryTheory.Equivalence`, `CategoryTheory.Functor.Monoidal` and `CategoryTheory.presheafToSheaf`.

### From Tau Ceti and roadmaps on main

`TauCeti.Huber.Pair` and `TauCeti.ValuationSpectrum.spa` supply the ring/valuation interfaces at the pinned statement baseline. `TauCeti.AffineGroupSchemeCat`, `TauCeti.Comodule.IsFaithful` and `TauCeti.Comodule.isFaithful_iff_isClosedImmersion_coordinateGroupSchemeHom` supply affine groups and basis-independent faithfulness. `TauCeti.ReductiveAffineGroupSchemeCat` is a field-coefficient carrier; it does not supply an integral reductive dictionary. Tau Ceti's `TauCeti.RingTheory.AdicCompletion.Pow` (`IsAdicComplete.pow`, `IsAdicComplete.of_le_of_pow_le`) compares adic completeness for an ideal and its powers, as used for repeated legs. The `p`-typical topology and quotient inputs are those listed under Scope and ownership. The scheme bundle input is `TauCeti.AlgebraicGeometry.FiniteLocallyFreeSheaf.finiteProjectiveEquiv` from `TauCeti.AlgebraicGeometry.VectorBundle.Affine.Basic`, with tensor and dual compatibility in `.Affine.Monoidal` and `.Affine.Dual`; AlgebraicVectorBundles Layers L0A–L0C specifies their general API. These are scheme statements; they do not assert an analytic affinoid comparison.

### From AdicSpacesPartII, AdicSpacesPartIII and PerfectoidSpaces

AdicSpacesPartII §§R0.2–R0.5 supplies separated rational-chart completions, strict completion exactness (`strict-complex-completion-exact`), spectral isometry criteria and completed Banach-module tensors. AdicSpacesPartIII §R3.4 supplies the complete-Banach correction for dense restrictions in quasi-Stein arguments. The integral coefficient tensor in §0.16 is a period-specific construction: it permits the continuous `π`-adic map `O_E→W_OE(R⁺)` with `(π,[ϖ])`-adic target even when the map is not adic. Prove finite-quotient compatibility, the actual completed integral tensor and continuity of the coefficient-module splitting there; no general non-adic Huber pushout is assumed. Strict finite-quotient/inverse-limit comparison is needed for the stated rational and finite-étale base changes; arbitrary tensor-limit exchange is excluded.

AdicSpacesPartIII §§R3.1–R3.5 supplies rational-basis sheafification, affinoid finite-projective/bundle comparison and finite-projective étale/Kiehl gluing. Its topological exact-square specialization must preserve the algebraic comparison maps. No analytic comparison for arbitrary data on the complement of a divisor is required of it: the complement data of §6.8 carry a meromorphic structure along the divisor, given on charts `U=Spa(A,A⁺)` with regular Cartier equation `ξ` by finite projective `A[1/ξ]`-modules, and the analytic complement `U∖V(ξ)` is never identified with `Spec(A[1/ξ])`.

AdicSpacesPartIII §R3.5, `split-injection-completed-base-change`, supplies completed base change of continuous module retractions. PerfectoidSpaces §§P3.17a.1–P3.17a.4 supplies sousperfectoid frames, stability, stable uniformity and sheafiness. AdicEtaleGeometry §A1.6a, `stable-basis-etale-vector-bundles`, supplies étale vector-bundle descent on the stable basis. The period calculations verify the actual topology, splitting and stable-cover hypotheses of these criteria. RigidAnalyticGeometry §2.2 supplies maximum modulus on nonzero finite-type affinoids, used only at the finite disc levels of §3.2.

### From PerfectoidSpaces and DiamondsAndVStacks

P1 supplies the integral perfectoid criterion of BMS Lemmas 3.10(ii) and 3.21: a regular `u` with `u^p` dividing `p`, `u`-adic completeness, and bijective Frobenius `S/u→S/u^p`. For root charts take `u=[ϖ]^(1/p)` and prove regularity and the completion-topology comparison. P1 also supplies marked untilts, primitive kernels, and the comparison of the geometric tilt with Mathlib PreTilt. P2 supplies perfected-disc tilting and its adic homeomorphism, including the retained `π=0` end. P3 supplies almost `H¹_v` vanishing with its annihilator and norm control, and finite-étale tilting. For primitive quotients use corrected [KL II](#ref-kl-ii) Theorem 3.3.13, pp. 61–62, rather than the incomplete KL I Proposition 3.6.11 argument.

D0 supplies groupoid quotients and two-fibre products; D4 small `v`-sheaves/stacks; D5 the Berkovich quotient. DiamondsAndVStacks D6, `pre-adic-diamondification`, supplies the pre-adic diamond interface of SW §§18.1–18.2 to represent bounded coefficient maps to `Spd(O_E)` including `π=0`. DiamondsAndVStacks D2–D3 supplies ordinary effective `v`-descent of finite locally free modules and maps, including `GL₁` (SW Lemma 17.1.8, pp. 150–151, and Proposition 19.5.3, pp. 180–181). Function descent, almost modules and almost `H¹` vanishing alone do not give this ordinary bundle result. The split-root comparison is part of the argument in the integral period case.

### From local fields and period-bundle foundations

LocalFieldsRamification Layers 0, 2 and 4 supplies the coefficient local fields, finite extensions, unramified tower and inertia. VectorBundlesAndIsocrystals VB3, `lubin-tate-universal-cover` and `fundamental-exact-sequence`, supplies the normalized formal `O_E`-module with scalar endomorphisms, its universal cover, and the comparison of its logarithm with the explicit period eigenfunction, including simple torsion zeros. Section 2.5 constructs the marked finite torsion fields, completed tower, tilt and `O_Eˣ` Galois action from these data. The separate `E_root∞` is used for chart perfectoidness. Section 0.23 proves the nonperfect Cohen variant using DerivedModuleAlgebra §§0.4–0.12 and §0.25: flat `π`-complete lifts exist and are isomorphic, without canonical uniqueness; the obstruction groups are `Ext²_K(L_(K/𝔽_q),N)` and `Ext¹_K(L_(K/𝔽_q),N)` for the square-zero kernel module `N`, and `L_(K/𝔽_q)≃Ω¹_(K/𝔽_q)[0]`.

PadicHodgeTheory §0.2, `bdRPlusAffinoid` and `filAffinoid`, supplies the mixed-characteristic `p`-typical affinoid de Rham ring/filtration on Mathlib's carrier. PadicPeriodRings §§1.5 and 4.1 supplies the geometric complete DVR, residue map and filtered fraction field; §4.3 supplies the underlying fundamental period sequence. A ramified `E` version still needs an embedding/factor choice and the coefficient lift; the equal-characteristic version remains intrinsic Cartier completion.

VectorBundlesAndIsocrystals VB1, `isocrystal-to-bundle-functor`, supplies the exact tensor arbitrary-rank isocrystal functor compatible with multiplier `π^(−n)`. Its `annular-frobenius-descent` supplies the Frobenius-bundle carrier; §1.18 proves the passage from generation on every compact interval to global sections over `R̃^∞` (KL I Lemma 6.1.4). VB2 supplies FS Theorem II.2.6, `U=X_S`, the global `Proj` map and tautological twists, the algebraic Cartier section and affine complement of KL I Lemma 8.9.3, and the two-affine cover for `B`-pair cohomology. VB3's FS Proposition II.1.21/Fargues Proposition 2.18 moduli properties require the late proper-base-change and smoothness inputs; they are not early curve prerequisites.

VB4's `integral-frobenius-local-systems` foundation supplies SW Theorem 12.3.4 independently of the gluing here. AInfCohomology §AI.2.3, `AInf.integral_robba_frobenius_descent`, supplies SW Proposition 12.3.5, p. 104: crystalline-point localization identifies no-leg shtukas on `Y_[0,∞)` with integral Robba `φ`-modules. Section 6.14a proves SW Corollary 12.4.1, p. 105: the unique normalized `φ⁻¹`-equivariant meromorphic comparison to a one-leg model at `φ⁻¹(x_C)`, identity at the crystalline point, away from the forward orbit of `x_C`; its completed comparison determines the lattice and recovers the shtuka. Both comparisons include morphisms and scalar extension. Downstream shtuka moduli are not its foundation.

### Representation and torsor inputs

Section 7.0 consumes PadicHodgeTheory §5.5’s field tensor-isomorphism torsor dictionary and proves its `O_E` coefficient extension for flat affine linear groups and exact tensor functors on finite-free representations valued in finite projective modules, with the étale dictionary when the group is smooth (SW Theorem 19.5.1, pp. 178–179, and its coefficient extension). It proves the smooth `O_E`-integral adic dictionary on analytic sousperfectoid spaces, including `𝒴` and opens in the dotted product with `Spa(O_E)`, compatible with restrictions and base change (SW Theorem 19.5.2, pp. 179–180; FS Definition/Proposition III.1.1, p. 88). For linear algebraic groups over `E`, a faithful `V` makes `V⊕V∨` a tensor generator, and closed immersions have the restriction/subquotient criterion (Deligne–Milne Propositions 2.20(b), 2.21(b), pp. 25–26, footnote 11). The field criterion is not an integral inference. ReductiveGroups Layer 1 and `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor` supply field-valued reconstruction; SchemeAndStackFoundations §§1.15 and 2.3 supplies geometric/fppf torsors. VectorBundlesAndIsocrystals VB4, `integral-group-torsors`, supplies the `ℤ_p` scheme and adic tensor dictionary. Section 7.0 proves its `O_E` coefficient extension and the faithful tensor-generator/structure-group criteria in the stated scope, independently of modification gluing.

### Completed geometric stalks for divisor approximation

For an affinoid divisor and a geometric point `s`, on pointed affinoid étale neighbourhoods `T` set `A_T=B_D⁺(T)/I_D`. Construct compatible `t`-adically complete closed rings of definition `R_T` with common regular topologically nilpotent unit `t`, the image of `[ϖ]` or a fixed power. Require `R=colim R_T`, `R[1/t]=colim A_T`, and an identification `(lim_n R/t^n)[1/t]≃B_D⁺(S_s)/I_D` for the completed geometric stalk, carrying sections of smooth affine finitely presented schemes. This is an additional Layer 3 target, including colliding/nonreduced legs and compatibility with the geometric fibre point. For approximation take `I=R`, keep `t` regular and `(R,t)` henselian, and apply Gabber–Ramero arXiv `v3` Proposition 5.4.21 and Claim 5.4.22, pp. 121–122. `I` here is distinct from `I_D`. A different integral model must prove its regularity and henselian hypotheses before the same argument applies.

## How to read the build

Layers 0–1 use VB−1’s coefficients and period domains to prove the Dwork, twisted-coordinate, integral-chart and annular-estimate refinements. Layer 2 compares the supplied Frobenius curve with its diamond presentations. Layers 3–4 construct Cartier legs, their symmetric moduli and completions before generic untilt comparisons. Layer 5 fixes the scalar rank-one sign and compares the supplied twists and partial section charts. Layers 6–7 apply linear patching and then the torsor tensor dictionary. The basic algebra in Layer 6 can be developed independently; its later schematic `B`-pair applications use the VB2 global comparison. Within each layer, the named prerequisites specify the order. Named interfaces specify library targets. `Suggested.lean` states the ramified Dwork criterion (§0.2), nonperfect Cohen coefficient lifting and comparison (§0.23), and Beauville–Laszlo finite-projective effectivity and detection of flatness and finite projectivity (§6.5). The geometric headlines require the relative ringed period spaces, Cartier divisors, completions and bundle categories specified in the layers below.

## Layer 0: coefficients and integral period geometry

<a id="target-0-1"></a>

### 0.1 Ramified Witt polynomials

Define `ramifiedWittPolynomials`. For `E` of characteristic zero with residue field `𝔽_q` and uniformizer `π`, set `w_n(X_0,…,X_n)=Σ_{i=0}^n π^i X_i^(q^(n-i))`. For every `O_E`-algebra `A` the ghost map on `A^N` is `w_A(x)=(w_n(x))_n`. `A` is not required perfect, reduced, flat or complete. The finite-sum definition `ramifiedGhost` in `Suggested.lean` is evaluated over any commutative coefficient ring, element `π` and natural `q`; the polynomial target `ramifiedWittPolynomials` is its actual multivariable polynomial. These formulas do not construct a ramified Witt ring. Require compatibility with coefficient-algebra homomorphisms.

`E` is a nonarchimedean local field of characteristic zero; `q=p^f`; `n≥0`. The all-`E` perfect strict lift is a separate construction.

The interface must support the following operations and laws.

- `ramifiedGhost`: `w_n(x)=Σ_{i≤n}π^i x_i^(q^(n-i))`.
- Zeroth ghost: `w_0(x)=x_0`.
- First ghost: `w_1(x)=x_0^q+πx_1`.
- Polynomial evaluation: Evaluation by `MvPolynomial.eval₂` agrees with `ramifiedGhost` on every coefficient algebra.
- The `p`-typical comparison: At `π=p,q=p` over `ℤ`, the ghost of the coefficient sequence of a Mathlib Witt vector is its `ghostComponent`.
- Naturality: For `f`:`A→B`, `w_B(f(x))=f(w_A(x))`.

Write the finite polynomials over `O_E`, then evaluate them in any `O_E`-algebra.

Functoriality follows from evaluation of polynomials.

**Checks.**

- `ghost_first`: `w_0(x)=x_0`.
- `ghost_second`: `w_1(x)=x_0^q+πx_1`.
- `ghost_p_typical`: For `E=ℚ_p,π=p,q=p` this is Mathlib WittVector.ghostComponent.

Further specializations and compatibility requirements are as follows.

- Compute `w_0=x_0` and `w_1=x_0^q+πx_1`.

([FF (2017)](#ref-ff-2017) §1.2.1, printed p. 53.)

*Needs:* Mathlib WittVector; Mathlib WittVector.ghostComponent.

<a id="target-0-2"></a>

### 0.2 Ramified Dwork criterion

Prove `ramifiedDworkCriterion`. If `A` is a `π`-torsion-free `O_E`-algebra with `O_E`-linear ring endomorphism `σ` lifting a`↦a^q` modulo `π`, the ghost map `w_A` is injective and its image consists precisely of sequences `y` with `y_(n+1)-σ(y_n)∈π^(n+1)A` for every `n≥0`.

`E` as in ramified-witt-polynomials; `π`-torsion-free (equivalently `p`-torsion-free here); `σ(a)≡a^q` mod `π`. No completeness assumption. The scalar signature `ramifiedDworkCriterion` uses a characteristic-zero discrete valuation ring `O`, a generator `π` of its maximal ideal, and finite residue field of cardinality `q`; the same recursive proof applies without completing `O`. Regularity of the image of `π` expresses torsion-freeness on `A`.

Injectivity follows inductively by cancelling `π^n` in the nth coordinate.

The binomial congruence propagates a`≡b` mod `π^i` to `a^q≡b^q` mod `π^(i+1)`.

Solve recursively for each Witt coordinate by the Dwork congruence.

Further specializations and compatibility requirements are as follows.

- The constant ghost sequence of a scalar from `O_E` passes the congruence; no injectivity claim is made on `𝔽_q`.

**Checks.**

- For `A=O_E` and `σ=id`, the constant ghost sequence of each scalar meets every congruence.
- For `E=ℚ_p`, `π=p` and `q=p`, the image criterion specializes to the ordinary Witt ghost criterion.
- For `A=𝔽_q`, multiplication by `π` is not injective; the vectors `(0,0,…)` and `(0,1,0,…)` have identical ghosts, so the regularity hypothesis cannot be dropped.

([FF (2017)](#ref-ff-2017) Lemme 1.2.1, proof, printed p. 53; [FF (corrected)](#ref-ff-corrected) Lemme 1.2.1, proof, printed p. 5.)

*Needs:* [§0.1](#target-0-1).

<a id="target-0-3"></a>

### 0.3 Ramified Witt functor on arbitrary coefficient algebras

Consume VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`) for the arbitrary-algebra ramified Witt functor, its universal polynomial operations, coordinate extensionality and functorial ghost homomorphisms. The hypotheses and coefficient embeddings of that supplier are retained.

**Checks.**

- The zero input algebra gives the zero Witt algebra.
- On every coefficient algebra, including torsion inputs, ghosts preserve addition and multiplication.
- For imperfect `𝔽_p[T]`, reduction via coordinate zero does not give the perfect strict-lift property.

([FF (2017)](#ref-ff-2017) Lemme 1.2.1, printed p. 53.)

*Needs:* VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`).

<a id="target-0-4"></a>

### 0.4 Uniformizer-independent ramified Witt vectors

Consume VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`) for the ghost-preserving change of uniformizer and its natural inverse and cocycle laws. The hypotheses and coefficient embeddings of that supplier are retained.

**Checks.**

- Changing a uniformizer to itself is the identity.
- The changes from `π` to `π′` and back compose to the identity.
- Under this comparison Teichmüller representatives agree, while `V_π′=(π′/π)V_π`.

([FF (2017)](#ref-ff-2017) §1.2.1 and Définition 1.2.2, printed pp. 53–54.)

*Needs:* VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`).

<a id="target-0-5"></a>

### 0.5 Teichmuller, Frobenius and Verschiebung

Consume VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`) for Teichmüller representatives, Frobenius and Verschiebung, with `FV_π=π` and the projection formula; `V_πF=π` is used only on residue-algebra inputs. The hypotheses and coefficient embeddings of that supplier are retained.

**Checks.**

- Teichmüller representatives preserve products, zero and one.
- For `E=ℚ₂`, `[1]+[1]=2` in `W(𝔽₂)`, so the representative map is not additive.
- At `E=ℚ_p` the operators agree with Mathlib Witt vectors under the supplied comparison.

([FF (2017)](#ref-ff-2017) §1.2.1, printed p. 54.)

*Needs:* VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`).

<a id="target-0-6"></a>

### 0.`6 V`-adic expansion and truncated ramified Witt vectors

Consume VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`), for the arbitrary-algebra expansion and truncation API. For characteristic-zero `E` and any `O_E`-algebra `A`, the `V_π`-adic truncations retain the first `n` Witt coordinates and recover the vector by inverse limit, with expansion `ΣV_π^n[a_n]`. The perfect strict-lift specialization identifies `V^nW` with `π^nW`.

**Checks.**

- The first truncation is the zeroth-coordinate residue algebra.
- The zero vector has every expansion coefficient zero.
- For an imperfect residue algebra `V`-adic completeness does not imply `V=π`.

([FF (2017)](#ref-ff-2017) §1.2.1, printed p. 54.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-coefficients.

<a id="target-0-7"></a>

### 0.7 Perfect ramified strict lift

Consume VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`) for the perfect strict lift for mixed or equal characteristic, with its marked reduction, unique Teichmüller expansions, flat completeness and coefficient Frobenius. The hypotheses and coefficient embeddings of that supplier are retained.

**Checks.**

- The strict lift of the marked residue algebra of `O_E` is `O_E`.
- The zero residue algebra lifts to zero.
- In equal characteristic the lift is `R[[π]]`, with coefficientwise Frobenius and `π` fixed.
- The imperfect ring `𝔽₂[T]` is outside strict perfect-lift uniqueness.

([FF (2017)](#ref-ff-2017) §1.2.1, printed pp. 54–55; [FS](#ref-fs) II.1 opening, printed p. 47.)

*Needs:* VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`).

<a id="target-0-8"></a>

### 0.8 Change of coefficient field

Consume VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`) for finite coefficient-field transport, including `w_n^E′(u(x))=w_(fn)^E(x)`, `uF_E^f=F_E′u` and `uV_π=(π/π′)V_π′uF_E^(f−1)`. The hypotheses and coefficient embeddings of that supplier are retained.

**Checks.**

- The identity extension induces the identity map.
- The first nonconstant ghost for `E′` is the `f`th ghost for `E`.
- For `f>1` the Frobenius comparison uses `F_E^f`; for `f=1` the Verschiebung formula reduces to uniformizer scaling.

([FF (2017)](#ref-ff-2017) Lemme 1.2.3, printed p. 55; [FF (corrected)](#ref-ff-corrected) Lemme 1.2.3, printed p. 7.)

*Needs:* VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`).

<a id="target-0-9"></a>

### 0.9 Witt diagonal and unramified coefficient action

Consume VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`) for the unramified coefficient action used in finite coefficient transport, characterized by the Witt diagonal with outer ghosts `F_E^n`. The hypotheses and coefficient embeddings of that supplier are retained.

**Checks.**

- The zeroth outer ghost of the diagonal is the original vector.
- The first outer ghost is `F_E`.
- For `A=𝔽_q′`, composing the diagonal with Witt functoriality for coordinate zero gives the identity action on `W_OE(A)`.

([FF (2017)](#ref-ff-2017) §1.2.1 following Lemme 1.2.3, printed p. 55.)

*Needs:* VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`).

<a id="target-0-10"></a>

### 0.10 Perfect coefficient base change

Consume VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`) for the perfect coefficient comparison `W_OE(R)⊗_(O_E″)O_E′≃W_OE′(R)` for finite `E′/E`, with its topology, marked residue and Frobenius API. The hypotheses and coefficient embeddings of that supplier are retained.

**Checks.**

- The identity coefficient extension gives the identity comparison.
- For residue degree `f`, coefficient Frobenius compares `F_E^f` with `F_E′`.
- At `E=ℚ_p` the tensor base is `W(𝔽_q′)`, rather than `ℤ_p` when the residue degree exceeds one.

([FF (2017)](#ref-ff-2017) §1.2.1, printed pp. 55–56.)

*Needs:* VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`).

<a id="target-0-11"></a>

### 0.`11 Q`-twisted Witt vectors

Define `qTwistedWittFunctor`. For `Q∈O_E[X]` with `Q≡X^q` modulo `π`, set `Q_0=X` and `Q_n=Q` iterated `n` times, and `w_(n,Q)(x)=Σ_(i≤n)π^i Q_(n−i)(x_i)`. There is a unique natural algebra structure on `A^N` with these ghost homomorphisms, and a canonical ghost-preserving isomorphism `W_(O_E,Q,π)(A)≃W_(O_E,π)(A)`, for every `O_E`-algebra `A`.

`E` characteristic zero; no perfectness, completeness or `π`-torsion-free assumption on A.

The polynomial congruence is coefficientwise: `Q`.`map(O_E→O_E/(π))=X^q`. It is a mandatory parameter of the constructed twisted ring and its `Q`-Teichmüller section.

The interface must support the following operations and laws.

- The coefficientwise congruence means that every coefficient of `Q−X^q` is divisible by `π`. It is meaningful over any commutative ring; the twisted Witt-ring construction retains the local-field hypotheses above.
- `twistedGhost`: `w_(n,Q)=Σ_(i≤n)π^i Q_(n−i)(x_i)`.
- Ordinary specialization: For `Q=X^q`, iterated evaluation gives `ramifiedGhost` over every commutative coefficient algebra, without torsion or admissibility hypotheses.
- `twistedWitt`: Polynomial-defined natural `O_E`-algebra on `A^N`.
- `twistedWittEquiv`: Canonical ghost-preserving algebra isomorphism to ordinary ramified Witt vectors.

Prove the congruence `Q(x)≡Q(y)` modulo `π^(i+1)` when `x≡y` modulo `π^i`, `i≥1`.

Apply the twisted Dwork criterion on universal torsion-free polynomial algebras.

Transfer integral operations and the unique ghost-preserving comparison to arbitrary A.

**Checks.**

- `twist_admissible_ordinary`: `Q=X^q` satisfies the predicate for every `π`.
- `twist_admissible_negative`: Over `ℤ`, `π=2` and `Q=X²+1` fail it because the constant coefficient 1 is not divisible by 2.
- `twist_admissible_unit`: If `π` is a unit, every `Q` satisfies the congruence predicate. This scalar fact does not meet the nonunit-uniformizer hypotheses of the Witt/`LT` construction.
- `twist_first_ghost`: `w_(1,Q)(x)=Q(x_0)+πx_1`.
- `twist_ordinary`: `Q=X^q` recovers ordinary ramified Witt vectors.
- `twist_torsion`: The functor and comparison exist on `A=O_E/π²`; their definition cannot require ghost injectivity there.

Further specializations and compatibility requirements are as follows.

- Evaluate `w_(0,Q)` and `w_(1,Q)`; do not assume `Q` is additive or multiplicative.

([FF (2017)](#ref-ff-2017) Proposition 1.2.4 and Lemmes 1.2.5–1.2.6, printed pp. 56–57.)

*Needs:* [§0.2](#target-0-2); [§0.3](#target-0-3).

<a id="target-0-12"></a>

### 0.`12 Q`-Teichmuller lift

Define `qTeichmullerLift`. Transport `(a,0,…)` through the twisted Witt comparison to define `[a]_Q∈W_OE(A)`. Its ghosts are `Q_n(a)`, it satisfies `Q([a]_Q)=[Q(a)]_Q`, and every element has a unique `V_π` expansion `ΣV_π^n[a_n]_Q`. For perfect `𝔽_q`-algebra `A` the `π` expansion is unique and `[a]_Q=lim_n Q_n(â_n)`, for any lifts a`̂_n` of `a^(q^(−n))`. The map is not generally multiplicative.

Arbitrary `O_E`-algebra `A` for the ghosts and `V` expansion; perfect residue algebra for the `π` expansion and limit.

The polynomial congruence is coefficientwise: `Q`.`map(O_E→O_E/(π))=X^q`. It is a mandatory parameter of the constructed twisted ring and its `Q`-Teichmüller section.

The interface must support the following operations and laws.

- `qTeich`: Natural lift `A→W_OE(A)`.
- `qTeich_ghost`: `w_n([a]_Q)=Q_n(a)`.
- `qTeich_equation`: `Q([a]_Q)=[Q(a)]_Q`.
- `qTeich_limit`: For perfect residue A, `[a]_Q=lim_n Q_n(â_n)`.

Apply the twisted comparison to coordinate-zero representatives.

Use universal ghosts for the `Q` identity and coordinate induction for the `V` expansion.

Use contraction modulo successive powers of `π` for the perfect-residue limit and its independence of chosen lifts.

**Checks.**

- `q_teich_ordinary`: For `Q=X^q`, `[a]_Q=[a]`.
- `q_teich_multiplicative_group`: For `E=ℚ_p` and `Q=(1+X)^p−1`, `[a]_Q=[1+a]−1`.
- `q_teich_not_multiplicative`: At `p=2` and `a=b=1` in `𝔽₂`, `[1]_Q=−1`, so [ab]`_Q≠[a]_Q[b]_Q`.

Further specializations and compatibility requirements are as follows.

- For `Q=(1+X)^p−1` over `ℚ_p` obtain `[a]_Q=[1+a]−1`.

([FF (2017)](#ref-ff-2017) Proposition 1.2.7 and Exemple 1.2.8, printed pp. 57–58.)

*Needs:* [§0.11](#target-0-11); [§0.6](#target-0-6); [§0.7](#target-0-7).

<a id="target-0-13"></a>

### 0.13 Weak coefficient topology

Prove `coefficientWeakTopology`. For a perfect complete valued field `F/𝔽_q` and `A=W_OE(O_F)`, the product topology on Teichmuller expansion coefficients equals the `(π,[ϖ])`-adic topology for a topologically nilpotent `ϖ∈O_F`. `A` has the separated complete topology supplied by VectorBundlesAndIsocrystals VB−1, `relative-coefficients` (`ramifiedWittCoefficients`). For `0<ρ<1` the Gauss norm `|Σπ^n[x_n]|_ρ=sup_n|x_n|ρ^n` induces it; at `ρ=1` the mixed-characteristic Teichmuller map need not be continuous.

This field case is `FF` Proposition 1.4.11. The relative uniform-Banach version is separately proved by period-ring estimates below.

For `E=ℚ_p` the completeness and separatedness of the `(p,[ϖ])`-adic topology on `W(O_F)` are Tau Ceti's `Valuation.Integers.isAdicComplete_span_p_teichmuller`, with the Huber structure of `TauCeti.RingTheory.Huber.WittVector`. This target differs from them in allowing every local field `E` and in comparing the topology with Teichmüller-coefficient convergence and with the Gauss norms.

The finite coefficient seminorms bound tails uniformly by powers of `ρ`.

Compare finite coefficient neighborhoods with powers of `(π,[ϖ])`.

Use completeness of `F` coefficientwise; the source example at `ρ=1` prevents extending the assertion to that endpoint.

Further specializations and compatibility requirements are as follows.

- The `LT` construction uses this topology; `π`-adic and weak topologies are separately named.

([FF (2017)](#ref-ff-2017) Définition 1.4.10, Proposition 1.4.11 and Remarque 1.4.12, printed pp. 64–65.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-coefficients; [§0.7](#target-0-7); Tau Ceti `Valuation.Integers.isAdicComplete_span_p_teichmuller` (p-typical case).

<a id="target-0-14"></a>

### 0.14 Lubin–Tate Teichmuller lift

Define `lubinTateTeichmullerLift`. If `Q≡πX` mod `X²` and `Q≡X^q` mod `π`, its Lubin–Tate formal group satisfies `LT_Q([x]_Q,[y]_Q)=[LT_Q(x,y)]_Q` when perfect `A` is complete for `(x,y)`. For a perfect complete valued field `F` of characteristic `p` and any Lubin–Tate formal group `LT` over `O_E`, the weak limit `[x]_LT=lim_n[π^n]_LT([x^(q^(−n))])` gives an injective `O_E`-module map `(m_F,+_LT)→(W_OE(m_F),+_LT)`. This is a module map for the formal-group law, not for ordinary addition.

`E` characteristic zero for this cited arbitrary Witt functor; `x,y` topologically nilpotent. The general formal power series require the weak topology, not solely `π`-adic convergence.

The interface must support the following operations and laws.

- `ltTeich`: For the specified Lubin–Tate formal `O_E`-module `LT`, the constructed weak lift is injective on the topologically nilpotent ideal `m_F`.
- `ltTeich_add`: Evaluate the same Mathlib FormalGroup power series in `F` and in the weak Witt ring; `LT([x]_LT,[y]_LT)=[LT(x,y)]_LT` whenever these evaluations converge.
- `ltTeich_scalar`: Evaluate the scalar endomorphism `[a]_LT` of that same formal `O_E`-module on source and target; its value commutes with the `LT` lift.
- `ltTeich_limit`: The weak limit uses the scalar series `[π^n]_LT` and Teichmüller lifts of the unique inverse `q`-power roots of `x`; the weak topology is the `(π,[ϖ])`-adic coefficient topology.

Identify `([x]_Q,[y]_Q,π)` with `([x],[y],π)` and prove the needed complete topology.

Evaluate the formal group using completeness and commute it with `Q` iterations.

Apply the limit characterization of `[−]_Q`, then the identical contraction argument for a general `LT` formal power series.

The residue map proves injectivity and scalar compatibility.

**Checks.**

- `lt_teich_zero`: `[0]_LT=0`.
- `lt_teich_multiplicative`: For the multiplicative formal group and its binomial scalar action, the constructed lift is `[1+x]−1`; the polynomial specialization over `𝔽₂` is tested in ramifiedWitt.
- `lt_teich_injective`: Equality of the actual `LT` images implies equality of the marked residue elements; a nonzero topologically nilpotent element has nonzero lift.

Further specializations and compatibility requirements are as follows.

- State the coefficient field, formal group and topology in the limit; no ordinary additive-map assertion.

([FF (2017)](#ref-ff-2017) Lemme 1.2.9 and Corollaire 1.2.10, printed p. 58.)

*Needs:* [§0.12](#target-0-12); [§0.7](#target-0-7); [§0.13](#target-0-13); VectorBundlesAndIsocrystals VB3/lubin-tate-universal-cover; Mathlib FormalGroup; Mathlib MvPowerSeries.eval₂.

<a id="target-0-15"></a>

### 0.15 Integral period chart rings

Define `integralRationalChartRings`. Put `W=W_OE(R⁺)` with ideal of definition `(π,[ϖ])`. For `n=p^m>0`, `C_n=W⟨π^n/[ϖ]⟩` is the completed rational ring of definition; `B_n=C_n[1/[ϖ]]`, and `B_n⁺` is the integral closure of `C_n` in `B_n`. The rational subset is `|π|^n≤|[ϖ]|≠0`. Its Tate unit is `[ϖ]`; `π` is allowed to vanish. The completion topology is the rational-localisation topology induced from `W`, not solely `π`-adic.

`S=Spa(R,R⁺)` affinoid perfectoid over `𝔽_q`; `R⁺` open integrally closed bounded; `ϖ` a topologically nilpotent unit of `R`.

The interface must support the following operations and laws.

- `integralChartRing`: `B_n=W⟨π^n/[ϖ]⟩[1/[ϖ]]`, with its completed topology.
- `integralChartPlus`: Integral closure of `C_n` in `B_n`.
- `integralChart_universal`: Continuous `W`-maps to complete pairs satisfying the rational bounds factor uniquely through `B_n`.
- `integralChart_frobenius`: `φ` compares `n=p^m` charts through `q`-power Teichmuller coefficients.

Form the rational localisation using the Huber-pair construction imported from the adic roadmap.

Use `[ϖ]` as the inverted denominator and complete the ring of definition.

Take the integral closure plus ring; the universal property describes maps with the stated valuation inequality.

**Checks.**

- `chart_special_fibre`: `π=0` is allowed and `[ϖ]` is invertible on each chart.
- `chart_unit_denominator`: `[ϖ]` is a topologically nilpotent unit in `B_n`.
- `chart_equal_char_disc`: For `E=𝔽_q((π))`, identify `B_n` with the completed closed-disc chart over `R` defined by `|π|^n≤|ϖ|`. Its quotient by `π` is `R`, and the quotient plus ring is `R⁺`.

Further specializations and compatibility requirements are as follows.

- Track both the topology and the plus ring, including the characteristic-`p` fibre.

([FS](#ref-fs) II.1.1 proof, printed p. 48.)

*Needs:* [§0.7](#target-0-7); AdicSpacesPartII, R0; Tau Ceti TauCeti.Huber.Pair.

<a id="target-0-16"></a>

### 0.16 Root-extension chart model

Define `rootExtensionChartModel`. Let `E_root∞` be the completion of `E(π^(1/p^∞))`. On the `n=1` chart let `π_m=π^(1/p^m)`, `v_m=[ϖ]^(1/p^m)`, `s_m=π_m/v_m`. In the completed base extension, set `A_0⁺=(W⊗̂_OE O_(E_root∞))[s_m:m≥0]^∧_[ϖ]`, with `π_m=v_m s_m` and `s_(m+1)^p=s_m`. Then `A=A_0⁺[1/[ϖ]]`, and `A⁺` is the integral closure of the extended chart plus ring. Reduction gives `A_0⁺/[ϖ]≃(R⁺/ϖ)[t_1^(1/p^∞)]`. The quotient in `s_m` roots the entire ratio `π/[ϖ]`.

Choose compatible roots; `R⁺` is perfect, so `v_m` exists. `E_root∞` is distinct from the Lubin–Tate torsion extension used for divisor sections.

The interface must support the following operations and laws.

- `rootChartModel`: The integral completed presentation with the three specified coefficient, denominator and whole-ratio root sequences. Their zeroth entries are the images of `π` and `[ϖ]`.
- `rootChart_reduce`: The integral root model modulo the image of `[ϖ]` is the coefficient quotient `(R⁺/ϖ)` with only the variable `t_1` perfected; the coefficient quotient is not replaced by its perfection.
- `rootChart_roots`: The constructed sequence `s_(m+1)^p=s_m`, together with the compatible `π_m` and `v_m` sequences.
- `rootChart_tiltCoordinate`: In the constructed model `π_m=v_m s_m`; after denominator localization `s_0=π/[ϖ]`. The geometric tilt identifies the corresponding root sequence with `t_1`, whose sharp is `s_0`.
- `rootChartRatio`: The compatible whole-ratio sequence in that same rootChartModel.

Construct the integral completed tensor by the separated completion of the finite coefficient-extension system, with the weak `(π,[ϖ])` topology on the Witt factor. Prove its comparison with every finite quotient, its continuous module splitting and the inverse-limit comparisons used for rational and finite-étale restriction. The coefficient map need not be adic, so this construction is not an application of a general Huber-pair pushout. Use the rational relation `π=[ϖ]s_0` to construct the completed presentation.

Adjoin compatible roots of that relation; retain all `π_m=v_ms_m` equations.

Reduce modulo `[ϖ]` and eliminate the coefficient-root relations, leaving the perfected polynomial variable.

**Checks.**

- `root_boundary_norm`: A valuation on the actual rootChartModel with nonzero `v_m` and `|π_m|=|v_m|` has `|s_m|=1`.
- `root_special_fibre`: Localize the constructed `v_0` before quotienting by the constructed `π_0`: the image of `s_0` is zero.
- `root_wrong_fraction`: Rooting only the numerator fails the boundary norm at every `m>0`.
- `root_reciprocal`: In a nonzero `π_0=0` special fibre with `v_0` inverted, the constructed `s_0` is not a unit. Its reciprocal cannot be the integral chart coordinate.

Further specializations and compatibility requirements are as follows.

- On `|π|=|[ϖ]|=c<1`, every `s_m` has norm 1; `π^(1/p^m)/[ϖ]` would have norm `c^(1/p^m−1)>1`.

([FS](#ref-fs) II.1.1 root-extension presentation, printed p. 48.)

*Needs:* [§0.15](#target-0-15); [§0.10](#target-0-10); AdicSpacesPartII, R0.

<a id="target-0-17"></a>

### 0.17 Perfectoid root extension and split sheaf descent

Prove `chartCoverPerfectoidnessAndSheafiness`. The charts `B_n` are sheafy. Their completed extension to `E_root∞` is perfectoid; the associated perfected disc charts glue to `S×_(𝔽_q)Spa 𝔽_q[[t^(1/p^∞)]]`. Hence `𝒴_S` is an analytic adic space over `O_E`. In mixed characteristic the charts are sousperfectoid; in equal characteristic perfection after the root extension and the split-module argument give the same sheaf conclusion.

`B_n` as defined above; plus rings are integral closures. The splitting is a continuous `B_n`-linear retraction, not a ring retraction.

Reduce to `n=1` using coefficient perfection and Frobenius.

For `A_0⁺`, use `u=[ϖ]^(1/p)`: `u^p` divides `p` in mixed characteristic because `π=[ϖ]s_0` and `p` is a unit times a power of `π`; the root presentation proves `u` is regular and `Frob`:`A_0⁺/u→A_0⁺/u^p` is bijective. Apply the integral-perfectoid criterion (BMS 3.10(ii)); in equal characteristic apply the perfect characteristic-`p` criterion.

Identify the tilt from the reduction presentation and `t_1♯=π/[ϖ]`. Normalize the global disc coordinate so these are the corresponding nested disc charts.

The coefficient-root extension admits a topological module splitting; transport it through the completed chart tensor product. Apply sousperfectoid sheaf descent, then glue the rational chart cover.

Further specializations and compatibility requirements are as follows.

- Verify the chosen `u` and both quotient ideals in the criterion; establish a continuous splitting before invoking the imported theorem.

([FS](#ref-fs) Proposition II.1.1 and proof, printed pp. 48–49; [BMS](#ref-bms) Lemma 3.10(ii), printed pp. 22–23.)

*Needs:* [§0.16](#target-0-16); PerfectoidSpaces, P1; PerfectoidSpaces, P3; AdicSpacesPartIII, R3.5/split-injection-completed-base-change; PerfectoidSpaces, P3.17a.3/sousperfectoid-sheafy.

<a id="target-0-18"></a>

### 0.18 Integral relative period domain

Consume VectorBundlesAndIsocrystals VB−1, `integral-period-domain` (`integralPeriodDomain`), with its complete coefficient, topology, chart, Frobenius and ordinary bundle-descent API. Here identify the explicit integral root charts of §§0.15–0.17 with those supplied charts, including their plus rings and special fibre. The domain is `𝒴_S=Spa(W_OE(R⁺),W_OE(R⁺))∖V([ϖ])`.

**Checks.**

- In equal characteristic over `Spa C`, the comparison gives the open unit disc including `π=0`.
- The characteristic-`p` untilt remains on `V(π)`.
- The root-chart restriction identifies the same `[ϖ]`-denominator and the same integral-closure plus ring.

([FS](#ref-fs) II.1 opening and Proposition II.1.1, printed pp. 47–48.)

*Needs:* [§0.15](#target-0-15); [§0.17](#target-0-17); VectorBundlesAndIsocrystals VB−1/integral-period-domain.

<a id="target-0-19"></a>

### 0.19 Integral period diamond comparison

Prove `untiltFunctorOfPoints`. For perfectoid `T/𝔽_q`, maps from an untilt `T♯` to `𝒴_S` are naturally pairs of an `O_E`-untilt of `T` and a map `T→S`. Thus curly-`Y_S◇≃S×Spd O_E`. The diamond of a pre-adic space is formed using untilt pairs; the non-Tate coefficient object `Spd O_E` is not replaced by `Spd E`.

Affinoid and subsequently general `S`; maps to `O_E` require `π` topologically nilpotent in the untilt, and the image of `[ϖ]` invertible in its Tate ring.

A map from an affinoid untilt is a continuous `W_OE(R⁺)→A⁺` map whose Teichmuller pseudouniformizer is invertible in A.

Use the perfect strict-lift universal property and `θ` to identify it with `R⁺→(A⁺)♭`, preserving plus rings.

This is precisely a map `T→S`; descend the equivalence on affinoid covers.

Further specializations and compatibility requirements are as follows.

- Use the pre-adic diamond interface from D6; do not presume the non-Tate coefficient ring is a Tate pair.

([FS](#ref-fs) Proposition II.1.2, printed p. 49.)

*Needs:* [§0.7](#target-0-7); [§0.18](#target-0-18); DiamondsAndVStacks, D6; PerfectoidSpaces, P1.18/fontaine-theta-and-primitive-kernel.

<a id="target-0-20"></a>

### 0.20 Gluing integral period spaces

Prove `gluingForGeneralBase`. For an affinoid open `S′⊂S`, curly-`Y_S′→``𝒴_S` is an open immersion and `|`curly-`Y_S′|=|`curly-`Y_S|×_|S||S′|`. The affinoid construction therefore glues for every perfectoid `S/𝔽_q`, compatibly with the integral diamond product and Frobenius.

An open immersion of bases, not an unrestricted ordinary fibre product of adic spaces over `S`.

Take the inverse image open in the diamond product.

Compare its adic structure with curly-`Y_S′` after `O_E→O_E_root∞`, where both spaces are perfectoid and diamonds detect the isomorphism.

Use the split injections on structure sheaves to descend the isomorphism; cocycle identities follow from naturality.

Further specializations and compatibility requirements are as follows.

- Check the intersection of two affinoid base opens; the identification is canonical.

([FS](#ref-fs) Proposition II.1.3 and proof, printed p. 49.)

*Needs:* [§0.19](#target-0-19); [§0.17](#target-0-17); DiamondsAndVStacks, D6/etale-site-comparison.

<a id="target-0-21"></a>

### 0.21 Whole analytic A-`inf` locus

Define `wholeAnalyticAinfLocus`. For `E=ℚ_p` put `W=W(R⁺)`, with its `(p,[ϖ])`-adic topology. Construct the two completed Huber pairs and valuation-space/presheaf comparison on `Z_S=Spa(W,W)∖V(p,[ϖ])`, the union of `D(p)` and `D([ϖ])`. It contains curly-`Y_S=D([ϖ])` and the end where `[ϖ]=0,p≠0`. The new work equips this locus with the two completed rational Huber pairs `|[ϖ]|≤|p|≠0` and `|p|≤|[ϖ]|≠0` and compares their rational presheaves and overlap; its underlying topological analytic locus is the input specified in Scope and ownership. The chart topologies are distinct, and the overlap is the equal-boundary localization.

Perfect Tate Huber `R` of characteristic `p` with integral-element subring `R⁺`; this additional comparison is explicitly `p`-typical.

The interface must support the following operations and laws.

- `wholeAnalyticAinf_cover`: Two inequality charts cover `Z_S`.
- `wholeAnalyticAinf_overlap`: Their intersection is `Spa(B_12,B_12⁺)`.

Cover the complement of simultaneous vanishing by the two rational inequalities.

Use Kedlaya Definition 3.5 for `B_1,B_2,B_12` and their plus rings.

Compare the rational presheaves on the two charts and their overlap. The ringed analytic domain is defined in §0.22 after sheafiness.

**Checks.**

- `analytic_crystalline_end`: A valuation through `W(k)[1/p]`, killing `[ϖ]`, lies in `Z_S`.
- `analytic_special_end`: `p=0,[ϖ]≠0` is in `Z_S` and in `𝒴_S`.
- `analytic_not_generic_union`: Removing `V(p)∪V([ϖ])` would omit both ends.
- `analytic_completed_charts`: On the chart `|[ϖ]|≤|p|≠0`, `p` is a topologically nilpotent unit after rational completion; on `|p|≤|[ϖ]|≠0`, `[ϖ]` is one. The unlocalized weak Witt ring does not have either of these Tate structures.
- `analytic_overlap_restrictions`: On the intersection, the two completed rational restriction maps agree on `W` and send their adjoined ratio coordinates to inverse units. An overlap map preserving only the underlying set fails this comparison.
- `analytic_primed_topology`: The ring identification involving the primed chart in Kedlaya Definition 3.5 does not identify its prescribed ideal of definition. The comparison must retain that ideal and its continuous completion, rather than infer a homeomorphism from a ring isomorphism.

Further specializations and compatibility requirements are as follows.

- Retain the crystalline end `[ϖ]=0` and compare the generic part with the appropriate `p`-adic topology.

([Kedlaya A-inf](#ref-kedlaya-a-inf) Hypothesis 3.4 and Definition 3.5, printed p. 7; Theorem 3.8, pp. 8–9.)

*Needs:* [§0.7](#target-0-7); AdicSpacesPartII, R0.

<a id="target-0-22"></a>

### 0.22 Sheafiness at both analytic ends

Prove `wholeAnalyticAinfSheafiness`. The whole analytic `A_inf` locus `Z_S` is sheafy on the specified charts, including the end `[ϖ]=0,p≠0`. For any discrete perfect `𝔽_p`-algebra `R_0`, `W(R_0)[1/p]` with its `p`-adic Tate topology is sheafy. This is distinct from strong noetherianity of the field-case `Y_[0,∞)` (SW Theorem 13.1.3), which is not a target here; no relative noetherianity is asserted.

Kedlaya Hypothesis 3.4 for `Z_S`; discrete `R_0` for the separate Witt assertion; field case only for strong noetherianity.

Use the stable uniformity of `A_1,A_12,B_1,B_2,B_12,B_2′` in Kedlaya 3.6; do not assert the stronger unproved property of `A_2`.

For the `p`-adic end, complete the coefficient-root extension and identify its perfectoid reduction; a split module retraction descends sheafiness.

After these sheafiness results, define `wholeAnalyticAinf` as the ringed analytic domain on `Z_S` by gluing the two charts of §0.21 with their analytic structure sheaves. Its complete chart/plus-ring identifications, cover and overlap maps are the presheaf comparisons of §0.21 equipped with the sheaf structure.

Further specializations and compatibility requirements are as follows.

- Distinguish equal underlying rings with different `p`-adic and `[ϖ]`-adic topologies; no general relative noetherianity conclusion.

([SW](#ref-sw) Proposition 13.1.1, printed pp. 108–109; Remark 13.1.2 and Theorem 13.1.3, p. 109; [Kedlaya A-inf](#ref-kedlaya-a-inf) Proposition 3.6, printed p. 8.)

*Needs:* [§0.21](#target-0-21); [§0.16](#target-0-16); PerfectoidSpaces, P3.17a.3/sousperfectoid-sheafy; AdicSpacesPartIII, R3.5/split-injection-completed-base-change.

<a id="target-0-23"></a>

### 0.23 Nonperfect Cohen coefficient lifts

Prove `cohenCoefficientLifts`. For any field `K/𝔽_q`, construct a flat, separated `π`-adically complete `O_E`-algebra with marked residue `K`. Any two such lifts admit a residue-compatible `O_E`-algebra isomorphism, and `q`-Frobenius admits an `O_E`-linear lift. These choices are not canonical when `K` is imperfect. Use `Algebra.CotangentComplex` and its square-zero algebra/morphism obstruction theory. Prove `L_(K/𝔽_q)≃Ω¹_(K/𝔽_q)[0]` by localization and filtered colimits of smooth finitely generated subextensions of the perfect field `𝔽_q`: `Ext²_K(L,N)` removes algebra-lifting obstructions and `Ext¹_K(L,N)` removes comparison/morphism-lifting obstructions; `Hom_K(Ω¹,N)` controls ambiguity. These higher Ext groups vanish because `Ω¹_(K/𝔽_q)` is a vector space in degree zero. The API includes the marked reduction, flat completeness, existence of comparison isomorphisms and a chosen Frobenius lift, without a uniqueness assertion for these maps. `Suggested.lean` states `cohenCoefficientLift_exists` for existence with a Frobenius lift and `cohenCoefficientLift_compare` for residue-compatible comparison. The coefficient ring is a complete discrete valuation ring with finite residue field, and the residue extension is an arbitrary field.

**Checks.**

- Perfect `K` recovers §0.7's strict lift and its canonical Frobenius.
- For `K=𝔽_q(T)`, `dT≠0`; lifts of `T` can differ by `π` and cannot be declared canonical.
- In equal characteristic `K[[π]]` is a lift with coefficientwise `q`-Frobenius and `π` fixed.

([FF (2017)](#ref-ff-2017) Remarque 1.3.5, printed p. 60.)

*Needs:* [§0.7](#target-0-7); DerivedModuleAlgebra §§0.4–0.12 and §0.25.

### Examples

For the residue algebra `𝔽_q` the perfect strict lift is `O_E`; the zero residue algebra lifts to zero. In equal characteristic the Teichmüller element is the constant power series. For the root chart choose `|π|=|[ϖ]|=r` with `0<r<1`. Then `|s_m|=1`, whereas rooting only the numerator gives `r^(1/p^m−1)>1`. The reciprocal `[ϖ]/π` is undefined at `π=0`. These calculations separate coefficient lifting, whole-ratio rooting and the retained special fibre.

### Dependencies

Mathlib WittVector; Mathlib WittVector.ghostComponent; Mathlib WittVector.frobenius; Mathlib PerfectRing; Mathlib IsAdicComplete; Mathlib WittVector.teichmuller; Mathlib PadicInt; Mathlib FormalGroup; Mathlib MvPowerSeries.eval₂; AdicSpacesPartII, R0; Tau Ceti TauCeti.Huber.Pair; PerfectoidSpaces, P1; PerfectoidSpaces, P3; AdicSpacesPartIII, R3.5/split-injection-completed-base-change; PerfectoidSpaces, P3.17a.3/sousperfectoid-sheafy; Tau Ceti TauCeti.ValuationSpectrum.spa; DiamondsAndVStacks, D6; PerfectoidSpaces, P1.18/fontaine-theta-and-primitive-kernel; DiamondsAndVStacks, D6/etale-site-comparison. The scope of each named supplier is fixed in Exact supplier contracts.

## Layer 1: annuli and relative period rings

<a id="target-1-1"></a>

### 1.1 Generic relative period domain

Consume `Y_S=𝒴_S∖V(π)` and its sheaf, complete charts, Frobenius and functoriality from VectorBundlesAndIsocrystals VB−1, `integral-period-domain` and `relative-annuli`. The comparison with §0.18 restricts the explicit integral-chart interface to this supplied generic open.

**Checks.**

- Over an equal-characteristic geometric base this is the punctured open unit disc.
- The point `π=0` is absent.
- Both `π` and `[ϖ]` are nonzero at every point of this open.

([FS](#ref-fs) Definition II.1.15, printed p. 54.)

*Needs:* [§0.18](#target-0-18); VectorBundlesAndIsocrystals VB−1/integral-period-domain; VectorBundlesAndIsocrystals VB−1/relative-annuli.

<a id="target-1-2"></a>

### 1.2 Radius and relative period annuli

Consume the completed annuli, restriction maps and plus rings from VectorBundlesAndIsocrystals VB−1, `relative-annuli`. Prove `radiusFunctionAndRationalAnnuli`, the comparison of those annuli with the logarithmic radius and higher-rank rational inequalities below. For `x∈|Y_S|` let `x̃` be its unique rank-one generalization and `rad_ϖ(x)=log|[ϖ](x̃)|/log|π(x̃)|∈(0,∞)`. For rational `0<a≤b` define the rational open `Y_[a,b]` by `|π|^b≤|[ϖ]|≤|π|^a`, using integer-power inequalities to interpret rational exponents. Its supplied ring `B_[a,b]` is the completed rational localisation of `W_OE(R⁺)`, with integral-closure plus ring. Equal endpoints are allowed. The radius factors through the Berkovich quotient and `rad_ϖ(φx)=q rad_ϖ(x)`. Changing `ϖ` changes the radius function but gives cofinal annular exhaustions of the same `Y_S`.

Affinoid `S`; fixed `ϖ` for this radius, a,`b` positive rational. The rational open may differ from the entire set `rad^−1([a,b])` at higher-rank points.

The target is the explicit all-`E` radius dictionary, including the higher-rank/rank-one comparison, on the supplied complete relative annuli. The `p`-typical rational power predicates and wandering-window topology are inputs from the ownership boundary.

The interface must support the following operations and laws.

- The scalar radius expression is `log(teichval)/log(πval)`. Its geometric use requires `0<πval<1` and `0<teichval<1`; the denominator is nonzero. Its power-scaling identity holds for every natural `q` and `teichval>0` with `0<πval<1`, including `q=0`.
- `periodRadius`: The logarithm ratio at the rank-one generalization.
- `periodAnnulus`: The completed rational chart for `[a,b]`.
- `periodRadius_frobenius`: `rad_ϖ(φx)=q rad_ϖ(x)`.
- `periodAnnulus_restrict`: `I⊂J` induces the continuous rational restriction `B_J→B_I`.
- `periodAnnulus_plus`: `B_I⁺` is the integral closure of its ring of definition.

Use the maximal/rank-one generalization of analytic points; logarithm ratios are independent of rescaling the real valuation.

Clear denominators in the rational inequalities and use Huber rational localisation.

`q`-Frobenius fixes `π` and raises `[ϖ]` to the qth power.

Compare powers of two pseudouniformizers for cofinality; do not assert their radii equal.

**Checks.**

- `radius_scalar_two`: At `πval=1/2` and teichval`=1/4` the value is 2.
- `radius_scalar_power`: Replacing teichval by `(1/4)³` makes the value 6.
- `radius_denominator_domain`: `log(t)/log(1)=0` for every real `t` by the totalized scalar division; this input is excluded from the geometric radius. Also teichval`=0` is excluded by `D([ϖ])`.
- `radius_scale`: If `|[ϖ]|=|π|^a` at a rank-one point, `rad_ϖ=a`.
- `annulus_equal_ends`: `[a,a]` gives a boundary annulus and is not discarded as empty.
- `radius_varpi_power`: Replacing `ϖ` by `ϖ^m` multiplies rad by `m`, while preserving the generic domain.

Further specializations and compatibility requirements are as follows.

- For `a=b` the affinoid boundary is used in the fundamental-domain gluing.

([FS](#ref-fs) Proposition II.1.16, printed pp. 54–55.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-annuli; [§1.1](#target-1-1); DiamondsAndVStacks, D5/berkovich-quotient; AdicSpacesPartII, R0.

<a id="target-1-3"></a>

### 1.3 Witt seminorm extension and restriction

Define `wittSeminormLambdaMu`. For a perfect `𝔽_p`-algebra with a power-multiplicative seminorm `α` bounded by the trivial norm, define `λ(α)(Σp^i[x_i])=max_i p^(−i)α(x_i)`, and `μ(β)(x)=β([x])`. They preserve multiplicative seminorms. The maps on their Berkovich spectra are continuous, `μλ=id` and `λμ≥id`. The same formulas extend to the relative integral and interval rings with the domination conditions of KL5.1.2.

The initial ring need not be a field or Banach. The analytic relative version uses a perfect uniform Banach pair over an analytic field and `0<s≤r`.

For the initial Witt spectrum, `α(x)≤1` and `β` is dominated by the `p`-adic norm: `β(x)≤1` for all Witt `x` and `β(p)≤p^−1`. Both spectra carry the topology induced by pointwise evaluation. Perfectness and characteristic `p` are mandatory.

The interface must support the following operations and laws.

- `wittLambda`: A map from trivial-bounded multiplicative coefficient seminorms to `p`-adic-bounded Witt seminorms, defined by the Teichmüller coefficient maximum.
- `wittMu`: The actual Teichmüller restriction from the `p`-adic-bounded Witt spectrum to the trivial-bounded coefficient spectrum.
- `wittMu_lambda`: `μ(λ(α))=α`.
- `wittLambda_mu`: On that bounded Witt spectrum, `β(x)≤λ(μ(β))(x)` for every Witt vector.
- `wittLambda_continuous`: Continuous for the induced pointwise-evaluation spectrum topologies.

Use homogeneous Witt addition polynomials to prove the ultrametric bound.

A leading maximal coefficient gives multiplicativity when `α` is multiplicative; iterate for power multiplicativity.

Prove `μ` is subadditive despite the nonadditivity of Teichmuller representatives.

Use stable Witt presentations to prove continuity and `μλ=id`; extend bounded seminorms to completions.

**Checks.**

- `lambda_teich`: `λ(α)([x])=α(x)`.
- `lambda_p`: `λ(α)(p)=p^−1` for a nonzero seminorm.
- `lambda_mu_not_identity`: If `β(p)=p^−1` and `β(p−[ϖ])=0`, the actual `λμ` majorant takes the positive value `p^−1` on `p−[ϖ]`. The normalized primitive quotient is not fixed by `λμ`.

Further specializations and compatibility requirements are as follows.

- Distinguish a ring homomorphism from this construction on seminorms.

([KL I](#ref-kl-i) Definition 3.3.2 and Lemma 3.3.3, printed p. 76; Proposition 5.1.2, pp. 114–115; [Kedlaya Witt](#ref-kedlaya-witt) Lemmas 4.1 and 4.4, Theorem 4.5 and Example 4.7, printed pp. 19–23.)

*Needs:* [§0.7](#target-0-7); Mathlib Valuation.

<a id="target-1-4"></a>

### 1.4 Relative extended Robba rings

Consume PadicHodgeTheory §7.5, `relativePeriodSheaf` and its weighted `p`-typical Robba, bounded, integral and interval carriers, restriction and Frobenius maps, and VectorBundlesAndIsocrystals VB1, `tilted-robba-ring`. Define `relativeExtendedRobbaRings` as the additional twelve-variant interfaces by comparison with these carriers; prove the additional growth estimates and all-`E` refinements here. For a perfect uniform Banach pair `(R,R⁺)` over an analytic field of characteristic `p` with spectral norm `α`, identify the supplied carriers with `Ẽ^int=W(R)`, `Ẽ=Ẽ^int[1/p]`, `R̃^(int,r)={Σ_(i≥0)p^i[x_i]:p^(−i)α(x_i)^r→0}`, `R̃^(bd,r)=R̃^(int,r)[1/p]`, `R̃^r` its Frechet completion for `λ(α^s)`, `0<s≤r`, and `R̃^[s,r]` its Banach completion for `max(λ(α^s),λ(α^r))`. Dropping `r` takes the union over `r>0`. Each plus-input variant uses `R⁺` instead of `R`. Its integral/bounded variants are `W(R⁺)` and `W(R⁺)[1/p]`; `R̃⁺` is the completion for all `s>0`, whereas `R̃^∞=∩_rR̃^r` is a different ring. Record `p`-adic, weak, Banach, Frechet and inductive limit topologies separately.

KL Hypothesis 5.0.1. These are extended relative rings. The paper does not construct the arithmetic relative Robba rings. For all `E`, compare the supplied ramified annuli with the formulas using `π` and `q`-Frobenius, and prove the additional growth and norm comparisons through coefficient transport.

The interface must support the following operations and laws.

- `relativeRobbaIntegral`: The actual subring of WittVector `p R` whose Teichmüller expansion coefficients satisfy `p^−i α(x_i)^r→0`, at `r>0`.
- `relativeRobbaInterval`: The endpoint-norm completion of the bounded growth ring at `0<s≤r`.
- `relativeRobbaPlus`: The image in the `infinity` ring of the all-positive-radii completion of `W(R⁺)[1/p]`; the `R⁺` input is retained.
- `relativeRobba_restrict`: Continuous interval restrictions for interval inclusion.
- `relativeRobba_frobenius`: In the `p`-typical interface, `φ` transports `[s,r]` to `[s/p,r/p]`; the all-`E q`-transport requires the recorded norm extension.

Compare the supplied growth subrings, localizations and completions with these interfaces using the coefficient norm estimates; transport the estimates through the all-`E` coefficient comparison.

Use `log` convexity to identify the interval norm with its two endpoint maximum.

Identify the supplied inclusions, topologies and Frobenius with `φ`:`R̃^[s,r]≃R̃^[s/q,r/q]` in the explicit interfaces.

**Checks.**

- `robba_teich`: The actual Teichmüller Witt element belongs to relativeRobbaIntegral, and its actual coefficient growth tends to zero.
- `robba_singleton_interval`: The actual completed singleton interval norm on its Teichmüller image equals `α(x)^r`; the definition is not tested by an unrelated `max` identity.
- `robba_plus_infinity`: If `α(x)>1` and `α≤1` on `R⁺`, the actual Teichmüller image of `x` in relativeRobbaInfinity does not lie in the constructed plus-completion image.

Further specializations and compatibility requirements are as follows.

- Never identify `R̃^∞` with `R̃⁺` or complete every ring in a single norm.

([KL I](#ref-kl-i) Hypothesis 5.0.1 and Definitions 5.1.1 and 5.1.3, printed pp. 113–115.)

*Needs:* PadicHodgeTheory §7.5/relativePeriodSheaf; VectorBundlesAndIsocrystals VB1/tilted-robba-ring; [§0.7](#target-0-7); [§1.3](#target-1-3).

<a id="target-1-5"></a>

### 1.5 Robba growth, units and Frobenius invariants

Prove `robbaGrowthUnitsAndInvariants`. For nonzero `x`, `t↦log λ(α^t)(x)` is convex. In `R̃^r`, boundedness as `t→0` characterizes `R̃^(bd,r)`. Every unit of `R̃` is already a unit in `R̃^bd` by KL5.2.3. The `φ^d`-invariant ring is `W(R^(φ^d))[1/p]`, retaining idempotents and disconnected constants. For `R⁺=R°`, membership `x∈R̃⁺` within `R̃^∞` is equivalent to `limsup_(t→∞)λ_t(x)^(1/t)≤1`.

Use exactly the bounded or completed ring in each criterion. Frobenius invariants are not asserted to be `ℚ_p` when the base is disconnected.

Prove convexity first on finite Witt sums and then by completion.

Use bounded endpoint norms to recover bounded Witt coefficients.

For a unit `x` with inverse `y`, use affine residue-field `log` norms and a uniform two-radius bound to show both `x` and `y` have bounded growth near zero.

For invariants compare each coefficient under `φ^d`; for the plus criterion use the integral/fractional splitting and the asymptotic coefficient maximum.

**Checks.**

- The unit has constant logarithmic norm zero, satisfying the convexity and bounded-growth tests.
- For a perfect complete nontrivially valued characteristic-`p` field `F` with `d=1`, the fixed period ring is `ℚ_p`.

- Check the invariant formula on `R=F×F`, where `F` is a perfect complete nontrivially valued characteristic-`p` field. With `d=1`, `F^{φ}=𝔽_p` and the fixed period ring is `ℚ_p×ℚ_p`.

([KL I](#ref-kl-i) Lemmas 5.2.1–5.2.2 and Corollaries 5.2.3–5.2.4, printed pp. 116–117; Lemma 5.2.11 and proof, pp. 119–120.)

*Needs:* [§1.4](#target-1-4); [§1.3](#target-1-3).

<a id="target-1-6"></a>

### 1.6 Controlled Robba splittings and intersections

Prove `robbaControlledSplittings`. For `0<s≤r` and `n∈Z` every `x∈R̃^[s,r]` splits `x=y+z` with `y∈p^nR̃^(int,r)`, `z` extending to every `[s,r′]`, `r′≥r`, and `λ_t(z)≤p^((1−n)(1−t/r))λ_r(x)^(t/r)` for `t≥r`. For `0<c<1` there is the second splitting of KL5.2.9 into bounded and plus parts with endpoint norm bounds and its `φ` estimates. Consequently `R̃^[s,r]∩R̃^[s′,r′]=R̃^[s,r′]` inside `R̃^[s′,r]` for `0<s≤s′≤r≤r′`. Intersection preservation for a base ring square requires strict inclusions and, for completions, a strict difference map.

The interval intersection specifies its common ambient ring. The strictness conditions of Remark 5.2.13 cannot be removed.

Split finite Witt sums at their `p`-adic index, or by `α(x_i)>c`.

Approximate a completed element by a geometrically convergent sequence of bounded sums.

Sum the split pieces using the displayed estimates.

Apply the integral-ring intersection lemma and strict completion exactness to the interval and base-square intersections.

Further specializations and compatibility requirements are as follows.

- Do not use the naive coefficient-series formula for an arbitrary interval-completed element.

([KL I](#ref-kl-i) Lemma 5.2.6, Remark 5.2.7, Lemmas 5.2.8–5.2.10 and Remark 5.2.13, printed pp. 117–121.)

*Needs:* [§1.4](#target-1-4); [§1.5](#target-1-5); AdicSpacesPartII, R0/strict-complex-completion-exact.

<a id="target-1-7"></a>

### 1.7 Relative period presheaves

Consume PadicHodgeTheory §7.5, `relativePeriodSheaf` and its weighted `p`-typical Robba, bounded, integral and interval carriers, restriction and Frobenius maps, and VectorBundlesAndIsocrystals VB1, `tilted-robba-ring`. Define `relativePeriodPresheaves` as the additional twelve-variant rational-basis interfaces by comparison with these supplied presheaves; prove their additional growth and all-`E` comparisons here. On `Spa(R,R⁺)` present the period presheaf for each of the twelve variants `Ẽ^int,Ẽ,R̃^(int,r),R̃^(int,+),R̃^int,R̃^(bd,r),R̃^(bd,+),R̃^bd,R̃^[s,r],R̃^r,R̃⁺,R̃` by the inverse limit of its values on rational affinoids contained in an open `U`. Restrictions and base maps are induced by the coefficient maps and completions. The plus-input and positive-radii-completion variants keep their distinct topologies.

Perfect uniform Banach base as in KL5.0.1; bounds and radii must be adjusted for a bounded coefficient map before taking the union.

The interface must support the following operations and laws.

- `relativePeriodPresheaf`: The rational-basis limit presheaf retains the coefficient functor, plus subrings, norms, rational basis, prime, radii `s,r` and twelve-variant index.
- `relativePeriodPresheaf_restrict`: Compatible restriction maps for open inclusion.
- `relativePeriodPresheaf_affinoid`: On a rational affinoid `U`, identify the constructed presheaf value with relativePeriodRing of `coeff(U)`, `plus(U)`, `α_U`, `p,s,r` and that same variant.
- `relativePeriodPresheaf_phi`: The coefficient Frobenius induces the natural transformation to the same variant with radii `s/p,r/p`.

Compare the rational-basis functor with the supplied restriction maps using Witt naturality and bounded norm estimates.

Use restriction coherence to define the limit on all opens.

Prove its value on a rational affinoid is its original period ring once the basis sheaf condition is established.

**Checks.**

- `period_empty`: The value on the empty open is the terminal zero ring.
- `period_restriction_chain`: Restriction through two rational subopens equals their composite.
- `period_plus_distinction`: Use the actual affinoid comparison for `R̃⁺` and its inclusion into `R̃^∞`. For `α(x)>1` with `α≤1` on `R⁺`, `[x]` is outside this inclusion’s image.

Further specializations and compatibility requirements are as follows.

- Keep the sheaf claim separate from the definition.

([KL I](#ref-kl-i) Definition 5.3.1, printed pp. 121–122.)

*Needs:* PadicHodgeTheory §7.5/relativePeriodSheaf; VectorBundlesAndIsocrystals VB1/tilted-robba-ring; [§1.4](#target-1-4); AdicSpacesPartIII, R3.

<a id="target-1-8"></a>

### 1.8 Period sheaves and rational acyclicity

Consume the `p`-typical rational and finite-projective descent of PadicHodgeTheory §7.5, `relativePeriodSheaf`, and VectorBundlesAndIsocrystals VB−1, `relative-annuli`. Prove `relativePeriodSheafAndAcyclicity` as their comparison with the twelve-variant interfaces, including the additional plus-variant sheaf assertions, exact acyclicity range and all-`E` refinements below. Every period presheaf of KL5.3.1 is a sheaf. Rational Tate acyclicity is asserted for `Ẽ^int,Ẽ,R̃^(int,r),R̃^int,R̃^(bd,r),R̃^bd,R̃^[s,r],R̃^r,R̃`, exactly the nine variants of Theorem5.3.3. The supplied Kiehl property is transported to the explicit interfaces for `Ẽ^int` and `R̃^(int,r)`, and separately for `R̃^[s,r]`; it is not automatically asserted for all twelve variants.

Use continuous strict rational covering sequences and the norm assigned to each variant. The plus variants are sheaves without the extra acyclicity claim in this theorem.

Use the supplied rational descent on the common carriers. For the additional variants and coefficient refinements, compare the Laurent covering sequence coefficientwise in Witt expansions and use controlled splitting to preserve strictness under the specified completions.

For `R̃^r` choose a convergent correction sequence over the shrinking radii, eliminating the `lim^1` term.

Apply the imported rational-basis sheaf and Kiehl descent criteria only to the cases proved in KL5.3.3 and5.3.6.

Further specializations and compatibility requirements are as follows.

- Acyclicity is asserted for exactly the nine variants above and Kiehl gluing only for the three named cases; neither is asserted for all twelve variants.

([KL I](#ref-kl-i) Lemma 5.3.2, Theorems 5.3.3 and 5.3.6, printed pp. 121–123.)

*Needs:* PadicHodgeTheory §7.5/relativePeriodSheaf; VectorBundlesAndIsocrystals VB−1/relative-annuli; [§1.7](#target-1-7); [§1.6](#target-1-6); AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing; AdicSpacesPartIII, R3.5/glueing-square-finite-projective-descent.

<a id="target-1-9"></a>

### 1.9 Relatively perfectoid interval rings

Consume rational and finite-projective descent on the supplied `p`-typical interval carriers from PadicHodgeTheory §7.5 and VectorBundlesAndIsocrystals VB−1, `relative-annuli`. Prove `intervalRingsRelativelyPerfectoid` for the explicit interfaces, retaining the additional norm comparisons and all-`E` refinements. For `0<s≤r` the Banach rings `Ẽ`, `R̃^(bd,r)` and `R̃^[s,r]` are relatively perfectoid. For any compatible adic plus extension they are stably uniform, sheafy, rationally acyclic and satisfy finite-projective Kiehl gluing. After scalar extension to the completed `p`-power-root tower the interval norm is power multiplicative and the ring is perfectoid. In all-`E` annular charts use the specified whole root relations and prove the coefficient extension of these norm estimates.

No field assumption on `R`. Relative perfectoidness is the imported sousperfectoid/relative-perfectoid condition, not an unproved designation for every Frechet or integral ring.

Compute scalar tensor norms using fractional `p`-power exponents and their orthogonal basis.

Prove power multiplicativity away from the finitely many norm-crossing radii and use convex continuity at crossings.

Frobenius-compatible Teichmuller representatives generate a dense perfect subring after tensor extension.

Transport the supplied descent along the interval comparisons. For the all-`E` norm refinement apply AdicSpacesPartIII §R3.5’s split completed-base-change criterion and PerfectoidSpaces §P3.17a.3’s sheafiness criterion to the listed Banach rings.

Use the corrected perfectoid completed-tensor comparison of [KL II](#ref-kl-ii) Theorem 3.3.13 (including injectivity), required from P3, when invoking Lemma 5.3.14; the old KL3.6.11 proof is incomplete.

Further specializations and compatibility requirements are as follows.

- The integral period disc uses its own chart theorem; it is not one of the three rings in this assertion.

([KL I](#ref-kl-i) Theorem 5.3.9 and Lemma 5.3.14, printed pp. 123–125.)

*Needs:* PadicHodgeTheory §7.5/relativePeriodSheaf; VectorBundlesAndIsocrystals VB−1/relative-annuli; [§1.4](#target-1-4); [§1.5](#target-1-5); [§0.16](#target-0-16); PerfectoidSpaces, P3.17a.3/sousperfectoid-sheafy; AdicSpacesPartIII, R3.5/split-injection-completed-base-change; PerfectoidSpaces, P3.

<a id="target-1-10"></a>

### 1.10 Interval adic pairs and base projection

Consume the supplied interval carriers and their rational and finite-projective descent from PadicHodgeTheory §7.5 and VectorBundlesAndIsocrystals VB−1, `relative-annuli`. Define `intervalAdicPairAndBaseProjection` as their explicit plus-ring and valuation-projection comparison. Give `R̃^[s,r]` the plus ring obtained by completing the subring generated by elements of endpoint norm `<1` and `[R⁺]`. A semivaluation first determines its unique exponent `t∈[s,r]`, then a seminorm `γ=μ(β)^(1/t)` of `R`. Extending to `H(γ)` and using `{x:v([x])≤1}` yields the valuation on `R`. This defines `μ_ad`:`Spa(R̃^[s,r],R̃^[s,r],+)→Spa(R,R⁺)` as a continuous map of adic topological spaces, without a structural ring homomorphism `R→R̃^[s,r]`.

Teichmuller representatives are multiplicative; their nonadditivity must be handled through the valuation-ring criterion. The pair uses the specified completed plus ring.

The interface must support the following operations and laws.

- `relativeAnnulusPair`: The interval Banach ring with its completed plus ring.
- `relativeAnnulus_exponent`: The unique `t∈[s,r]` determined by the coefficient valuation.
- `relativeAnnulus_toBase`: The continuous adic-spectrum map `μ_ad`.
- `relativeAnnulus_baseValuation`: Its valuation ring consists of the bounded Teichmuller representatives.

Determine `t` by evaluating a topologically nilpotent unit from the analytic coefficient field.

Use domination to extend the seminorm to the completed residue field.

Prove the bounded Teichmuller representatives form a valuation ring.

Check the plus condition and continuity on rational inequalities.

**Checks.**

- `annulus_projection_teich`: The pullback valuation measures `[x]` by the corresponding coefficient valuation.
- `annulus_endpoint`: Both `t=s` and `t=r` occur; a singleton interval is allowed.
- `annulus_no_additive_teich`: The projection is defined by valuations although `[x+y]` need not equal `[x]+[y]`.

Further specializations and compatibility requirements are as follows.

- Use the source plus ring and normalized exponent in the projection.

([KL I](#ref-kl-i) Lemma 5.3.4 and Definition 5.3.10, printed pp. 122–124.)

*Needs:* PadicHodgeTheory §7.5/relativePeriodSheaf; VectorBundlesAndIsocrystals VB−1/relative-annuli; [§1.4](#target-1-4); [§1.9](#target-1-9); [§1.3](#target-1-3); Tau Ceti TauCeti.ValuationSpectrum.spa.

<a id="target-1-11"></a>

### 1.11 Rational base change and interval descent

Consume rational base change and finite-projective interval descent from PadicHodgeTheory §7.5, `relativePeriodSheaf`, and VectorBundlesAndIsocrystals VB−1, `relative-annuli`. Apply this supplied descent to the explicit twelve-variant period interfaces of §§1.4–1.10; the comparisons denoted `annularRationalBaseChange` retain their individual topologies and restriction maps. A rational localization `(R,R⁺)→(S,S⁺)` induces the rational localization of interval pairs representing `μ_ad^−1Spa(S,S⁺)`. Rational base coverings therefore induce annular coverings and the interval period sheaf satisfies Kiehl gluing. For a finite covering `I=⋃I_j` of a compact interval in `(0,∞)`, `R̃^I→∏R̃^I_j` is effective descent for finite projective modules. After the scalar extension of KL5.3.14, each subinterval restriction is itself a rational localization; before that extension use the proven gluing square, rather than asserting rationality.

The interval cover is finite and uses closed intervals; the Banach base is perfect uniform over an analytic field. General base maps give functorial maps, not a universal uncompleted tensor identity.

Identify the supplied rational-localization maps through their Teichmüller inequalities and spectral norms. Transport the supplied gluing squares and finite-projective descent along these comparisons, retaining the restriction and overlap maps; the all-`E` transport uses the coefficient norm comparison.

Further specializations and compatibility requirements are as follows.

- Do not call every interval restriction a rational localization over `ℚ_p` before the required scalar extension.

([KL I](#ref-kl-i) Lemma 5.3.11, Corollary 5.3.12 and Theorems 5.3.13 and 5.3.16, printed pp. 124–126.)

*Needs:* PadicHodgeTheory §7.5/relativePeriodSheaf; VectorBundlesAndIsocrystals VB−1/relative-annuli; [§1.10](#target-1-10); [§1.6](#target-1-6); [§1.9](#target-1-9); AdicSpacesPartIII, R3.5/glueing-square-finite-projective-descent; AdicSpacesPartIII, R3.5/finite-projective-etale-descent.

<a id="target-1-12"></a>

### 1.12 Berkovich period deformation

Define `berkovichPeriodDeformation`. On `M(R̃^(int,r))` the stable-presentation construction defines `H(β,u)`, `u∈[0,1]`, with `H(β,0)=β`, `H(β,1)=λμ(β)`, `μH(β,u)=μ(β)`, and `H(H(β,u),v)=H(β,max(u,v))`. It is continuous. On `T_R=⋃_(0<s<r)M(R̃^[s,r])` it gives a strong deformation retract to `M(R)×(0,∞)`. The properly discontinuous `φ^d` action scales the exponent by `q=p^d`, has compact Hausdorff quotient `X_R`, and descends the retraction to `M(R)×(R_>0/q^Z)≃M(R)×S^1`.

These are Berkovich spaces and their maximal Hausdorff quotient. Neither the deformation nor the circle description asserts an adic ringed-space product.

The interface must support the following operations and laws.

- `periodHomotopy`: The stable-presentation `H` on the Gauss-bounded spectrum of the constructed relative integral growth ring, with coefficient norm and `r>0` as parameters.
- `periodHomotopy_zero`: `H(β,0)=β`.
- `periodHomotopy_one`: `H(β,1)=relativePeriodLambda(relativePeriodMu β)`, with the same coefficient datum and radius.
- `periodHomotopy_max`: `H(H(β,u),v)=H(β,max(u,v))` for that constructed `H`.
- `periodBerkovichQuotient`: The compact quotient and its circle-valued exponent.

Extend to the residue valued field and define `H` using stable Witt presentations.

Check the endpoint, restriction and `max`-semigroup formulas.

Embed into a Witt spectrum for the trivially normed integral ring to prove joint continuity.

Use the exponent and a compact fundamental annulus to prove discontinuity and compactness; descend the compatible deformation.

**Checks.**

- `homotopy_fixed`: For a point produced by the actual relative Gauss section `λ`, `H(λ(β),u)=λ(β)`.
- `homotopy_mu`: The actual relative Teichmüller restriction `μ` is constant along each `H` path.
- `circle_disconnected_base`: On a product coefficient algebra, two period points with different `μ`-values at `(1,0)` cannot be joined by the constructed deformation; the quotient retains the base components.

Further specializations and compatibility requirements are as follows.

- The topological circle statement supplies no adic structural map to the base.

([KL I](#ref-kl-i) Theorem 5.4.1, Definition 5.4.3, Theorem 5.4.4 and Proposition 5.4.6, printed pp. 126–127; [Kedlaya Witt](#ref-kedlaya-witt) Definition 7.5, Theorem 7.8 and proof, printed pp. 33–34.)

*Needs:* [§1.3](#target-1-3); [§1.10](#target-1-10); [§1.5](#target-1-5); DiamondsAndVStacks, D5/berkovich-quotient.

<a id="target-1-13"></a>

### 1.13 Surjectivity of relative period spectra

Prove `periodSpectrumSurjectivity`. If `R→S` is bounded between perfect uniform Banach `𝔽_p`-algebras and `M(S)→M(R)` is surjective, then `M(R̃_S^(int,r))→M(R̃_R^(int,r))` is surjective for every `r>0`. The proof extends a seminorm using a perfected auxiliary variable, a primitive quotient and a lift from `M(S)`. No faithfully flat tensor-product hypothesis is substituted for the given spectral surjectivity.

`R,S` retain their Banach topology; use exactly KL5.4.2’s hypothesis on Berkovich spectra.

Adjoin and perfect a variable with its `p^−1`-Gauss norm.

Extend the given Witt seminorm so `p−T` is killed and read it as a primitive-quotient norm.

Lift the base seminorm through `M(S)` and the residue-field completed tensor extension.

Restrict the lifted norm back to the original integral growth ring.

Use the corrected primitive perfectoid quotient input required from P3, as in [KL II](#ref-kl-ii) Theorem 3.3.13 rather than the incomplete proof of KL3.6.11 ([KL II](#ref-kl-ii) Remark 3.3.14).

Further specializations and compatibility requirements are as follows.

- Do not broaden the conclusion to an adic-cover or tensor isomorphism without another comparison.

([KL I](#ref-kl-i) Lemma 5.4.2, printed p. 126.)

*Needs:* [§1.3](#target-1-3); [§1.4](#target-1-4); PerfectoidSpaces, P1.18/distinguished-element-criterion; AdicSpacesPartII, R0; PerfectoidSpaces, P3.

<a id="target-1-14"></a>

### 1.14 Finite etale compatibility of period rings

Prove `periodRingsFiniteEtaleCompatibility`. Finite etale `S/R` lifts to the relative Witt and extended period rings. FE`́t(R̃^int)→`FE`́t(W(R))→`FE`́t(R)` are tensor equivalences; at a fixed `r` the category is `φ^−1`-equivariant FE`́t(R̃^(int,r))`, with quasi-inverse `S↦R̃_S^(int,r)`. The bounded and completed period-ring extensions of KL5.5.4 are finite etale and satisfy its finite-module base-change comparisons. For a normalized degree-one primitive `z` with `z_0∈R×` and `z−[z_0]∈pW(R⁺)×`, take `r≥1`, a compact interval `I⊂(0,∞)` containing 1 and `m>0`. Every existing arrow in KL I Lemma 5.5.5(b)’s diagram induces an isomorphism modulo `z^m`. In particular the bounded-radius arrow `R̃^(bd,r)_R→R̃^I_R` is included only for `I⊆(0,r]`. Consequently the lifted finite-etale correspondence agrees with the imported perfectoid tilting correspondence.

Enumerate the diagram’s coefficient and period maps as follows (write `U=R⁺` or `R°` for its two plus-growth choices).

- `W(R⁺)[1/[z₀]]=W(R°)[1/[z₀]]→R̃^(int,r)_R`, with vertical inversion of `p` on the Witt terms and `R̃^(int,r)_R→R̃^(bd,r)_R`.
- `W(R⁺)[1/[z₀],1/p]=W(R°)[1/[z₀],1/p]→R̃^(bd,r)_R`.
- `W(R⁺)[1/p]→W(R°)[1/p]`; for each `U`, the localization `W(U)[1/p]→W(U)[1/[z₀],1/p]`, the identification `W(U)[1/p]=R̃^(bd,r)_U`, and the completion map `W(U)[1/p]→R̃^I_U`.
- `R̃^(bd,r)_(R⁺)→R̃^(bd,r)_(R°)→R̃^(bd,r)_R` and `R̃^I_(R⁺)→R̃^I_(R°)→R̃^I_R`. The remaining arrow `R̃^(bd,r)_R→R̃^I_R` exists only for `I⊆(0,r]`.

The plus-growth subscripts retain KL Definition 5.1.1’s coefficient bounds. The displayed equalities are the canonical identifications in the diagram, with each arrow taken before reduction modulo `z^m`.

**Checks.**

- For `r=1` and `I=[1,2]`, omit the bounded-radius-to-interval arrow; there is no such restriction map.
- For `r=2` and `I=[1,2]`, that arrow exists and gives the quotient isomorphism for every `m>0`.
- At `m=1`, the quotient comparisons recover the same primitive untilt residue ring; `m=0` is outside the statement.

The fixed-radius integral category requires Frobenius descent. The primitive quotient is normalized and is taken at a window containing its radius.

Use the corrected primitive definition in [KL II](#ref-kl-ii) Appendix A: `z_0` is a unit of `R`. This concerns the generic quotient comparison and does not remove the `π=0` integral leg.

Lift a finite residue-module generating set and use a strict norm bound to obtain generators at sufficiently small radii. In KL I Lemma 5.5.2, initialize the residual with `z₀=z`, not the printed `z₀=0`, and use the `S`-period ring for the final arbitrary element (printed pp. 128–129). In Proposition 5.5.3’s proof, the module’s scalar ring is the period ring without the printed FÉt wrapper (p. 129). The residual recursion and module types determine these readings of the displayed proofs.

Use henselian lifting for the integral union and Frobenius iteration for each fixed radius.

Lift a finite-projective splitting and prove the completed tensor map is isometric.

Use the primitive relation to exchange `p` and `[z_0]` in the finite quotients; induct on `m` via regularity. Use the corrected `x_0` coefficient and spectral coefficient norm in the final estimate of KL5.5.5 (KLII Appendix A).

Compare the finite-etale equivalence with the P3 almost-purity supplier, without rebuilding almost purity.

Further specializations and compatibility requirements are as follows.

- Record the finite module tensor comparisons from Proposition5.5.4, not a general tensor-limit interchange.

([KL I](#ref-kl-i) Lemma 5.5.2, Propositions 5.5.3–5.5.4, Lemma 5.5.5 and Corollary 5.5.6, printed pp. 128–132.)

*Needs:* [§1.4](#target-1-4); [§1.6](#target-1-6); PerfectoidSpaces, P1.18/distinguished-element-criterion; AdicSpacesPartIII, R3.5/finite-projective-etale-descent; PerfectoidSpaces, P3.

<a id="target-1-15"></a>

### 1.15 Stein exhaustion of the generic period space

Consume the countable quasi-Stein annular exhaustion, dense restrictions, inverse-limit section comparison and higher acyclicity for finite projective annular modules from VectorBundlesAndIsocrystals VB−1, `relative-annuli`. Identify its structure-sheaf inverse limit with the explicit completed period rings of §1.4. On affinoid bases this identifies `O(Y_S)` with that Fréchet limit and gives `Hⁱ(Y_S,O)=0` for `i>0`.

**Checks.**

- Restriction of a finite Witt sum agrees in every compact annular ring.
- The two cofinal exhaustions from `ϖ` and `ϖ^m` give the same limit by the radius dictionary.
- The zero annular module has zero limit and zero higher cohomology.

([FS](#ref-fs) II.2 opening, printed p. 57; [KL I](#ref-kl-i) §6.1.)

*Needs:* [§1.4](#target-1-4); [§1.2](#target-1-2); VectorBundlesAndIsocrystals VB−1/relative-annuli.

<a id="target-1-16"></a>

### 1.16 Annular coefficient and anchor comparisons

Consume choice independence and annular coefficient transport from VectorBundlesAndIsocrystals VB−1, `relative-coefficients` and `relative-annuli`. Prove `annularCoefficientChoiceAndAnchorComparisons` for the explicit Robba norms, radius dictionary and fixed-field anchor below. Uniformizer and topologically nilpotent-unit choices give canonical identifications of `Y_S` and its sheaf; the annular coverings change by cofinal refinement with the transformed radius convention. Finite coefficient-field change is computed from the perfect unramified-base Witt tensor comparison, then rational localization, completion and integral closure of plus rings. In the specialization `E=ℚ_p,S=Spa(F,O_F)`, identify each closed interval ring and plus ring with the absolute `B^I,B^{I,+}` of TauCetiRoadmap.AdicSpaces, Layer 6 (§6.3), respecting all rational restriction maps, complete topologies and Frobenius. These comparisons commute with the fixed-field diamond presentation; a homeomorphism of spectra is insufficient.

For coefficient change choose the residue embedding and corresponding `q`-power Frobenius. For a general completed coefficient extension use the integral coefficient-tensor comparison of §0.16; no tensor product over `R` of nonadditive Teichmuller maps is formed.

Use ghost-preserving Witt uniformizer transport and the unit change in each primitive equation.

Compare the valuations defining the two annular bases and obtain cofinal rational refinements.

Carry the finite unramified-base scalar comparison through the finite completed chart operations and plus-ring integral closure.

At the fixed-field anchor match the same Witt coefficient norms and dense subrings; the completion universal property identifies the rings, not merely their `Spa` sets.

Check each comparison commutes with restrictions, the transported Frobenius and the cofinal choice transport.

Further specializations and compatibility requirements are as follows.

- A field-specialization check must give an isomorphism of complete Huber pairs compatible with the coefficient Frobenius.

([FS](#ref-fs) II.1.1 and generic-open convention, printed pp.48–49; [KL I](#ref-kl-i) Definitions 5.1.1–5.1.3 and Remark 5.1.6, printed pp. 113–115.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-coefficients; VectorBundlesAndIsocrystals VB−1/relative-annuli; [§0.4](#target-0-4); [§0.10](#target-0-10); [§1.4](#target-1-4); [§1.11](#target-1-11); [§1.2](#target-1-2); TauCetiRoadmap.AdicSpaces, Layers 3–6; AdicSpacesPartII, R0.

<a id="target-1-17"></a>

### 1.17 Local generation on period annuli

Prove `localGenerationOnPeriodAnnuli`. Let `M` be finite projective over `R̃^[s,r],0<s≤r`. If elements `e_1,…,e_n` generate its base change to `R̃_(H(β))^[s,r]` for `β∈M(R)`, then they generate `M` after a rational localization of the base `(R,R⁺)` encircling `β`. This is a local neighborhood conclusion and does not assert that `M` is free or that the same generators work over the whole base.

Finite projective interval module, a finite proposed generating set and generation over the completed coefficient residue field.

Apply Nakayama at each point of the residue-field period annulus.

Cover that compact annulus by finitely many rational neighborhoods where the elements generate.

Spread this finite covering to a rational base neighborhood of `β`.

Use the residue-point detection criterion for surjectivity of finite modules to conclude generation.

Further specializations and compatibility requirements are as follows.

- Passing from generation on every interval to generation of global sections is the separate target §1.18 (KL Lemma 6.1.4).

([KL I](#ref-kl-i) Lemma 5.1.7 and proof, printed p. 116.)

*Needs:* [§1.4](#target-1-4); [§1.10](#target-1-10); [§1.11](#target-1-11); AdicSpacesPartIII, R3.5/glueing-square-finite-projective-descent.

<a id="target-1-18"></a>

### 1.18 Generation of global annular sections

Prove `annularGlobalSectionGeneration`. Under KL Hypothesis 5.0.1, let `a≥1` and let `M={M_I}` be a `φ^a`-bundle over the relative extended Robba annuli. If the same finite family of global sections `v₁,…,v_n` generates `M_I` over `R̃^I` for every compact interval `I⊂(0,∞)`, it generates `Γ(M)` over `R̃^∞`. Use the countable cofinal intervals and convergent corrections between local splittings; dense restriction alone is not algebraic surjectivity. Prove the all-`E` version using §1.16’s coefficient norm comparisons; the displayed source statement is `p`-typical.

**Checks.**

- The zero bundle is generated by the empty family.
- The section 1 generates the trivial line on every interval and globally.
- Generation on one interval is insufficient: the hypothesis requires every interval in a cofinal exhaustion.

([KL I](#ref-kl-i) Lemma 6.1.4, printed p. 134.)

*Needs:* [§1.15](#target-1-15); [§1.16](#target-1-16); VectorBundlesAndIsocrystals VB1/annular-frobenius-descent.

### Examples

At a rank-one point with `|[ϖ]|=|π|²` the radius is 2, and replacing `ϖ` by `ϖ³` gives radius 6 with the same domain. A boundary interval `[2,2]` is retained. A perfected Robba ring has coefficients weighted by its explicitly stated norm parameter, so comparison with this geometric radius must compute the reciprocal conversion before changing interval endpoints.

### Dependencies

Layers 0; DiamondsAndVStacks, D5/berkovich-quotient; AdicSpacesPartII, R0; Mathlib Valuation; AdicSpacesPartII, R0/strict-complex-completion-exact; AdicSpacesPartIII, R3; AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing; AdicSpacesPartIII, R3.5/glueing-square-finite-projective-descent; PerfectoidSpaces, P3.17a.3/sousperfectoid-sheafy; AdicSpacesPartIII, R3.5/split-injection-completed-base-change; PerfectoidSpaces, P3; Tau Ceti TauCeti.ValuationSpectrum.spa; AdicSpacesPartIII, R3.5/finite-projective-etale-descent; PerfectoidSpaces, P1.18/distinguished-element-criterion; TauCetiRoadmap.AdicSpaces, Layers 3–6. The scope of each named supplier is fixed in Exact supplier contracts.

## Layer 2: the relative curve and its diamond

<a id="target-2-1"></a>

### 2.1 Relative Fargues–Fontaine curve

Consume VectorBundlesAndIsocrystals VB−1, `relative-period-curve` (`relativePeriodCurve`), for the analytic quotient `X_S=Y_S/φ^ℤ`, its structure sheaf, quotient charts and base functoriality. Compare its wandering windows with §1.2’s explicit radius: for affinoid `S`, `Y_[1,q]` presents the qcqs curve with the two boundary annuli identified by Frobenius.

**Checks.**

- A point and its Frobenius translate have the same image.
- The radius-1 and radius-`q` boundary charts are identified by the supplied coefficient Frobenius.
- The integral point `π=0` is outside this generic quotient.

([FS](#ref-fs) Definition II.1.15 and Proposition II.1.16, printed pp. 54–55.)

*Needs:* [§1.2](#target-1-2); VectorBundlesAndIsocrystals VB−1/relative-period-curve.

<a id="target-2-2"></a>

### 2.2 Period diamonds and the topological map to the base

Prove `diamondFormulaAndMapToBase`. There are canonical isomorphisms `Y_S◇≃S×Spd E` and `X_S◇≃(S×Spd E)/(φ_S^Z×id)`. Since absolute Frobenius `φ_S×φ_E` acts trivially on the product topology, the second presentation can topologically move the action to the coefficient factor. It gives a qcqs continuous map `|X_S|→|S|`. This is not an adic structural morphism `X_S→S`.

The coefficient base is `Perf_(𝔽_q)`, with a chosen embedding when changing to an algebraically closed residue base.

Restrict the integral product comparison to the generic open.

Identify the actual equivariant action and apply effective sheaf quotient descent.

Use simultaneous absolute Frobenius on topology to transfer the action; on affinoid opens the compact fundamental annulus proves the map qcqs.

At the fixed-field `ℚ_p` specialization identify the ring maps defining the affinoid product and equivariant quotient comparisons.

Further specializations and compatibility requirements are as follows.

- Check equivariance on maps of marked untilts, not only a homeomorphism of quotient sets.

([FS](#ref-fs) Proposition II.1.17 and preceding paragraph, printed p. 55.)

*Needs:* [§0.19](#target-0-19); [§2.1](#target-2-1); DiamondsAndVStacks, D0/groupoid-quotients-and-two-fibre-products.

<a id="target-2-3"></a>

### 2.3 Functoriality of relative period curves

Consume the analytic maps and their identity/composition laws from VectorBundlesAndIsocrystals VB−1, `integral-period-domain` and `relative-period-curve`. Prove `relativeCurveFunctoriality`, their compatibility with §2.2’s equivariant diamond presentations. A map of perfectoid bases `T→S` over `𝔽_q` induces analytic maps curly-`Y_T→``𝒴_S`, `Y_T→Y_S` and `X_T→X_S`, preserving Frobenius, quotient charts and pullback of locally free sheaves. Composition and identity hold. For an open base immersion these are the open inverse images on topology. The diamond square `Y_T◇→Y_S◇` over `T→S` is cartesian; curve diamonds compare through the equivariant quotient presentation, with the Frobenius action on the varying base.

General morphisms have no ordinary cartesian square `X_T→X_S` over `T→S` in adic spaces, since there is no structural `X_S→S`.

Compare the supplied maps on the explicit coefficient rings, rational inequalities and completed localisations.

Use the already established integral open comparison on base opens.

`q`-Frobenius equivariance descends maps to quotient charts; descent cocycles prove composition.

Check products and quotients on the actual untilt functors.

Further specializations and compatibility requirements are as follows.

- A geometric point `s→S` gives `X_(K(s),K(s)⁺)→X_S` with the correct marking.

([FS](#ref-fs) II.1.3 and paragraph after II.1.16, printed pp. 49 and 55.)

*Needs:* VectorBundlesAndIsocrystals VB−1/integral-period-domain; VectorBundlesAndIsocrystals VB−1/relative-period-curve; [§0.20](#target-0-20); [§0.8](#target-0-8); [§2.1](#target-2-1); [§2.2](#target-2-2); AdicSpacesPartII, R0/completed-tensor-product.

<a id="target-2-4"></a>

### 2.4 Global period sheaves and etale curve maps

Consume the `p`-typical period sheaves and their rational and finite-projective descent from PadicHodgeTheory §7.5, `relativePeriodSheaf`, and VectorBundlesAndIsocrystals VB−1, `relative-annuli`. Define `globalPeriodSheavesAndEtaleFunctoriality` as the twelve-variant, all-`E` and étale-curve comparison with those supplied interfaces. Glue the twelve rational period sheaves over any perfect adic base; their etale sheafifications have the same values on perfect uniform affinoids. The relative-curve functor carries etale, finite etale and faithfully finite etale base morphisms to morphisms with the same property. The projection of underlying topological spaces upgrades to a morphism of etale topoi. This does not supply a structural adic map `X_S→S`.

Use the etale comparison for the exact affinoid class; a general nonuniform affinoid is not covered.

The interface must support the following operations and laws.

- `globalRelativePeriodSheaf`: The glued period sheaves on a perfect adic base.
- `globalRelativePeriodSheaf_affinoid`: On a rational affinoid `U`, the glued sheaf has the specific `relativePeriodRing(coeff(U),plus(U),α_U,p,s,r,i)` as its ring of functions.
- `relativeCurve_etale`: Etale base maps induce etale curve maps.
- `relativeCurve_finiteEtale`: Finite etale and faithfully finite etale base maps retain those properties.
- `relativeCurve_etaleTopos`: The underlying projection induces a morphism of etale topoi.

Use the supplied rational descent and overlap maps to glue the additional period-sheaf comparisons.

Use the R3 etale comparison and KL8.2.21 to identify etale values.

Apply period-ring finite-etale compatibility on annuli and descend along Frobenius.

Reduce general etale morphisms to finite-etale affinoid neighborhoods and compose the induced maps of sites.

Use the corrected factorization in KL8.2.20: `Z_ij→Y` is finite etale and `Y_ij→Z_ij` is an open immersion ([KL II](#ref-kl-ii) Appendix A, p. 191).

**Checks.**

- `global_period_affinoid`: Restriction to an affinoid recovers the rational period sheaf.
- `curve_split_etale`: A disjoint union of two copies of `S` gives two copies of `X_S`.
- `curve_split_etale_degree`: A split finite étale base cover of degree `r` gives the disjoint union of `r` copies of `X_S`; pullback of finite-projective bundles is componentwise scalar extension.

Further specializations and compatibility requirements are as follows.

- The all-`E` extension of the `p`-typical period sheaf statements is proved in the coefficient comparison.

([KL I](#ref-kl-i) Definition 8.3.4, printed p. 166; Lemma 8.7.15 and Remark 8.7.16, p. 180.)

*Needs:* PadicHodgeTheory §7.5/relativePeriodSheaf; VectorBundlesAndIsocrystals VB−1/relative-annuli; [§1.8](#target-1-8); [§1.14](#target-1-14); [§2.3](#target-2-3); [§2.2](#target-2-2); DiamondsAndVStacks, D6/etale-site-comparison.

<a id="target-2-5"></a>

### 2.5 Lubin–Tate diamond presentation

Prove `lubinTateDiamondPresentation`. Let `F` be a perfectoid field of characteristic `p` over `𝔽_q` (the source takes `F=C♭` with `C` complete algebraically closed). The classical generic period space has diamond `Y_F^◇≃Spd(F)×Spd(E)`. The tilt of the completed Lubin–Tate tower `E_LT∞` is the completed perfection of `𝔽_q((t))`, denoted `𝔽_q((t^(1/p^∞)))`, so the punctured perfected open disc over `F`, with coordinate `t`, presents `Spd(F)×Spd(E_LT∞)`; taking its `O_E×` quotient gives `Y_F^◇`, using the Lubin–Tate reciprocity action. The relative curve is the subsequent `φ^Z` quotient. These two quotients are distinct, and the `LT` tower is separate from the whole `π/[ϖ]` root extension used for integral chart perfectoidness.

Construct the finite `LT` torsion fields `E_n=E(LT[π^n])` and their completed union `E_LT∞`. Prove `Gal(E_n/E)≃(O_E/π^n)ˣ`, with `a` acting by the scalar endomorphism `[a]_LT`, and pass to `Gal(E_LT∞/E)≃O_Eˣ`. Prove the perfectoid tower and its tilt comparison, retaining the marked torsion coordinate. The formal module and logarithm comparison are VectorBundlesAndIsocrystals VB3, `lubin-tate-universal-cover`. This is the field-case comparison in the source; no universal base or root/`LT` tower identification is assumed.

The `lubinTateDiamondPresentation` API includes the finite torsion-field inclusions, scalar-action Galois isomorphisms compatible under level reduction, the completed tower, and its marked tilted open-disc coordinate. A change of compatible torsion generator by `u∈O_Eˣ` transports that coordinate by `[u]_LT`, not by an unrelated choice of roots.

**Checks.**

- For the multiplicative formal group over `ℤ_p`, `E_n=ℚ_p(μ_(p^n))` and a unit `a` acts by `ζ↦ζ^a`; the action is not its inverse.
- The zero torsion section cannot be used as a nonzero tower parameter; a compatible primitive sequence retains its exact level at each `n`.
- Taking the `O_Eˣ` quotient of the tower product gives the `E` product; the subsequent Frobenius quotient gives the curve. Neither quotient can be omitted.

Use the formal-group torsion tower and its tilted open-disc coordinate.

Identify the punctured perfected disc with the product for the completed `LT` tower, then descend along `Gal(E_LT∞/E)≃O_E×` to the product with `Spd(E)`.

Track the coefficient action and Frobenius orbit on both presentations.

Compare the resulting quotient with the Layer 2 curve presentation.

Further specializations and compatibility requirements are as follows.

- Keep `E_LT∞` and `E_root∞` as distinct named extensions.
- Take the coefficient-unit quotient before the Frobenius quotient; the punctured disc itself presents the `LT`-tower product, not `Y_F` without quotienting.

([FF (2017)](#ref-ff-2017) Preface by P. Colmez, Remark 3.19, printed p. 38; [FS](#ref-fs) Corollary II.2.4 and proof, printed p. 61.)

*Needs:* [§0.14](#target-0-14); [§2.2](#target-2-2); [§0.16](#target-0-16); VectorBundlesAndIsocrystals, VB3/lubin-tate-universal-cover; LocalFieldsRamification Layer 0; PerfectoidSpaces P2–P3.

### Examples

In the Lubin–Tate field case, the punctured perfected disc first gives the product with `E_LT∞`. Dividing by `O_Eˣ` gives the product with `E`, and only then dividing by `φ^ℤ` gives the curve. A change of perfectoid base is handled by these equivariant diamond formulas; no additive Teichmüller ring map to the base is introduced.

### Dependencies

Layers 0, 1; TauCetiRoadmap.AdicSpaces, Layers 3–6; DiamondsAndVStacks, D0/groupoid-quotients-and-two-fibre-products; AdicSpacesPartII, R0/completed-tensor-product; DiamondsAndVStacks, D6/etale-site-comparison. The scope of each named supplier is fixed in Exact supplier contracts.

## Layer 3: effective divisors and ambient completions

<a id="target-3-1"></a>

### 3.1 Ramified primitive untilt equations

Consume generic marked theta maps and primitive Cartier kernels from VectorBundlesAndIsocrystals VB−1, `relative-untilt-divisors`. Prove `ramifiedPrimitiveUntiltEquation` on the integral domain, including its `π=0` leg and compatibility with that generic construction. An `O_E`-untilt `(R♯,R♯+)` of the marked perfectoid pair `(R,R⁺)` gives a continuous surjection `θ_E`:`W_OE(R⁺)→R♯+` with principal regular kernel `(ξ)`. Locally choose `ϖ` with `ϖ♯` dividing `π` and a lift a of `π/ϖ♯`; then `ξ=π−a[ϖ]` is a primitive generator. This includes a characteristic-`p` untilt with `ξ=π`. For `E=ℚ_p` the construction and primitive ideal agree with the imported P1 correspondence. An arbitrary element of `W_OE(R⁺)` is not asserted primitive.

All `E`, specified coefficient embedding and marked untilt; characteristic-`p` leg allowed on the integral domain. The `q`-Teichmuller formal-group lifts are not substituted for multiplicative `[ϖ]` in this equation.

In mixed characteristic obtain the coefficient `θ` by the `p`-typical `θ` and the `O_E` action, using the unramified scalar comparison; in equal characteristic evaluate the power-series variable at the coefficient `π`.

Apply the ramified strict-lift quotient argument to identify the untilt plus ring and its regular primitive kernel.

Choose `ϖ♯|π`, lift the quotient through `θ_E`, and compare with the primitive generator using reduction and the coefficient of `π`.

Check the `p`-typical specialization on `θ` and its kernel, not only on the quotient carrier.

Further specializations and compatibility requirements are as follows.

- Prove the ramified regularity/quotient comparison before the integral closed-image argument; do not infer it from generic invertibility of `π`.

([FS](#ref-fs) Proposition II.1.4 proof, printed p. 50.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-untilt-divisors; [§0.7](#target-0-7); [§0.10](#target-0-10); PerfectoidSpaces, P1.18/fontaine-theta-and-primitive-kernel; PerfectoidSpaces, P1.21/untilts-classified-by-primitive-ideals; PerfectoidSpaces, P1.18/distinguished-element-criterion.

<a id="target-3-2"></a>

### 3.2 Untilts as integral closed Cartier divisors

Consume the generic Cartier inclusion and closed-image criterion from VectorBundlesAndIsocrystals VB−1, `relative-untilt-divisors`. Prove `closedCartierDivisorNormEstimate`, the explicit integral-chart lower bound, including the `π=0` leg. The marked `O_E`-untilt embeds into `𝒴_S` as a relative closed Cartier divisor. On a neighborhood `U={|ξ|≤|[ϖ]|^n}`, give each completed residue field the normalization `|[ϖ]|=q^−1` and `A=O(U)` its spectral norm. Multiplication by `ξ` satisfies `||ξa||≥q^−n||a||`. Therefore it is injective with closed image, and the completed untilt quotient is already `A/ξ`; `0→O→O→i_*O_(S♯)→0` is exact. This remains valid at `π=0` and on every geometric-base fibre.

`ξ` the ramified primitive equation just constructed; after localisation the untilt pullback is all of `S♯`. The normalization and common neighborhood are part of the assertion.

Any neighborhood of the Cartier zero contains one of the displayed `U`.

Reduce to a geometric fibre and its perfected disc using the root extension and tilt. Approximate by finite-level ordinary rational-disc functions. Apply the R0 strict finite-type affinoid maximum-modulus theorem only at those finite levels, where the Shilov boundary lies on `|ξ|=|[ϖ]|^n`.

Take the supremum of the finite-level boundary estimates `|ξf|=q^−n|f|`, then pass through the norm-controlled approximations to the perfected disc. This proves the lower bound without assuming a general perfected affinoid has a point attaining the spectral supremum.

The lower bound gives regularity and closed image by completeness. Since the untilt is the separated completion of `A/ξ`, closedness identifies the algebraic quotient with the complete ring.

Check fibrewise Cartier exactness using the same construction.

Further specializations and compatibility requirements are as follows.

- Use the reciprocal/root-corrected disc model; the zero section is included, and no generic-only divisor theorem is an input.

([FS](#ref-fs) Proposition II.1.4 and Remark II.1.5, printed p. 50.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-untilt-divisors; [§3.1](#target-3-1); [§0.18](#target-0-18); [§0.17](#target-0-17); RigidAnalyticGeometry, §2.2 (maximum modulus).

<a id="target-3-3"></a>

### 3.3 Ordinary descent of period line bundles

Consume generic Cartier-ideal and ordinary bundle descent from VectorBundlesAndIsocrystals VB−1, `relative-untilt-divisors` and `integral-period-domain`. Prove `ordinaryVDescentOfPeriodLineBundles` for the integral Cartier refinements and their explicit root-chart comparison. Invertible `O`-modules on `𝒴_S`, with their maps into `O`, satisfy effective `v`-descent in the perfectoid base `S`. The descended object is an ordinary invertible sheaf and its inclusion, not only an almost module. The generic and curve-local versions follow by restriction and Frobenius descent.

Use affinoid period charts with topological-module root splitting; descent includes cocycles and maps. A global generator need not descend.

Apply perfectoid vector-bundle `v`-descent on the root-extended charts.

Use the continuous split-module comparison to descend the finite projective module, as in SW 19.5.3; use rational Kiehl glueing on overlaps.

Descend the map to `O` and verify the invertible ideal condition `v`-locally.

For a degree-one leg the locally chosen generators can change by units; their ideals descend canonically.

Further specializations and compatibility requirements are as follows.

- Use the ordinary finite-locally-free `v`-descent contract of D3, including `GL₁` and morphisms into the structure sheaf.

([SW](#ref-sw) Proposition 19.5.3 and proof, printed pp. 180–181; [FS](#ref-fs) VI.1.2 proof, printed p. 191.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-untilt-divisors; VectorBundlesAndIsocrystals VB−1/integral-period-domain; [§0.16](#target-0-16); [§0.17](#target-0-17); DiamondsAndVStacks, D3; AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing.

<a id="target-3-4"></a>

### 3.4 Effective divisor moduli

Consume generic marked legs and effective Cartier divisors from VectorBundlesAndIsocrystals VB−1, `relative-untilt-divisors` and VB2, `divisor-section-comparison`. Define `divDModuliVSheaf`, the symmetric-orbit presentations and their integral-end extension. For `d≥0` define the small `v`-sheaves `Div^d_curlyY=(Spd O_E)^d/Σ_d`, `Div^d_Y=(Spd E)^d/Σ_d` and `Div^d_X=(Spd E/φ^Z)^d/Σ_d`. Each quotient is the sheafification of orbit classes, not the quotient stack. Coincident legs have multiplicity and must not be deleted. At `d=0` the sheaf is final and its divisor is empty.

On `Perf_(𝔽_q)`; coefficient base and Frobenius action are fixed. Formation of `Div_X` requires the actual Layer 2 curve quotient, while the integral product definition only needs `𝒴`.

The interface must support the following operations and laws.

- `effectiveDivisors`: The `v`-sheafification of `U↦Sym(Leg(U),d)`, whose restrictions apply the leg restriction to every component. Choose Leg`=Spd O_E`, `Spd E` or the constructed Frobenius quotient according to the domain.
- `effectiveDivisors_zero`: The sheafification of `Sym(Leg(U),0)` is the final sheaf, with empty divisor.
- `effectiveDivisors_orderedCover`: The map from the actual finite product `Leg^d` sends an ordered section to its symmetric orbit class and then to the sheafification; it is an epimorphism.
- `effectiveDivisors_generic`: The coefficient-open leg inclusion induces the generic symmetric-power open subfunctor.

Form finite products of the specified small `v`-sheaves.

Use the small sheaf quotient interface and compare with the sheaf of isomorphism classes of the action groupoid.

Restrict the integral coefficient factor to `E`; use the curve quotient on each individual leg for `Div_X`.

**Checks.**

- `divisor_degree_zero`: The actual constructed sheaf has exactly one degree-zero section over each test object.
- `divisor_double`: The image of the actual ordered tuple (a,a) is the sheafification of its repeated symmetric orbit, with length two and no deletion of a leg.
- `divisor_not_stack`: In the discrete category of sections of constructed `Div^2`, the endomorphisms of the repeated divisor form a subsingleton; the swap is a distinct nonidentity stabilizer of its ordered tuple. This distinguishes orbit sheaf from action stack.

Further specializations and compatibility requirements are as follows.

- For `d=2`, `(D,D)` is a legitimate ordered lift of `2D`; its presence is independent of a global ordering obstruction for other divisors.

([FS](#ref-fs) Definition VI.1.1, printed p. 190.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-untilt-divisors; VectorBundlesAndIsocrystals VB2/divisor-section-comparison; [§0.19](#target-0-19); [§2.1](#target-2-1); [§2.2](#target-2-2); DiamondsAndVStacks, D0/groupoid-quotients-and-two-fibre-products; Mathlib CategoryTheory.presheafToSheaf.

<a id="target-3-5"></a>

### 3.5 Product Cartier equations and affineness

Consume generic products and addition of Cartier ideals from VectorBundlesAndIsocrystals VB−1, `relative-untilt-divisors`. Prove `productEquationAndAffineness` for the explicit integral product charts, retaining colliding and characteristic-`p` legs. An ordered tuple of `d O_E`-untilts cuts out a closed Cartier divisor on `𝒴_S` with equation `ξ=∏_i ξ_i`. For affinoid `S` its ring is `W_OE(R⁺)[1/[ϖ]]/(ξ)`, with plus ring the integral closure of `W_OE(R⁺)/(ξ)`. Multiplication by the product is regular with closed image on a common suitable neighborhood, including repeated `ξ_i`. After ordinary ideal descent an unordered divisor is also affinoid for affinoid `S`. Generic divisors are affine by restriction; divisors on `X_S` are affine only locally in the analytic topology of `S`.

`d≥0`, with `ξ=1` for `d=0`; generators exist after ordering/localisation, not necessarily globally.

Apply the degree-one Cartier lower bounds successively on a common chart; the product lower bound is the product of the constants.

Identify the complete product quotient and the integral-closure plus ring.

Descend the invertible ideal along the ordered cover, preserving regularity and its inclusion into `O`.

Quasicompactness over affinoid `S` places the support in one integral chart; identify its complete quotient there.

Use Frobenius local charts for `X`; do not infer a global affinoid presentation on `X`.

Further specializations and compatibility requirements are as follows.

- At repeated legs the local ring is `A/(ξ_1²)`, not `A/(ξ_1)`; the zero divisor has ring 0.

([FS](#ref-fs) Proposition VI.1.2 and proof, printed p. 191.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-untilt-divisors; [§3.2](#target-3-2); [§3.3](#target-3-3); [§3.4](#target-3-4); [§0.15](#target-0-15); [§2.1](#target-2-1).

<a id="target-3-6"></a>

### 3.6 Geometric degree criterion

Consume the generic geometric-degree/effective-divisor identification from VectorBundlesAndIsocrystals VB2, `divisor-section-comparison`. Prove `relativeDegreeCriterion` for the symmetric-orbit presentation and its integral-end inverse family implication. `Div^d_curlyY(S)`, `Div^d_Y(S)` and `Div^d_X(S)` identify with relative effective closed Cartier divisors whose pullback to every geometric `Spa(C,C⁺)` has total degree `d`, counting lengths and repeated points. In the integral case the characteristic-`p` point is included. For a pre-existing Cartier divisor, this criterion supplies local ordered presentations rather than assuming an ordering in the definition.

The generic symmetric-power statement is Fargues Proposition 2.18. The integral inverse implication additionally requires the local factorization and ideal descent proved below; the generic statement does not supply them. At `d=0` the divisor is empty.

The product equation proves the fibre degree of every tuple, including multiplicities.

For the converse use geometric factorisation of primitive period functions and the family lifting of their unordered roots.

In the generic case compare Far Definition 2.6 and Proposition 2.18 with the leg quotient.

For the integral endpoint and arbitrary base, prove local factorization into primitive equations and descent of the invertible ideal from the symmetric orbit sheaf; the inverse family implication rests on these two statements, which are part of the present target. Their proof is independent of later bundle classification and divisor-moduli properness.

Further specializations and compatibility requirements are as follows.

- The generic proof in Fargues' preprint uses Picard and section theorems; the all-`E` integral case is proved here independently of them.
- The inverse family implication uses the integral local factorization and descent; the DVR product-length calculation alone proves only the geometric forward implication.

([FS](#ref-fs) Remark VI.1.3, printed p. 191; [Fargues divisors](#ref-fargues-divisors) Definition 2.6 and Proposition 2.18, printed pp. 6 and 11.)

*Needs:* VectorBundlesAndIsocrystals VB2/divisor-section-comparison; [§3.4](#target-3-4); [§3.5](#target-3-5); [§3.3](#target-3-3); DiamondsAndVStacks, D3; Mathlib Module.length.

<a id="target-3-7"></a>

### 3.7 Descent on divisors and their thickenings

Prove `vDescentOfBundlesOnTheDivisor`. For a family `D_S` from `Div^d`, vector bundles on `D_S` and on each finite infinitesimal thickening `V(I_D^n)`, `n≥1`, form `v`-stacks in `S`. Morphisms and descent data descend, and effectivity gives ordinary finite locally free modules. The limit of the finite quotient rings is a `v`-sheaf; the almost vanishing used in matrix correction is not the final descent conclusion.

Affineness local on `S` for curve divisors; finite `n`. The separate completion-module algebraization is not asserted here.

Descend morphisms by function-sheaf descent and finite quotient exact sequences.

Over geometric bases induct on divisor degree and thickening length, reducing the reduced degree-one case to the untilt vector-bundle theorem.

Reduce étale covers to rational and finite étale covers on the stable affinoid basis; use ordinary finite projective descent.

For a general `v`-cover approximate the geometric invariant basis so the cocycle is in `1+[ϖ]M_r(O⁺/ξ)`.

Root-chart module splitting transfers almost `H^1` vanishing from the perfectoid cover. Correct the cocycle successively with shrinking norm; completeness gives an invariant basis and an ordinary descended bundle.

Further specializations and compatibility requirements are as follows.

- Check `ξ²` and every `ξ^n`; a double leg is not treated as a reduced degree-one divisor.

([FS](#ref-fs) Proposition VI.1.4 and proof, printed pp. 191–192; [SW](#ref-sw) Lemma 17.1.8 and Corollary 17.1.9, printed pp. 150–151.)

*Needs:* [§3.5](#target-3-5); [§3.2](#target-3-2); DiamondsAndVStacks, D2/v-descent-of-functions; DiamondsAndVStacks, D3; PerfectoidSpaces, P3; AdicEtaleGeometry, A1.6a/stable-basis-etale-vector-bundles; AdicSpacesPartIII, R3.5/finite-projective-etale-descent.

<a id="target-3-8"></a>

### 3.8 Completed divisor period rings

Consume the generic single-untilt completion and filtration from VectorBundlesAndIsocrystals VB−1, `relative-period-completions`. Define `completedRingsBPlusAndB`, its integral-end and multileg extension, with finite-thickening descent and compatibility with the supplied completion. For the invertible Cartier ideal `I_D⊂O_Z`, `Z=𝒴_S,Y_S` or `X_S`, define the sheaf `B_D⁺=lim_(n≥1)O_Z/I_D^n` on the formal divisor and `B_D` by locally inverting a generator of its completed ideal. If `D` is affine, take global sections; on `X` use the analytic local affine presentation. A generator `ξ` identifies this with `ξ`-adic completion and localization, but `ξ′=uξ` changes only the trivialization. The construction is intrinsic to `I_D` and descends under permutations and `v`-covers.

Completion is of the ambient sheaf, not of `O_D` with its zero divisor ideal. The zero divisor gives the zero ring. A general completed base change must use continuous completed maps; ordinary tensor products need not commute with the inverse limit.

Prove `completedDivisorGeometricStalk`, the completed geometric-stalk comparison stated in Exact supplier contracts, for the closed rings of definition `R_T` and their common regular element `t`, including colliding and nonreduced legs. The completion definition of FS VI.1 supplies neither this comparison nor preservation of smooth sections. Prove regularity and completeness on each finite Cartier thickening, identify the pointed étale colimit after inverting `t`, and compare its `t`-adic completion with the geometric fibre using the finite-thickening/topological comparison. The comparison must preserve the given geometric section. §7.6 applies the henselian approximation argument through this comparison.

Prove `divisorCompletionFiniteProjectives`. Let `B=B_D⁺` on an affine Cartier chart, with finitely generated extended ideal `J` and `B≃lim_(n≥1)B/J^n`. Reduction gives an equivalence from finite projective `B`-modules to systems of finite projective `B/J^n`-modules equipped with compatible reduction isomorphisms. Construct the inverse and the Hom comparison, and prove tensor, dual and restriction compatibility. Lift an idempotent matrix for the first quotient, identify its successive reductions with the prescribed system using nilpotent lifting, and take the complete limit of the compatible Hom matrices. Use `TauCeti.IsAdicComplete.exists_isIdempotentElem_eq` from `TauCeti.RingTheory.AdicCompletion.Idempotent` for matrix idempotent lifting. Formal-module gluing uses this equivalence, after gluing on each finite thickening.

**Checks for `divisorCompletionFiniteProjectives`.**

- The constant zero system algebraizes to zero, and the standard rank-`r` free system to `B^r`.
- A compatible system of endomorphisms of the free rank-one system is multiplication by its unique element of `lim_n B/J^n=B`.
- Replacing a Cartier parameter by a unit multiple gives identical reduction ideals and the same algebraization. Replacing `J` by `J²` uses cofinal reindexing, retaining the original finite quotient at level one.

([FS](#ref-fs) proof of Proposition VI.1.7, printed p. 193, passage from finite thickenings to completed bundles; the idempotent construction supplies this passage.)

The interface must support the following operations and laws.

- `divisorCompletion`: Intrinsic inverse-limit ring/sheaf `B_D⁺`.
- `divisorPuncturedCompletion`: Local inversion of the completed invertible ideal.
- `divisorCompletion_generator`: A generator identifies `B_D⁺` with its adic completion.
- `divisorCompletion_changeGenerator`: Replacing `ξ` by `uξ` induces the canonical identical ideal-adic ring.
- `divisorCompletion_residue`: `B_D⁺→O_D` has kernel the completed ideal.
- `divisorCompletion_complete`: For a finitely generated ideal `I` (locally principal for the Cartier input), the completion is complete for the extended ideal; `B_D⁺≃lim_n B_D⁺/I_D^n`.

Apply existing adic completion on each affine neighborhood with its actual ideal, then glue by the ideal-independent quotient system.

Use regularity to identify the completed ideal locally as a line and invert its local generator.

The unit-change comparison makes the localizations glue canonically.

Function descent on all finite thickenings and limits proves the `v`-sheaf property; order is irrelevant after ideal descent.

**Checks.**

- `completion_empty`: `D=∅` gives `B_D⁺=0`.
- `completion_double`: Completion along `(ξ²)` and along `(ξ)` have cofinal filtrations, but `A/ξ²` and `A/ξ` differ.
- `completion_special`: At the characteristic-`p` leg `ξ=π` the integral completion is `W_OE(R)`, rather than the absolute characteristic-`p` input of Mathlib BDeRhamPlus.
- `completion_unit_change`: `ξ` and `uξ` generate identical powers of ideals.

Further specializations and compatibility requirements are as follows.

- A repeated leg is completed along `(ξ²)`, which has a cofinal power filtration with `(ξ)`; its finite quotient modulo `(ξ²)` still retains multiplicity.

([FS](#ref-fs) VI.1 after Proposition VI.1.4, printed p. 192.)

*Needs:* Tau Ceti `TauCeti.RingTheory.AdicCompletion.Idempotent`; VectorBundlesAndIsocrystals VB−1/relative-period-completions; [§3.5](#target-3-5); [§3.7](#target-3-7); Mathlib AdicCompletion; Mathlib IsLocalization; Mathlib Ideal.span; Mathlib Ideal.span_singleton_mul_left_unit.

<a id="target-3-9"></a>

### 3.9 Addition and disjoint divisor loci

Consume generic Cartier addition and the disjoint-support locus from VectorBundlesAndIsocrystals VB−1, `relative-untilt-divisors`. Define `additionAndDisjointDivisorLoci` on the integral symmetric-orbit interfaces and prove their multileg completion comparison. Concatenation of ordered tuples descends to `Div^d×Div^e→Div^(d+e)`, associative and commutative with the empty-divisor unit. Its Cartier ideal is `I_(D+E)=I_D I_E`. The disjoint locus consists of pairs with disjoint supports, equivalently `I_D+I_E=O` locally, and there the positive completed ring splits `B_(D+E)⁺≃B_D⁺×B_E⁺` by the Chinese remainder theorem. At colliding legs this product splitting is not asserted.

All three divisor domains; disjointness is local in the analytic space. Quotienting does not discard equal entries.

The interface must support the following operations and laws.

- `divisorAdd`: Degree-additive concatenation of symmetric leg quotients.
- `divisorAdd_ideal`: `I_(D+E)=I_D I_E`.
- `divisorAdd_assoc`: `(D+E)+F=D+(E+F)`.
- `divisorAdd_disjointCompletion`: Comaximal supports give the completed CRT product.

Use block concatenation and permutation invariance on the ordered covers.

Multiply the descended Cartier ideals.

For disjoint supports apply CRT to every power of the comaximal ideals and pass to inverse limits.

**Checks.**

- `addition_empty`: `D+0=D`.
- `addition_repeat`: `D+D=2D` with ideal `I_D²`.
- `addition_no_crt_collision`: For a geometric leg, `A/ξ²` is a length-two local thickening and is not `(A/ξ)×(A/ξ)`.

Further specializations and compatibility requirements are as follows.

- The repeated divisor `2D` has equation `ξ²` and does not satisfy the disjoint CRT hypothesis.

([FS](#ref-fs) Definition VI.1.1 and VI.1.2 product proof, printed pp. 190–191; [Fargues divisors](#ref-fargues-divisors) §2.4 preceding Proposition 2.18, printed p. 11.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-untilt-divisors; [§3.4](#target-3-4); [§3.5](#target-3-5); [§3.8](#target-3-8).

### Examples

For zero legs the divisor is empty and its moduli is terminal. For two disjoint legs the completed ring is a product by Chinese remainders. If two legs coincide, the equation is `ξ²`, the `ξ²`-adic and `ξ`-adic completions have the same underlying ring, but degree and numbered filtrations retain multiplicity. In particular a nonreduced divisor quotient is not assigned perfectoidness.

### Dependencies

Layers 0, 2; PerfectoidSpaces, P1.18/fontaine-theta-and-primitive-kernel; PerfectoidSpaces, P1.21/untilts-classified-by-primitive-ideals; PerfectoidSpaces, P1.18/distinguished-element-criterion; RigidAnalyticGeometry, §2.2 (maximum modulus); DiamondsAndVStacks, D3; AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing; DiamondsAndVStacks, D0/groupoid-quotients-and-two-fibre-products; Mathlib CategoryTheory.presheafToSheaf; Mathlib Module.length; DiamondsAndVStacks, D2/v-descent-of-functions; PerfectoidSpaces, P3; AdicEtaleGeometry, A1.6a/stable-basis-etale-vector-bundles; AdicSpacesPartIII, R3.5/finite-projective-etale-descent; Mathlib AdicCompletion; Mathlib IsLocalization; Mathlib Ideal.span; Mathlib Ideal.span_singleton_mul_left_unit. The scope of each named supplier is fixed in Exact supplier contracts.

## Layer 4: marked untilts and local de Rham geometry

<a id="target-4-1"></a>

### 4.1 Classical integral period points

Define `classicalPointsOfIntegralPeriodDisc`. For `C` algebraically closed perfectoid over `𝔽_q`, a point of curly-`Y_C` is classical precisely when it is the closed Cartier point of an `O_E`-untilt `C♯` with a specified identification `(C♯)♭≃C`. The completed residue field and induced `θ` map recover this marking. In equal characteristic curly-`Y_C` is an open unit disc and its classical points are `a∈C` with `|`a`|<1`, including `a=0`.

Closed points arising from marked untilts; the assertion that all maximal ideals or all closed points have this form is a separate VB2-classification theorem.

The interface must support the following operations and laws.

- `classicalIntegralPoint`: The support ideal `ker θ` of the actual marked `O_E`-untilt point; in equal characteristic it is the kernel of evaluation at `a∈C` with `|`a`|<1`.
- `classicalIntegralPoint_injective`: The completed residue field and specified `θ` recover the marked untilt; equality of those constructed points gives equality of marked data.
- `classicalIntegralPoint_equalChar`: The supports of the constructed equal-characteristic evaluation maps are in bijection with `a∈C`, `|`a`|<1`, including zero.

Use the integral Cartier construction of §3.2 to attach a point to an untilt.

Recover the untilt and its marking from the completed residue map.

For equal characteristic evaluate the coefficient `π` at a topologically nilpotent a.

**Checks.**

- `classical_zero`: The constructed equal-characteristic evaluation point at zero has support `(X)`.
- `classical_small_nonzero`: For `0<|a|<1` the constructed evaluation kernel contains `X−a` and differs from the support at zero.
- `classical_gauss_nonexample`: The positive-radius Gauss valuation on `C[X]` has zero support; every constructed evaluation kernel contains the nonzero `X−a`, so the supports differ.

Further specializations and compatibility requirements are as follows.

- The marking is part of the data; maximal-ideal/PID characterization is not used in the definition.

([FS](#ref-fs) Example II.1.6 and Definition/Proposition II.1.7, printed p. 51.)

*Needs:* [§0.18](#target-0-18); [§0.19](#target-0-19); [§3.2](#target-3-2).

<a id="target-4-2"></a>

### 4.2 Tilting map of the period disc

Define `tiltingMapOfPeriodDisc`. Root extension and tilting give a continuous surjective map `|D_C|≃|D_C`,perf`|≃|`curly-`Y_C×O_E O_E_root∞|→|`curly-`Y_C|`. Its inverse image of the classical locus is exactly the classical locus. On a classical `a∈C`, `|`a`|<1`, its image is cut out by `π−[a]`. The map is topological; ordinary ring structure is not transported through tilting.

`C` algebraically closed; `D_C` the ordinary open disc. Compatible root extension and the tilt convention from the root chart.

The interface must support the following operations and laws.

- `periodDiscTiltMap`: Continuous surjective map of underlying disc/period spaces.
- `periodDiscTiltMap_classical`: Preimage of the classical locus is the classical disc locus.
- `periodDiscTiltMap_equation`: The classical point a maps to the Cartier ideal `(π−[a])`.

Use the homeomorphism between the disc and its perfection.

Identify the perfected disc with the tilt of the root-extended integral period space.

Project the coefficient extension; evaluate `θ` on `π−[a]` for classical points.

**Checks.**

- `tilting_zero`: `a=0` maps to the special-fibre ideal `(π)`.
- `tilting_equation`: For `0<|a|<1` the image satisfies `π=[a]`.
- `tilting_not_additive`: For mixed-characteristic `E` the topological map is not induced by an additive embedding `C→W_OE(C)`.

Further specializations and compatibility requirements are as follows.

- At `a=0` the equation is `π`; surjectivity does not turn tilting into an additive ring map.

([FS](#ref-fs) Proposition II.1.8 and preceding construction, printed p. 51.)

*Needs:* [§0.17](#target-0-17); [§4.1](#target-4-1); PerfectoidSpaces, P2.

<a id="target-4-3"></a>

### 4.3 Gauss-point disc in the base-extension fibre

Prove `gaussDiscFibre`. Let `x∈D_C(C)`, `0<ρ<1` with the closed `ρ`-disc contained in `D_C`, and `x_ρ` its Gauss point. After base change to its completed residue field `C(x_ρ)`, the fibre of `x_ρ` contains the open disc of radius `ρ` around the tautological point. For power series `f`, `|u−t|<ρ` implies `|f(u)−f(t)|<|f(x_ρ)|` when `f` is nonzero, so the restricted valuations agree.

Use a disc genuinely contained in the open unit disc. The printed membership condition `x_ρ∈|D_C|` already excludes `ρ=1`; `0<ρ<1` is an explicit equivalent range here, not a source misprint.

Translate the centre to zero and use `|u^n−t^n|<ρ^n`.

Bound each coefficient term strictly below the attained Gauss maximum.

Convergence of the power series ensures the maximum is attained and proves the valuation equality.

Further specializations and compatibility requirements are as follows.

- A zero-radius point is classical and is not an instance of this positive-radius theorem.

([FS](#ref-fs) Lemma II.1.10 and proof, printed p. 52.)

*Needs:* [§4.1](#target-4-1); RigidAnalyticGeometry, §2.2 (maximum modulus).

<a id="target-4-4"></a>

### 4.4 Classical base change and nonclassical fibres

Prove `classicalBaseChangeAndNonclassicalFibres`. For `C′/C` complete algebraically closed, a point `x` of curly-`Y_C` is classical iff its fibre in curly-`Y_C′` consists of a classical point. A nonclassical rank-one point has, after some such extension, a fibre containing a nonempty open subset. No corresponding claim is made for arbitrary higher-rank points.

The phrase “is a classical point” refers to the whole fibre, not just the existence of a classical point in it.

For classical points use marked-untilt base extension.

For the converse, descend the isomorphism of the corresponding residue-field diamond along the `v`-cover `Spa C′→Spa C`.

For nonclassical rank-one points reduce through the tilting map to a Gauss disc or decreasing balls with positive limiting radius, and apply the Gauss-fibre theorem.

Further specializations and compatibility requirements are as follows.

- The nonclassical fibre can contain classical points; merely finding one does not characterize classical `x`.

([FS](#ref-fs) Proposition II.1.9 and proof, printed pp. 51–52.)

*Needs:* [§4.2](#target-4-2); [§4.3](#target-4-3); DiamondsAndVStacks, D2/v-descent-of-functions.

<a id="target-4-5"></a>

### 4.5 Inertia at a period Gauss point

Prove `inertiaAtAPeriodGaussPoint`. On the generic period domain `Y_C` there is a nonclassical rank-one point `x` with completed residue field `K(x)` such that `Gal(K(x)^sep/K(x))→I_E` is surjective. The image of any origin-centred Gauss point of radius `0<r<1` under the punctured disc tilting map works.

`C` algebraically closed over `𝔽_q`, with the coefficient embedding that identifies the completed maximal unramified extension `Ĕ` inside `K(x)`.

The residue field contains the unramified coefficient completion, so the Galois image lies in inertia.

For every finite extension of that coefficient completion, the Gauss locus lifts uniquely with its radius.

Connectedness of the fibre of each finite extension forces the map onto every finite inertia quotient; pass to the inverse limit.

Further specializations and compatibility requirements are as follows.

- This statement is the input to the Drinfeld-lemma argument of VStackSheavesAndLisseCategories, Layer VS1 (FS uses it for Proposition IV.7.3); its proof uses no form of Drinfeld's lemma.

([FS](#ref-fs) Lemma II.1.14 and proof, printed p. 54.)

*Needs:* [§4.2](#target-4-2); [§4.3](#target-4-3); TauCetiRoadmap.LocalFieldsRamification, Layers 0, 2 and 4.

<a id="target-4-6"></a>

### 4.6 Generic marked untilt comparison

Consume the generic marked-untilt Cartier correspondence from VectorBundlesAndIsocrystals VB−1, `relative-untilt-divisors`. Prove `primitiveUntiltCorrespondence`, its compatibility with this roadmap’s integral equations and quotient charts. Restrict the all-`E` integral `θ`/primitive presentation to `O_E`-untilts in which `π` is invertible. The marked untilt is a Cartier divisor on `Y_S` and then on `X_S`; the latter depends only on its Frobenius orbit. In the `E=ℚ_p` case the marking, `θ` map, primitive ideal and quotient plus ring identify with P1/marked-untilt and P1/untilts-classified-by-primitive-ideals. This imports that correspondence rather than constructing another `p`-typical primitive-ideal theory.

An `E`-untilt, not merely an `O_E`-untilt; geometric residue and plus-ring markings are retained.

Use the integral ramified presentation and closed Cartier estimate.

Restrict to the generic open, then descend through the local Frobenius quotient.

Match the `p`-typical coefficient ring and `θ` on the marked pair, including the ideal and plus ring.

Frobenius translates give the same curve divisor; local inverse charts recover the orbit.

Further specializations and compatibility requirements are as follows.

- A special-fibre leg is outside this comparison; its integral presentation remains valid.

([FS](#ref-fs) Proposition II.1.18, printed p. 55.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-untilt-divisors; [§3.1](#target-3-1); [§3.2](#target-3-2); [§2.1](#target-2-1); FarguesFontaineDiamonds F4 (fixed-field `ℚ_p` analytic Cartier comparison); PerfectoidSpaces, P1.22/marked-untilt; PerfectoidSpaces, P1.21/untilts-classified-by-primitive-ideals.

<a id="target-4-7"></a>

### 4.7 Degree-one divisor moduli and coefficient base

Consume `Div¹=Spd E/φ^ℤ` from VectorBundlesAndIsocrystals VB−1, `relative-untilt-divisors`. Prove `div1Moduli`, the explicit coefficient-base comparison and its agreement with §3.4’s degree-one symmetric-orbit presentation. The degree-one Cartier-divisor moduli on `Perf_(𝔽_q)` is `Div^1=Spd E/φ^Z`, canonically the `d=1` curve-leg quotient. Its points locally on the analytic base come from an `E`-untilt. After base change to `Perf_k`, `k` an algebraic closure of `𝔽_q` with fixed coefficient embedding, it is `Spd Ĕ/φ^Z`, where `Ĕ=W_OE(k)[1/π]`. The two coefficient bases must not be identified before this base change. The comparison identifies the supplied moduli `v`-sheaf with these two coefficient-base presentations.

Take the quotient as a `v`-sheaf on varying perfectoid bases; it is distinct from the diamond of a curve attached to one fixed base.

The interface must support the following operations and laws.

- `degreeOneDivisors`: The sheafification of the pointwise integer-Frobenius orbit presheaf of `Spd E`, with the identification with the degree-one curve-leg symmetric sheaf.
- `degreeOneDivisors_localUntilts`: The actual sheafification unit sends a coefficient untilt to its orbit divisor; each divisor admits such a lift locally on the analytic base.
- `degreeOneDivisors_baseChange`: For the specified inverse-image functor `Perf_k→Perf_(𝔽_q)`, the coefficient-base comparison and its Frobenius compatibility induce an isomorphism between base-changed `Div^1` and the sheafification of `Spd Ĕ/φ^Z`.

Take the degree-one specialization of the symmetric quotient and compare with generic marked-untilt orbits.

Use the local quotient charts to see open-cover and `v`-cover quotients agree here.

Compute the coefficient-base extension using the strict-lift/unramified completion and track `φ`.

**Checks.**

- `divone_fq_base`: A section a and a distinct Frobenius translate `φ(a)` have the same image in the actual constructed `Div^1`; the raw `Spd E` definition fails this test.
- `divone_algebraic_closure`: Evaluate the coefficient-base comparison on a geometric marked untilt `C♯/E` with fixed residue embedding `k→C♯♭`. The induced `Ĕ→C♯` extends the specified `E` action, and its divisor has the same Cartier ideal as before base change; changing the residue embedding changes the marking.
- `divone_torsion_tower`: Evaluate `Spd E_LT∞→Div¹` on a marked primitive torsion tower. Multiplication by coefficient units and shifts by powers of `π` give the same divisor. Before the Frobenius quotient, the distinct `π` shifts retain their distinct tilt markings. Use VectorBundlesAndIsocrystals VB3, `fundamental-exact-sequence`, for this section/divisor presentation.

Further specializations and compatibility requirements are as follows.

- The construction uses none of the later properties of `Div^1` (properness, spatiality and cohomological smoothness, FS Proposition II.1.21, which belong to VectorBundlesAndIsocrystals, VB3).

([FS](#ref-fs) Definition II.1.19 and following paragraph, printed p. 56; paragraph after Corollary II.2.4 for the presentation over `Perf_k`, printed p. 61.)

*Needs:* VectorBundlesAndIsocrystals VB3/fundamental-exact-sequence; VectorBundlesAndIsocrystals VB−1/relative-untilt-divisors; [§3.4](#target-3-4); [§4.6](#target-4-6); [§2.2](#target-2-2); [§0.7](#target-0-7); Mathlib CategoryTheory.presheafToSheaf.

<a id="target-4-8"></a>

### 4.`8 P`-typical affinoid de Rham comparison

Consume the generic completed ring from VectorBundlesAndIsocrystals VB−1, `relative-period-completions`. Prove `pTypicalAffinoidCompletionComparison`, the comparison of this roadmap’s intrinsic completion with the specified Mathlib carrier. For a characteristic-zero perfectoid field `K` with an open bounded valuation subring `K⁺` and a perfectoid affinoid `(K,K⁺)`-algebra `(A,A⁺)`, put `S=Spa(A♭,A♭+)`, take its `ℚ_p`-untilt divisor `D` and `J=ker(θ:W(A♭+)[1/p]→A)`. Then `B_D⁺≃lim_n W(A♭+)[1/p]/J^n`, preserving `θ`, `J`, the residue map and filtration. Under the specified P1 comparison PreTilt `A⁺ p≃A♭+`, this is the pinned Mathlib BDeRhamPlus `A⁺ p`. Only after this actual identification import PadicHodgeTheory §0.2’s affinoid theorem and its local generator.

`K` and `K⁺` satisfy the exact PadicHodgeTheory §0.2 `bdRPlusAffinoid` hypotheses. `K` need not be `C_p`. The primitive generator from `K` has nonzero image in every affinoid input; `A⁺` is `p`-adically complete with `p` nonunit.

Match the geometric tilt to Mathlib PreTilt through the P1 comparison.

Match Mathlib fontaineTheta, localization away from `p` and its extended kernel with the divisor `θ` map.

Use a Cartier neighborhood and the cofinal ideal-power quotient system to identify the two completions.

Map the chosen primitive generator from the field and check that it generates the same ideal. Invoke the PadicHodgeTheory §0.2 theorem with this comparison, retaining its residue and filtration.

Further specializations and compatibility requirements are as follows.

- The comparison precedes supplier reuse and includes the actual ideal and residue map. Characteristic-`p` inputs are outside this theorem.

([Scholze periods](#ref-scholze-periods) §6, Definition 6.1, Lemma 6.3 and Corollary 6.4, printed pp. 35–36; [FS](#ref-fs) VI.1 completion definition, printed p. 192.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-period-completions; [§3.8](#target-3-8); [§4.6](#target-4-6); PerfectoidSpaces, P1.8/tilt-comparison-with-mathlib-pretilt; PadicHodgeTheory, §0.2/bdRPlusAffinoid; Mathlib BDeRhamPlus; Mathlib WittVector.fontaineTheta; Mathlib PreTilt; Mathlib PreTilt.untilt.

<a id="target-4-9"></a>

### 4.9 Ramified de Rham coefficient comparison

Consume the filtered coefficient transport of VectorBundlesAndIsocrystals VB−1, `relative-period-completions`. Prove `coefficientFieldDeRhamComparison` for the explicit selected-factor and embedding interface below. For finite `E/ℚ_p` and a marked `E`-untilt `A` over a characteristic-zero perfectoid field, the `θ_E`-adic completion of `W_OE(A♭+)[1/π]` is canonically the `p`-typical `B_D⁺` of A, with the chosen `E` action lifted from the residue ring. It preserves residue, the completed Cartier ideal, filtration and localization. For `E′/E` the comparison is compatible with a specified `E′` action on the same untilt; a tensor product over the smaller coefficient field before selecting that action can have extra factors.

Perfect residue coefficient ring with `𝔽_q` action; the chosen embedding `E→A` selects the completion factor. This comparison is only mixed characteristic.

Identify the ramified Witt ring with its `p`-typical scalar extension over the maximal unramified coefficient ring.

After inverting `p` the coefficient extension is finite separable. Lift the chosen residue action uniquely through each square-zero step `J^n/J^(n+1)` by formal etaleness; lift the compatible sequence to the complete ring.

The corresponding finite-etale factor has residue A and is isomorphic to the completed `p`-typical ring; the selected factor gives the `θ_E` completion.

Identify the two completed invertible ideals and their unit-related local generators; this gives filtration and punctured-localization compatibility.

Further specializations and compatibility requirements are as follows.

- Preserve the selected embedding; do not claim the entire finite scalar extension is a single de Rham ring.

([FF (2017)](#ref-ff-2017) Lemme 1.2.3 and coefficient base change, printed pp. 55–56; [Stacks (henselian)](#ref-stacks-henselian) Tags 09XI and 09ZL, accessed 7 October 2026.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-period-completions; [§0.10](#target-0-10); [§4.8](#target-4-8); Mathlib Algebra.FormallyEtale.comp_bijective; Mathlib Algebra.FormallyEtale.of_isSeparable; Mathlib IsAdicComplete.liftRingHom.

<a id="target-4-10"></a>

### 4.10 Generic divisor de Rham rings

Consume generic de Rham rings and their single-leg filtration from VectorBundlesAndIsocrystals VB−1, `relative-period-completions`. Prove `BdRCompletionAndFiltration`, their agreement with the integral/multileg completion of §3.8 and §§4.8–4.9’s explicit coefficient comparisons. For a generic degree-one leg, write `B_dR⁺=B_D⁺` and `B_dR=B_D`, using the intrinsic completed Cartier ideal. The `p`-typical affinoid object is identified by the explicit affinoid comparison and its PadicHodgeTheory §0.2 theorem; finite mixed-characteristic coefficients are compared by the selected-factor theorem. Equal-characteristic `E` and arbitrary perfectoid bases retain the intrinsic all-`E` ideal-adic construction and `v`-descent. For `d>1` the same notation denotes a divisor ring and is not automatically a DVR.

Interpret the ambient completion and puncture of §3.8 at the marked generic untilt, preserving their Cartier ideal and filtration.

Restrict the integral completion to `Div^1_Y` and `Div^1_X`.

Apply the `p`-typical and finite-coefficient comparisons exactly in their hypotheses.

For equal characteristic use the power-series coefficient ring and the local Cartier ideal directly.

Glue the generic identifications and compare them with the integral construction on common quotient systems.

Further specializations and compatibility requirements are as follows.

- Absolute Mathlib BDeRhamPlus on a characteristic-`p` input is zero; it cannot replace the equal-characteristic `E` divisor completion.

([FS](#ref-fs) VI.1 after Proposition VI.1.4, printed p. 192.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-period-completions; [§3.8](#target-3-8); [§4.8](#target-4-8); [§4.9](#target-4-9); [§4.6](#target-4-6).

<a id="target-4-11"></a>

### 4.11 Cartier filtration and Breuil–Kisin lines

Consume the generic conormal filtration from VectorBundlesAndIsocrystals VB−1, `relative-period-completions`. Prove `cartierFiltrationAndBreuilKisinLines` for the integral and multileg interfaces, including their parameter-change and negative fractional-ideal conventions. Let `J` be the completed Cartier ideal in `B_D⁺`. The residue map has `B_D⁺/J≃O_D`. For `m≥0`, `gr^m B_D⁺=J^m/J^(m+1)≃(I_D/I_D²)^(⊗m)`, a line bundle on `D`. On `B_D` set `Fil^m=J^m B_D⁺` for `m∈Z` using the invertible fractional ideal. A chosen generator `ξ` identifies each graded piece with `ξ^m O_D` and the associated graded ring of the punctured `B_D` with `O_D[T,T^−1]` (the nonnegative associated graded of `B_D⁺` is `O_D[T]`); replacing `ξ` by `uξ` scales the degree-`m` trivialization by (`u` mod `I_D`)`^m`. The intrinsic line need not be globally free.

Regular invertible Cartier ideal and complete sheaf from the integral construction; no choice of generator is retained in the intrinsic statement.

Use the cofinal quotient presentation to identify the completed ideal and residue map.

For a local regular generator multiply by `ξ^m` to identify `O_D` with `J^m/J^(m+1)`.

Check the unit-change transition functions and glue to tensor powers of the conormal line.

Invert the local ideal for negative powers and check graded multiplication.

Further specializations and compatibility requirements are as follows.

- Use `ξ²` versus `ξ` tests for finite thickenings; preserve potentially nontrivial conormal transition functions.

([FS](#ref-fs) Proposition VI.1.11 and preceding VI.1.10, printed pp. 194–195.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-period-completions; [§3.8](#target-3-8); [§3.2](#target-3-2); [§4.10](#target-4-10).

<a id="target-4-12"></a>

### 4.12 Geometric untilt DVR

Consume VectorBundlesAndIsocrystals VB−1, `relative-period-completions`: at a geometric marked `E`-untilt `C♯`, the degree-one completion is a complete DVR with residue `C♯`, Cartier uniformizer and fraction field `B_D`. Compare this supplied DVR with the completed ring of §3.8 and the selected-factor identifications of §§4.8–4.9.

**Checks.**

- The residue map sends the chosen marked coefficient field to its prescribed image in `C♯`.
- Two disjoint geometric legs give a product of local DVRs, rather than a single DVR.
- For `m>1`, the finite quotient by the `m`th parameter power has length `m` and is not itself a DVR.

([FS](#ref-fs) VI.1 degree-one ring convention, printed p. 192; [Scholze periods](#ref-scholze-periods) §6, geometric case of Lemma 6.3, printed p. 35.)

*Needs:* [§3.8](#target-3-8); [§4.8](#target-4-8); [§4.9](#target-4-9); VectorBundlesAndIsocrystals VB−1/relative-period-completions.

<a id="target-4-13"></a>

### 4.13 Divisor completion and coefficient base change

Consume generic finite-thickening restriction and filtered coefficient maps from VectorBundlesAndIsocrystals VB−1, `relative-period-completions`. Prove `divisorCompletionBaseChange` for the integral/multileg quotient systems and their strict completed base-change comparisons. Base maps of marked perfectoid pairs induce continuous maps on finite Cartier quotient rings and hence on `B_D⁺`, `B_D`, residue and filtration. For rational restrictions and finite etale base maps satisfying the strict quotient comparison, these identify the completed base changes. Under finite coefficient-field change use the unramified Witt comparison and, in mixed characteristic, the selected embedding in the de Rham completion. For arbitrary `v`-covers the assertion is sheaf descent of the quotient systems and their limit; no uncompleted tensor product is claimed to commute with that limit.

Specify the complete tensor topology, plus integral closure and finite-quotient compatibility for a base-change isomorphism. Arbitrary nonflat or nonsplit tensor operations are not included.

Functoriality of primitive ideals gives maps on every quotient by `I_D^n`.

Use rational/finite-etale exactness on the actual complete quotient rings to prove the finite-level comparisons.

Pass to the compatible inverse limit with its completion topology and localize the ideal.

For general `v`-covers use the already proved ring/sheaf descent; the maps on graded lines are pullbacks of the conormal line.

Further specializations and compatibility requirements are as follows.

- State and check the strict finite-quotient comparison instead of treating all completed tensor products as exact.

([FS](#ref-fs) VI.1 completion v-sheaves, printed p. 192.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-period-completions; [§3.8](#target-3-8); [§3.7](#target-3-7); [§2.3](#target-2-3); [§0.10](#target-0-10); [§4.9](#target-4-9); AdicSpacesPartII, R0/completed-tensor-product; AdicSpacesPartIII, R3.5/finite-projective-etale-descent.

### Examples

At one geometric generic leg the completed ring is a DVR with residue `C♯`. Its nth graded piece is the nth tensor power of the conormal line. A second disjoint leg yields a product of DVRs, and a repeated leg gives a nonreduced divisor quotient. Neither is the single-leg DVR statement. Equal-characteristic integral completion remains available even when the `p`-localized Mathlib construction is zero.

### Dependencies

Layers 0, 2, 3; PerfectoidSpaces, P2; RigidAnalyticGeometry, §2.2 (maximum modulus); DiamondsAndVStacks, D2/v-descent-of-functions; TauCetiRoadmap.LocalFieldsRamification, Layers 0, 2 and 4; PerfectoidSpaces, P1.22/marked-untilt; PerfectoidSpaces, P1.21/untilts-classified-by-primitive-ideals; Mathlib CategoryTheory.presheafToSheaf; PerfectoidSpaces, P1.8/tilt-comparison-with-mathlib-pretilt; PadicHodgeTheory, §0.2/bdRPlusAffinoid; Mathlib BDeRhamPlus; Mathlib WittVector.fontaineTheta; Mathlib PreTilt; Mathlib PreTilt.untilt; Mathlib Algebra.FormallyEtale.comp_bijective; Mathlib Algebra.FormallyEtale.of_isSeparable; Mathlib IsAdicComplete.liftRingHom; Mathlib IsDiscreteValuationRing; PadicPeriodRings, §§1.5 and 4.1 (geometric de Rham DVR); AdicSpacesPartII, R0/completed-tensor-product; AdicSpacesPartIII, R3.5/finite-projective-etale-descent. The scope of each named supplier is fixed in Exact supplier contracts.

## Layer 5: rank-one twists and section charts

<a id="target-5-1"></a>

### 5.1 Integral rank-one Frobenius twists

Consume VectorBundlesAndIsocrystals VB−1, `relative-twists`, for `O_X(n)` with descent multiplier `π^(−n)φ`, its section equation, tensor/dual laws and annular/base compatibility. Use its lines and the VB0 slope convention: multiplier `π^(−n)σ` has slope `−n`, and the line has degree `n`.

Over an arbitrary field `K`, a unit `π∈Kˣ`, an integer `n` and a ring endomorphism `φ`, the scalar identity identifies `π^(−n)φ(x)=x` with `φ(x)=π^n x`. This sign calculation carries no analytic coefficient hypotheses.

**Checks.**

- `twist_multiplier_zero`: At `n=0` the multiplier is 1.
- `twist_multiplier_signs`: At `n=1` it is `π⁻¹` and at `n=−1` it is `π`.
- `twist_multiplier_unit`: Taking `π=1` gives multiplier 1 for every `n`; `π=0` has no input in Kˣ.
- `twist_section_zero`: `x=0` satisfies the equation for every `n`.
- `twist_section_weight_zero`: At `n=0` the equation is `φ(x)=x`.
- `twist_section_negative_control`: With `φ=id`, `x=1`, `n=1` and `π≠1`, the equation fails.
- `twist_zero`: `O(0)` is the structure line with descent `φ`.
- `twist_one_sign`: `O(1)` has multiplier `π^−1` and sections with `φ(f)=πf`.
- `twist_negative_sign`: `O(−1)` has multiplier `π` and sections with `φ(f)=π^−1 f`.
- `twist_inverse`: `O(n)⊗O(−n)≃O`.

Further specializations and compatibility requirements are as follows.

- At `n=1` and `n=−1` the slope/degree comparisons have opposite signs, as computed above.

([FS](#ref-fs) II.2 opening after Proposition II.2.1, printed p. 58.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-twists; [§2.1](#target-2-1); [§2.2](#target-2-2); AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing.

<a id="target-5-2"></a>

### 5.2 Positive Frobenius eigenvectors on a window

Prove `positiveFrobeniusEigenvectorRestriction`. For `n≥0,d>0,q=p^d` and `r>0`, restriction identifies `{x∈R̃⁺:φ^d x=p^n x}`, `{x∈R̃:φ^d x=p^n x}`, and compatible eigenvectors on the fundamental window `R̃^[r/q,r]`. The window equality is interpreted by agreement after restriction to the overlap on which `x` and `φ^d x` are both defined. The all-`E` version has multiplier `π^n` and `q`-Frobenius. This is the concrete period-ring presentation of nonnegative-degree sections, without a finite-dimensionality assertion.

The displayed KL result has `n` nonnegative. Negative twists and geometric vanishing need their own arguments and cannot be inferred by changing this sign.

Iterate Frobenius and use interval intersections to extend a window eigenvector across all radii.

The eigenvalue gives the plus growth bound.

For a general `R⁺` use the residue projection in the final paragraph of KL5.2.12, rather than replacing `R⁺` by `R°`.

Compare the extended eigenvector with the invariant descent equation defining `O(n)`.

In the growth estimate use an iteration index `m` distinct from the eigenweight `n`, as corrected in [KL II](#ref-kl-ii) Appendix A, printed p. 190.

Further specializations and compatibility requirements are as follows.

- The statement is a restriction bijection and has no cohomological finiteness conclusion.

([KL I](#ref-kl-i) Corollary 5.2.12 and proof, printed p. 120.)

*Needs:* [§1.4](#target-1-4); [§1.5](#target-1-5); [§1.6](#target-1-6); [§5.1](#target-5-1).

<a id="target-5-3"></a>

### 5.3 Crystalline boundary and twist section input

Prove `crystallineBoundaryAndCechSectionInput`. In FSII.2.5 put `Y_[1,∞]={|[ϖ]|≤|π|≠0}`, including the end `[ϖ]=0,π≠0`, and `Y_[0,a]={|π|^a≤|[ϖ]|≠0}`, retaining the end `π=0`. Write `B_[a,b]` for the rings of functions with the specified rational completion. The two-chart Cech sequences are `0→W_OE(R⁺)[1/π]→B_[1,∞]⊕B_[0,q][1/π]→B_[1,q]→0` and the same sequence with `q` replaced by1. The coefficient ring on the left has its `π`-adic Tate topology, distinct from the `(π,[ϖ])`-adic topology of the integral period space. For `n>0` the contracting Frobenius series used in FSII.2.5 give the restriction quasi-isomorphism of the two `φ−π^n` complexes. This provides the section input for the rank-one twists; general bundle cohomology and global generation remain at VB1/VB2.

Affinoid perfectoid base, actual boundary charts and their complete topologies. The notation `[1,∞]` does not mean a subset of generic `Y`. The displayed rational inequality for general a is interpreted by integer powers for rational a.

Apply sheafiness of the `π`-adic Tate ring `W_OE(R⁺)[1/π]` to its two rational charts.

Use the exact two-chart covering sequences with `q` and with1.

On the integral-end term invert `φ−π^n` using `Σ_(j≥1)π^(n(j−1))φ^(−j)`; on the `[ϖ]`-divisible crystalline-end term use `−Σ_(j≥0)π^(−n(j+1))φ^j`.

Check convergence in the actual interval norms and deduce the restriction quasi-isomorphism.

Further specializations and compatibility requirements are as follows.

- This records the boundary chart calculation without importing VB2 global generation into Layer 5.

([FS](#ref-fs) Proof of PropositionII.2.5, printed p. 63.)

*Needs:* [§0.21](#target-0-21); [§0.22](#target-0-22); [§1.8](#target-1-8).

<a id="target-5-4"></a>

### 5.4 Lubin–Tate divisor section

Consume VectorBundlesAndIsocrystals VB3, `lubin-tate-universal-cover` and `fundamental-exact-sequence`, with the chosen Lubin–Tate module, torsion tower and period normalization. Its bilateral eigenfunction has the untilt as its simple Cartier zero and supplies the consecutive-twist sequences. Prove `lubinTateDivisorSection`, the compatibility of that supplied section with this roadmap’s integral-chart ideal and completion interfaces. The untilt is over `E_LT∞`, distinct from the root-extension tower.

**Checks.**

- In a generic integral chart, the section generates `I_D(1)` with the supplied simple zero.
- Its image in `B_D⁺` is a unit times a Cartier uniformizer; its square generates the double-leg ideal.
- Changing the local Cartier generator by a unit transports the same completed section and exact sequence.

([FS](#ref-fs) Proposition II.2.3 and proof, printed pp. 60–61.)

*Needs:* VectorBundlesAndIsocrystals VB3/lubin-tate-universal-cover; VectorBundlesAndIsocrystals VB3/fundamental-exact-sequence; [§3.2](#target-3-2); [§3.8](#target-3-8); [§5.1](#target-5-1).

<a id="target-5-5"></a>

### 5.5 Graded section algebra and projective scheme

Consume VectorBundlesAndIsocrystals VB−1, `relative-graded-ring` (`relativeHomogeneousRing`): the nonnegative section algebra `P_S=⊕H⁰(X_S,O(n))`, `Proj(P_S)`, homogeneous degree-zero localizations and their overlap maps. The degree-`n` piece uses the supplied twist of §5.1. The global map and tautological-twist comparison are VB2 outputs.

**Checks.**

- The degree-zero piece is `H⁰(X_S,O)`.
- Products of eigenvectors of weights `m,n` have weight `m+n`.
- A ring generated only in degree two does not acquire a cover by degree-one standard opens.

([FS](#ref-fs) II.2.3 opening and Proposition II.2.7 proof, printed pp. 64–67.)

*Needs:* VectorBundlesAndIsocrystals VB−1/relative-graded-ring; [§5.1](#target-5-1).

<a id="target-5-6"></a>

### 5.6 Section-covered `Proj` comparison

Consume the partial analytic chart maps of VectorBundlesAndIsocrystals VB−1, `relative-graded-ring`. Their domain is `U=⋃_(deg g>0)D(g)`, with `a/g^k` mapped to the analytic section ratio on `D(g)`. Use their overlap and positive-power comparisons; global coverage is a separate VB2 theorem.

**Checks.**

- The charts for `g` and `g^a`, `a>0`, agree on their identical nonvanishing loci.
- The overlap of the `g` and `h` charts is the `gh` chart with its two compatible restriction maps.
- On `ℙ¹` with `L=O(−1)`, all positive-power sections vanish and the section-covered open is empty.

([FS](#ref-fs) Proposition II.2.7 proof, printed p. 67.)

*Needs:* [§5.5](#target-5-5); VectorBundlesAndIsocrystals VB−1/relative-graded-ring.

### Examples

For `n=1` the multiplier is `π⁻¹φ` and an invariant section satisfies `φ(f)=πf`; for `n=−1` it is `πφ` and satisfies `φ(f)=π⁻¹f`. Thus the isocrystal slopes are `−1` and `+1` while the bundle degrees are `+1` and `−1`. The lattice `ξB_D⁺` gives `O(−1)`. The chart comparison is defined wherever a positive-degree section is nonzero; global coverage is a distinct VB2 input.

### Dependencies

Layers 0, 1, 2, 3, 4; AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing; Mathlib Module.length; Mathlib GradedAlgebra; Mathlib ProjectiveSpectrum; Mathlib AlgebraicGeometry.Scheme; Mathlib AlgebraicGeometry.projIsoSpec; Mathlib AlgebraicGeometry.LocallyRingedSpace; Mathlib IsLocalization. The scope of each named supplier is fixed in Exact supplier contracts.

## Layer 6: linear patching and modifications

<a id="target-6-1"></a>

### 6.1 Exact squares of rings and glueing data over them (Kedlaya-Liu 1.3.7)

Define `ExactSquare` and `GlueingDatum`. An exact square of commutative rings is a commuting square `R → R_1`, `R → R_2`, `R_1 → R_12`, `R_2 → R_12` such that the sequence of `R`-modules `0 → R → R_1 ⊕ R_2 → R_12 → 0`, whose last arrow is the difference `(r_1, r_2) ↦ r_1 - r_2` of the two maps, is exact. A glueing datum over it is a triple of modules `M_1`, `M_2`, `M_12` over `R_1`, `R_2`, `R_12` with isomorphisms `ψ_1` : `M_1 ⊗_{R_1} R_12 = M_12` and `ψ_2` : `M_2 ⊗_{R_2} R_12 = M_12`; a morphism of glueing data is a triple of linear maps commuting with `ψ_1` and `ψ_2`. The datum is finite, resp. finite projective, when `M_1`, `M_2`, `M_12` are finite, resp. finite projective, over their rings. Its module of sections is `M = ker(ψ_1 - ψ_2 : M_1 ⊕ M_2 → M_12)`, with natural `R`-linear maps `M → M_i` adjoint to `M ⊗_R R_i → M_i`. Every `R`-module `N` gives the glueing datum `Can(N) = (N ⊗ R_1, N ⊗ R_2, N ⊗ R_12, can, can)`. No topology is involved.

The rings are commutative and the square commutes; nothing is assumed about flatness of `R → R_1` or `R → R_2`.

Exactness of `0 → R → R_1 ⊕ R_2 → R_12 → 0` is required at all three places; surjectivity on the right is part of the definition.

A glueing datum carries no cocycle over `R_1 ⊗_R R_1`: the square replaces fpqc descent data.

The interface must support the following operations and laws.

- Section compatibility: for the given overlap identifications `ψ₁,ψ₂`, the condition on `(x₁,x₂)` is `ψ₁(1⊗x₁)=ψ₂(1⊗x₂)`. The structure stores the actual modules and linear equivalences.
- `ExactSquare`: An exact square: four commutative rings, the four ring maps, commutativity, and exactness of `0 → R → R_1 ⊕ R_2 → R_12 → 0`.
- `ExactSquare.exact`: An element of `R_1 ⊕ R_2` lies in the image of `R` iff its two images in `R_12` agree, `R → R_1 ⊕ R_2` is injective, and `R_1 ⊕ R_2 → R_12` is surjective.
- `GlueingDatum`: A glueing datum `(M_1, M_2, M_12, ψ_1, ψ_2)` over an exact square, with morphisms the compatible triples of linear maps.
- `GlueingDatum.sections`: The module of sections `M = ker(ψ_1 - ψ_2 : M_1 ⊕ M_2 → M_12)`, an `R`-module, functorial in the datum.
- `GlueingDatum.sectionsCompare`: The natural maps `M ⊗_R R_i → M_i (i = 1, 2)`, compatible with `ψ_1`, `ψ_2` after base change to `R_12`.
- `GlueingDatum.can`: The functor `Can` : `R`-modules `→` glueing data, `N ↦ (N ⊗ R_1, N ⊗ R_2, N ⊗ R_12, can, can)`, with `map_id` and `map_comp`.
- `GlueingDatum.can_sections_adjunction`: `Hom_R(N, sections(D)) = Hom(Can(N), D)` naturally in `N` and `D`.
- `GlueingDatum.sections_can_of_flat`: For a flat `R`-module `N` the unit `N → sections(Can N)` is an isomorphism.
- `GlueingDatum.tensor`: Tensor product and dual of finite projective glueing data, componentwise, with `sections(Can N ⊗ Can N')` compatible with `N ⊗ N'` for finite projective `N`, `N'`.
- `GlueingDatum.baseChange`: For a map of exact squares `(R → R_1, R_2 → R_12) → (R' → R'_1, R'_2 → R'_12)`, base change of glueing data, compatible with `Can`.
- `ExactSquare.ofGlueingSquare`: Every glueing square of complete Tate rings (AdicSpacesPartIII, R3.2/glueing-square) is an exact square, its finite glueing data are glueing data here, and its module of sections is the module of sections here.
- `ExactSquare.zariski`: For `f`, `g` in `R` generating the unit ideal, `R → R_f`, `R_g → R_fg` is an exact square.
- `GlueingDatum.Hom`: Compatible triples of linear maps, commuting with the two overlap identifications; evaluation on pure tensors determines compatibility.
- `GlueingDatum.Hom.ext`: Two compatible triples agree when their three component linear maps agree.
- `GlueingDatum.Hom.id`: The componentwise identity is a compatible triple.
- `GlueingDatum.Hom.comp`: Compatible triples compose componentwise and satisfy identity and associativity laws.
- `GlueingDatum.sectionsMap`: A compatible triple sends a section `(x1,x2)` to `(f1(x1),f2(x2))`; it respects identities and composition.
- `GlueingDatum.sections_ext`: Equality of both coordinates gives equality in the equalizer submodule.
- `GlueingDatum.canMap`: Tensoring a linear map at the three corners defines its canonical datum morphism, with identity and composition laws.
- `GlueingDatum.sectionsTensor`: The canonical map `sections(D) tensor_R sections(E)` to `sections(D tensor E)` sends pure tensors to the two component pure tensors. It is an isomorphism for effective finite-projective data, without asserting this for arbitrary data.
- `GlueingDatum.dual`: For finite-projective pieces, form the componentwise dual datum using scalar-extension compatibility of duals; for canonical finite-projective data its sections are the dual of the sections.
- `GlueingDatum.baseChange_can`: Extending the pieces of `Can_R(N)` along a commuting corner map gives the canonical datum with the new corners. Its comparison maps are tensor cancellation on pure tensors. For a map of base rings `R` to `S` this agrees with `Can_S(S tensor_R N)` by associativity.

Kedlaya-Liu Definition 1.3.7 states the definition; the Stacks project's category `Glue(R → R', f)` (before Theorem 15.92.16) is the case `R_1 = R'`, `R_2 = R_f`, `R_12 = R'_f`.

`Can` is a functor, and the sections functor is right adjoint to it on the level of `R`-modules: `Hom(N, sections(D)) = Hom(Can(N), D)`.

For flat `N` the sequence `0 → N → N ⊗ R_1 ⊕ N ⊗ R_2 → N ⊗ R_12 → 0` is exact (tensor the exact square with `N`), so `sections(Can N) = N`.

**Checks.**

- `section_identity`: For the identity square and identity transitions the compatible pairs are exactly `(m,m)`.
- `section_nonexample`: Over `ℤ`, the pair `(1,0)` with identity transitions fails compatibility.
- Rank-one unit transition: For coefficient algebras `R₁,R₂→R₁₂` and a unit `u∈R₁₂`, use the canonical rank-one first identification and multiplication by `u` in the second. Over the identity square of `ℚ` with `u=3`, `(1,1/3)` is a section and `(1,1)` is not.
- `section_transition_three`: For the `ℤ[1/2],ℤ[1/3]` square with transition 3, the pair `(1,1/3)` is compatible and `(1,1)` is not; the difference is `x₁−3x₂`.
- `GlueingDatum.sections_zariski_Z`: For `R = Z`, `f = 2`, `g = 3`, the glueing datum (`Z[1/2]`, `Z[1/3]`, `Z[1/6]`, `id`, multiplication by 3) has module of sections {`(k, k/3)` : `k` in `Z`}, free of rank one with generator `(1, 1/3)`.
- `GlueingDatum.sections_identitySquare`: For the identity square `R = R_1 = R_2 = R_12` and a datum `(M, M, M, id, id)`, the module of sections is the diagonal, isomorphic to `M`.
- `ExactSquare.zariski_sections_can`: For the Zariski square of `D(f)`, `D(g)` with `(f, g) = R` and any `R`-module `N`, `sections(Can N) = N`; this is gluing of quasicoherent sheaves on `Spec R = D(f) u D(g)`.
- `ExactSquare.not_exact_double_localization`: For `R = k[x]` and `R_1 = R_2 = R_12 = k[x, 1/x]`, the square is not exact: the kernel of the difference is the diagonal `k[x, 1/x]`, and `sections(Can R) = k[x, 1/x]` is not `R`.

Further specializations and compatibility requirements are as follows.

- The Zariski square of `D(f)`, `D(g)` for comaximal `f`, `g` is exact and its glueing data are quasicoherent gluing data
- Every glueing square of complete Tate rings of AdicSpacesPartIII, R3.2/glueing-square is an exact square in this sense, with the same glueing data and module of sections
- The identity square is exact and its glueing data are modules

([KL I](#ref-kl-i) Definition 1.3.7, p. 17; [KL I](#ref-kl-i) Definition 1.3.7, p. 17; [Stacks](#ref-stacks) Section 15.92, before Theorem 15.92.16 (tag 0BP2).)

*Needs:* AdicSpacesPartIII, R3.2/glueing-square; Mathlib TensorProduct; Mathlib LinearEquiv; Mathlib Module.Flat; Mathlib Module.Finite; Mathlib Module.Projective; Mathlib IsLocalization.Away.awayToAwayLeft; Mathlib IsLocalization.Away.awayToAwayRight; Mathlib TensorProduct.AlgebraTensorModule.rid.

<a id="target-6-2"></a>

### 6.2 Finite projective glueing data over an exact square are effective (Kedlaya-Liu 1.3.8-1.3.9)

Prove `finite_projective_glueing_over_exact_square`. Let `R → R_1`, `R_2 → R_12` be an exact square. (i) For a finite glueing datum with module of sections `M` such that `M ⊗_R R_1 → M_1` is surjective: `ψ_1 - ψ_2` : `M_1 ⊕ M_2 → M_12` is surjective, `M ⊗_R R_2 → M_2` is surjective, and a finitely generated submodule `M_0` of `M` already surjects onto `M_1` and `M_2`. (ii) Suppose `M ⊗_R R_1 → M_1` is surjective for every finite projective glueing datum. Then for every finite projective glueing datum `M` is finitely presented and `M ⊗_R R_i → M_i` is bijective for `i = 1`, 2. (iii) If moreover the image of `Spec(R_1 ⊕ R_2) → Spec(R)` contains every maximal ideal, `M` is finite projective; hence `Can` is an equivalence from finite projective `R`-modules to finite projective glueing data, with quasi-inverse the module of sections.

The surjectivity hypothesis of (ii) is for EVERY finite projective glueing datum; it is verified separately in each application (density for complete Tate rings, the Beauville-Laszlo argument for completions).

The maximal-ideal condition of (iii) cannot be dropped: it is what makes the rank of `M` locally constant and the Fitting ideal `Fitt_n(M)` equal to `R`.

No flatness of `R → R_1` or `R → R_2` is assumed.

(i) The surjection `M ⊗ R_1 → M_1` gives a surjection `M ⊗ R_12 → M_12` and hence the surjectivity of `ψ_1 - ψ_2`; an element `v` of `M_2` is reached by correcting with a preimage, and finitely many generators give `M_0` (KL Lemma 1.3.8).

(ii) Choose a finite free `F → M_0` and compare the exact rows `0 → N → F → M`, `0 → N_i → F_i → M_i`; the kernels `N_i` are finite projective and form a glueing datum, so (i) applies to it and a diagram chase gives finite generation, then finite presentation, of `M`, and the five lemma gives bijectivity of `M ⊗ R_i → M_i` (KL Lemma 1.3.9(a)).

(iii) Split by the rank idempotents, compute Fitting ideals: `Fitt_i(M) = 0` for `i < n` because `R → R_1 ⊕ R_2` is injective, and `Fitt_n(M) = R` because every maximal ideal comes from a point of `Spec(R_1 ⊕ R_2)` where the rank is `n` (KL Lemma 1.3.9(b)).

Full faithfulness of `Can` on finite projective modules follows from `sections_can_of_flat` in §6.1.

Further specializations and compatibility requirements are as follows.

- Recover Zariski gluing of finite projective modules from the square `R → R_f`, `R_g → R_fg`
- Recover AdicSpacesPartIII, R3.5/glueing-square-finite-projective-descent for a glueing square of complete Tate rings, whose density hypothesis gives the surjectivity of (ii)
- Recover finite projective descent for the Beauville-Laszlo square ([§6.5](#target-6-5))

([KL I](#ref-kl-i) Lemma 1.3.8, p. 17; [KL I](#ref-kl-i) Lemma 1.3.9, pp. 18-19; [KL I](#ref-kl-i) Lemma 1.3.9(b), pp. 18-19.)

*Needs:* [§6.1](#target-6-1); Mathlib Module.FinitePresentation; Mathlib Module.Projective; Mathlib Module.Finite.

<a id="target-6-3"></a>

### 6.3 Finite etale algebras glue over an exact square (Kedlaya-Liu 1.3.10)

Prove `finite_etale_glueing_over_exact_square`. Under the hypotheses of [§6.2](#target-6-2) (iii), the base change functor `FEt(R) → FEt(R_1) x_{FEt(R_12)} FEt(R_2)` from finite etale `R`-algebras to compatible pairs of finite etale algebras is an equivalence of categories.

Same hypotheses as the finite projective glueing theorem: surjectivity for all finite projective glueing data and the maximal-ideal condition.

The algebra structure is glued from the exact sequence `0 → A → A_1 ⊕ A_2 → A_12 → 0`; etaleness is checked through the trace pairing, not through flat descent.

View `(A_1, A_2, A_12)` as a finite projective glueing datum; the module of sections `A` is finite projective with A `⊗ R_i = A_i`.

The multiplications of `A_1`, `A_2`, `A_12` restrict to A through the exact sequence `0 → A → A_1 ⊕ A_2 → A_12 → 0`, so `A` is a finite flat `R`-algebra.

Applying the glueing theorem to the duals gives `0 → Hom_R(A, R) → Hom(A_1, R_1) ⊕ Hom(A_2, R_2) → Hom(A_12, R_12) → 0`, and the snake lemma shows the trace pairing of `A` is perfect, so `A` is finite etale (KL Corollary 1.3.10).

Further specializations and compatibility requirements are as follows.

- For the Zariski square this is gluing of finite etale covers
- The trace pairing argument shows that unramifiedness is not checked by a flatness argument

([KL I](#ref-kl-i) Corollary 1.3.10, p. 19; [KL I](#ref-kl-i) Proof of Corollary 1.3.10, p. 19.)

*Needs:* AdicSpacesPartIII §R3.8/finite-locally-free-algebra-trace; AdicSpacesPartIII §R3.8/algebra-trace-base-change; AdicSpacesPartIII §R3.8/etale-iff-trace-pairing-perfect (finite projective algebras over arbitrary commutative rings); [§6.2](#target-6-2); Mathlib CommAlgCat.FiniteEtale; Mathlib Algebra.Etale; Mathlib Module.Dual.

<a id="target-6-4"></a>

### 6.4 Glueing pairs and glueable modules (Stacks 15.92)

Define `GlueingPair` and `Glueable`. Let `R` be a ring, `f` in `R`, and `R → R'` a ring map inducing isomorphisms `R/f^n R = R'/f^n R'` for all `n ≥ 1` (for example `R' = R-hat = lim R/f^n R`). `(R → R', f)` is a glueing pair if `0 → R → R' ⊕ R_f → R'_f → 0` (last arrow the difference) is exact; equivalently `R[f^oo] → R'[f^oo]` is bijective, where `M[f^oo]` is the `f`-power torsion. `(R, f)` is a glueing pair if `(R → R-hat, f)` is one. An `R`-module `M` is glueable for `(R → R', f)` if `0 → M → (M ⊗_R R') ⊕ M_f → M ⊗_R R'_f → 0` is exact, equivalently `M[f^oo] → (M ⊗_R R')[f^oo]` is bijective. A glueing pair is in particular an exact square `R → R'`, `R_f → R'_f`.

`R → R'` must induce `R/f^n = R'/f^n` for EVERY `n`, not only `n = 1`.

If `f` is a nonzerodivisor of `R` then `(R, f)` is a glueing pair; no noetherian hypothesis.

Glueability is a condition on the module; flat modules are glueable, and a non-glueable module exists already for a nonzerodivisor `f`.

The interface must support the following operations and laws.

- `GlueingPair`: A ring map `R → R'` and `f` in `R` with `R/f^n = R'/f^n` for all `n` and the exact sequence `0 → R → R' ⊕ R_f → R'_f → 0`.
- Torsion criterion: Assuming the ring map induces `R/f^n R = R'/f^n R'` for all positive `n`, `(R → R', f)` is a glueing pair iff `R[f^oo] → R'[f^oo]` is bijective (Stacks 15.92.6).
- Regular completion: If `f` is a nonzerodivisor of `R` then `(R → R-hat, f)` is a glueing pair (Stacks 15.92.7).
- Flat completion: If `R → R-hat` is flat (for example `R` noetherian) then `(R, f)` is a glueing pair (Stacks 15.92.8).
- Exact square: A glueing pair is an exact square `R → R'`, `R_f → R'_f` ([§6.1](#target-6-1)).
- Quotient comparison: For a glueing pair `(R → R',f)`, the canonical map `R/f^n R → R'/f^n R'` is an isomorphism for every `n`. In the completion case `R'=R-hat` these quotient isomorphisms hold without assuming the pair condition (Stacks 15.92.1).
- Spectral surjectivity: `Spec(R') u Spec(R_f) → Spec(R)` is surjective (Stacks 15.92.3), the maximal-ideal condition of the exact-square glueing theorem.
- `Glueable`: The predicate: `0 → M → (M ⊗ R') ⊕ M_f → M ⊗ R'_f → 0` is exact.
- Module torsion criterion: For a glueing pair, `M` is glueable iff `M[f^oo] → (M ⊗ R')[f^oo]` is injective (Stacks 15.92.10).
- Flat modules: Flat `R`-modules are glueable (Stacks 15.92.11).

Lemma 15.92.6: the sequence is always exact on the right; exactness on the left and in the middle are injectivity and surjectivity of `R[f^oo] → R'[f^oo]`.

Remark 15.92.7: for `f` a nonzerodivisor, `f` is a nonzerodivisor in `R-hat` (Stacks Algebra Lemma 10.96.4), so both torsion modules vanish.

Lemma 15.92.10 and Remark 15.92.11: the same criterion for modules, and flat modules are glueable.

**Checks.**

- `torsion_zero_element`: `f=0` gives all of `M`, using `n=1`.
- `torsion_unit_element`: `f=1` gives exactly `{0}`.
- `torsion_natural_power`: In `ℤ/4ℤ` with `f=2`, every element is killed by `f²`; the class of 1 is not killed by `f⁰` or `f¹`.
- The integer completion pair: For `R = Z` and `f = p`, `R-hat = ℤ_p` and `0 → Z → ℤ_p ⊕ Z[1/p] → ℚ_p → 0` is exact; `(Z, p)` is a glueing pair.
- Unit equation: If `f` is a unit then `R-hat = 0`, `R_f = R`, the sequence is `0 → R → R → 0 → 0`, every module is glueable and glueing data are `R`-modules.
- Noetherian completion: For `R` noetherian, Mathlib's AdicCompletion (Ideal.span `{f}`) `R` is flat over `R`, so `(R, f)` is a glueing pair and every `R`-module is glueable (Stacks 15.92.8, 15.92.11).
- Failure of the pair condition: For `R = k[f, T_1, T_2, ...]/(f T_1, f T_2 - T_1, f T_3 - T_2, ...)`, `(R, f)` is not a glueing pair: `T_1` is `f`-power torsion and nonzero in `R` but its image in `R-hat` is `f`-divisible, hence zero (Stacks Example 15.92.9).
- Nonglueable smooth germs: For `R` the germs of smooth functions at 0 on the real line and `f = x`, the module `R/φ R` with `φ = exp(−1/x^2)` is not glueable although `f` is a nonzerodivisor (Stacks Example 15.92.12).

Further specializations and compatibility requirements are as follows.

- Check the criterion `R[f^oo] → R'[f^oo]` bijective on the two examples of Stacks Example 15.92.9
- Check that a nonzerodivisor gives a glueing pair without any noetherian hypothesis
- Check that the henselization of `R` along `f`, which also satisfies `R/f^n = R^h/f^n`, gives a glueing pair whenever `f` is a nonzerodivisor of it

([Stacks](#ref-stacks) Section 15.92, Glueing pairs, before Lemma 15.92.6; [Stacks](#ref-stacks) Lemma 15.92.6 (tag 0BNR) and Remark 15.92.7 (tag 0BNS); [Stacks](#ref-stacks) Lemma 15.92.10 (tag 0BNW).)

*Needs:* [§6.1](#target-6-1); Mathlib AdicCompletion; Mathlib AdicCompletion.of; Mathlib IsLocalization.Away; Mathlib nonZeroDivisors; Mathlib Module.Flat; Mathlib MvPolynomial; Mathlib Ideal.Quotient.mk.

<a id="target-6-5"></a>

### 6.5 The Beauville-Laszlo theorem for non-noetherian rings

Prove `beauville_laszlo_module_gluing`. Let `(R → R', f)` be a glueing pair (the regular-completion case is supplied by AInfCohomology §AI.2.1, `AInf.linear_module_patching`). (a) The functor `Can` : `M ↦ (M ⊗_R R', M_f, can)` is an equivalence from the category of `R`-modules glueable for `(R → R', f)` to the category of glueing data `(M', M_1, α_1 : (M')_f = M_1 ⊗_R R')`, with quasi-inverse the module of sections. Consume the equivalence for regular completion and `f`-torsion-free modules from that supplier, and identify its fibre-product inverse and Hom maps with the glueable-module equivalence here. (b) An `R`-module `M` is flat, resp. finite projective, iff `M ⊗_R R'` and `M_f` are flat, resp. finite projective; hence every finite projective glueing datum is `Can` of a finite projective `R`-module, unique up to unique isomorphism, and `R → R' x R_f` is an effective descent morphism for finite projective modules. (c) For flat `M`, the sequence `0 → M → (M ⊗_R R′) ⊕ M_f → M ⊗_R R′_f → 0` is exact. In particular this applies with `R′=R-hat` when `(R → R-hat,f)` is a glueing pair, including when `f` is a nonzerodivisor. The statement is not a case of fpqc descent: `R → R-hat` need not be flat when `R` is not noetherian, and no descent datum over `R-hat ⊗_R R-hat` is part of the data.

For `R′=R-hat`, a nonzerodivisor `f` suffices; for general `R′`, assume `(R → R′,f)` is a glueing pair. No noetherian, flatness or separatedness hypothesis is needed (Kedlaya-Liu's `'t`-adically separated' in Proposition 1.3.6 is not used by the Stacks proof).

In (a) the modules must be glueable; for `f` a nonzerodivisor every module on which `f` is a nonzerodivisor is glueable.

The finite projectivity criterion of (b) is part of the theorem and is what makes the gluing of vector bundles possible.

Scholze-Weinstein point out that the statement does NOT follow from fpqc descent, for the two reasons in the statement.

Surjectivity of `d` : `M' ⊕ M_1 → (M')_f` for any glueing datum, by writing a target element with a common denominator `f^n` and splitting coefficients of `R'` as `R + f^n R'` (Stacks proof of 15.92.16).

With `M = ker d`, the sequence `0 → M/M[f^oo] → M_1 → (M')_f/M' → 0` is exact; tensoring with the flat `R_f` gives `M_f = M_1`.

`Tor_1^R(R', Coker(M' → M'_f)) = 0` (Stacks 15.92.13-15.92.15) keeps that sequence exact after tensoring with `R'`, and the five lemma gives `M ⊗ R' = M'`; so `Can` is essentially surjective and `H^0 o Can = id` on glueable modules gives full faithfulness.

Flatness and finite projectivity descend: Stacks 15.92.18 (Tor computation from the exact square) and 15.92.19 (finite generation from 15.92.4, then finite presentation).

Alternatively, for `f` a nonzerodivisor and finite projective data, Kedlaya-Liu Remark 2.7.9 verifies the surjectivity hypothesis of [§6.2](#target-6-2) for the square `R → R-hat`, `R[1/t] → R-hat[1/t]` using the `t`-adic density of `R[1/t]` in `R-hat[1/t]`, and concludes from Lemma 1.3.9.

`Suggested.lean` states `beauvilleLaszlo_flat_iff`, flatness detection for any module over a glueing pair, and `beauvilleLaszlo_finiteProjective_iff`, finite-projective detection for an arbitrary module. Its statement `beauvilleLaszlo_effective` gives compatible base-change identifications for finite-projective gluing data, with an explicit common localization and compatibility on pure tensors. These statements apply to general glueing pairs and assume neither noetherianity nor completion flatness.

**Checks.**

- For the identity pair `R′=R`, the flat-module sequence is exact for every `f`. In the ring `k[f,T₁,T₂,…]/(fT₁,fT₂−T₁,…)`, the nonzero `T₁` maps to zero in both `R-hat` and `R_f`, so replacing `R′` by the completion would destroy injectivity.
- For `R=ℤ`, `f=p` prime and `M=R`, the regular-completion sequence is `0→ℤ→ℤ_p⊕ℤ[1/p]→ℚ_p→0`.
- For unit `f`, completion is zero and the sequence for `R′=R-hat` reduces to the identity of `M`.

Further specializations and compatibility requirements are as follows.

- Run the gluing for `R = A_inf[1/p]` and `f = ξ`, where `R-hat = B⁺_dR(C)`: a `B⁺_dR`-lattice in `T ⊗ B_dR` glues with `T ⊗ A_inf[1/p][1/ξ]` to a finite projective `A_inf[1/p]`-module (the step used in SW20 Proposition 12.4.6)
- Exhibit, for a non-noetherian `R`, a module `M` with `f` a nonzerodivisor on `M` whose completion `M ⊗ R-hat` is computed by the gluing although `R → R-hat` is not flat
- Verify finite projectivity in both directions of (b)
- Check the necessity of glueability with Stacks Example 15.92.12

([SW](#ref-sw) Lemma 5.2.9, printed p. 38; [SW](#ref-sw) After Lemma 5.2.9, printed p. 38; [Stacks](#ref-stacks) Theorem 15.92.16 (tag 0BP2), Remark 15.92.11 (tag 0BNX) and Example 15.92.9 (tag 0BNU); [Stacks](#ref-stacks) Lemma 15.92.19; [KL I](#ref-kl-i) Proposition 1.3.6, pp. 16-17.)

*Needs:* AInfCohomology §AI.2.1/AInf.linear_module_patching; [§6.4](#target-6-4); [§6.1](#target-6-1); [§6.2](#target-6-2); Mathlib AdicCompletion; Mathlib IsAdicComplete; Mathlib IsLocalization.Away; Mathlib nonZeroDivisors; Mathlib Module.Projective; Mathlib Module.Flat; Mathlib Module.FinitePresentation; Mathlib Module.FaithfullyFlat.

<a id="target-6-6"></a>

### 6.6 Modifications of vector bundles at a relative Cartier divisor

Define `Modification`. Let `X-cal` be one of `𝒴_S`, `Y_S`, `X_S` and `D` a closed Cartier divisor of `X-cal` attached to a map `S → Div^d_(-)`, with ideal sheaf `I_D` and `E(kD) = E ⊗ I_D^(−k)`. For vector bundles `E`, `E'` on `X-cal`, a modification of `E'` at `D` is a pair `(E, β)` with `β` : `E|_{X-cal minus D} = E'|_{X-cal minus D}` an isomorphism of vector bundles on the open complement which is meromorphic along `D`: locally on `S` and `X-cal` there is some `k ≥ 0` such that `β` extends to a morphism `E → E'(kD)` and `β^(−1)` extends to a morphism `E' → E(kD)` (through the inclusions `E' → E'(kD)`, `E → E(kD)`). Such a `k` is a bound of the modification. A morphism `(E_1, β_1) → (E_2, β_2)` is an isomorphism `E_1 → E_2` whose restriction off `D` is `β_2^(−1) β_1`; modifications of `E'` at `D` form a groupoid `Mod_D(E')`.

`D` must be a closed Cartier divisor (`I_D` invertible); this is what makes `O(kD)` defined and what makes restriction to the complement injective on sections.

`β` must be an isomorphism on all of `X-cal minus D`, not only near `D`.

Both `β` and `β^(−1)` are required to be meromorphic; Fargues-Scholze require one direction for every representation of `G`, which for `GL_n` includes the dual representation and so gives the other direction.

The definition is local on `S` and on `X-cal`; for `d = 0` (`D` empty) a modification is an isomorphism.

The interface must support the following operations and laws.

- Local pole bounds: for a commutative ring `A`, element `ξ` and module `M′`, the condition on submodules `M⊆A[1/ξ]⊗_A M′` requires finite projectivity, `ξ^kM′⊆M` and `ξ^kM⊆image(M′)`. It records bounds without constructing a geometric bundle.
- `Modification`: A modification of `E'` at `D`: a vector bundle `E` with an isomorphism `β` : `E|_{X minus D} = E'|_{X minus D}` meromorphic along `D` in both directions.
- `Modification.extend`: For a bound `k`, the unique morphism `E → E'(kD)` extending `β`, and `E' → E(kD)` extending `β^(−1)`.
- `Modification.refl`: `(E', id)` is a modification of `E'` at `D` with bound 0.
- `Modification.symm`: `(E', β^(−1))` is a modification of `E` at `D` with the same bound.
- `Modification.trans`: Modifications bounded by `k` and `l` compose to one bounded by `k + l`.
- `Modification.tensor`: The tensor product of modifications of `E'_1` and `E'_2` bounded by `k` and `l` is a modification of `E'_1 ⊗ E'_2` bounded by `k + l`; the dual of a modification bounded by `k` is bounded by `k`.
- `Modification.pullback`: For `T → S`, pullback of `(E, β)` along `X-cal_T → X-cal_S` is a modification at `D_T`; pullback along the identity is the identity and pullbacks compose.
- `Modification.ext`: Two morphisms of modifications are equal iff they agree off `D`; `(E_1, β_1)` and `(E_2, β_2)` are isomorphic iff `β_2^(−1) β_1` extends to an isomorphism `E_1 = E_2`.
- `Modification.ofSubbundle`: An injective morphism `E → E'` that is an isomorphism off `D` and whose image contains `E'(−kD)` defines a modification bounded by `k`.

The definition is Fargues-Scholze's meromorphic modification at `D`, specialised to `GL_n` (FS III.3, printed p. 97), and the datum `β` of Scholze-Weinstein Theorem 14.1.1(3).

Composition and inverses: if `β_1` is bounded by `k` and `β_2` by `l` then `β_2 β_1` is bounded by `k + l`, and `β^(−1)` is a modification of `E` at `D` with the same bound.

Because `I_D` is invertible and locally generated by a nonzerodivisor, a morphism of vector bundles is determined by its restriction off `D`; so isomorphisms of modifications are unique when they exist. The groupoid `Mod_D(E')` is therefore equivalent to the discrete set of its isomorphism classes. Allowing arbitrary bundle maps here would give a category with noninvertible arrows, for example `O(−D) → O` for nonempty `D`.

**Checks.**

- Scalar ideal bound: For `ξ` regular and nonunit, `ξA` inside `A[1/ξ]` belongs at `k=1` and fails at `k=0`.
- `bounded_zero_module`: For `M′=0` and any `ξ`, the `k=0` set is the singleton zero submodule.
- `bounded_unit_equation`: If `ξ` is a unit and `M′` is finite projective, every bound gives the singleton full reference module; there is no nontrivial divisor.
- `Modification.ideal_inclusion`: For `D` nonempty, the inclusion `I_D = O(−D) → O_X-cal` restricts to an isomorphism off `D` and is a modification of `O` at `D` bounded by 1, not bounded by 0.
- `Modification.empty_divisor`: For `d = 0` (`D` empty) a modification of `E'` at `D` is an isomorphism `E = E'`, and every bound works.
- `Modification.ff_absolute`: On the schematic geometric Fargues–Fontaine curve, recover the algebraic modifications supported at infinity of FF §5.3.1, Proposition 5.3.1, pp. 208–209. On the analytic curve the specified complement isomorphism and its inverse must remain meromorphic along infinity.
- `Modification.essential_singularity`: Over geometric mixed-characteristic coefficients, choose `b∈B_e` with a pole at infinity. The series `h=Σ_(n≥1)p^(n²)b^n` converges on compact subsets of the analytic complement and has no finite pole bound. The invertible matrix `[[1,h],[0,1]]` and its inverse are analytic there but do not define a meromorphic modification. A positive-degree section nonzero at infinity, divided by a section defining infinity (with powers matching degrees), supplies such a `b`.
- `Modification.not_iso_off_D`: For a second degree-one divisor `D'` disjoint from `D`, the inclusion `O → O(D')` is not a modification of `O(D')` at `D`: it is not an isomorphism on `X-cal minus D`.

Further specializations and compatibility requirements are as follows.

- The inclusion `I_D = O(−D) → O` is a modification of `O` at `D` bounded by 1
- For `d = 0` the groupoid is the set of bundles isomorphic to `E'`
- At a geometric point use FF §5.3.1, Proposition 5.3.1 on the schematic curve; on the analytic curve retain meromorphy of the complement isomorphism and its inverse.

([FS](#ref-fs) III.3, printed p. 97; [SW](#ref-sw) Theorem 14.1.1(3), printed p. 115; [FF (2017)](#ref-ff-2017) 5.3, before Proposition 5.3.1, p. 208.)

*Needs:* [§3.5](#target-3-5); [§3.2](#target-3-2); [§3.4](#target-3-4); VectorBundlesAndIsocrystals, VB1/finite-locally-free-bundles; AdicSpacesPartIII, R3.5/locally-free-sheaf; [§2.1](#target-2-1); Mathlib Module.Invertible; Mathlib Module.Projective.

<a id="target-6-7"></a>

### 6.7 Beauville-Laszlo gluing on the relative curve: modifications are `B⁺`-lattices

Prove `meromorphic_modification_at_a_divisor`. Let `X-cal` be `𝒴_S`, `Y_S` or `X_S`, `D` the divisor of a map `S → Div^d_(-)`, assumed affinoid, and `E'` a vector bundle on `X-cal` with completion `E'-hat_D = Γ`(`D`, completion of `E'` along `D`), a finite projective `B⁺_D(S)`-module. Then `(E, β) ↦ Ξ(E, β) := β(E-hat_D)` is an equivalence from the groupoid `Mod_D(E')` of modifications of `E'` at `D` to the set of `B⁺_D(S)`-lattices in `E'-hat_D[1/I_D]`, i.e. finite projective `B⁺_D(S)`-submodules `Ξ` with `Ξ[1/I_D] = E'-hat_D[1/I_D]`. A modification is bounded by `k` iff `I_D^k E'-hat_D` is contained in `Ξ` and `Ξ` in `I_D^(−k) E'-hat_D`. In particular the restriction `E'|_{X-cal minus D}` of this globally given reference bundle, a vector bundle on the formal neighbourhood `(Ξ)` and an isomorphism on the punctured formal neighbourhood `(Ξ[1/I_D] = E'-hat_D[1/I_D])` determine a vector bundle on `X-cal`, and this fixed-reference gluing functor is fully faithful and essentially surjective. Complement data without a globally given reference bundle are glued by §6.8, which requires them to carry a meromorphic structure along `D`. Locally: on each sheafy affinoid chart `U = Spa(A, A⁺)` meeting `D` on which `I_D = ξ` A, the ring of completion along `D` intersect `U` is the `ξ`-adic completion of A and the statement is [§6.5](#target-6-5) for the glueing pair `(A, ξ)` combined with finite projective `A`-modules `=` vector bundles on `U`.

`D` affinoid, which holds locally on `S` ([§3.5](#target-3-5)); the result globalises over `S` by gluing.

`I_D` is invertible and locally generated by a nonzerodivisor `ξ` of the chart ring `A` ([§3.2](#target-3-2), [§3.5](#target-3-5)); this makes `(A, ξ)` a glueing pair.

The charts are sheafy (sousperfectoid) affinoids, so vector bundles on `U` are finite projective `A`-modules (AdicSpacesPartIII, R3); on `X_S` the charts come from `Y_S` through the `φ`-quotient (Layer 2).

The punctured formal neighbourhood is not an open subspace of `X-cal`; the gluing is formulated through modifications of a given `E'`, which is how Scholze-Weinstein and Fargues-Scholze use it.

The theorem is linear: `G`-valued and Grassmannian statements are Layer 7 and GeometricSatakeAndFusion, GS0 (loop geometry).

Use a cover of a neighbourhood of `D` by sheafy affinoid charts `U = Spa(A, A⁺)` on which `I_D|_U = ξ` A, `ξ` a nonzerodivisor of A; the completion along `D` intersect `U` has section ring `A-hat` (the `ξ`-adic completion) because `A/ξ^n = O`(`D_n` intersect `U`) for every `n`, and this is independent of `U` ([§3.8](#target-3-8)). On overlaps the canonical constructions agree by full faithfulness. Glue the reductions on each finite thickening, then apply `divisorCompletionFiniteProjectives` of [§3.8](#target-3-8) on objects and arrows to glue the formal finite projective modules on this cover; for affinoid `D` their global sections give the lattice over `B⁺_D(S)`. Affineness of `D` alone does not assert a single chart `U` containing it with a principal ideal.

Given a lattice `Ξ` with `ξ^k E'-hat_D` in `Ξ` in `ξ^(−k) E'-hat_D`, let `M' = E'(U)`, a finite projective `A`-module (AdicSpacesPartIII, R3.5/vector-bundle-global-generation). The glueing datum `(M'[1/ξ], Ξ, can)` is finite projective, so the Beauville-Laszlo theorem gives a finite projective `A`-module `M` with `M[1/ξ] = M'[1/ξ]` and `M tensor_A A-hat = Ξ|_{D intersect U}`; the inclusions `ξ^k M'` in `M` in `ξ^(−k) M'` hold because they hold after completion and after inverting `ξ` (exactness of `0 → M → M[1/ξ] ⊕ M-hat → M-hat[1/ξ] → 0`).

The bundle `E_U` on `U` attached to `M` agrees with `E'` on `U minus D` through these inclusions (`ξ` is invertible there); glue all `E_U` with `E'|_{X-cal minus D}` along their overlaps and `U minus D` (vector bundles form a sheaf: AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing). The result is a modification bounded by `k` with `Ξ(E, β) = Ξ`.

Conversely a modification bounded by `k` gives `ξ^k M'` in `E(U)` in `ξ^(−k) M'` and `Ξ(E, β) = E(U)`-hat is a lattice; morphisms are determined off `D` ([§6.6](#target-6-6)), giving full faithfulness.

The fixed-reference construction follows the local algebra used in SW Proposition 19.1.2, p. 170, and Theorem 14.1.1, pp. 115-116: recover modules by Beauville-Laszlo and then take their associated affinoid bundles. HK Section 4.3, p. 29, uses this construction representationwise over the perfectoid base.

**Checks.**

- For a geometric base, `d=1` and trivial rank-`n` reference bundle, recover the bijection between modifications with a specified meromorphic trivialization off infinity and `B_dR⁺`-lattices in `B_dR^n`. The schematic version permits arbitrary algebraic complement trivializations.
- For a geometric reduced degree-one leg, lattices `tE′-hat⊆Ξ⊆E′-hat` correspond to vector-space quotients of `E′|_D`. For a general divisor, impose explicitly that `E′-hat/Ξ` is finite projective over `O_D`; finite projectivity of `Ξ` and these inclusions do not imply it.
- At a double geometric leg `D=2D₀`, take `B=B_dR⁺`, `E′-hat=B` and `Ξ=tB`. The inclusions `t²B⊂tB⊂B` hold, but `B/tB` is not projective over `B/t²B`: over this local ring a nonzero projective finite module is free, whereas `t` annihilates this quotient.
- Independence of the chart `U` and of the local generator `ξ`
- The schematic triple description of [§6.14](#target-6-14) agrees with this one under GAGA

([SW](#ref-sw) Proof of Proposition 19.1.2, printed p. 170; [SW](#ref-sw) Proof of Theorem 14.1.1, printed p. 116; [Howe–Klevdal](#ref-howe-klevdal) Section 4.3, p. 29; [FS](#ref-fs) VI.1, before Definition VI.1.5, printed p. 192.)

*Needs:* [§6.5](#target-6-5); [§6.6](#target-6-6); [§6.4](#target-6-4); [§3.8](#target-3-8); [§3.5](#target-3-5); [§3.2](#target-3-2); [§4.10](#target-4-10); AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing; AdicSpacesPartIII, R3.5/vector-bundle-global-generation; AdicSpacesPartIII, R3.5/locally-free-sheaf; VectorBundlesAndIsocrystals, VB1/finite-locally-free-bundles; Mathlib AdicCompletion; Mathlib Module.Projective; Mathlib Module.Invertible.

<a id="target-6-8"></a>

### 6.8 Patching meromorphic complement data and formal bundle data

Prove `complement_formal_patching`. Let `E` be any nonarchimedean local field, `S` an affinoid perfectoid space over `𝔽_q`, `X-cal` one of `𝒴_S`, `Y_S`, `X_S`, and `D` the effective Cartier divisor of a map `S → Div^d_(-)` (Layers 3–4), affinoid locally on `S`. A *meromorphic vector bundle on `X-cal minus D`* is a vector bundle `E_U` on `X-cal minus D` together with a meromorphic structure along `D`: a cover of a neighbourhood of `D` by sheafy affinoid charts `U_i = Spa(A_i, A_i⁺)` on which `I_D = ξ_i A_i` with `ξ_i` a nonzerodivisor, finite projective `A_i[1/ξ_i]`-modules `M_i`, and identifications of `E_U` on `U_i minus D` with the bundles attached to the `M_i` (on a rational `V` inside `U_i minus D`, where `ξ_i` is a unit, the sections are `M_i ⊗ O(V)`), compatible on overlaps through the canonical maps `A_i[1/ξ_i] → A_V[1/ξ_V]` for rational `V` inside `U_i ∩ U_j`. Two such structures are equivalent when they agree on a common refinement. A morphism of meromorphic bundles is a bundle map on `X-cal minus D` given on some refinement by `A_i[1/ξ_i]`-linear maps of the chart modules. Then restriction to `X-cal minus D` (with the canonical meromorphic structure `M_i = E(U_i)[1/ξ_i]`) and to the formal completion along `D`, with the canonical identification over `B_D`, is an equivalence between vector bundles on `X-cal` and triples `(E_U, F, α)`: `E_U` a meromorphic vector bundle on `X-cal minus D`, `F` a finite locally free module over the completed ring `B_D⁺` (a finite projective `B_D⁺(S)`-module when `D` is affinoid), and `α` an isomorphism of `B_D`-modules from the module glued from the `M_i ⊗ Â_i[1/ξ_i]` to `F[1/I_D]`. Arrows are pairs of maps compatible with `α`. No global extension of `E_U` is part of the input. The equivalence commutes with restriction to opens of `S`.

The meromorphic structure is part of the datum. A bundle map on `X-cal minus D` need not be meromorphic along `D`: on a punctured open disc `0<|z|<1` over a complete nonarchimedean field, `Σ_{n≥1} c^(n²) z^(−n)` with `0<|c|<1` converges and has infinitely many polar terms, so it has no realization over the completed local ring. Data on the complement without a meromorphic structure are therefore not inputs of this theorem, and `U_i minus D` is not identified with `Spec(A_i[1/ξ_i])`.

Work on a chart cover of a neighbourhood of `D`, with a generator `ξ_i` of `I_D` on each chart; the charts are sheafy (sousperfectoid), so vector bundles on them are finite projective modules (AdicSpacesPartIII, R3).

On each chart, `(A_i, ξ_i)` is a glueing pair because `ξ_i` is a nonzerodivisor ([§6.4](#target-6-4)); by [§3.8](#target-3-8) the `ξ_i`-adic completion `Â_i` is the ring of the formal completion along `D ∩ U_i`. The chart triple `(M_i, F(D ∩ U_i), α_i)` is a finite projective glueing datum, so [§6.5](#target-6-5) gives a finite projective `A_i`-module `N_i` with `N_i[1/ξ_i] = M_i` and `N_i ⊗ Â_i = F(D ∩ U_i)`, unique up to unique isomorphism.

On a rational `V` inside `U_i ∩ U_j` the generators differ by a unit. `N_i ⊗_{A_i} A_V` is finite projective, with localization `M_i ⊗ A_V[1/ξ_V]` and completion `F(D ∩ V)`, so by the uniqueness in [§6.5](#target-6-5) for the glueing pair `(A_V, ξ_V)` it is canonically isomorphic to `N_j ⊗_{A_j} A_V`, compatibly with triple overlaps.

The bundles attached to the `N_i` agree on overlaps and agree with `E_U` away from `D`, where each `ξ_i` is a unit; since vector bundles form a sheaf (AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing) they glue with `E_U` to a vector bundle `E` on `X-cal`. Arrows are glued in the same way from the full faithfulness of [§6.5](#target-6-5) on each chart. For a vector bundle on `X-cal`, the triple of its restrictions with the canonical structure `M_i = E(U_i)[1/ξ_i]` returns `E`, so the functor is an equivalence. Independence of the cover and of the local generators follows from the uniqueness statements.

In the unramified degree-one schematic setting the complement is the affine scheme `Spec(B_e(A))`, and finite projective `B_e(A)`-modules give the chart models; this recovers KL Theorem 8.9.6(b)-(c), p. 188, and CS Theorem 3.5.1, p. 33 ([§6.14](#target-6-14)). For a globally given reference bundle `E′`, the canonical meromorphic structure of `E′` restricted to `X-cal minus D` recovers [§6.7](#target-6-7). SW 5.2.8-5.2.9, pp. 37-38, and SW 19.1.2, p. 170, use the same chartwise algebra.

Further specializations and compatibility requirements are as follows.

- Retain `E_U` with its meromorphic structure as input, without replacing it by the restriction of a global `E′`.
- Recover the fixed-reference lattice theorem [§6.7](#target-6-7) and the unramified schematic triple theorem [§6.14](#target-6-14) as specializations.
- Negative control: the function `Σ_{n≥1} c^(n²) z^(−n)`, `0<|c|<1`, on a punctured disc is an endomorphism of the trivial bundle on the complement that is not meromorphic; it is not an arrow of the triple category.
- Use a chart cover; the analytic complement `U_i minus D` is not `Spec(A_i[1/ξ_i])`.

([SW](#ref-sw) Theorem 5.2.8 and Lemma 5.2.9, printed pp. 37-38; Proposition 19.1.2, printed p. 170; [KL I](#ref-kl-i) Theorem 8.9.6(b)-(c), printed p. 188.)

*Needs:* [§6.4](#target-6-4); [§6.5](#target-6-5); [§6.7](#target-6-7); AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing; AdicSpacesPartIII, R3.5/vector-bundle-global-generation; [§3.8](#target-3-8); [§3.5](#target-3-5).

<a id="target-6-9"></a>

### 6.9 The gluing is an exact tensor equivalence and commutes with base change

Prove `gluing_exactness_tensor_and_base_change`. In the setting of [§6.7](#target-6-7): (a) the lattice functor commutes with tensor products, duals and internal `Hom`: `Ξ(E_1 ⊗ E_2) = Ξ(E_1) ⊗ Ξ(E_2)` inside `(E'_1 ⊗ E'_2)-hat_D[1/I_D]` and `Ξ(E^dual) = Ξ(E)^dual`; (b) it is exact: a sequence of modifications `0 → E_1 → E → E_2 → 0` of a short exact sequence `0 → E'_1 → E' → E'_2 → 0` is exact iff the sequence of lattices `0 → Ξ_1 → Ξ → Ξ_2 → 0` is exact, and every exact sequence of lattices compatible with the completed sequence of the `E'` glues to an exact sequence of vector bundles; (c) it commutes with base change: for a map `T → S` of affinoid perfectoid spaces with pulled-back divisor `D_T`, the pullback of `(E, β)` corresponds to `Ξ ⊗_{B⁺_D(S)} B⁺_{D_T}(T)`, compatibly with composition of base changes; (d) on the algebraic side, for a map of glueing pairs `(R, f) → (R_2, f_2)` (a ring map with `f ↦ f_2` up to a unit), `Can` and the module of sections commute with base change of finite projective glueing data (coefficient change). (e) The equivalence of [§6.8](#target-6-8) for meromorphic complement data also commutes with tensor products, duals, short exact sequences and pullback; this is checked on its chart module triples by the arguments of (a)–(c).

Bundles and lattices are finite projective; exactness is for sequences of finite projective modules.

Base change uses that `B⁺_{Div^d}` and `B_{Div^d}` are `v`-sheaves over `Div^d` ([§3.8](#target-3-8)), so `B⁺_D(S) → B⁺_{D_T}(T)` is defined.

Coefficient change in (d) requires `f_2` to be a nonzerodivisor (or `(R_2, f_2)` a glueing pair); otherwise the base-changed datum need not glue.

(a) On a chart `U` with `I_D = ξ` A, the gluing of [§6.5](#target-6-5) commutes with tensor products and duals of finite projective glueing data, because `Can` is a tensor functor and the module of sections of a finite projective datum is finite projective with `M ⊗ R' = M'` ([§6.2](#target-6-2)).

(b) Exact sequences of finite projective modules are split, so scalar extension preserves them. For reflection, the cokernel vanishes if it vanishes on both pieces (Stacks 15.92.2). Surjectivity onto the right finite projective module then splits; its kernel is finite projective and its scalar extensions are the kernels on the pieces. Apply the same cokernel detection to the map from the left module to that kernel, split again, and detect its remaining kernel by the sections exact sequence. This proves exactness reflection for finite projective sequences without claiming it for arbitrary modules. Caraiani-Scholze 3.5.1 records this compatibility.

(c) Pullback of the chart: `A → A_T` with `ξ ↦ ξ_T` a local generator of `I_{D_T}`, so A-hat `⊗` ... `→ A_T-hat`; the gluing of the base change is the base change of the gluing by (d).

(d) Let `R → A` be the coefficient map of glueing pairs, with compatible maps `R' → A'` and their localizations. If `M` glues the old finite projective datum, `M tensor_R A` is finite projective; tensor associativity identifies its canonical datum over `(A,A')` with the datum extended piecewise from the old one. Beauville-Laszlo over the new glueing pair identifies its sections with `M tensor_R` A. This does not assert that tensoring the original ring exact sequence stays exact, or that `R' tensor_R` A equals A`'`.

(e) For the meromorphic complement data of [§6.8](#target-6-8) the chart triples are finite projective glueing data, so the split finite-projective arguments above apply chart by chart, and full faithfulness glues their compatibilities.

Further specializations and compatibility requirements are as follows.

- The tensor product of modifications bounded by `k` and `l` is bounded by `k + l`, and the lattice of the determinant is the determinant of the lattice
- Base change to the geometric points of `S` recovers the fibrewise lattices
- Exactness is asserted only for sequences of lattices, which are finite projective: the sequence `0 → I_D B⁺ → B⁺ → B⁺/I_D → 0` has a torsion last term and is not the lattice sequence of a short exact sequence of modifications

([Caraiani–Scholze](#ref-caraiani-scholze) Theorem 3.5.1, printed p. 33; [FS](#ref-fs) VI.1, before Definition VI.1.5, printed p. 192; [Stacks](#ref-stacks) Section 15.92, introduction.)

*Needs:* [§6.7](#target-6-7); [§6.5](#target-6-5); [§6.2](#target-6-2); [§3.8](#target-3-8); Mathlib TensorProduct; Mathlib Module.Dual; Mathlib CategoryTheory.Functor.Monoidal; [§6.8](#target-6-8).

<a id="target-6-10"></a>

### 6.10 Gluing along several disjoint or colliding legs

Prove `disjoint_and_colliding_legs`. Let `D_1`, `D_2` be divisors attached to `S → Div^{d_1}_(-)`, `S → Div^{d_2}_(-)` and `D = D_1 + D_2` the divisor attached to their sum in `Div^{d_1 + d_2}`, so `I_D = I_{D_1} I_{D_2}`. (a) Disjoint legs: if `D_1` and `D_2` are disjoint then `B⁺_D(S) = B⁺_{D_1}(S) x B⁺_{D_2}(S)` and `B_D(S) = B_{D_1}(S) x B_{D_2}(S)`; a lattice at `D` is a pair of lattices, and modifications of `E'` at `D` are equivalent to pairs consisting of a modification `(E_1, β_1)` of `E'` at `D_1` and a modification of `E_1` at `D_2` (iterated gluing, in either order, canonically independent of the order). (b) Colliding legs: if `D = m D_1` (all legs equal, `m ≥ 1`) then `I_D = I_{D_1}^m`, `B⁺_D(S) = B⁺_{D_1}(S)` and `B_D(S) = B_{D_1}(S)`, and a modification is bounded by `l` at `D` iff it is bounded by `m*l` at `D_1`. A `k`-bound at `D_1` implies a `ceiling(k/m)`-bound at `D`, while that bound at `D` implies only an `m*ceiling(k/m)`-bound at `D_1`. When a least global bound `k_min` exists, the least bound at `D` is `ceiling(k_min/m)`. (c) For a locally finite family `(D_n)` of pairwise disjoint degree-one divisors of `Y_S` (for instance the Frobenius translates `φ^n(D_0)`, `n ≥ 1`, on `Y_{[0,oo)}`), modifications of `E'` with locally finite support along the union and meromorphy bounded on each chart (no single global bound imposed) are equivalent to families of lattices `(Ξ_n)` at each `D_n`.

Disjointness in (a) is of the closed subspaces `D_1`, `D_2` of `X-cal`; then `I_{D_1} + I_{D_2} = O` and the Chinese remainder theorem applies on affinoid charts.

In (b) the legs may coincide; FS VI.1.2 constructs the degree-`d` divisor of an ordered tuple by the product equation `ξ = ξ_1` ... `ξ_d`, which is a nonzerodivisor also at coincident legs.

In (c) local finiteness is what lets the gluing be performed chart by chart; the family is infinite in Scholze-Weinstein Proposition 12.4.6.

(a) Work on an affinoid chart cover near `D` with `I_{D_i} = ξ_i` A, the ideals `ξ_1^n` A and `ξ_2^n A` are comaximal for every `n`, so `A/(ξ_1 ξ_2)^n = A/ξ_1^n x A/ξ_2^n` and the completions split; a lattice at `D` is then a pair, and [§6.7](#target-6-7) glues one factor at a time.

(b) For `D = m D_1` one has `I_D = I_{D_1}^m`, so the `I_D`-adic and `I_{D_1}`-adic filtrations are cofinal and the completions and their localisations coincide (Tau Ceti's `IsAdicComplete.of_le_of_pow_le` and `IsAdicComplete.pow` transfer adic completeness between an ideal and its powers); `E → E'(l D)` is exactly `E → E'(m*l D_1)`; the same applies to `β^(−1)`, so meromorphy along `D` and along `D_1` are the same condition.

For a locally finite disjoint family, choose charts meeting only finitely many supports. Apply finite gluing there and use uniqueness on overlaps to glue the resulting bundles and Frobenius maps. This is the iteration in SW Proposition 12.4.6, pp. 106-107; no uniform bound over the entire non-quasicompact space is imposed.

Fargues-Fontaine Proposition 5.3.1 is the absolute case: a bundle on `X`, finitely many points `x_i`, completions `O-hat_{X,x_i}`.

Further specializations and compatibility requirements are as follows.

- For `S` a geometric point and finitely many distinct classical points `x_1`, ..., `x_r` of `X_FF`, recover Fargues-Fontaine Proposition 5.3.1
- For two colliding legs at the same untilt, the Beilinson-Drinfeld ring `B⁺_{Div^2}` at the diagonal is `B⁺_dR`, not `B⁺_dR x B⁺_dR`
- The iterated gluing at `D_1` then `D_2` and at `D_2` then `D_1` give canonically isomorphic modifications
- For `m = 2`, the modification `O(−2D_1) → O` is bounded by 1 at `2D_1` but not by 1 at nonempty `D_1`. Thus `k`-bounded and `ceiling(k/m)`-bounded loci are not identified in general.

([FS](#ref-fs) Definition VI.1.6 and the remark after it, printed p. 193; [SW](#ref-sw) Proof of Proposition 12.4.6, printed pp. 106-107; [FF (2017)](#ref-ff-2017) Proposition 5.3.1, p. 209.)

*Needs:* [§6.7](#target-6-7); [§6.9](#target-6-9); [§3.5](#target-3-5); [§3.8](#target-3-8); [§3.4](#target-3-4); AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing.

<a id="target-6-11"></a>

### 6.11 The complement of the untilt divisor in `Proj(P_R)` is affine (Kedlaya-Liu 8.9.3)

Consume PadicHodgeTheory §7.5’s unramified chartwise curve and affine complement construction. Under KL Hypotheses 8.7.1 and 8.9.1, let `(A,A⁺)` be perfectoid over `ℚ_p`, `(R,R⁺)` its tilt, `q=p^a`, `a≥1`, and `E=W(𝔽_q)[1/p]` with specified embedding. The untilt Cartier divisor `Z` in `Proj(P_R)` has affine complement and an affine neighbourhood. Compare its ideal and completion with the all-`E` divisor interfaces of §§3.8 and 4.10, using VB2 GAGA.

**Checks.**

- At a geometric point with `a=1`, the complement is `Spec(B_e)` with `B_e=B[1/t]^{φ=1}`.
- At `a=2`, the normalized slope of `O(Z)` in the KL convention is `1/2`; positivity still gives affineness.
- The supplied affine neighbourhood contains `Z`; its completion uses the same Cartier ideal as §3.8.

([KL I](#ref-kl-i) Lemma 8.9.3, p. 187; Convention 4.1.13, pp. 105–106, and Lemma 8.8.19, p. 186.)

*Needs:* PadicHodgeTheory §7.5; [§3.8](#target-3-8); [§4.10](#target-4-10); VectorBundlesAndIsocrystals VB2/gaga-equivalence.

<a id="target-6-12"></a>

### 6.12 The relative period rings `B_e(A)`, `B⁺_dR(A)`, `B_dR(A)` (Kedlaya-Liu 8.9.4)

Consume the unramified chartwise rings and maps from PadicHodgeTheory §7.5: `R₁=B_e(A)` is the affine-complement ring, `R₂=B_dR⁺(A)` the ambient Cartier completion, and `R₃=B_dR(A)=R₂[1/z]` for a Cartier generator `z`. Retain the hypotheses and coefficient embedding of §6.11. Prove `relativeBPairPeriodComparison`: the supplied completion, residue, filtration and puncture agree with §§3.8 and 4.10’s all-`E` modification interfaces in this unramified specialization. For `E=ℚ_p`, the comparison includes the marked PreTilt/Mathlib identification of §4.8.

**Checks.**

- For `A=C` and `a=1`, the supplied sequence is `0→ℚ_p→B_e⊕B_dR⁺→B_dR→0`, with the difference map.
- Replacing `z` by a unit multiple leaves the punctured ring and its two restriction maps unchanged.
- Under the geometric `p`-typical comparison the completed ring is Mathlib BDeRhamPlus, with the same theta residue map.
- At `a=1`, `1/t` has Frobenius eigenvalue `p⁻¹`, so it belongs to `B[1/t]` but not to `B_e`.

([KL I](#ref-kl-i) Definition 8.9.4, p. 187; [Caraiani–Scholze](#ref-caraiani-scholze) before Theorem 3.5.1, printed p. 33.)

*Needs:* PadicHodgeTheory §7.5; [§6.11](#target-6-11); [§3.8](#target-3-8); [§4.8](#target-4-8); [§4.10](#target-4-10); VectorBundlesAndIsocrystals VB2/gaga-equivalence.

<a id="target-6-13"></a>

### 6.`13 B`-pair cohomology computes quasicoherent cohomology (Kedlaya-Liu 8.9.6(a))

Consume the vector-bundle difference-complex comparison from PadicHodgeTheory §7.6, `relativePeriodDerivedComparison`. Prove `B_pair_cohomology`, its extension to arbitrary flat quasicoherent sheaves. Kedlaya-Liu Hypotheses 8.7.1 and 8.9.1: `a ≥ 1` an integer and `q = p^a`; `(A, A⁺)` a perfectoid adic Banach algebra over `ℚ_p`, `X = Spa(A, A⁺)`, and `(R, R⁺)` the perfect uniform adic Banach algebra over `𝔽_p` corresponding to it; `P_R = sum_{n ≥ 0} P_{R,n}` the graded ring with `P_(R,n)={x∈R-tilde_R⁺ : φ^a(x)=p^n x}=H⁰(O(n))`, `Proj(P_R)` the schematic relative curve, `FF_R → Proj(P_R)` the comparison morphism (an equivalence on vector bundles, KL 8.7.7), and `Z` the image of the canonical section `Spec(A) → Proj(P_R)` given by the untilt `A` of `R`. For `S = Spa(R, R⁺)` over `𝔽_q` and `E = W(𝔽_q)[1/p]` this is the schematic curve `X_S^alg = Proj(P)` of Layer 5 and the degree-one divisor of the untilt; `L_X` denotes the line bundle `O(Z)` (KL Definition 8.8.18, Convention 8.9.2). With `R_1`, `R_2`, `R_3` as in [§6.12](#target-6-12), for every flat quasicoherent sheaf `V` on `Proj(P_R)` the cohomology of the complex `0 → Γ(Spec R_1, V) ⊕ Γ(Spec R_2, V) → Γ(Spec R_3, V) → 0`, whose arrow is the difference of the two restriction maps, is naturally identified with `Hⁱ(Proj(P_R), V)` (so `H^i = 0` for `i ≥ 2`). At a geometric point (Fargues-Fontaine Proposition 5.3.3) for a vector bundle `E` with `M = Γ(X minus {infinity}, E)` and `N = E-hat_infinity`: `H⁰(X, E) = M` intersect `N` and `H¹(X, E) = N[1/t]/(M + N)`.

`V` flat and quasicoherent; for non-flat `V` the Beauville-Laszlo sequence need not be exact.

`Spec(R_2) → Proj(P_R)` is not known to be flat in general (Kedlaya-Liu Remark 8.9.5), so the statement is not obtained by faithfully flat descent.

Same hypotheses as [§6.11](#target-6-11).

Cohomology of arbitrary bundles belongs to VectorBundlesAndIsocrystals, VB1; the content here is the comparison with the explicit difference complex and its formal-completion inputs.

KL Lemma 8.9.3(b) gives an affine neighborhood `Spec(B_0)` containing `Z`. Let `I` be its invertible Cartier ideal. The marked primitive generator of the completed ideal in Definition 8.9.4 gives a basis of `I/I²` over `B_0/I`. Lift this basis to `z∈I`. The finite `B_0`-module `C=I/(B_0 z)` satisfies `C=IC`. Nakayama in determinant form gives `g≡1 mod I` with `gC=0` (Mathlib `Submodule.exists_sub_one_mem_and_smul_eq_zero_of_fg_of_le_smul`). Thus `Spec(B_0[1/g])` still contains all of `Z`, and its Cartier ideal is generated by `z`; this generator is regular. Put `B=B_0[1/g]`. Since `g≡1 mod I`, it is a unit in the completion, so shrinking preserves the completed and punctured rings `R_2,R_3`.

Cover `Proj(P_R)` by `Spec(R_1)` and this principal affine neighborhood `Spec(B)`. Separatedness makes their intersection affine, so the Cech complex computes quasicoherent cohomology and cohomology vanishes above degree 1 (KL Remark 8.7.6(b); VectorBundlesAndIsocrystals, VB2 (ampleness)/two-affine-cover-cohomological-dimension).

On `Spec(B)`, Beauville-Laszlo for the glueing pair `(B, z)` and the flat module `V(B)` gives the exact sequence `0 → V(B) → V(B)[1/z] ⊕ (V(B) tensor_B B-hat) → (V(B) tensor_B B-hat)[1/z] → 0` ([§6.5](#target-6-5) (c)). This is extension of scalars, not the `z`-adic completion of `V(B)`: those differ for infinite flat modules.

Compare the two-affine Cech complex with the flat-module Beauville-Laszlo sequence. The complement of `Z` inside `Spec(B)` is `Spec(B[1/z])`; formal pullback has sections `V(B) tensor_B B-hat` and localized pullback has its `z`-localization. The resulting map of complexes induces the desired H0 and H1 identifications (KL Theorem 8.9.6(a), p. 188).

**Checks.**

- For `V = O` and `A = C` recover `H⁰(X, O) = ℚ_p` and `H¹(X, O) = 0` from Fontaine's fundamental exact sequence
- For `V=O(1)`, `A=C` and `a=1`, the local pieces are `B_e` and `t^(−1)B_dR⁺` inside `B_dR`. Since `B_e+B_dR⁺=B_dR`, also `B_e+t^(−1)B_dR⁺=B_dR`, giving `H¹(X,O(1))=0`. The notation `B_e^{φ=p}` would give zero and cannot express this check.
- Check that the complex has length two, matching the cohomological dimension one of `Proj(P_R)`
- On `B_0=k[t,u]` with `I=(t)`, the lift `z=(1+ut)t` generates `I/I²` but not `I` on all of `Spec(B_0)`. Taking `g=1+ut` gives a principal neighborhood containing `Z` and leaves its completion unchanged.

([KL I](#ref-kl-i) Lemma 8.9.3(b), Definition 8.9.4 and Remark 8.9.5, p. 187; Theorem 8.9.6(a), p. 188; [Stacks](#ref-stacks) tag 00DV; [FF (2017)](#ref-ff-2017) Proposition 5.3.3, p. 209.)

*Needs:* PadicHodgeTheory §7.6/relativePeriodDerivedComparison; [§6.12](#target-6-12); [§6.11](#target-6-11); [§6.5](#target-6-5); VectorBundlesAndIsocrystals, VB2 (ampleness)/two-affine-cover-cohomological-dimension; Mathlib Module.Flat; Mathlib Submodule.exists_sub_one_mem_and_smul_eq_zero_of_fg_of_le_smul.

<a id="target-6-14"></a>

### 6.14 Vector bundles on the relative curve are relative `B`-pairs (Kedlaya-Liu 8.9.`6(b),(c)`)

Consume PadicHodgeTheory §7.5, `RelativeBPair`, its finite-projective patching and exact tensor equivalence between unramified chartwise bundles and relative `B`-pairs. Retain the hypotheses of §6.11, with triples of finite projective modules over `R₁,R₂,R₃` from §6.12. Prove `relativeBPairModificationCompatibility`: under VB2 GAGA and §6.12’s period comparison, the supplied triple equivalence agrees with the all-`E` meromorphic modification gluing of §§6.7–6.9. This comparison includes arrows, tensor products, short exact sequences and pullback.

**Checks.**

- A lattice in `B_dR(A)^n` glued to the trivial complement gives the same bundle by both functors.
- At a geometric point the reference lattice gives `O^n`, while `t⁻¹B_dR⁺⊕(B_dR⁺)^(n−1)` gives `O(1)⊕O^(n−1)`.
- In rank zero both constructions give the zero bundle and its unique comparison.

([KL I](#ref-kl-i) Theorem 8.9.6(b),(c), p. 188; [Caraiani–Scholze](#ref-caraiani-scholze) Theorem 3.5.1, printed p. 33.)

*Needs:* PadicHodgeTheory §7.5/RelativeBPair; [§6.12](#target-6-12); [§6.7](#target-6-7); [§6.9](#target-6-9); VectorBundlesAndIsocrystals VB2/gaga-equivalence.

<a id="target-6-14a"></a>

### 6.14a No-leg shtukas and normalized tail recovery

For `E=ℚ_p` and `C` complete algebraically closed perfectoid, consume AInfCohomology §AI.2.3, `AInf.integral_robba_frobenius_descent`: no-leg shtukas on `Y_[0,∞)(Spa C♭)`, integral Robba `φ`-modules and finite free `ℤ_p`-modules are equivalent. Use its crystalline-point localization, morphisms and scalar extension. Prove `normalizedTailComparison`: a shtuka with one leg at `φ⁻¹(x_C)` has a unique `φ⁻¹`-equivariant meromorphic comparison with that no-leg model away from `⋃_(n≥0)φ^n(x_C)`, inducing its specified crystalline localization. The API includes morphisms, scalar extension, the normalization and completed lattice recovery. These comparisons precede insertion of lattices in §6.15.

**Checks.**

- The zero module gives the zero no-leg shtuka.
- `ℤ_p` gives the trivial line with its identity Frobenius descent.
- Multiplication by a scalar other than 1 does not preserve the prescribed crystalline identification; equivariance alone does not normalize the comparison.
- The removed orbit starts at `n=0` and the leg is at `φ⁻¹(x_C)`; reversing the orbit changes the assertion.

([SW](#ref-sw) Proposition 12.3.5, printed p. 104; Corollary 12.4.1, printed p. 105.)

*Needs:* AInfCohomology §AI.2.3/AInf.integral_robba_frobenius_descent; [§0.18](#target-0-18); [§5.3](#target-5-3); VectorBundlesAndIsocrystals VB4/integral-frobenius-local-systems; AdicSpacesPartIII R3.5.

<a id="target-6-15"></a>

### 6.15 Lattices `(T, Ξ)` and modifications of trivial bundles (Scholze-Weinstein 12.4.6, 14.1.1)

Prove `lattices_and_modifications_of_trivial_bundles`. (a) For `S` affinoid perfectoid with an untilt `S♯` over `E`, `D = S♯` the degree-one divisor of `X_S`, fix a finite free `O_E`-module `T` and the reference bundle `F = T ⊗_{O_E} O_{X_S}`. The gluing of [§6.7](#target-6-7) gives an equivalence between `B⁺_dR(S♯)`-lattices `Ξ` in `T ⊗_{O_E} B_dR(S♯)` and modifications `(F', β^(−1))` of this fixed `F` at `D`, where `β` : `F|_{X_S minus D} → F'|_{X_S minus D}` is meromorphic along `D`. If `T` varies, the output retains `T` and its identification with the reference bundle; forgetting this integral data does not give an equivalence of categories. (b) For `S = Spa(C♭)` and `E = ℚ_p`, using the locally finite family of disjoint divisors `φ^n(x_C)`, `n ≥ 1`, of `Y_{[0,oo)}`: the pairs `(T, Ξ)` are equivalent to shtukas over `Spa(C♭)` with one leg at `φ^(−1)(x_C)` (Scholze-Weinstein Proposition 12.4.6), and to quadruples `(F, F', β, T)` with `F` trivial and `T` a `ℤ_p`-lattice in `H⁰(X_FF, F)` (Theorem 14.1.1, `(2) <=> (3)`). (c) Minuscule case (Fargues-Fontaine 8.3.1): lattices with `t Ξ_0` in `Ξ` in `Ξ_0`, `Ξ_0 = T ⊗ B⁺_dR`, correspond to `C`-subspaces of `T ⊗ C`, i.e. to modifications whose cokernel is killed by `t`.

`E = ℚ_p` and `S` a geometric point in (b), as in the source; (a) is the relative statement and needs no more than the linear gluing.

The equivalence of `'F` trivial with a `ℤ_p`-lattice `T` in `H⁰(X_FF, F)'` and `'T` finite free over `ℤ_p'` uses `H⁰(X_FF, O) = ℚ_p` (VectorBundlesAndIsocrystals, VB1/cohomology-of-twists), not the classification of bundles.

This equivalence supplies the curve input for essential surjectivity of the Breuil–Kisin–Fargues classification by pairs `(T,Ξ)`. Its full-faithfulness argument is independent (BMS Remark 4.29).

For the one-leg shtuka assertion use the VectorBundlesAndIsocrystals VB4 integral Frobenius comparison and §6.14a’s supplied no-leg equivalence and normalized-tail theorem: SW Theorem 12.3.4, Proposition 12.3.5 and Corollary 12.4.1. These supply construction and recovery independently of the modification theorem.

(a) Apply [§6.7](#target-6-7) with `E' = F`: `F-hat_D = T ⊗ B⁺_dR(S♯)`, so modifications of `F` at `D` are lattices in `T ⊗ B_dR`.

SW Theorem 12.3.4 identifies integral Robba Frobenius modules and `W(C♭)` Frobenius modules with finite free `ℤ_p`-modules, using scalar extension and fixed vectors (VB4/integral-frobenius-local-systems). The §6.14a no-leg equivalence, SW Proposition 12.3.5, identifies these with no-leg shtukas on `Y[0,infinity)`. Starting with `T` tensor `O`, insert `Ξ` at `x_C` and then at each `φ^n(x_C)`, `n>=1`; local finiteness and the linear gluing give a one-leg shtuka. The §6.14a tail-recovery theorem, SW Corollary 12.4.1, uniquely compares a one-leg shtuka to its no-leg model away from the forward orbit; its completed comparison recovers `Ξ`. This proves the construction and recovery of SW Proposition 12.4.6, pp. 106-107.

For SW Theorem 14.1.1(2)-(3), `H⁰(X_FF,O)=ℚ_p` identifies a trivial bundle `F` with a finite-dimensional `ℚ_p`-space. Retaining the `ℤ_p`-lattice `T` in its sections gives the integral reference datum. Linear Beauville-Laszlo identifies `F`-prime and its meromorphic comparison `β` with a `B_dR`-plus lattice in `T` tensor `B_dR`. Thus the varying-`T` category keeps `T`, rather than forgetting it; multiplication by `1/p` on `F` is not an automorphism of `T=ℤ_p` (SW pp. 115-116).

(c) A modification with `t Ξ_0` in `Ξ` in `Ξ_0` is determined by `Ξ / t Ξ_0`, a `C`-subspace of `Ξ_0 / t Ξ_0 = T ⊗ C` (Fargues-Fontaine 8.3.1).

Further specializations and compatibility requirements are as follows.

- `p`-divisible group range: `T ⊗ B⁺_dR` in `Ξ` in `ξ^(−1)(T ⊗ B⁺_dR)` (Scholze-Weinstein Theorem 14.1.1, last sentence; Remark 12.4.7)
- Rank one: `Ξ = ξ^k B⁺_dR` with `k` in `Z` gives `F' = O(−k)`, compatible with the sign convention `O(infinity) = O(1)`
- The functor `(T, Ξ) ↦ (F, F', β, T)` commutes with tensor products and duals ([§6.9](#target-6-9))

([SW](#ref-sw) Proposition 12.4.6, printed p. 106; [SW](#ref-sw) Proof of Proposition 12.4.6, printed pp. 106-107; [SW](#ref-sw) Proof of Theorem 14.1.1, printed p. 116; [BMS](#ref-bms) Remark 4.29, p. 43; [SW](#ref-sw) Theorem 12.3.4 and Proposition 12.3.5, printed p. 104; Corollary 12.4.1, printed p. 105.)

*Needs:* [§6.7](#target-6-7); [§6.10](#target-6-10); [§6.9](#target-6-9); [§4.10](#target-4-10); VectorBundlesAndIsocrystals, VB1/cohomology-of-twists; PadicPeriodRings, §§1.5 and 4.1 (geometric de Rham DVR); Mathlib Module.Free; VectorBundlesAndIsocrystals, VB4/integral-frobenius-local-systems; [§6.14a](#target-6-14a).

<a id="target-6-16"></a>

### 6.16 Kedlaya's algebraicity of vector bundles on the punctured Witt spectrum

Prove `kedlaya_algebraicity_of_punctured_bundles`. Let `R` be a perfect Tate Huber ring of characteristic `p`, `R⁺` a ring of integral elements, `x` in `R` a topologically nilpotent unit (so `x` in `R⁺`), and `A = W(R⁺)` (`p`-typical Witt vectors). Let `X-sch = Spec(A) minus V(p, [x])` and `Y-ad = Spa(A, A) minus V(p, [x])`, the analytic locus. Then pullback along the morphism of locally ringed spaces `Y-ad → X-sch` is an equivalence `Vec(X-sch) = Vec(Y-ad)` (Kedlaya, Theorem 3.8). For a geometric perfectoid field `K=C♭`, consume AInfCohomology §AI.2.1, `AInf.punctured_spectrum_triviality`, and §AI.2.3, `AInf.analytic_vector_bundle_extension`, for finite-free extension on the algebraic and analytic punctured loci. Their compatibility with the general-base algebraicity comparison is the assertion here. For general `R⁺` a vector bundle on `Spec(A) minus {p = [x] = 0}` need not extend to `Spec(A)` (Kedlaya Example 3.14).

`p`-typical: `A = W(R⁺)`, coefficient field `ℚ_p`, as in the source. The ramified `W_{O_E}(R⁺)` and equal-characteristic analogues are not targets of this roadmap.

The adic space `Y-ad` contains the locus `[x] = 0` (the `'`crystalline end'), outside `𝒴_S`; its rational charts are those of Kedlaya Definition 3.5.

For an arbitrary perfect characteristic-`p` field `K`, complete for a nontrivial rank-one nonarchimedean valuation, with `R⁺=o_K`, retain the extension theorem beyond the algebraically closed supplier scope: finite free `W(o_K)`-modules, bundles on `Spa(W(o_K),W(o_K))` and bundles on its punctured analytic locus are equivalent. Prove this using Kedlaya Theorem 2.7 and the general-base algebraicity comparison of Theorem 3.8. The geometric specialization consumes the AInfCohomology equivalences; no extension theorem is asserted for general `R⁺`.

Cover `Y-ad` by the rational subsets `U = {|[x]| ≤ |p| != 0} = Spa(B_1)` and `V = {|p| ≤ |[x]| != 0} = Spa(B_2)` with intersection `Spa(B_12)`, where `B_1 = A_1<[x]/p>`, `B_2 = A_2<p/[x]>`, `A_1 = A[1/p]`, `A_2 = A[1/[x]]`, `A_12 = A[1/p[x]]` (Kedlaya Definition 3.5). With `x=ϖ`, `Y-ad` is the locus `Z_S` of [§0.21](#target-0-21), and these charts are the ones constructed there, rather than charts of the smaller `𝒴` open.

Import the exact chart sheafiness/stable-uniformity input of [§0.22](#target-0-22): `A_1,A_12,B_1,B_2,B_12,B_2`-prime are stably uniform, whereas `A_2` is only asserted uniform (Kedlaya Proposition 3.6). Use the completed coefficient-root extension and continuous module splitting of AdicSpacesPartIII §R3.5. Do not infer stable uniformity of `A_2` or treat an underlying-ring isomorphism involving a primed chart as a topological isomorphism.

On each sheafy chart, vector bundles are finite projective modules (Kedlaya Proposition 3.2(c); AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing), and the simple Laurent squares are glueing squares (Proposition 3.`2(a,b)`; AdicSpacesPartIII, R3.2/simple-laurent-glueing-square, AdicSpacesPartIII, R3.5/glueing-square-finite-projective-descent).

Compare the Zariski cover `{Spec A_1, Spec A_2}` of `X-sch` with the adic cover through the exact-square gluing of [§6.2](#target-6-2); in the resulting 2-commutative square every functor but `Vec(X-sch) → Vec(Y-ad)` is an equivalence (proof of Kedlaya Theorem 3.8).

For the field extension beyond the geometric supplier scope, use Kedlaya Theorem 2.7: its gluing stack uses `A_inf[1/p]` and `W(K)` over `W(K)[1/p]`, with finite-free sections from Lemma 2.6 and recovery from Lemma 2.3(c). Combine with Theorem 3.8. In the geometric-field specialization, identify the two supplied extension functors through the general-base comparison of Theorem 3.8. On the two charts their scalar-extension maps and Hom equalizers are the same; no second field-extension construction is required.

**Checks.**

- For a perfect complete nontrivially valued field `K`, the trivial `W(o_K)` line and its endomorphisms are recovered by global sections on the punctured analytic locus.
- At `K=C♭`, the resulting equivalence and its Hom maps agree with the two AInfCohomology suppliers.
- Field case: every vector bundle on `Spa(A_inf) minus {x_k}` is free, recovering the input of Breuil-Kisin-Fargues module theory
- Kedlaya Example 3.14, p. 10: for `R⁺` the `(y, z)`-adic completion of the perfection of `k[[y, z]]` and `x = yz`, the kernel of `(a, b, c) ↦ a[y] + b[z] + cp` is a bundle on `Spec W(R⁺) minus` the closed point that does not extend
- Compatibility with the Beauville-Laszlo square used in the field case

([Kedlaya A-inf](#ref-kedlaya-a-inf) Theorem 3.8, printed pp. 8-9; [Kedlaya A-inf](#ref-kedlaya-a-inf) Theorem 3.9, printed p. 9; [SW](#ref-sw) Theorem 14.2.1, printed p. 116; [Guo–Reinecke (arXiv)](#ref-guo-reinecke-second-edition) Proof of Theorem 4.15, p. 43.)

*Needs:* AInfCohomology §AI.2.1/AInf.punctured_spectrum_triviality; AInfCohomology §AI.2.3/AInf.analytic_vector_bundle_extension; [§6.2](#target-6-2); [§6.5](#target-6-5); AdicSpacesPartIII, R3.2/simple-laurent-glueing-square; AdicSpacesPartIII, R3.5/glueing-square-finite-projective-descent; AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing; PerfectoidSpaces, P3.17a.3/sousperfectoid-stably-uniform; [§0.21](#target-0-21); [§0.22](#target-0-22); PerfectoidSpaces, P1.16/witt-vectors-of-perfect-plus-ring; Mathlib WittVector; Mathlib Module.Projective; Mathlib Module.Free.

### Examples

Take `ℤ→ℤ[1/2],ℤ[1/3]→ℤ[1/6]`, with overlap transition multiplication by 3. A section satisfies `a=3b` and is uniquely `(k,k/3)`, `k∈ℤ`; its generator is `(1,1/3)`. The difference is a`−3b`, fixing the sign. For the identity square sections are diagonal. For `k[x]` with both pieces `k[x,1/x]`, `(1/x,1/x)` is a compatible pair that does not come from `k[x]`, so the square fails exactness. For the completion pair of `ℤ` at `p`, rank-one formal lattice `p^mℤ_p` gives the fractional lattice `p^mℤ`, with the stated off-`p` identification.

### Dependencies

Layers 0, 2, 3, 4, 5; AdicSpacesPartIII, R3.2/glueing-square; Mathlib TensorProduct; Mathlib LinearEquiv; Mathlib Module.Flat; Mathlib Module.Finite; Mathlib Module.Projective; Mathlib IsLocalization.Away.awayToAwayLeft; Mathlib IsLocalization.Away.awayToAwayRight; Mathlib TensorProduct.AlgebraTensorModule.rid; Mathlib Module.FinitePresentation; Mathlib CommAlgCat.FiniteEtale; Mathlib Algebra.Etale; Mathlib Module.Dual; Mathlib AdicCompletion; Mathlib AdicCompletion.of; Mathlib IsLocalization.Away; Mathlib nonZeroDivisors; Mathlib MvPolynomial; Mathlib Ideal.Quotient.mk; Mathlib IsAdicComplete; Mathlib Module.FaithfullyFlat; VectorBundlesAndIsocrystals, VB1/finite-locally-free-bundles; AdicSpacesPartIII, R3.5/locally-free-sheaf; Mathlib Module.Invertible; AdicSpacesPartIII, R3.5/sheafy-tate-acyclicity-and-kiehl-gluing; AdicSpacesPartIII, R3.5/vector-bundle-global-generation; AdicSpacesPartIII, R3; Mathlib CategoryTheory.Functor.Monoidal; VectorBundlesAndIsocrystals, VB2 (ampleness)/ample-section-affineness; VectorBundlesAndIsocrystals, VB2 (ampleness)/globally-etale-positive-ampleness; VectorBundlesAndIsocrystals, VB2 (ampleness)/gaga-equivalence; PadicHodgeTheory, §0.2/bdRPlusAffinoid; Mathlib BDeRhamPlus; Mathlib BDeRham; VectorBundlesAndIsocrystals, VB2 (ampleness)/two-affine-cover-cohomological-dimension; VectorBundlesAndIsocrystals, VB1/schematic-curve-at-a-geometric-point; Mathlib Module.Free; Mathlib CategoryTheory.Equivalence; VectorBundlesAndIsocrystals, VB1/cohomology-of-twists; PadicPeriodRings, §§1.5 and 4.1 (geometric de Rham DVR); VectorBundlesAndIsocrystals, VB4/integral-frobenius-local-systems; [§6.14a](#target-6-14a); AdicSpacesPartIII, R3.2/simple-laurent-glueing-square; AdicSpacesPartIII, R3.5/glueing-square-finite-projective-descent; PerfectoidSpaces, P3.17a.3/sousperfectoid-stably-uniform; PerfectoidSpaces, P1.16/witt-vectors-of-perfect-plus-ring; Mathlib WittVector. The scope of each named supplier is fixed in Exact supplier contracts.

## Layer 7: group-valued modifications

<a id="target-7-0"></a>

### 7.0 Scheme and integral adic torsor comparison

Prove `torsorTensorDictionary`. For a flat affine linear group scheme `G` over `O_E` (or a linear algebraic group over `E`) and a scheme over that base, geometric `G`-torsors, fppf `G`-torsors and exact tensor functors from finite-free representations to finite locally free modules are equivalent. For smooth `G` the torsors are étale locally trivial. Extend the `ℤ_p` scheme and analytic sousperfectoid dictionaries of VectorBundlesAndIsocrystals VB4, `integral-group-torsors`, to `O_E`, compatible with restrictions, base change and extension of structure group. This coefficient extension covers `𝒴` and the opens of the dotted product with `Spa O_E` used in §7.2. It is proved before modification gluing. Over `E` consume ReductiveGroups Layer 1's reconstruction and Tau Ceti's tensor-automorphism comparison; consume PadicHodgeTheory §5.5, `tensorIsomTorsor`, its two actions and inverse tensor descent over `E`-algebras, and glue these affine scheme comparisons. The integral extension uses finite-free `O_E` representations and reconstruction through the coordinate Hopf algebra, rather than field-valued semisimplicity.

The API comprises associated bundles, tensor-isomorphism torsors, the three comparison functors and their inverse isomorphisms, pullback and change of structure group. Prove the faithful tensor-generator and closed-immersion restriction/subquotient criteria over `E`: faithful `V` has generator `V⊕V∨`. No such field criterion is applied to `O_E` without its integral proof.

**Checks.**

- For `G=GL_n`, the torsor is the frame torsor and its associated standard bundle is the given rank-`n` bundle.
- For `G=G_m`, associated bundles are invertible lines; a nontrivial line retains its nontrivial frame torsor.
- The trivial group has one torsor up to unique isomorphism and gives the scalar-extension functor.
- A trivial representation of a nontrivial group cannot reconstruct that group or detect its torsors.

([SW](#ref-sw) Theorems 19.5.1–19.5.2, printed pp. 178–180; [FS](#ref-fs) Definition/Proposition III.1.1 and coefficient-extension footnote, printed p. 88; [Deligne–Milne](#ref-deligne-milne) Propositions 2.20(b), 2.21(b), pp. 25–26.)

*Needs:* PadicHodgeTheory §5.5/tensorIsomTorsor; ReductiveGroups Layer 1; SchemeAndStackFoundations §§1.15 and 2.3; VectorBundlesAndIsocrystals VB4/integral-group-torsors; DiamondsAndVStacks D2–D3; PerfectoidSpaces P3.17a; `TauCeti.Tannaka.pointsFunctorIsoTensorAutFunctor`.

<a id="target-7-1"></a>

### 7.1 Modifications of `G`-bundles at a relative Cartier divisor

Define `GModification`. Let `X-cal` be `Y_S` or `X_S`, `D` the divisor of a map `S → Div^d_(-)` and `P`, `P' G`-bundles on `X-cal`. A modification between `P` and `P'` at `D` is an isomorphism `β` : `P|_{X-cal minus D} = P'|_{X-cal minus D}` of exact tensor functors on `X-cal minus D` such that for every `V` in `Rep_E G` the induced isomorphism `β_V` : `P(V)|_{X-cal minus D} = P'(V)|_{X-cal minus D}` is meromorphic along `D`, i.e. extends to a morphism `P(V) → P'(V)(kD)` for `k >> 0` (Fargues-Scholze III.3). Applying this to `V^dual` shows that each `β_V` is a modification of vector bundles in the sense of [§6.6](#target-6-6). Modifications between `G`-bundles at `D` form a groupoid, and `G`-modifications of a fixed `P'` at `D` form a groupoid `Mod^G_D(P')`.

`G` linear algebraic over `E` for `X-cal = Y_S`, `X_S` (on `𝒴_S` with `G` over `O_E` the integral statements are formulated over the completed rings, see [§7.2](#target-7-2) (ii)).

Meromorphy is required for EVERY representation; by [§7.3](#target-7-3) it suffices to test one faithful representation and its dual.

`β` is an isomorphism of tensor functors, so the `β_V` are compatible with tensor products, duals and morphisms of representations.

The interface must support the following operations and laws.

- `GModification`: A modification between `G`-bundles `P` and `P'` at `D`: an isomorphism of exact tensor functors off `D`, meromorphic on every representation.
- `GModification.toModification`: For `V` in `Rep_E G`, `β_V` is a modification of `P'(V)` at `D` ([§6.6](#target-6-6)), natural in `V` and compatible with tensor products and duals.
- `GModification.ofGL`: For `G = GL_n`, `G`-modifications are the modifications of the rank-`n` vector bundles `P(std)`.
- `GModification.refl`: The identity of `P` is a modification between `P` and `P`.
- `GModification.symm`: The inverse of a modification is a modification.
- `GModification.trans`: The composite of modifications at `D` is a modification at `D`.
- `GModification.pushforward`: For `ρ` : `G → H`, `ρ_* β` (precomposition with Res : `Rep H → Rep G`) is a modification between `ρ_* P` and `ρ_* P'`.
- `GModification.pullback`: Pullback along `T → S` of affinoid perfectoid spaces, with `map_id` and `map_comp`.
- `GModification.ext`: Two modifications between `P` and `P'` are equal iff they agree on one faithful representation (equivalently off `D` on all representations).

Fargues-Scholze define the notion in III.3 for `D` in `Div^1`; the definition is the same for `D` of any degree, the meromorphy being along the Cartier divisor `D`.

Scholze-Weinstein Remark 19.1.3: in the Tannakian language a trivialisation off `S♯` is meromorphic iff it is so for the vector bundles of all algebraic representations.

Composition, inverse and pullback are inherited representation by representation from the vector-bundle notion.

**Checks.**

- `GModification.gl_eq_modification`: For `G = GL_n`, the map `β ↦ β_std` is a bijection from modifications between `P` and `P'` at `D` to modifications of the vector bundles `P(std)`, `P'(std)` at `D`.
- `GModification.gm_geometric_point`: For `G = G_m`, `S = Spa(C♭)` and `D = infinity`, the modifications of the trivial `G_m`-bundle at `D` are the line bundles `O(−k)`, `k` in `Z`, with the lattice `ξ^k B⁺_dR` (`ξ` a uniformiser of `B⁺_dR`).
- `GModification.identity_degenerate`: For `d = 0` (`D` empty) a modification between `P` and `P'` is an isomorphism of `G`-bundles `P = P'`.
- `GModification.not_iso_extension`: Meromorphy is not extension to an isomorphism over `D`: for `G = G_m` the inclusion `O(−D) → O` is a modification between `O(−D)` and `O` at `D`, although it does not extend to an isomorphism of `G_m`-bundles on `X-cal`.

Further specializations and compatibility requirements are as follows.

- For `G = GL_n` with the standard representation the notion is [§6.6](#target-6-6)
- For `G = G_m` and `S` a geometric point, the modifications of the trivial bundle at `infinity` are the `O(−k)`, `k` in `Z`
- Meromorphy is preserved under pushforward along homomorphisms `G → H`

([FS](#ref-fs) III.3, printed p. 97; [SW](#ref-sw) Remark 19.1.3, printed p. 170; [Howe–Klevdal](#ref-howe-klevdal) Section 4.3, p. 29.)

*Needs:* [§6.6](#target-6-6); [§7.0](#target-7-0); Tau Ceti TauCeti.AffineGroupSchemeCat; Mathlib CategoryTheory.Functor.Monoidal.

<a id="target-7-2"></a>

### 7.2 Beauville-Laszlo gluing for `G`-bundles (Tannakian transfer)

Prove `tannakian_transfer_of_gluing`. (i) Let `G` be a linear algebraic group over `E`, `X-cal = Y_S` or `X_S`, `D` the affinoid divisor of `S → Div^d_(-)`, and `P'` a `G`-bundle on `X-cal` with completion `P'-hat_D` (the exact tensor functor `V ↦ P'(V)-hat_D` to finite projective `B⁺_D(S)`-modules). Then `P ↦ P-hat_D` gives an equivalence between the groupoid of pairs `(P, β)`, `β` a modification between `P` and `P'` at `D` ([§7.1](#target-7-1)), and the groupoid of pairs `(Q, α)` with `Q` a `G`-torsor on `Spec B⁺_D(S)` and `α` : `Q|_{Spec B_D(S)} = P'-hat_D|_{Spec B_D(S)}`. In particular every such `(Q, α)` is effective. For `d = 1`, `S` over `Spd E` with untilt `S♯` and `P'` trivial: `G`-torsors on `Spec B⁺_dR(R♯)` with a trivialisation over `B_dR(R♯)` correspond to `G`-bundles on `X_S` with a modification of the trivial `G`-bundle at `S♯` (Fargues-Scholze III.3, Scholze-Weinstein Proposition 19.1.2). (ii) For `G` smooth affine over `O_E` and `X-cal = 𝒴_S` (or an open subset of `S x Spa O_E` as in Scholze-Weinstein 19.1.2) the same holds, with the `O_E`-integral Tannakian description of torsors. (iii) With the §7.0 dictionaries, a `G`-bundle on `X-cal minus D` whose value on every representation carries a meromorphic structure along `D` (compatibly with tensor products and exact sequences), a formal `G`-torsor and an identification over `B_D` glue, uniquely up to unique isomorphism, to a `G`-bundle on `X-cal`: apply [§6.8](#target-6-8) to each representation. No global reference bundle is given, so this is distinct from the fixed-reference case (i).

The tensor functors are exact; exactness of the glued functor is what the exactness half of [§6.9](#target-6-9) provides.

Torsors on the affine schemes `Spec B⁺_D(S)`, `Spec B_D(S)` are taken in the Tannakian sense, via the scheme-theoretic three-descriptions theorem (Scholze-Weinstein 19.5.1, Broshi), proved in §7.0.

`D` affinoid, which holds locally on `S`; the statement globalises by the base-change compatibility.

Clause (ii) consumes the `O_E`-coefficient extension of the integral §7.0 comparison; FS III.1.1, p. 88, records the extension of the `ℤ_p` references to `O_E`.

For each `V` in `Rep_E G` apply [§6.7](#target-6-7) to `E' = P'(V)` and the lattice `Q(V)` in `P'(V)-hat_D[1/I_D]` given by `α`: this gives a vector bundle `P(V)` with a modification `β_V`.

Functoriality in `V` and compatibility with tensor products, duals and exact sequences ([§6.9](#target-6-9)) make `V ↦ P(V)` an exact tensor functor, i.e. a `G`-bundle ([§7.0](#target-7-0)), and `β` a modification between `G`-bundles.

Full faithfulness from full faithfulness of the linear gluing representation by representation.

SW Proposition 19.1.2, p. 170, and CS Corollary 3.5.2, p. 33, transfer linear gluing by reconstructing the exact tensor functor on representations. The `GL_n` case is the vector-bundle equivalence; the group case uses the §7.0 torsor dictionary.

For clause (iii) apply [§6.8](#target-6-8) representationwise; its exact tensor compatibility ([§6.9](#target-6-9) (e)) reconstructs the torsor through §7.0. The fixed-reference lattice theorem does not apply directly, because the complement bundle has no given global extension.

**Checks.**

- For `G = GL_n` recover [§6.7](#target-6-7)
- For trivial `P′` and `d=1`, if `Q` is globally trivial, choosing a trivialization represents `(Q,α)` by a coset in `LG(S)/L⁺G(S)`. In general local trivializations and their descent give a section of the étale sheafification.
- The construction is independent of the faithful representation used to bound the modification ([§7.3](#target-7-3))

([SW](#ref-sw) Proposition 19.1.2, printed p. 170; [FS](#ref-fs) III.3, printed pp. 97-98; [Caraiani–Scholze](#ref-caraiani-scholze) Corollary 3.5.2 and proof, printed p. 33.)

*Needs:* [§7.1](#target-7-1); [§6.7](#target-6-7); [§6.9](#target-6-9); [§7.0](#target-7-0); [§3.8](#target-3-8); [§4.10](#target-4-10); Tau Ceti TauCeti.AffineGroupSchemeCat; Mathlib CategoryTheory.Functor.Monoidal; Mathlib CategoryTheory.Equivalence; [§6.8](#target-6-8).

<a id="target-7-3"></a>

### 7.3 Meromorphy can be tested on one faithful representation

Prove `faithful_representation_criterion`. Let `G` be a linear algebraic group over `E` and `V` in `Rep_E G` faithful. (a) An isomorphism `β` : `P|_{X-cal minus D} = P'|_{X-cal minus D}` of `G`-bundles is a modification at `D` iff `β_V` is a modification of the vector bundles `P(V)`, `P'(V)` at `D` (both `β_V` and `β_V^(−1)` meromorphic). (b) Consequently the `G`-gluing of [§7.2](#target-7-2) and its bounds may be computed with any faithful representation: if `β_V` is bounded by `k` then for every tensor construction `W = V^(x a) ⊗ (V^dual)^(x b)` and every subquotient of a direct sum of copies of that tensor word, `β_W` is bounded by `(a + b) k`. For a finite sum of tensor words of differing bidegrees `(a_i,b_i)`, the bound is `max_i(a_i + b_i) k`.

`V` faithful: `G → GL(V)` a closed immersion (Tau Ceti's TauCeti.Comodule.IsFaithful); a non-faithful `V` does not suffice.

Both directions of meromorphy are needed for `V`; equivalently one direction for `V` and for `V^dual`.

The subquotient step uses that `P` and `P'` are EXACT tensor functors, so subrepresentations go to local direct summands.

Deligne-Milne Proposition 2.20(b): for `G` algebraic with faithful `V`, `V ⊕ V^dual` is a tensor generator of `Rep_E G`, i.e. every `W` is a subquotient of `P(V, V^dual)` for a polynomial `P` with natural coefficients. The new conclusion is propagation of meromorphy and finite pole bounds through these tensor constructions.

Meromorphy with bound `k` is preserved by tensor products (bounds add), duals, and direct sums ([§6.6](#target-6-6) API).

Subobjects: if `W` in `W'` then `P(W)` in `P(W')` and `P'(W)` in `P'(W')` are local direct summands; the extension `P(W') → P'(W')(kD)` maps `P(W)` into `P'(W)(kD)` because it does so off `D` and `P'(W)(kD)` is saturated in `P'(W')(kD)` (sections are determined off `D` since `I_D` is invertible). Quotients similarly.

Hence meromorphy on `V` and `V^dual` gives meromorphy on every `W`, which is the definition of a `G`-modification (Fargues-Scholze III.3).

Further specializations and compatibility requirements are as follows.

- For `G = GL_n` and `V` the standard representation, (a) is the definition
- For a torus `T` with faithful character lattice generators, meromorphy on finitely many characters suffices
- A non-faithful `V` (`e`.`g`. the trivial representation) does not detect meromorphy

([Deligne–Milne](#ref-deligne-milne) Proposition 2.20(b) and its proof, printed pp. 25-26; [Deligne–Milne](#ref-deligne-milne) Footnote 11 to Proposition 2.20, printed pp. 25-26; [FS](#ref-fs) III.3, printed p. 97.)

*Needs:* [§7.1](#target-7-1); [§6.6](#target-6-6); [§6.9](#target-6-9); [§7.0](#target-7-0); Tau Ceti TauCeti.Comodule.IsFaithful; Tau Ceti TauCeti.Comodule.isFaithful_iff_isClosedImmersion_coordinateGroupSchemeHom.

<a id="target-7-4"></a>

### 7.4 Gluing commutes with change of structure group

Prove `change_of_structure_group`. Let `ρ` : `G → H` be a homomorphism of linear algebraic groups over `E` (resp. of smooth affine group schemes over `O_E`). (a) Pushforward `ρ_*` (precomposition with the restriction functor `Res_rho` : `Rep H → Rep G`) carries `G`-modifications at `D` to `H`-modifications at `D`, and commutes with the gluing of [§7.2](#target-7-2): `ρ_*(glue(Q, α)) = glue(ρ_* Q, ρ_* α)`, compatibly with composition `(ρ' ρ)_* = ρ'_* ρ_*`. (b) Over `E`, if `ρ` is a closed immersion, an isomorphism of `G`-bundles off `D` is meromorphic along `D` iff its pushforward to `H` is.

(a) needs no hypothesis on `ρ`; (b) needs `ρ` a closed immersion (equivalently every `G`-representation is a subquotient of restrictions of `H`-representations).

Prove compatibility of extension of structure group with meromorphic modification and gluing.

Part (b) is over the field `E`. Deligne-Milne 2.21(b) does not justify the same claim over `O_E`; the integral extension requires a separate representation theorem and is not asserted here.

(a) For `W` in `Rep H`, `(ρ_* P)(W) = P(Res W)`; the gluing of [§7.2](#target-7-2) is computed representation by representation, so it commutes with precomposition by Res.

(b) Deligne-Milne Proposition 2.21(b): `ρ` is a closed immersion iff every object of `Rep G` is a subquotient of an object `Res(W')`; meromorphy passes to subquotients as in [§7.3](#target-7-3). Equivalently, the restriction of a faithful `H`-representation is a faithful `G`-representation.

For reductive groups this is the linear-algebra input to Scholze-Weinstein Lemma 19.1.5 (`Gr_G → Gr_H` is a closed embedding for a closed embedding `G → H`), whose Grassmannian statement is GeometricSatakeAndFusion's.

Further specializations and compatibility requirements are as follows.

- `GL_n → GL_n × G_m`, `g ↦ (g, det g)`: the pushforward of a modification of rank-`n` bundles is the pair (modification, its determinant)
- For a closed immersion `ρ` the restriction of a faithful `H`-representation is a faithful `G`-representation, so (b) also follows from [§7.3](#target-7-3)

([Deligne–Milne](#ref-deligne-milne) Proposition 2.21(b), printed pp. 25-26; [SW](#ref-sw) Lemma 19.1.5, printed p. 171.)

*Needs:* [§7.2](#target-7-2); [§7.3](#target-7-3); [§7.1](#target-7-1); [§7.0](#target-7-0); Tau Ceti TauCeti.Comodule.IsFaithful.

<a id="target-7-5"></a>

### 7.`5 G`-gluing commutes with base change and with addition of legs

Prove `base_change_and_divisor_compatibility`. (a) For a map `f` : `T → S` of affinoid perfectoid spaces over `𝔽_q` and `D` the divisor of `S → Div^d_(-)`, the `G`-gluing of [§7.2](#target-7-2) commutes with pullback: `f^* glue(Q, α) = glue(Q ⊗_{B⁺_D(S)} B⁺_{D_T}(T), α_T)`, compatibly with composition of base changes. (b) For `D = D_1 + D_2` with `D_1`, `D_2` disjoint, `G`-torsors on `Spec B⁺_D(S)` with an isomorphism over `B_D(S)` are pairs of such data at `D_1` and `D_2`, and the gluing at `D` is the iterated gluing at `D_1` and `D_2`; for colliding legs `D = m D_1` the data at `D` and at `D_1` coincide. (c) For arbitrary `D_1`, `D_2`, a chain of modifications at `D_1` then `D_2` has a composite meromorphic at `D_1 + D_2`: representationwise the local equations multiply, and the two finite pole bounds give a bound at the sum. This construction commutes with base change. An equivalence with pairs of independent lattice data is asserted only on the disjoint locus; on a collision locus the chain retains extra intermediate data.

Base change uses that `B⁺_{Div^d}` and `B_{Div^d}` are `v`-sheaves over `Div^d` ([§3.8](#target-3-8)).

Disjointness is of the closed subspaces `D_1`, `D_2`; the product decomposition of the completed rings is [§6.10](#target-6-10).

(a) Apply [§6.9](#target-6-9) (c) representation by representation.

(b) A `G`-torsor on `Spec(B_1 x B_2)` is a pair of torsors; combine with [§6.10](#target-6-10) (a), (b) representation by representation.

(c) Work representationwise on charts with local equations `ξ_1`, `ξ_2`. If the bounds are `k,l`, the composite and its inverse have poles at most `kD_1+lD_2`, hence at most `max(k,l)(D_1+D_2)`. The product equation and pullback of divisors are [§3.5](#target-3-5). Disjoint product decomposition and diagonal cofinality do not prove a factorisation for partially overlapping divisors.

Further specializations and compatibility requirements are as follows.

- Pullback to geometric points recovers the fibrewise Beauville-Laszlo modifications of Fargues-Scholze III.3
- On the diagonal of `Div^1 x Div^1` the two legs collide and the datum is a single modification at the common leg

([FS](#ref-fs) VI.1, before Definition VI.1.5, printed p. 192; [FS](#ref-fs) Definition VI.1.6, printed p. 193.)

*Needs:* [§7.2](#target-7-2); [§6.9](#target-6-9); [§6.10](#target-6-10); [§3.8](#target-3-8); [§3.4](#target-3-4); [§3.5](#target-3-5).

<a id="target-7-6"></a>

### 7.`6 v`-descent of `G`-torsors and etale-local triviality over the completed divisor rings

Prove `v_descent_and_local_triviality`. (a) For `S` in `Perf` over `𝔽_q`, `U` an open subset of `S x Spa O_E` (for example of `𝒴_S`) and `G` smooth affine over `O_E`, the functor `S' ↦` {`G`-torsors on `U x_{S x Spa O_E} (S' x Spa O_E)`} is a `v`-stack on `Perf_S` (Scholze-Weinstein Proposition 19.5.3 for `E=ℚ_p`; for general `E`, the same split descent argument uses Fargues-Scholze II.1.1's coefficient-root charts). (b) For `S → Div^d_(-)` with `D_S` affinoid, vector bundles and `G`-bundles over `B⁺_{Div^d}(S)` (`G` reductive over `O_E`, resp. over `E`) satisfy `v`-descent in `S`, and so do isomorphisms between two of them over `B_{Div^d}(S)`. (c) Every `G`-bundle over `B⁺_{Div^d_{𝒴}}(S)`, `G` reductive over `O_E`, is trivial etale-locally on `S`. The quotient presentations Hck `= L⁺G` \ LG / `L⁺G` and `Gr = LG / L⁺G` that Fargues-Scholze deduce from (b) and (c) belong to GeometricSatakeAndFusion, Layer GS0 (loop geometry).

`G` smooth affine for (a); `G` reductive for (b) and (c), as in Fargues-Scholze VI.1.6-1.7.

(a) uses the coefficient-root extension `U_∞=U×_(Spa O_E)Spa O_(E_root∞)` of §§0.16–0.17. This space is perfectoid, and on affinoid charts `A→A_∞` has a continuous `A`-linear retraction. For `E=ℚ_p` this is the mixed-characteristic extension `U×_(Spa ℤ_p)Spa(ℤ_p[p^(1/p^∞)]^)` of SW 19.5.3. In equal characteristic the roots are those of `π`, and the charts perfect the whole ratio `π/[ϖ]`.

(c) is etale-local on `S`, not merely `v`-local; the presentation of Hck is one of ETALE stacks.

The affineness of the target scheme is what makes loop spaces `v`-sheaves (FS before Definition VI.1.6).

(a) By §7.0's Tannakian description reduce to `GL_n`. Work on rational affinoid subcharts of the integral period charts. For every coefficient field `E`, use `E_root∞=E(π^(1/p^∞))^` and the completed tensors and plus rings of §§0.16–0.17. On the first chart retain `π_m=v_m s_m` and `s_(m+1)^p=s_m`. In equal characteristic this gives `R⟨s_0^(1/p^∞)⟩`, rather than the ordinary disc `R⟨s_0⟩`; in mixed characteristic use the integral-perfectoid criterion of §0.17. Rational restriction gives the perfectoid space `U_∞`.

Choose the coefficient retraction as the projection onto the coefficient of 1 in the compatible bases `1,π_m,…,π_m^(p^m−1)` over `O_E`. These projections are uniformly bounded and compatible with the finite root extensions, hence extend continuously to `O_(E_root∞)→O_E`. The completed chart construction of §0.16 transports them to continuous `A`-linear retractions `A_∞→A`. Prove their compatibility with rational restriction and with every affinoid term of the Čech nerve of an affinoid `v`-cover `T→S`, using the same coefficient projection and separated completed tensors. The maps `U_∞(T)→U_∞(S)` are perfectoid `v`-covers, and their Čech terms are the corresponding perfectoid base changes; this follows from the perfected-disc presentation (and tilting in mixed characteristic).

Apply ordinary perfectoid vector-bundle descent (SW Lemma 17.1.8; DiamondsAndVStacks D2.9). To recover a bundle on `U`, descend the two coefficient pullbacks and their comparison over `A_∞⊗̂_A A_∞`; descend its cocycle over the triple coefficient tensor. Establish these comparisons after the base `v`-cover using the compatible split maps and the Čech descent of functions, as in SW 19.5.3. The coefficient tensor products themselves need not be perfectoid. Continuous module splittings persist under their completed base changes (AdicSpacesPartIII R3.5); the split descent argument gives ordinary modules and arrows and preserves finite projectivity (SW 19.5.3, with Stacks 08XD for the finite-projective descent step). These constructions commute with chart restriction, so the bundles and their exact tensor data glue on `U`.

(b) Fargues-Scholze, proof of VI.1.7: for vector bundles over `B⁺_{Div^d}`, descend each finite thickening by Proposition VI.1.4 ([§3.7](#target-3-7)), then algebraize the compatible modules and arrows by `divisorCompletionFiniteProjectives` ([§3.8](#target-3-8)); by the Tannakian formalism so do `G`-bundles; an isomorphism over `B_{Div^d}(S)` is a section of an affine scheme, which again satisfies `v`-descent.

For (c), first reduce the given torsor `Q` modulo `I_D` to a smooth affine finite-presentation torsor Q0 over `A_T=B_D-plus(T)/I_D`. Over a geometric point, `B_D`-plus is a finite product of complete DVRs whose residue fields are algebraically closed; the reductive torsor has a section. Reduction modulo `I_D`, including the nonreduced Artinian thickening at colliding legs, retains a section by smooth lifting. The assertion here is the reductive case of FS VI.1.7, p. 193; no smooth nonreductive extension is inferred.

Fix a geometric point `s` and take the filtered system of pointed affinoid etale neighbourhoods `T` of `s`. Choose compatible closed rings of definition `R_T` in the Tate rings `A_T=B_D-plus(T)/I_D`, with a common topologically nilpotent unit `t` coming from `[varpi]` (use a fixed power if necessary). Set `R=colim_T R_T` and `I=R`, so `R[1/t]=colim_T A_T` and `R-hat=lim_n R/t^n R`. Multiplication by `t` is injective on `R` because `t` is a unit on each `A_T`. Each `R_T` is `t`-adically complete, hence `(R_T,tR_T)` henselian; filtered colimits preserve the henselian pair condition, giving `(R,tI)=(R,tR)` henselian. The compatibility of this construction and the identification `R-hat[1/t]` with the reduced-divisor ring over the completed geometric stalk are the theorem `completedDivisorGeometricStalk` of [§3.8](#target-3-8), not consequences of henselianity alone.

Base change `Q0` to `X=Q0 tensor_{A_T} R[1/t]`. It is smooth affine of finite presentation over `R[1/t]`, hence quasi-projective. The geometric-fiber section gives an `R-hat[1/t]`-point through the required completed-stalk comparison. GR arXiv v3 Proposition 5.4.21 and its affine Claim 5.4.22, pp. 121-122, imply that `X(R[1/t])` is nonempty: the dense image in the nonempty completed point space contains a point. Use the arXiv v3 numbering with these explicit `R,t,I`.

Because Q0 is finitely presented, a section over `colim_T A_T` descends to one pointed affinoid etale neighbourhood `T`. The section solves the finite defining equations there; thus approximation yields an etale neighbourhood on `S`, rather than only a `v`-cover. Lift this section to `Q` over the `I_D`-adically complete ring `B_D-plus(T)` by formal smoothness, using the pinned Mathlib lifting lemma. Together with `completedDivisorGeometricStalk` ([§3.8](#target-3-8)) this proves étale-local triviality. For degree one SW19.1.2, p. 170, instead uses the untilt and successive nilpotent lifting.

**Checks.**

- Unperfected disc coordinate: For `E=𝔽_q((π))`, `S=Spa(C,C⁺)` with `C` a characteristic-`p` perfectoid field, and the chart `π=ϖT`, the ordinary ring `C⟨T⟩` has no `p`-th root of `T`: a `p`-th power has zero coefficient in degree 1. The `ℤ_p[p^(1/p^∞)]^` extension has this ring as a quotient after killing its coefficient roots of zero. Its Frobenius is therefore not surjective, so that extension is not perfectoid. The no-root assertion holds for every ultrametric normed field of characteristic `p` on Mathlib's restricted-power-series subring.
- With the `π`-root extension on this same chart, `T=s_0` has roots `s_m`, and the continuous `C⟨T⟩`-linear projection `C⟨T^(1/p^∞)⟩→C⟨T⟩` keeps exactly the integral exponents. It sends 1 to 1 and each `T^(1/p^m)` to zero for `m>0`.
- On the double and triple base-cover overlaps, the coefficient retractions commute with restriction. A trivial rank-`n` bundle with identity descent maps recovers the ordinary module `A^n`, with the same identity cocycle, in both coefficient characteristics.
- The presentation obtained by trivialising etale-locally is one of etale stacks, not merely `v`-stacks
- At a geometric point check triviality directly from the product-of-complete-DVRs description
- Without affineness of `Z`, `L⁺Z` and LZ need not be `v`-sheaves; the Tannakian reduction to `GL_n` is where affineness enters
- Instantiate GR with `I=R`, `t` regular, `R[1/t]=` the etale neighbourhood colimit and the required completed-stalk ring; descend an actual section by finite presentation. Distinguish `I` in GR from the divisor ideal `I_D`.

([FS](#ref-fs) Proposition II.1.1 and proof, printed pp. 48–49; [SW](#ref-sw) Proposition 19.5.3 and proof, printed pp. 180–181; [Stacks](#ref-stacks) tag 08XD; [FS](#ref-fs) Proof of Proposition VI.1.7, printed p. 193; [Gabber–Ramero](#ref-gabber-ramero) Proposition 5.4.21 and Claim 5.4.22, arXiv v3, printed pp. 121–122; [SW](#ref-sw) Proof of Proposition 19.1.2, printed p. 170; [SW](#ref-sw) Lemma 17.1.8 and proof, printed pp. 150–151.)

*Needs:* [§0.16](#target-0-16); [§0.17](#target-0-17); [§7.0](#target-7-0); [§3.7](#target-3-7); [§3.8](#target-3-8); [§4.10](#target-4-10); AdicSpacesPartIII R3.5/split-injection-completed-base-change; VectorBundlesAndIsocrystals, VB1/v-descent-for-bundles-and-cohomology; DiamondsAndVStacks, D2.9/vector-bundles-across-pro-etale-and-v-sites; DiamondsAndVStacks, D2/v-descent-of-functions; DiamondsAndVStacks, D2/higher-v-acyclicity; DiamondsAndVStacks, D4/small-v-sheaves-and-small-v-stacks; PerfectoidSpaces, P3.17a.4/sousperfectoid-adic-space; PadicPeriodRings, §§1.5 and 4.1 (geometric de Rham DVR); Mathlib Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete; Mathlib Algebra.Smooth; Mathlib HenselianRing; Mathlib IsDiscreteValuationRing; Mathlib IsAdicComplete; Mathlib Module.Projective; Tau Ceti TauCeti.ReductiveAffineGroupSchemeCat; Mathlib PowerSeries.IsRestricted.subring; Layer 3; DiamondsAndVStacks, D2.

<a id="target-7-7"></a>

### 7.7 The modification of a `G`-bundle by a `B⁺_dR`-lattice

Define `GBundleModification`. Let `S` be a perfectoid space over `Spd E` (untilt `S♯` over `E`, `D = S♯` the degree-one divisor of `X_S`), `G` a linear algebraic group over `E`, `P` a `G`-bundle on `X_S` and `L` a `G(B⁺_dR)`-lattice on the `G(B_dR)`-torsor `P|_{B_dR}`: a `G`-torsor `Q` on `Spec B⁺_dR(R♯)`, given etale-locally on `S`, with `α` : `Q|_{B_dR} = P-hat_D|_{B_dR}`. The modification `P_L` of `P` by `L` is the `G`-bundle on `X_S` glued from `(P, Q, α)` by [§7.2](#target-7-2), with its canonical modification `P_L|_{X_S minus D} = P|_{X_S minus D}`. It is functorial in `(P, L)`, compatible with pullback in `S` and with pushforward along homomorphisms of groups. For `P` trivial it is the map `E` from `G`-torsors on `Spec B⁺_dR` trivialised over `B_dR` to `G`-bundles on `X_S` of Caraiani-Scholze Corollary 3.5.2 and Fargues-Scholze III.3; identifying its source with `Gr_G(S)` belongs to GeometricSatakeAndFusion, Layer GS0 (loop geometry); the resulting Beauville–Laszlo morphism `Gr_G → Bun_G` is used by BunGAndNewtonStrata, Layer BG2 (uniformization), and by HeckeStacksAndLocalShtukas, Layers HS0 and HS2.

The lattice is a `G(B⁺_dR)`-lattice, i.e. a `G`-torsor over `B⁺_dR`, not merely a `B⁺_dR`-lattice in one representation.

`L` is given étale-locally on `S`; descend the representationwise vector bundles, maps and exact tensor structure using AdicSpacesPartIII §R3.5 and the §7.0 dictionary on curve charts and Frobenius overlaps.

Degree one here; several or colliding legs are [§7.5](#target-7-5).

The interface must support the following operations and laws.

- `modify`: The `G`-bundle `P_L` on `X_S` attached to a `G`-bundle `P` and a `G(B⁺_dR)`-lattice `L` on `P|_{B_dR}`.
- `modify.modification`: The canonical modification `P_L|_{X_S minus D} = P|_{X_S minus D}`, meromorphic along `D`.
- `modify_tautological`: For the tautological lattice `L = P-hat_D`, `P_L = P` with the identity modification.
- `modify_comp`: For `L` a lattice on `P|_{B_dR}` and `L'` a lattice on `P_L|_{B_dR} = P|_{B_dR}`, `(P_L)_{L'} = P_{L'}`.
- `modify.pullback`: For `T → S`, `(P_L)_T = (P_T)_{L_T}`; compatible with composition.
- `modify.pushforward`: For `ρ` : `G → H`, `ρ_*(P_L) = (ρ_* P)_{ρ_* L}`.
- `modify_gl`: For `G = GL_n`, `P_L` is the bundle glued by [§6.7](#target-6-7) from `P(std)` and the lattice `L(std)`.
- `modify.characterisation`: `P_L` is the unique `G`-bundle with a modification to `P` at `D` whose completion at `D` is `L` ([§7.2](#target-7-2)).

Howe-Klevdal 4.3: completion along `I_infinity` is an exact tensor functor `Vect(FF_S) → Loc_{B⁺_dR}(S)`; a lattice `L` on `E|_{B_dR}` defines `E_L` by the Tannakian formalism and Beauville-Laszlo gluing.

Glue with [§7.2](#target-7-2) étale-locally on `S` where `L` is a torsor with `α`. By §2.4, the base cover induces an étale cover of curves. Descend each associated vector bundle using AdicSpacesPartIII §R3.5’s étale vector-bundle descent on the curve’s annular charts. Descend the tensor isomorphisms, exact sequences and meromorphic complement maps on those charts and their Frobenius overlaps. Apply §7.0’s tensor dictionary to recover the `G/E` bundle and its modification; the overlap compatibilities glue it on `X_S`.

Functoriality, base change and pushforward from [§7.5](#target-7-5) and [§7.4](#target-7-4).

**Checks.**

- `modify_gl_compat`: For `G = GL_n` and `P` trivial, `P_L` is the rank-`n` vector bundle obtained by gluing the `B⁺_dR`-lattice `L` in `B_dR^n` to the trivial bundle off `D`, as in Caraiani-Scholze 3.5.1.
- `modify_gm_degree`: For `G = G_m`, `S = Spa(C♭)`, `P` trivial and `L = ξ^k B⁺_dR`, `P_L = O(−k)`, of degree -`k`.
- `modify_tautological_eq`: For the tautological lattice `L = P-hat_D` the modification `P_L` is `P`, with the identity modification.
- `modify_SL2_nonlattice`: For `G = SL_2` and `P` trivial, the `B⁺_dR`-lattice `ξ B⁺_dR ⊕ B⁺_dR` of `B_dR^2` has determinant lattice `ξ B⁺_dR`, so it is not an `SL_2(B⁺_dR)`-lattice of the trivial `SL_2`-torsor and does not define an `SL_2`-modification, although it defines a `GL_2`-modification.

Further specializations and compatibility requirements are as follows.

- For `G = GL_n` the construction is [§6.7](#target-6-7)
- Sign convention: for `G = G_m` and the lattice `ξ^k B⁺_dR` the modified bundle is `O(−k)`, as fixed by `O(infinity) = O(1)`
- Modifying first by `L` and then by `L'` (a lattice in `P_L|_{B_dR} = P|_{B_dR}`) is modifying by `L'`

([Howe–Klevdal](#ref-howe-klevdal) Section 4.3, p. 29; [Caraiani–Scholze](#ref-caraiani-scholze) Corollary 3.5.2, printed p. 33; [FS](#ref-fs) III.3, printed p. 98.)

*Needs:* [§2.4](#target-2-4); [§7.0](#target-7-0); AdicSpacesPartIII §R3.5/finite-projective-etale-descent; AdicEtaleGeometry §A1.6a/stable-basis-etale-vector-bundles; [§7.2](#target-7-2); [§7.6](#target-7-6); [§7.5](#target-7-5); [§7.4](#target-7-4); [§7.1](#target-7-1); [§4.10](#target-4-10); PadicPeriodRings, §§1.5 and 4.1 (geometric de Rham DVR).

### Examples

For `G=GL₁`, a lattice `ξ^kB_D⁺` changes the trivial line to `O(−k)`; `k=1` and `k=−1` fix both directions. For `GL_n` use diagonal lattices `⊕ξ^(k_i)B_D⁺`, giving determinant degree `−Σk_i`. A trivial structure group has a single modification. One faithful representation is tested together with its dual and tensor operations; an integral tensor-generator assertion requires its own scheme dictionary.

### Dependencies

Layers 3, 4, 6; [§7.0](#target-7-0); Tau Ceti TauCeti.AffineGroupSchemeCat; Mathlib CategoryTheory.Functor.Monoidal; Mathlib CategoryTheory.Equivalence; Tau Ceti TauCeti.Comodule.IsFaithful; Tau Ceti TauCeti.Comodule.isFaithful_iff_isClosedImmersion_coordinateGroupSchemeHom; VectorBundlesAndIsocrystals, VB1/v-descent-for-bundles-and-cohomology; DiamondsAndVStacks, D2/v-descent-of-functions; DiamondsAndVStacks, D2/higher-v-acyclicity; DiamondsAndVStacks, D4/small-v-sheaves-and-small-v-stacks; PerfectoidSpaces, P3.17a.4/sousperfectoid-adic-space; PadicPeriodRings, §§1.5 and 4.1 (geometric de Rham DVR); Mathlib Algebra.FormallySmooth.exists_mkₐ_comp_eq_of_isAdicComplete; Mathlib Algebra.Smooth; Mathlib HenselianRing; Mathlib IsDiscreteValuationRing; Mathlib IsAdicComplete; Mathlib Module.Projective; Tau Ceti TauCeti.ReductiveAffineGroupSchemeCat; Layer 3; DiamondsAndVStacks, D2. The scope of each named supplier is fixed in Exact supplier contracts.

## Downstream consumers

The period and bundle interfaces agree with VectorBundlesAndIsocrystals VB`−1` and VB1–VB4. Its independent relative foundations supply the coefficients, annuli, quotient, generic divisors and completions, twists and partial section charts as well as higher-rank/global results. The integral-chart, symmetric-divisor, multileg and patching targets here specify the additional refinements required for modifications. BunGAndNewtonStrata, GeometricSatakeAndFusion and the Hecke/local-shtuka roadmaps receive completed Cartier legs, lattice modifications and their group/base-change compatibilities. AInfCohomology supplies regular-completion patching and the geometric-field extension inputs; its constructions agree with the broader glueing-pair and general-base algebraicity comparisons here; Breuil–Kisin–Fargues full faithfulness does not acquire a blanket dependency on relative curve geometry.

## References

<a id="ref-fs"></a>

- Laurent Fargues, Peter Scholze, [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf). MPIM author copy, PDF created 27 November 2024, 356 pages; locators refer to this copy, not Astérisque 466 (2026).

<a id="ref-sw"></a>

- Peter Scholze, Jared Weinstein, [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf). Annals of Mathematics Studies 207; PDF dated 'March 27, 2020' on every page header.

<a id="ref-bms"></a>

- Bhargav Bhatt, Matthew Morrow, Peter Scholze, [Integral p-adic Hodge theory](https://arxiv.org/abs/1602.03148). arXiv:1602.03148v3; published in Publications IHÉS 128 (2018), 219–397. Page locators use the arXiv copy.

<a id="ref-stacks-henselian"></a>

- The Stacks Project Authors, [Henselian pairs and finite etale algebras](https://stacks.math.columbia.edu/tag/09ZL). Tags 09XI and 09ZL, online version.

<a id="ref-kl-ii"></a>

- Kiran Kedlaya, Ruochuan Liu, [Relative p-adic Hodge theory II: imperfect period rings](https://arxiv.org/abs/1602.06899). arXiv:1602.06899v3 (2019); Appendix A and Theorem 3.3.13 with Remark 3.3.14.

<a id="ref-ff-2017"></a>

- Laurent Fargues, Jean-Marc Fontaine, [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf). Author copy, 16 April 2017, 399 pages; Astérisque 406 (2018).

<a id="ref-kl-i"></a>

- Kiran Kedlaya, Ruochuan Liu, [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792). arXiv:1301.0792v5, 9 May 2015 (PDF dated 2 May 2015); preprint of Astérisque 371 (2015).

<a id="ref-fargues-divisors"></a>

- Laurent Fargues, [Simple connexite des fibres d une application d Abel-Jacobi et corps de classes local](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf). Author preprint dated 24 October 2017; source cited as Far20b by FS, locators refer to this edition.

<a id="ref-kedlaya-a-inf"></a>

- Kiran Kedlaya, [Some ring-theoretic properties of A_inf](https://arxiv.org/abs/1602.09016). arXiv:1602.09016v5, 11 June 2019.

<a id="ref-kedlaya-witt"></a>

- Kiran Kedlaya, [Nonarchimedean geometry of Witt vectors](https://arxiv.org/abs/1004.0466). arXiv:1004.0466 author copy.

<a id="ref-scholze-periods"></a>

- Peter Scholze, [p-adic Hodge theory for rigid-analytic varieties](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeTheory.pdf). Author-hosted pAdicHodgeTheory.pdf.

<a id="ref-ff-corrected"></a>

- Laurent Fargues, Jean-Marc Fontaine, [Courbes et fibres vectoriels en theorie de Hodge p-adique, corrected author copy](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf). Author-hosted PDF created 13 November 2018, 404 pages; Locators include Lemme 1.2.3 and Proposition 1.4.9.

<a id="ref-stacks"></a>

- The Stacks project authors, [The Stacks project, More on Algebra, Section 15.92 The Beauville-Laszlo theorem (tag 0BNI), with Sections 15.9 and 15.11](https://stacks.math.columbia.edu/tag/0BNI). Online version, tags 0BNI, 0BNR, 0BNS, 0BNW, 0BP2, 07M7 and 0ALJ, accessed 2026-10-13.

<a id="ref-caraiani-scholze"></a>

- Ana Caraiani, Peter Scholze, [On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/abs/1511.02418v1). arXiv:1511.02418v1 (8 November 2015); published in Annals of Mathematics 186 (2017), where Theorem 3.5.1 is on p. 687.

<a id="ref-howe-klevdal"></a>

- Sean Howe, Christian Klevdal, [Admissible pairs and p-adic Hodge structures II: The bi-analytic Ax-Lindemann theorem](https://arxiv.org/abs/2308.11064v2). arXiv:2308.11064v2 (28 February 2025).

<a id="ref-guo-reinecke-second-edition"></a>

- Haoyang Guo, Emanuel Reinecke, [A prismatic approach to crystalline local systems](https://arxiv.org/abs/2203.09490v3). arXiv:2203.09490v3 (27 October 2023); published in Inventiones Mathematicae 236 (2024).

<a id="ref-gabber-ramero"></a>

- Ofer Gabber, Lorenzo Ramero, [Almost ring theory](https://arxiv.org/abs/math/0201175v3). arXiv:math/0201175v3, sixth and final release (2002); Locators here use arXiv v3, pp. 121–122, rather than the pagination of LNM 1800 (2003).

<a id="ref-deligne-milne"></a>

- Pierre Deligne, James S. Milne, [Tannakian categories](https://www.jmilne.org/math/xnotes/tc2018.pdf). Revised version of LNM 900 (1982), dated November 4, 2018, author-hosted.
